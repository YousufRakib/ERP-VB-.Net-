 <%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePO.ascx.vb" Inherits="pages_PagePO" %>
<script src="../js/validation.js"></script>
<style>
    a {
        color: black;
    }

    .button-group:after {
        content: '';
        display: block;
        clear: both;
    }

    .button-group .button {
        float: left; /* width: 145px; */
        height: 31px;
        font-size: 12px;
        font-weight: bold;
    }

    .TotalRows {
        background-color: #72C97D; /*color: black;*/
        font-weight: bold;
        color: red;
        font-size: 12px;
    }

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .reset {
        background: url(images/Reset.gif) no-repeat 10px 0px;
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

    .clear {
        background: url(images/clear.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .Deny {
        background: url(images/Alert.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 20px;
        cursor: pointer;
    }


    .DetailsTitleDiv {
        background: #fafafa url(css/images/bg.gif) repeat-x top;
        position: relative;
        border: 1px solid #cccccc;
        border-bottom: 0px;
        overflow: hidden;
        padding-bottom: 3px;
    }

    .DetailsTitleDiv2 {
        float: left;
        clear: both;
        padding: 1px;
        width: 100%;
        height: 25px;
        padding-top: 10px;
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


    .selectize-input {
        width: 307px;
    }

    .selectize-dropdown-content {
        height: 100%;
        max-height: 140px;
    }

    #fgrdPOProductPurchaseDetailsTempGrid input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    #fgrdConfirmPODetails input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    #DivADDEDITPO input {
        background-color: rgb(214, 214, 255);
    }

        #DivADDEDITPO input:focus {
            background-color: cornsilk;
        }

    #DivADDEDITPO tr {
        height: 39px;
    }

    #DivEDITPODetail input {
        background-color: rgb(214, 214, 255);
    }

        #DivEDITPODetail input:focus {
            background-color: cornsilk;
        }

    #DivEDITPODetail tr {
        height: 39px;
    }

    /*#DivEDITPOHeaderDialog td {
        text-indent: 20px;
    }*/


    #DivEDITPODetailPart2 input {
        background-color: rgb(250, 205, 248);
    }

        #DivEDITPODetailPart2 input:focus {
            background-color: cornsilk;
        }

    #DivEDITPODetailPart2 tr {
        height: 39px;
    }

    .NewButtonStyle {
        /*width: 85px;*/
        border: 1px;
        border-style: solid;
        border-color: lightgrey;
        float: left;
        margin-right: 3px;
        cursor: pointer;
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

    /*Region Create PO*/
    .divCreatePOButton {
        border: 1px;
        border-style: solid;
        border-color: #a4a4a4;
        height: 51px;
        cursor: pointer;
        background-color: #F2F2F2;
        font-weight: bold;
    }

    .createpodesign {
        font-size: 10.5px;
    }

    .trSelected {
        background-color: dodgerblue !important;
    }

    .red {
        background-color: red;
    }

    .yellow {
        background-color: yellow;
    }

    .pink {
        background-color: hotpink;
        margin-right: 630px;
    }

    .green {
        background-color: forestgreen;
    }

    .hred:hover {
        background: -webkit-linear-gradient(top, red 1%, red 100%) !important;
        box-shadow: 3px 3px 6px black !important;
    }

    .hyellow:hover {
        background: -webkit-linear-gradient(top, yellow 1%, yellow 100%) !important;
        box-shadow: 3px 3px 6px black !important;
    }

    .fyellow:focus {
        background: -webkit-linear-gradient(top, yellow 1%, yellow 100%) !important;
        box-shadow: 3px 3px 6px black !important;
    }

    .hpink:hover {
        background: -webkit-linear-gradient(top, hotpink 1%, hotpink 100%) !important;
        box-shadow: 3px 3px 6px black !important;
    }

    .hgreen:hover {
        background: -webkit-linear-gradient(top, green 1%, green 100%) !important;
        box-shadow: 3px 3px 6px black !important;
    }

    .btntoleft {
        float: left !important;
        margin-right: 620px;
    }

    .btntoleftWithoutImageAligment {
        float: left !important;
        margin-right: 770px;
    }

    input[type="file"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 20px;
        padding-left: 2px;
    }

    input[type="file"] {
        display: block;
    }

    .imageThumb {
        max-height: 40px;
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
    }

    .pip {
        display: inline-block;
        margin: 10px 10px 0 0;
    }

    .remove {
        display: block;
        color: white;
        cursor: pointer;
    }

        .remove:hover {
            background: white;
            color: black;
        }
    /*End Region Create PO*/
</style>
<script type="text/javascript">
    document.title = "Purchase Orders";
</script>
<table>
    <tr>
        <td>
            <div class="button-group">
                <input id="tab-CreatePO" type="button" class="tabs button" value="Create PO" style="">
                <input id="tab-POList" type="button" class="tabs button" value="PoList" style="">
                <input id="tab-AllPurchases" type="button" class="tabs tab-3 button" value="All Purchases"
                    style="">
<%--                <input id="tab-Reception" type="button" class="tabs tab-4 button" value="Reception"
                    style="">--%>
                <img id="aEmailInvoices" style="margin-left: 10px; margin-top:7px; cursor: pointer;" src="images/email.png" title="Check emails sent" />
            </div>
        </td>
    </tr>
</table>
<div id="DivPOSelectFarmDialog" style="display: none; width: 1100px;">
    <table id="tblSelectFarm">
        <tr style="height: 30px">
        </tr>
        <tr>
            <td colspan="2">
                <table style="width: 100%; margin: 5px 5px 0px 5px;">
                    <tr>
                        <td>
                            <table>
                                <tr style="height: 40px">
                                    <td style="vertical-align: top; padding-top: 9px; font-weight: bold;">ORIGIN</td>
                                    <td style="margin-left: 57px; vertical-align: top"><select id="originListDropdown" style="width: 305px; margin-left: 0px; margin-right: 17px;" onchange="MainCityClicked(this)" /></td>
                                </tr>
                                <tr style="height: 40px">
                                    <td style="vertical-align: top; padding-top: 9px; font-weight: bold;">VENDOR
                                    </td>
                                    <td style="margin-left: 57px; vertical-align: top">
                                        <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                                        <div style="">
                                            <select id="lstfarmADDPO" style="width: 250px; margin-left: 27px; margin-right: 17px;" />
                                        </div>
                                    </td>
                                    <%--<td style="height: 101px; vertical-align: top; text-shadow: 0 0 black; position: absolute;">
                                        <div class="button-group" style="border: 1px solid gray;" id="DivPOCityControls">
                                        </div>
                                    </td>--%>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%--<div style="margin-top: 64px; margin-left: 7px;" id="DivRelatedCitiesByMainCity">
    </div>--%>
</div>
<%--Region "Create PO"--%>
<div class="tabcontent" id="tabcontent-CreatePO" style="display: none">
    <div id="divCreatePO" style="overflow: visible; display: block; height: 78px;">
        <div id="divCreatePOgrid">
            <table id="fgrdCreatePO" style="display: none;">
            </table>
        </div>
        <div>
            <table style="height: 50px;">
                <tr>
                    <td>
                        <div style="margin-right: 265px;">
                            <fieldset id="fsCreatePOButtons" style="height: 48px; border-width: 1px; border-radius: 5px;">
                                <legend style="background: white; margin-left: 2px;"></legend>
                                <table>
                                    <tr>
                                        <td>
                                            <div style='float: left; width: 90px;' id="btnCreatePODetailed" class="divCreatePOButton">
                                                <img style='position: relative; margin-top: 13px; margin-left: 35px;' src='images/printer.png' /><span style='margin-left: 23px; position: relative; top: 9px;'>Detailed</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div style='float: left; width: 90px;' id="btnCreatePOSummary" class="divCreatePOButton">
                                                <img style='position: relative; margin-top: 13px; margin-left: 35px;' src='images/printer.png' /><span style='margin-left: 23px; position: relative; top: 9px;'>Summary</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div style='float: left; width: 90px;' id="btnCreatePOFuture" class="divCreatePOButton">
                                                <img style='position: relative; margin-top: 13px; margin-left: 35px;' src='images/printer.png' /><span style='margin-left: 23px; position: relative; top: 9px;'>Future</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div style='float: left; width: 90px;' id="btnHold" class="divCreatePOButton">
                                                <img style='position: relative; margin-top: 13px; margin-left: 35px;' src='images/printer.png' /><span style='margin-left: 23px; position: relative; top: 9px;'>Holds</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div style='float: left; width: 230px; background-color: #0082ff;' id="btnCreatePOGenSO" class="divCreatePOButton">
                                                <img style='position: relative; margin-top: 13px; margin-left: 101px;' src='images/file.png' /><span style='margin-left: -73px; position: relative; top: 20px;'>Generate Standing Orders</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td>
                        <div style="width: 150px; height: 51px; margin-left: 305px;">
                            <label style="font-size: 14px; font-weight: bold;">Sales Amount$</label>
                            <input type="text" id="txtCreatePOTotSale" style="width: 145px; margin-top: 4px; height: 27px; font-size: 13px; font-weight: bold; text-align: right;" readonly="readonly" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div id="DivCreatePOPurchaseDialog" style="display: none;">
    <table id="tblCreatePOHdr" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 195px;">
                <div class="filterbutton" id="divCPOHdrProdName">
                    <table style="width: 100%; height: 100%;" id="tblProd">
                        <tr>
                            <td style="font-weight: bold;">Product Name
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 61px;">
                <div class="filterbutton" id="divCPOHdrOrigin">
                    <table style="width: 100%; height: 100%;" id="tblCPOOrigin">
                        <tr>
                            <td style="font-weight: bold;">Origin
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 110px">
                <div class="filterbutton" id="divCPOHdrFarm">
                    <table style="width: 100%; height: 100%;" id="tblFarm">
                        <tr>
                            <td style="font-weight: bold;">Farm
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 65px;">
                <div class="filterbutton" id="divCPOHdrWH">
                    <table style="width: 100%; height: 100%;" id="tblWH">
                        <tr>
                            <td style="font-weight: bold;">WH
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 50px;">
                <div class="filterbutton" id="divCPOHdrQty">
                    <table style="width: 100%; height: 100%;" id="tblQty">
                        <tr>
                            <td style="font-weight: bold;">Qty
                            </td>
                        </tr>
                    </table>
                </div>
            </td>



            <td style="vertical-align: top; width: 75px; display: none;">
                <div class="filterbutton" id="divCPOHdrTotSal">
                    <table style="width: 100%; height: 100%;" id="tblTotSal">
                        <tr>
                            <td style="font-weight: bold;">Total Sales
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 50px;">
                <div class="filterbutton" id="divCPOHdrPrice">
                    <table style="width: 100%; height: 100%;" id="tblPrice">
                        <tr>
                            <td style="font-weight: bold;">Price
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 50px;">
                <div class="filterbutton" id="divCPOHdrCost">
                    <table style="width: 100%; height: 100%;" id="tblCost">
                        <tr>
                            <td style="font-weight: bold;">Cost
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 68px;">
                <div class="filterbutton" id="divCPOHdrTotCost">
                    <table style="width: 100%; height: 100%;" id="tblTotCost">
                        <tr>
                            <td style="font-weight: bold;">Total Cost
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 55px;">
                <div class="filterbutton" id="divCPOHdrPack">
                    <table style="width: 100%; height: 100%;" id="tblPack">
                        <tr>
                            <td style="font-weight: bold;">Pack
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 60px;">
                <div class="filterbutton" id="divCPOHdrUom">
                    <table style="width: 100%; height: 100%;" id="tblUom">
                        <tr>
                            <td style="font-weight: bold;">UOM
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 60px;">
                <div class="filterbutton" id="divCPOHdrVia">
                    <table style="width: 100%; height: 100%;" id="tblVia">
                        <tr>
                            <td style="font-weight: bold;">AGENCY
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 67px;">
                <div class="filterbutton" id="divCPOHdrFreight">
                    <table style="width: 100%; height: 100%;" id="tblFreight">
                        <tr>
                            <td style="font-weight: bold;">Freight
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 67px;">
                <div class="filterbutton" id="divCPOHdrHandling">
                    <table style="width: 100%; height: 100%;" id="tblHandling">
                        <tr>
                            <td style="font-weight: bold;">Handling
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 50px;">
                <div class="filterbutton" id="divCPOHdrDuty">
                    <table style="width: 100%; height: 100%;" id="tblDuty">
                        <tr>
                            <td style="font-weight: bold;">Duty
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 56px;">
                <div class="filterbutton" id="divCPOHdrGPM">
                    <table style="width: 100%; height: 100%;" id="tblGPM">
                        <tr>
                            <td style="font-weight: bold;">GPM%
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 74px;">
                <div class="filterbutton" id="divCPOHdrCargoDate">
                    <table style="width: 100%; height: 100%;" id="tblCargoDate">
                        <tr>
                            <td style="font-weight: bold;">Cargo Date
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 65px;">
                <div class="filterbutton" id="divCPOHdrBoxCode">
                    <table style="width: 100%; height: 100%;" id="tblBoxCode">
                        <tr>
                            <td style="font-weight: bold;">Box Code
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <table id="tblCreatePODet" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 100px;">
                <div class="filterbutton" id="divDetailProd">
                    <table style="width: 100%; height: 100%;" id="tblDetProd">
                        <tr>
                            <td>
                                <input type="text" id="txtCPOdetProdName" style="width: 192px; height: 20px;" />
                                <input type="hidden" id="hfCPOdetProd" />
                                <input type="hidden" id="hfCPOdetSPORDID" />
                            </td>
                            <td style="font-weight: bold;">
                                <select id="lstCPOdetOrigin" style="width: 60px; background-color: #00ff00; height: 23px;" />
                                <input type="hidden" id="hfCPOdetOrigin" />
                            </td>

                            <td style="font-weight: bold;">
                                <select id="lstCPOdetFarm" style="width: 90px; background-color: #00ff00; height: 23px;" />
                                <input type="hidden" id="hfCPOdetFarm" />
                            </td>

                            <td style="font-weight: bold;">
                                <select id="lstCPOdetWH" style="width: 65px; background-color: #00ff00; height: 23px;" />
                                <input type="hidden" id="hfCPOdetWH" />
                            </td>

                            <td>
                                <input type="text" id="txtCPOdetQty" style="width: 45px; height: 20px; text-align: right;" class="ClsNumbersOnly" />
                            </td>
                            <td style="display: none;">
                                <input type="text" id="txtCPOdetTotSales" style="width: 71px; height: 20px; text-align: right;" class="ClsDecimalsOnly" readonly="readonly" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetPrice" style="width: 48px; height: 20px; text-align: right;" class="ClsDecimalsOnly" />
                            </td>
                            <td>
                                <input type="text" class="ClsDecimalsOnly" id="txtCPOdetCost" style="width: 44px; height: 20px; text-align: right; background-color: #00ff00;" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetTotCost" style="width: 64px; height: 20px; text-align: right; background-color: #ff0000;" class="ClsDecimalsOnly" readonly="readonly" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetPack" style="width: 49px; height: 20px; text-align: right; background-color: #00ff00;" class="ClsNumbersOnly" />
                            </td>
                            <td style="font-weight: bold;">
                                <select id="lstCPOdetUOM" style="width: 60px; background-color: #00ff00; height: 23px;" />
                                <input type="hidden" id="hfCPOdetUOM" />
                            </td>

                            <td style="font-weight: bold;">
                                <select id="lstCPOdetVIA" style="width: 60px; background-color: #00ff00; height: 23px;" />
                                <input type="hidden" id="hfCPOdetVIA" />
                            </td>

                            <td>
                                <input type="text" id="txtCPOdetFreight" style="width: 64px; height: 20px; text-align: right; background-color: #84ffff;" class="ClsDecimalsOnly" />
                                <input type="hidden" id="hfCPOdetFBE" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetHandling" style="width: 50px; height: 20px; text-align: right; background-color: #84ffff;" class="ClsDecimalsOnly" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetDuty" style="width: 50px; height: 20px; text-align: right; background-color: #84ffff;" class="ClsDecimalsOnly" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetGPM" style="width: 50px; height: 20px; text-align: right; background-color: #84ffff; font-size: medium; font-weight: bold" class="ClsDecimalsOnly" />
                            </td>

                            <td>
                                <input type="text" id="txtCPOdetCargoDate" style="width: 64px; height: 20px; text-align: right; background-color: #84ffff;" />
                                <%--<select id="lstCPOdetCargoDate" style="width: 100px; height: 23px;" />--%>
                                <input type="hidden" id="hfCPOdetCargoDate" />
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetBoxCode" style="width: 106px; height: 20px;" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <table id="tblCreatePOFarmcom1" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOHdrFarmDet">
                    <table style="width: 100%; height: 100%;" id="tblFarmDet">
                        <tr>
                            <td style="font-weight: bold;">Farm Comments
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOHdrFarmCom1">
                    <table style="width: 100%; height: 100%;" id="tblFarmDetCom1">
                        <tr>
                            <td>
                                <input type="text" id="txtCPOdetFarmCom1" style="width: 1051px; height: 20px; margin-left: -99px;" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <table id="tblCreatePOFarmcom2" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOHdrFarmDet2">
                    <table style="width: 100%; height: 100%;" id="tblFarmDet2">
                        <tr>
                            <td style="font-weight: bold;"><input type="image" id="btnsearch" src="images/search.png" /></td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOHdrFarmCom2">
                    <table style="width: 100%; height: 100%;" id="tblFarmDetCom2">
                        <tr>
                            <td>
                                <input type="text" id="txtCPOdetFarmCom2" style="width: 1051px; height: 20px; margin-left: -99px;" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <table id="tblCreatePOIntercom" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOHdrIntercom">
                    <table style="width: 100%; height: 100%;" id="tblIntercom">
                        <tr>
                            <td style="font-weight: bold; width: 55%">Internal Comments
                            </td>
                            <td>
                                <%--<span id="btnDeny" class="Deny" title="Click here For DENY Order"></span>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 295px;">
                <div class="filterbutton" id="divCPOdetIntercom">
                    <table style="width: 100%; height: 100%;" id="tbldetIntercom">
                        <tr>
                            <td>
                                <input type="text" id="txtCPOdetIntercom" style="width: 1051px; height: 20px; margin-left: -99px;" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <table id="tblCreatePOOthers" style="margin-left: 5px;" class="createpodesign">
        <tr>
            <td style="vertical-align: top; width: 195px;">
                <div class="filterbutton" id="divCPOHdrlblUPC">
                    <table style="width: 100%; height: 100%;" id="tbllblUPC">
                        <tr>
                            <td style="font-weight: bold;">UPC
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetUPC" style="width: 163px; height: 20px;" maxlength="30" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 195px;">
                <div class="filterbutton" id="divCPOHdrlblType">
                    <table style="width: 100%; height: 100%;" id="tbllblType">
                        <tr>
                            <td style="font-weight: bold;">Type
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetType" style="width: 158px; height: 20px;" maxlength="30" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 195px;">
                <div class="filterbutton" id="divCPOHdrDesc">
                    <table style="width: 100%; height: 100%;" id="tbllblDesc">
                        <tr>
                            <td style="font-weight: bold;">Desc
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetDesc" style="width: 205px; height: 20px;" maxlength="30" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 285px;">
                <div class="filterbutton" id="divCPOHdrDateCode">
                    <table style="width: 100%; height: 100%;" id="tblDateCode">
                        <tr>
                            <td style="font-weight: bold;">
                                <label id="lblCPODateCode">Date Code</label>
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetDateCode" style="width: 205px; height: 20px;" maxlength="30" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 343px;">
                <div class="filterbutton" id="divCPOHdrUPCPrice">
                    <table style="width: 100%; height: 100%;" id="tblUPCPrice">
                        <tr>
                            <td style="font-weight: bold; padding-right: 15px; padding-left: 5px;">UPC Price
                            </td>
                            <td>
                                <input type="text" id="txtCPOdetUPCPrice" style="width: 240px; height: 20px;" maxlength="30" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
<%--End Region "Create PO"--%>
<%--Region "All Purchases"--%>
<div class="tabcontent" id="tabcontent-AllPurchases" style="display: none">
    <div id="PurchaseOrdersFilters" style="overflow: visible; display: block; border-width: 1px;">
        <table id="tblPurchaseHdrDropDowns" style="margin-left: 5px;">            
            <tr>
                <td style="vertical-align: top; width: 80px;">
                    <div class="filterbutton" id="divbtnCargo">
                        <table style="width: 100%; height: 100%;" id="tblbtnCargo">
                            <tr>
                                <td>
                                    <input id="btnPurchaseOrderCargoTruck" type="button" class="BloomButtonEnabled" value="Cargo" style="margin-left: 10px; width: 66px;">
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 10px;"></td>
                <%--<td>From
                </td>--%>
                <td>
                    <input type="text" id="txtPurchaseOrderFromDate" style="width: 70px;" />
                </td>
               <%-- <td>To
                </td>--%>
                <td>
                    <input type="text" id="txtPurchaseOrderToDate" style="width: 70px;" />
                </td>     
               <td>
                    <input id="btnAllPurchaseRefresh" type="button" class="BloomButtonEnabled" value="Refresh" style="margin-left: 5px; width: 66px;">
                </td> 
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailBuyer">
                        <table style="width: 100%; height: 100%;" id="tblDetBuyer">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrBuyer" style="width: 150px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrBuyer" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailFarm">
                        <table style="width: 100%; height: 100%;" id="tblDetFarm">
                            <tr>
                                <td style="font-weight: bold; font-size: small">
                                    <select id="lstAllPurchaseOdrFarm" style="width: 150px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrFarm" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailOrigin">
                        <table style="width: 100%; height: 100%;" id="tblDetOrigin">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrOrigin" style="width: 150px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrOrigin" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailStatus">
                        <table style="width: 100%; height: 100%;" id="tblDetStatus">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrStatus" style="width: 150px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrStatus" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailDesc">
                        <table style="width: 100%; height: 100%;" id="tblDetDesc">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrDesc" style="width: 210px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrDesc" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailUOM">
                        <table style="width: 100%; height: 100%;" id="tblDetUOM">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrUOM" style="width: 100px">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrUOM" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailCust">
                        <table style="width: 100%; height: 100%;" id="tblDetCust">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <select id="lstAllPurchaseOdrCust" style="width: 150px; display:none;">
                                    </select>
                                    <input type="hidden" id="hfAllPurchaseOdrCust" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailPieces">
                        <table style="width: 100%; height: 100%;" id="tblDetPieces">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <label style="margin-left: 10px;">Pieces</label>
                                </td>
                                <td style="font-weight: bold; font-size: small;">
                                    <input type="text" id="txtDetPieces" style="width: 50px; height: 19px; float: left; text-align: right; font-weight: bold;"
                                        class="AllUpperCaseTextBox" readonly="readonly" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="divDetailFBE">
                        <table style="width: 100%; height: 100%;" id="tblDetFBE">
                            <tr>
                                <td style="font-weight: bold; font-size: small;">
                                    <label style="margin-left: 10px;">FBE</label>
                                </td>
                                <td style="font-weight: bold; font-size: small;">
                                    <input type="text" id="txtDetFBE" style="width: 50px; height: 19px; float: left; text-align: right; font-weight: bold;"
                                        class="AllUpperCaseTextBox" readonly="readonly" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="DivAllPurchases">
        <table id="fgrdAllPurchasesList" style="display: none;">
        </table>
    </div>
</div>
<%--End Region--%>
<div class="tabcontent" id="tabcontent-POList" style="display: none">
    <table id="tblPOListHeaders" style="margin-left: 5px;">
        <tr>
            <td style="vertical-align: top; width: 100px; font-weight: bold; font-size: small;">
                <input type="button" id="btnDateType" class="BloomButtonEnabled" style="margin-left: 5px; width: 66px;"/>
            </td>
            <td style="vertical-align: top; width: 100px; font-weight: bold; font-size: small;">
                <input type="text" id="txtPOListFromDate" style="width: 95px;" />
            </td>
            <td style="vertical-align: top; width: 100px; font-weight: bold; font-size: small;">
                <input type="text" id="txtPOListToDate" style="width: 95px;" />
            </td>
            <td>                    
                <input id="btnPOListRefresh" type="button" class="BloomButtonEnabled" value="Refresh" style="margin-left: 5px; width: 66px;">
            </td>
            <td style="vertical-align: top; width: 100px; font-weight: bold; font-size: small;">
                <select id="lstAllPolistBuyer" style="width: 150px">
                </select>
                <input type="hidden" id="hfAllPOListBuyer" />
            </td>
            <td style="font-weight: bold; font-size: small">
                <select id="lstAllPOListFarm" style="width: 150px">
                </select>
                <input type="hidden" id="hfAllPOListFarm" />
            </td>
            <td style="font-weight: bold; font-size: small;">
                <select id="lstAllPOListOrigin" style="width: 150px">
                </select>
                <input type="hidden" id="hfAllPOListOrigin" />
            </td>
            
            <td style="font-weight: bold; font-size: small;">
                <select id="lstAllPOListStatus" style="width: 150px">
                </select>
                <input type="hidden" id="hfAllPOListStatus" />
            </td>
 
        </tr>
    </table>
    <div id="DivPOHeaderList">
        <table id="fgrdPOHeaderList" style="display: none;">
        </table>
    </div>
    <input id="btnNewPO" type="button" class="BloomButtonEnabled" value="NEW" style="margin-left: 5px; width: 66px;">
    <input id="btnPOHeaderEmail" type="button" class="BloomButtonEnabled" value="EMAIL"
        style="margin-left: 5px; width: 66px; display: none;">
    <input id="btnPOHeaderPrint" type="button" class="BloomButtonEnabled" value="PRINT"
        style="margin-left: 5px; width: 66px;">
<%--    <input id="btnPOCancelled" type="button" class="BloomButtonEnabled" value="CANCEL"
        style="margin-left: 5px; width: 66px;">--%>
    <input id="btnPOVoid" type="button" class="BloomButtonEnabled" value="VOID" style="margin-left: 5px; width: 66px;">
    <input id="btnView" type="button" class="BloomButtonEnabled" value="VIEW" style="margin-left: 5px; width: 66px;">
    <%--<input id="btnPostMultiplePO" type="button" class="BloomButtonEnabled" value="POST" style="margin-left: 5px; width: 66px;">--%>
    <input id="btnPORecalculate" type="button" class="BloomButtonEnabled" value="RECALC"
        style="margin-left: 5px; width: 66px;">

</div>
<div id="DeleteconfirmPODetail" style="display: none;" title="Alert">
</div>
<div id="PODetailNumber" style="display: none;">
</div>
<div id="CreatePOTempDialog">
    <div class="DetailsTitleDiv" style="font-size: 11px; ">
        <div class="DetailsTitleDiv2">
            <div class="DetailsTitlelink">
                <a class="DetailsTitlelinks"><span class="add" onclick="AddEditPOclicked();" title="Add a new detail">Add new</span></a> <a class="DetailsTitlelinks"><span class="update" onclick="updatedetailToTempGridclicked()"
                    title="Update selected detail">Update</span></a> <a class="DetailsTitlelinks"><span
                        class="clear" onclick="DeleteZeroValueInTempPOGrid()" title="Clear 0 boxes">Clear</span></a>
            </div>
            <div style="float: right;">
                <div style="float: left; margin-top: 4px; margin-right: 10px; font-weight: bold;">
                    CARGO DATE
                </div>
                <div style="float: left;">
                    <input type="text" id="txtCARGODATEAdd" style="margin-right: 27px; width: 135px; height: 16px; float: left"
                        class="AllUpperCaseTextBox" />
                </div>
            </div>
        </div>
        <div id="DivProductPurchaseDetailsTemp" style="margin-top: 10px; display: block">
            <table id="fgrdPOProductPurchaseDetailsTempGrid" style="display: none;">
            </table>
        </div>
    </div>
</div>
<div id="POSearchDialog">  <%--added by Belal on 22 Aug 2020 for searching PO List--%>
    <div class="" style="font-size: 11px; margin-top:35px;">
        <table>
            <tbody>
                <tr>
                    <td>PO Number</td>
                    <td><input type="text" id="txtSearchPONumber" style="width:220px; margin-left:25px;" /></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div id="TempPOHeaderID" style="display: none">
</div>
<div id="TempSelectedFarm" style="display: none">
</div>
<div id="TempSelectedFarmName" style="display: none">
</div>
<div id="msgbox-CreatePOTempCargoDateConfirm" style="display: none;" title="Alert">
    <p id="msgCreatePOTempCargoDateConfirm">
    </p>
</div>
<%-- Belal::17-APRIL-2021:: For Confirmation to transfer User File --%>
<div id="DivConfirmTransferToUserDialogNew" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td colspan="2">
                <div style="margin-top: 17px;">
                    <p id="msgCreatePOTempCargoDateConfirmNew"> </p>
                </div>
             </td>
        </tr>
        <tr>
            <td align="left">AWB</td>
            <td>
                <input type="text" id="txtAwb" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>
        <tr>
            <td align="left">Invoice</td>
            <td>
                <input type="text" id="txtInvoice" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>
    </table>
</div>
<%-- END --%>
<div id="DivADDEDITPO" style="display: none;" align="center">
    <table style="text-align: left; border-collapse: collapse;width:95%;">
        <tr style="height: 40px">
            <td colspan="6">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>


        <tr>
            <td style="" class="boldfont">Product
            </td>
            <td colspan="2">
                <input type="text" id="txtFlower_ADDEDITPO" style="width:642px; float: left;margin-left:21px" value=""
                    class="AllUpperCaseTextBox" />
                <%--<select placeholder='Choose Flower...' id="lstFlower" style="width: auto;" value="" />--%>
                <input type="hidden" id="hfFlower_ADDEDITPO" />
            </td>
        </tr>

        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px" class="boldfont">Quantity
                        </td>
                        <td>
                            <input type="text" id="txtQuantity_ADDEDITPO" style="width: 52px; margin-left: 31px;text-align:right;"
                                class="NumbersOnly" maxlength="5" />&nbsp;&nbsp;&nbsp;
                            <select id="lstUOM_ADDEDITPO" style="width:125px; height:23px; margin-right:5px;">
                            </select>
                            <input type="hidden" id="hfUOM_ADDEDITPO" />
                        </td>
                        <td class="boldfont">Units/Bunch
                        </td>
                        <td>
                            <input type="text" id="txtUnitsPerBunch_ADDEDITPO" style="width: 52px; margin-right:5px;text-align:right;" class="NumbersOnly" />
                        </td>
                        <td class="boldfont">Units/Box
                        </td>
                        <td>
                            <input type="text" id="txtUnitsPerBox_ADDEDITPO" style="width: 52px;margin-right:5px;text-align:right;"
                                class="NumbersOnly" maxlength="4" />
                        </td>
                        <td class="boldfont">Total Units
                        </td>
                        <td>
                            <input type="text" id="txtTotalUnits_ADDEDITPO" style="width: 60px; padding-left: 4px;text-align:right;"
                                class="NumbersOnly" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td style="" class="boldfont">Cost/Units
            </td>
            <td>
                <input type="text" id="txtCostPerUnit_ADDEDITPO" style="width:52px;text-align:right; margin-left:21px" class="DecimalsOnly" />
            </td>
             <td style="padding-left: 0px;" class="boldfont">Type
                <input style="width: 45px; padding-left: 7px" maxlength="1" type="text" id="txtType_ADDEDITPO"
                    class="AllUpperCaseTextBox SpecifiedCharOnly" />
                <label style="font-weight: normal">
                    (M-Market,P-PreBook,S-Standing Order,B-Bi-Weekly)</label>
            </td>
        </tr>

        <%--<tr>
            <td style="" class="boldfont">Cost/Units
            </td>
            <td>
                <input type="text" id="txtCostPerUnit_ADDEDITPO" style="width: 52px;" class="DecimalsOnly" />
            </td>
            <td style="padding-left: 0px;" class="boldfont">Type
                <input style="width: 15px; padding-left: 7px" maxlength="1" type="text" id="txtType_ADDEDITPO"
                    class="AllUpperCaseTextBox SpecifiedCharOnly" />
                <label style="font-weight: normal">
                    (M-Market,P-PreBook,S-Standing Order,B-Bi-Weekly)</label>
            </td>
        </tr>--%>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">BoxCode
                        </td>
                        <td>
                            <input type="text" id="txtBoxCode_ADDEDITPO" maxlength="15" style="width: 110px;margin-left: 31px;margin-right: 29px;" />
                        </td>
                        <td style="padding-left: 0px" class="boldfont">UPC
                        </td>
                        <td>
                            <input type="text" id="txtUPC_ADDPODetail" style="width: 80px;text-align:left;margin-left:5px;" class="DecimalsOnly" />
                        </td>

                        <td class="boldfont" style="padding-left:17px">Price UPC
                        </td>
                        <td>
                            <input type="text" id="txtPriceOnUPC_ADDPODetail" maxlength="15" style="text-align:left;width:80px;margin-left:5px;" />
                        </td>

                        <td class="boldfont" style="padding-left:17px;">Date Code
                        </td>
                        <td>
                            <input type="text" id="txtDateCode_ADDPODetail" style="width: 80px; margin-left:5px;text-align:left" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <%--<tr>
            <td style="" class="boldfont">BoxCode
            </td>
            <td>
                <input type="text" id="txtBoxCode_ADDEDITPO" maxlength="15" style="width: 110px;" />
            </td>
        </tr>--%>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">Cust#
                        </td>
                        <td>
                            <input type="text" id="txtCustNo_ADDEDITPO" style="text-align:right;width: 110px;margin-left:47px" class="NumbersOnly" maxlength="5" />
                        </td>

                        <td class="boldfont" style="padding-left:29px;">Description
                        </td>
                        <td>
                            <input type="text" id="txtDescription_ADDPODetail" maxlength="15" style="width: 385px;text-align:left;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <%--<tr>
            <td style="" class="boldfont">Cust#
            </td>
            <td>
                <input type="text" id="txtCustNo_ADDEDITPO" style="width: 52px;" class="NumbersOnly"
                    maxlength="5" />
            </td>
        </tr>--%>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">Comments
                        </td>
                        <td>
                            <input style="width: 640px;margin-left:19px"  type="text" maxlength="200" id="txtComments_ADDEDITPO" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

       <%-- <tr>
            <td style="" class="boldfont">Comments
            </td>
            <td colspan="3">
                <input type="text" id="txtComments_ADDEDITPO" maxlength="200" style="width: 513px;" />
            </td>
        </tr>--%>

        <tr style="display:none;">
            <td style="" class="boldfont">BreakDown
            </td>
            <td colspan="3">
                <input style="width: 513px" type="text" maxlength="200" id="txtBreakdown_ADDEDITPO" />
            </td>
        </tr>
    </table>
</div>


<div id="DivEDITPODetail" style="display: none;" align="center">
    <table style="text-align: left; border-collapse: collapse;width:95%;">
        <tr style="height: 40px">
            <td colspan="6">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>

        <tr style="height: 5px">
            <td style="" class="boldfont">Product
            </td>
            <td colspan="2">
                <input type="text" id="txtFlower_EDITPODetail" style="width:642px; float: left;margin-left:21px"
                    value="" class="AllUpperCaseTextBox" />
                <%--<select placeholder='Choose Flower...' id="lstFlower" style="width: auto;" value="" />--%>
                <input type="hidden" id="hfFlower_EDITPODetail" />
            </td>
        </tr>

        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px" class="boldfont">Quantity
                        </td>
                        <td>
                            <input type="text" id="txtQuantity_EDITPODetail" style="width: 52px; margin-left: 31px;text-align:right;"
                                class="NumbersOnly" maxlength="5" />&nbsp;&nbsp;&nbsp;
                            <select id="lstUOM_EDITPODetail" style="width:125px; height:23px; margin-right:5px;">
                            </select>
                            <input type="hidden" id="hfUOM_EDITPODetail" />
                        </td>
                        <td class="boldfont">Units/Bunch
                        </td>
                        <td>
                            <input type="text" id="txtUnitsPerBunch_EDITPODetail" style="width: 52px; margin-right:5px;text-align:right;" class="NumbersOnly" />
                        </td>
                        <td class="boldfont">Units/Box
                        </td>
                        <td>
                            <input type="text" id="txtUnitsPerBox_EDITPODetail" style="width: 52px;margin-right:5px;text-align:right;"
                                class="NumbersOnly" maxlength="4" />
                        </td>
                        <td class="boldfont">Total Units
                        </td>
                        <td>
                            <input type="text" id="txtTotalUnits_EDITPODetail" style="width: 60px; padding-left: 4px;text-align:right;"
                                class="NumbersOnly" disabled />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="" class="boldfont">Cost/Units
            </td>
            <td>
                <input type="text" id="txtCostPerUnit_EDITPODetail" style="width:52px;text-align:right; margin-left:21px" class="DecimalsOnly" />
            </td>
            <td style="padding-left: 0px;" class="boldfont">Type
                <input style="width: 45px; padding-left: 7px" maxlength="1" type="text" id="txtType_EDITPODetail"
                    class="AllUpperCaseTextBox SpecifiedCharOnly" />
                <label style="font-weight: normal">
                    (M-Market,P-PreBook,S-Standing Order,B-Bi-Weekly)</label>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">BoxCode
                        </td>
                        <td>
                            <input type="text" id="txtBoxCode_EDITPODetail" maxlength="15" style="width: 110px;margin-left: 31px;margin-right: 29px;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">Cust#
                        </td>
                        <td>
                            <input type="text" id="txtCustNo_EDITPODetail" style="text-align:right;width: 110px;margin-left:47px" class="NumbersOnly" maxlength="5" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="" class="boldfont">Comments
                        </td>
                        <td>
                            <input style="width: 640px;margin-left:19px"  type="text" maxlength="200" id="txtComments_EDITPODetail" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="width: 1px; vertical-align: middle">
                            <img src="images/netsalesinfo.png" id="EditPOPart2" class="imgCustSales" data-custno="" data-custname="" title="Bouquet Details" style="margin-bottom: 15px; cursor: pointer;" />
                        </td>
                    </tr>
                </table>
            </td> 
        </tr>

        <tr style="display:none;">
            <td style="" class="boldfont">BreakDown
            </td>
            <td colspan="3">
                <input style="width: 513px" type="text" maxlength="200" id="txtBreakdown_EDITPODetail" />
            </td>
        </tr>
    </table>
</div>


<div id="DivEDITPODetailPart2" style="display: none;" align="center">

    <table style="text-align: left; border-collapse: collapse;width:95%;">
    <%--    <tr style="height: 40px">
            <td colspan="6">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>--%>
        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        
                        <td style="padding-left:1px;width: 48px;" class="boldfont">UPC
                        </td>
                        <td>
                            <input type="text" id="txtUPC_EDITPODetail2" style="width: 110px;text-align:left;margin-left:52px;" class="ClsNumbersOnly" />
                        </td>

                        <td class="boldfont" style="padding-left:17px">UPC Price
                        </td>
                        <td>
                            <input type="text" id="txtPriceOnUPC_EDITPODetail2" maxlength="15" style="text-align:left;width:110px;margin-left:5px;" />
                        </td>

                        <td class="boldfont" style="padding-left:17px;">Date Code
                        </td>
                        <td>
                            <input type="text" id="txtDateCode_EDITPODetail2" style="width: 110px; margin-left:5px;text-align:left" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left:1px;width: 80px;" class="boldfont" valign='top'>UPC Desc
                        </td>
                        <td valign='top'>
                            <input type="text" id="txtDescription_EDITPODetail2" maxlength="100" style="width: 450px;text-align:left;margin-left:19px" />
                        </td>
                        <td valign='top'><input type="file" id="bouquetImg" style="display: none;" /><button id="btnbouquetImg">No file found</button></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left:1px;width: 80px;" class="boldfont" valign='top'>Food Desc
                        </td>
                        <td valign='top'>
                            <input type="text" id="txtFoodDesc_EDITPODetail2" maxlength="100" style="width: 450px;text-align:left;margin-left:19px" />
                        </td>
                        <td valign='top'><input type="file" id="foodImg" style="display: none;" /><button id="btnfoodImg">No file found</button></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left:1px;width: 80px;" class="boldfont" valign='top'>Pick Desc
                        </td>
                        <td valign='top'>
                            <input type="text" id="txtPickDesc_EDITPODetail2" maxlength="100" style="width: 450px;text-align:left;margin-left:19px" />
                        </td>
                        <td valign='top'><input type="file" id="pickImg" style="display: none;" /><button id="btnpickImg">No file found</button></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr style="height: 45px">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left:1px;width: 80px;" class="boldfont" valign='top'>Sleeve Desc
                        </td>
                        <td valign='top'>
                            <input type="text" id="txtSleeveDesc_EDITPODetail2" maxlength="100" style="width: 450px;text-align:left;margin-left:19px" />
                        </td>
                        <td valign='top'><input type="file" id="sleeveImg" style="display: none;" /><button id="btnsleeveImg">No file found</button></td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
</div>

<div id="DivPOComment" style="display: none; align-items: center">
    <table style="text-align: left; border-collapse: collapse;">
        <tr>
            <td>
                <textarea id="txtPOCommentUpdate" style="width: 560px;" rows="15" cols="40" />
            </td>
        </tr>
    </table>
</div>
<div id="DivEDITPOHeaderDialog" style="display: none;" align="center">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>P.O. #
                        </td>
                        <td>
                            <input type="text" disabled="disabled" id="txtPONumber_EditPOHeader" />
                        </td>
                    </tr>
                    <tr style="height: 39px;">
                        <td>VENDOR
                        </td>
                        <td style="margin-left: 57px; vertical-align: top">
                            <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                            <div style="">
                                <select id="lstfarm_EditPOHeader" style="width: 250px;" value="" />
                            </div>
                        </td>
                        <td>AIRPORT
                        </td>
                        <td>
                            <label id="lblAirport_EDITPOHEADER">
                            </label>
                        </td>
                        <td>FARM SHIP
                        </td>
                        <td>
                            <input type="text" id="txtFarmShip_EDITPOHEADER" style="width:75px;" />
                        </td>
                        <td><div style="margin-left:-60px;" id="DivDayofShip"></div></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>WAREHOUSE
                        </td>
                        <td style="vertical-align:top">
                            <input type="text" style="display: block;opacity:0; height: 0px; width: 0px" />
                            <div style="">
                                <select id="lstWarehouse_EditPOHeader" style="width: 150px;" value="" />
                            </div>
                        </td>
                        <td>POTYPE
                        </td>
                        <td>
                            <select id="lstPOTYPE_EditPOHeader" style="width:150px;" value="" />
                        </td>
                        <td>AGENCY
                        </td>
                        <td>
                            <select id="lstAGENCY_EditPOHeader" style="width:150px;" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="btnConfirmPO" type="button" class="BloomButtonEnabled" value="CONFIRM"
                                style="margin-left: 5px; width:200px;"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>PO STATUS
                        </td>
                        <td>
                            <select id="lstPOSTATUS_EditPOHeader" style="width:150px;" value="" />
                        </td>
                        <td>BUYER
                        </td>
                        <td>
                            <input type="text" id="txtBuyer_EDITPOHEADER" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <div id="DivPODetailList">
                                <table id="fgrdPODetails" style="display:none;">
                                </table>
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
                        <td>
                            <input id="btnAddPODetailItem" type="button" class="BloomButtonEnabled" value="ADD"
                                style="margin-left: 5px; width: 66px;">
                            <input id="btnPOPostNew" type="button" class="BloomButtonEnabled" value="POST" style="margin-left: 5px; width: 66px;">
                            <input id="btnPODetailDROP" type="button" class="BloomButtonEnabled" value="DROP"
                                style="margin-left: 5px; width: 66px;">
                            <input id="btnPODetailEmail" type="button" class="BloomButtonEnabled" value="EMAIL"
                                style="margin-left: 5px; width: 66px;">
                            <input id="btnPOPrint" type="button" class="BloomButtonEnabled" value="PRINT"
                                style="margin-left: 5px; width: 66px;">
                            <input id="btnPOComment" type="button" class="BloomButtonEnabled" value="COMMENT"
                                style="margin-left: 5px; width: 80px;">
                            <input id="btnPODuplicate" type="button" class="BloomButtonEnabled" value="DUPLICATE"
                                style="margin-left: 5px; width: 90px;">
                            <input id="btnPOHistory" type="button" class="BloomButtonEnabled" value="HISTORY"
                                style="margin-left: 5px; width: 80px;">
                            <input id="btnClose" type="button" class="BloomButtonEnabled" value="CLOSE" style="margin-left: 5px; width: 66px;">
                            <input id="btnPOHeaderSave" type="button" class="BloomButtonEnabled" value="SAVE" style="margin-left: 5px; width: 66px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="DivViewRecipeForFgrd" style="display: none;">
    <table>
        <tr>
            <td>
               <div id="DivRecipeForFgrd">

    <div class="flexigrid">
        <div class="tDiv">
            <div class="tDiv2" style="height: 20px;">
                <div class="link"><a class="links"><span class="add" onclick="addRecipeclicked()">Add</span></a></div>
               <div>
                    <table>
                     <tr>
                         <td style="font-weight: bold; font-size: small;">
                        <label style="margin-left: 435px;">Total Cost:</label>
                    </td>
                          <td style="font-weight: bold; font-size: small;">
                                    <input type="text" id="txtRecipetotcost" style="width: 80px; height: 19px; float: left; text-align: left; font-weight: bold;"
                                         readonly="readonly" />
                                </td>
                    <%-- <td style="font-weight: bold; font-size: small;">
                        <label id="lblRecipetotcost" style="margin-left: 10px;"></label>
                    </td>--%>
                     </tr>
                  </table>
               </div>
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
 
    <table id="fgrdRecipe" style="display: none;"></table>
    <div id="DeleteConfirmRecipeDetails" style="display: none;" title="Alert"></div>
    <div id="RecipeOldId" style="display: none;"></div>
</div>
            </td>
        </tr>
        
    </table>
</div>
<div id="ProductRecipeDialog" style="display: none;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    
                    <tr style="width:50px">
           <td>
                <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">PRODUCT</label>
                        </td>
            <td colspan="10" id="tdRecProduct">
                <input type="hidden" id="hfRecipeProductID"" />
                 <input type="hidden" id="hfRecipeProduct" />
                 <input type="hidden" id="hfRecipeFlower" />
                
                <input type="text" style="width: 377px;" id="txtRecipeProduct"  class="AllUpperCaseTextBox"/>
            </td>
          
        </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">QTY</label>
                        </td>
                        <td>
                            <input type="text" id="txtRecipeQTY" class="ClsNumbersOnly" style="width: 65px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">UOM</label>
                        </td>
                        <td>
                            <%--<select id="lstRecipeUOM" style="width: 68px; height: 23px; margin-bottom: 2px;"></select>--%>
                            <input type="text" style="width: 30px;" id="txtRecipeUOM"  class="AllUpperCaseTextBox" maxlength="5" placeholder="ST"/>
                            <input type="hidden" id="hfRecipeUOM" />
                        </td>
                    </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">COST</label>
                        </td>
                        <td>
                            <input type="text" id="txtRecipeCost" class="DecimalsOnly" style="width: 65px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>


                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">TYPE</label>
                        </td>
                        <td>
                           <%-- <input type="text" id="txtRecipeType" style="width: 21px; margin-bottom: 2px;" class="AllUpperCaseTextBox">--%>
                             <select id="lstRecipeType" style="width: 100px; height: 25px; margin-bottom: 2px;"> </select>
                            <input type="hidden" id="hfRecipeType" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="divFlowerID" style="display: none;"></div>
<div id="DivPOHistoryMain">
    <table id="tblPOHS" style="float: left" cellspacing="0">
        <tr>
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <div id="DivPOHistoryInner" style="float: left">
                    <table id="fgrdPOHistory" style="display: block;">
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="DivPOStatus" style="display:none;">
</div>
<div id="DivConfirmPO" style="display: none;">
    <table id="fgrdConfirmPODetails" style="display: none;">
    </table>
</div>
<div id="DivDenyPO" style="display:none;" title="Alert">
    <table id="tblDivDenyPO" style="float: left" cellspacing="0">
        <tr>
            <td style="vertical-align: top; padding: 0px; margin: 0px;width:70px;">
               Reason
            </td>
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <input type="text" id="txtDenyPOReason" style="width: 300px;" />
            </td>
        </tr>
        <tr>
            <td id="tdDivDenyPO">

            </td>
        </tr>
    </table>
</div>
<div id="DivDuplicatePOConfirm" style="display: none;">
    <table style="width: 100%">
        <tr style="height: 39px;">
            <td style="width: 40%; text-align: center">SHIP DATE
            </td>
            <td style="width: 60%; text-align: left">
                <input type="text" id="txtFarmShip_Duplicate" style="width: 100px;" />
            </td>
        </tr>
    </table>
</div>
<div id="DivCreatePOGenerateStandingOrder" style="display: none;">
    <table style="width: 100%">
        <tr style="height: 39px;">
            <td style="width: 40%; text-align: center">CUSTOMER #
            </td>
            <td style="width: 60%; text-align: left">
                <input type="text" id="txtCustomerSPORD" style="width: 200px;" />
                <input type="hidden" id="hdnCustomerSPORD" style="width: 200px;" />
                <img style="cursor: pointer;" id="ChkIgnore" src="images/check-off.png" />Ignore
            </td>
        </tr>
        <tr style="height: 39px;">
            <td style="width: 40%; text-align: center">FARM SHIP DATE
            </td>
            <td style="width: 60%; text-align: left">
                <input type="text" id="txtCargoDate" style="width: 100px;" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td>
                <img style="cursor: pointer;" id="ChkAllWeek" src="images/check-off.png" />All Week
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td>
                <img style="cursor: pointer;" id="ChkRepeat" src="images/check-off.png" />Repeat (Warning)
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td>
                <img style="cursor: pointer;" id="rdoAllFarm" src="images/check-off.png" />All Farm
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td>
                <img style="cursor: pointer;" id="rdoSelectFarm" src="images/check-off.png" />Select Farm
            </td>
        </tr>
        <tr id="trFarmSPORD" style="height: 39px; display: none;">
            <td style="width: 40%; text-align: center">SELECT FARM
            </td>
            <td style="width: 60%; text-align: left">
                <select id="lstFarmSPORD" style="width: 200px;" />
            </td>
        </tr>
    </table>
</div>
<div id="DivCancelPODialog" style="display: none;">
    <table style="width: 100%">
        <tr style="height: 39px;">
            <td style="width: 40%; text-align: center">REASON
            </td>
            <td style="width: 60%; text-align: left">
                <select id="lstCancelReason" style="width: 260px;" />
            </td>
        </tr>
        <tr>
            <td style="width: 40%; text-align: center">COMMENT
            </td>
            <td style="width: 60%; text-align: left">
                <textarea id="txtCancelComment" style="width: 260px;" rows="4" cols="50" />
            </td>
        </tr>
    </table>
</div>
<div id="DivVoidPODialog" style="display:none;">
    <table style="width:100%">
        <tr style="height:39px;">
            <td style="width:40%;text-align: center">REASON
            </td>
            <td style="width: 60%;text-align:left">
                <select id="lstVoidReason" style="width: 260px;" />
            </td>
        </tr>
        <tr>
            <td style="width: 40%; text-align: center">COMMENT
            </td>
            <td style="width: 60%; text-align: left">
                <textarea id="txtVoidComment" style="width: 260px;" rows="4" cols="50" />
            </td>
        </tr>
    </table>
</div>
<div id="DivDropPOItem" style="display: none;">
    <table style="width: 100%">
        <tr style="height: 39px; display: none;">
            <td style="width: 40%; text-align: center">SHIP DATE
            </td>
            <td style="width:60%; text-align:left">
                <input type="text" id="txtFarmShip_Drop" style="width:100px;" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="fgrdDropPOList" style="display: block;">
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="DetailFlag" style="display: none;"></div>
<div id="ORDNo" style="display: none;"></div>
<div id="POQId" style="display: none;"></div>

<div id="txtUPC_EDITPODetail" style="display: none;"></div>
<div id="txtPriceOnUPC_EDITPODetail" style="display: none;"></div>
<div id="txtDateCode_EDITPODetail" style="display: none;"></div>
<div id="txtDescription_EDITPODetail" style="display: none;"></div>
<div id="txtFoodDesc_EDITPODetail" style="display: none;"></div>
<div id="txtPickDesc_EDITPODetail" style="display: none;"></div>
<div id="txtSleeveDesc_EDITPODetail" style="display: none;"></div>

<%--<input type="hidden" id="txtUPC_EDITPODetail"/>
<input type="hidden" id="txtPriceOnUPC_EDITPODetail"/>
<input type="hidden" id="txtDateCode_EDITPODetail"/>
<input type="hidden" id="txtDescription_EDITPODetail"/>
<input type="hidden" id="txtFoodDesc_EDITPODetail"/>
<input type="hidden" id="txtPickDesc_EDITPODetail"/>
<input type="hidden" id="txtSleeveDesc_EDITPODetail"/>--%>

<div id="DialogEmailPO" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr style="display: none">
            <td style="float: left" title="Send Selected Invoices One By One">
                <input type="checkbox" id="chkSendInvoicesOneByOne">
                <label for="chkSendInvoicesOneByOne"><span style="padding: 1px; float: left;"></span>One By One</label>
            </td>
        </tr>
        <tr class="Emailsection">
            <td>
                <b>Send To</b>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailIDsForPO" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr id="trSubject">
            <td>
                <b>Subject</b>
                <input type="text" style="width: 466px;" id="txtEmailSubject" spellcheck="false" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Message</b>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailBody" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>
<div id="DialogEmailPODetail" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr style="display: none">
            <td style="float: left" title="Send Selected Invoices One By One">
                <input type="checkbox" id="chkSendInvoicesOneByOneDetail">
                <label for="chkSendInvoicesOneByOne"><span style="padding: 1px; float: left;"></span>One By One</label>
            </td>
        </tr>
        <tr class="Emailsection">
            <td>
                <b>Send To</b>
                <textarea rows="2" style="width: 466px; height: 50px;" cols="5" id="txtEmailIDsForPODetail" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr id="trSubjectDetail">
            <td>
                <b>Subject</b>
                <input type="text" style="width: 466px;" id="txtEmailSubjectDetail" spellcheck="false" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Message</b>
                <textarea rows="2" style="width: 466px; height: 101px;" cols="5" id="txtEmailBodyDetail" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
    <div id="LoggedInUserID" runat="server" style="display: none"></div>
</div>
<div id="divSaveFlag" style="display:none;"></div>
<div id="divPOAcPostAgainConfirmDialog" style="display:none;">
    <p>Do you want to post the PO again?</p>
    <div>
        <input type="hidden" id="RepostPoNum" />
    </div>
</div>
<div id="divPoPostMessageDialog" style="display:none;">
    <div id="PoPostMessage">
        
    </div>
</div>
<div id="DivLoadPurchasesByProductForPageFlowers" style="display: none;" class="FileHover">
    <table id="tblLoadPurchasesByProductForPageFlowers" style="display: none;"></table>
</div>
<script type="text/javascript">
    var POListGridIntialize = false;
    var POAllPurchaseGridIntialize = false;
    var POCreatePOGridInitialize = false;
    var isAllPurchaseFromDateChanged = false, isAllPurchaseToDateChanged = false;
    var isPOListFromDateChanged = false, isPOListToDateChanged = false;
    var hideCustOnGrid = false;
    var isSPORDCPOeditclicked = false;
    var isFromCreatePOEdit = false;
    var getcpo_oldqty = parseInt(0.00), getcpo_oldpack = parseInt(0.00), getcpo_oldcost = parseFloat(0.00).toFixed(4), getcpo_oldprice = parseFloat(0.00).toFixed(4), cpomode = parseInt(0), cpoorigin = "";
    var sqlIdForCreatePO = 0;

    hideCustOnGrid = '<%=ConfigurationManager.AppSettings("HideCustomerNameOnCreatePO").ToString() %>' == "1" ? true : false;
    var selectedPOEditRow = "";
    var companyName = "";
    companyName = '<%=ConfigurationManager.AppSettings("CompanyName").ToString() %>';
    debugger;

    $("#txtUPC_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtPriceOnUPC_EDITPODetail2").focus();
        }
    });

    $("#txtPriceOnUPC_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtDateCode_EDITPODetail2").focus();
        }
    });

    $("#txtDateCode_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtDescription_EDITPODetail2").focus();
        }
    });


    $("#txtDescription_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtFoodDesc_EDITPODetail2").focus();
        }
    });

    $("#txtFoodDesc_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtPickDesc_EDITPODetail2").focus();
        }
    });

    $("#txtPickDesc_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtSleeveDesc_EDITPODetail2").focus();
        }
    });


    $("#txtSleeveDesc_EDITPODetail2").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#btnPoEditDialogSavePart2").focus();
        }
    });



    $("#txtFlower_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtQuantity_EDITPODetail").focus();
        }
    });
    $("#txtQuantity_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#lstUOM_EDITPODetail").focus();
        }
    });
    $("#lstUOM_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtUnitsPerBunch_EDITPODetail").focus();
        }
    });
    $("#txtUnitsPerBunch_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtUnitsPerBox_EDITPODetail").focus();
        }
    });
    $("#txtUnitsPerBox_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtCostPerUnit_EDITPODetail").focus();
        }
    });
    $("#txtCostPerUnit_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtType_EDITPODetail").focus();
        }
    });
    $("#txtType_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtBoxCode_EDITPODetail").focus();
        }
    });

    $("#txtBoxCode_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtCustNo_EDITPODetail").focus();
        }
    });



    $("#txtCustNo_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#txtComments_EDITPODetail").focus();
        }
    });

    $("#txtComments_EDITPODetail").on("keypress", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#btnPoEditDialogSave").focus();
        }
    });
    $("#txtComments_ADDEDITPO").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $(".icon-save").focus();
            return false;
        }
    });

    if (companyName != "Misty Flowers") {
        $("#btnPOPostNew").css({ "display": "none" });
    }

    $("#btnPOPostNew").on("click", function () {
        var PO = $("#txtPONumber_EditPOHeader").val();
        var PoStatus = CheckIfPOAlreadyPosted(PO);
        debugger;
        if (PoStatus == "AC POSTED") {
            $("#RepostPoNum").val(PO);
            $("#divPOAcPostAgainConfirmDialog").dialog("open");
        } else {

            LoadPODetailsByPONum(PO);
        }
    })
    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) {
            if ($(this).attr('id') == "txtInvoice") {
                $(".icon-save").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetProdName") {
                $("#txtCPOdetQty").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetQty") {
                $("#txtCPOdetCost").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetCost") {
                $("#txtCPOdetPack").focus()
                return false;
            }
            //if ($(this).attr('id') == "txtCPOdetPack") {
            //    $("#lstCPOdetUOM").focus()
            //    return false;
            //}
            //if ($(this).attr('id') == "lstCPOdetUOM") {
            //    $('select[name="lstCPOdetOrigin"]').eq(1).focus();
            //    //$("#lstCPOdetOrigin").focus()
            //    return false;
            //}
            //if ($(this).attr('id') == "lstCPOdetOrigin") {
            //    $("#lstCPOdetVIA").focus()
            //    return false;
            //}
            if ($(this).attr('id') == "txtCPOdetPack") {
                $("#txtCPOdetFreight").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetFreight") {
                $("#txtCPOdetHandling").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetHandling") {
                $("#txtCPOdetDuty").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetDuty") {
                $("#txtCPOdetGPM").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetGPM") {
                $("#txtCPOdetBoxCode").focus()
                return false;
            }
            //if ($(this).attr('id') == "lstCPOdetFarm") {
            //    $("#lstCPOdetCargoDate").focus()
            //    return false;
            //}
            //if ($(this).attr('id') == "lstCPOdetCargoDate") {
            //    $("#lstCPOdetWH").focus()
            //    return false;
            //}
            //if ($(this).attr('id') == "lstCPOdetWH") {
            //    $("#txtCPOdetBoxCode").focus()
            //    return false;
            //}
            if ($(this).attr('id') == "txtCPOdetBoxCode") {
                $("#txtCPOdetFarmCom1").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetFarmCom1") {
                $("#txtCPOdetFarmCom2").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetFarmCom2") {
                $("#txtCPOdetIntercom").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetIntercom") {
                $("#txtCPOdetUPC").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetUPC") {
                $("#txtCPOdetType").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetType") {
                $("#txtCPOdetDesc").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetDesc") {
                $("#txtCPOdetDateCode").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetDateCode") {
                $("#txtCPOdetUPCPrice").focus()
                return false;
            }
            if ($(this).attr('id') == "txtCPOdetUPCPrice") {
                //$("#txtCPOdetQty").focus()
                //return false;
            }
        }
    }); //end of input key press

    $(".tabs").die('click').live("click", function (e) {
        $(".tabs").css('background', '#dddddd')
        $(".tabs").css('color', 'black');
        $(this).css('background', '#0000ff')
        $(this).css('color', 'white');
    });
    var today = new Date();
    var newdate = new Date();
    newdate.setDate(today.getDate());
    $("#txtCARGODATEAdd").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", newdate);

    $("#txtFarmShip_EDITPOHEADER").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", newdate);

    $("#txtFarmShip_Duplicate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", newdate);

    $("#txtFarmShip_Drop").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", newdate);

    $("#txtCPOdetCargoDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", new Date());

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
        $("#txtInventoryFromRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        $("#txtInventoryToRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
    });

    $("#aEmailInvoices").die("click").live("click", function () {
        viewEmailLog();  // Added By Belal on 05 Sept 2020
    });

    $("#divPOAcPostAgainConfirmDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 300,
        modal: true,
        title: 'Confirm PO post',
        buttons: {
            Yes: function () {
                var PO = $("#RepostPoNum").val();
                LoadPODetailsByPONum(PO);

                $("#RepostPoNum").val("");
                $("#divPOAcPostAgainConfirmDialog").dialog("close");
            },
            No: function () {
                $("#RepostPoNum").val("");
                $("#divPOAcPostAgainConfirmDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
    });
    $("#divPoPostMessageDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 450,
        modal: true,
        title: 'Confirm PO post',
        buttons: {
            ok: function () {
                $("#PoPostMessage").empty();
                $("#divPoPostMessageDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function LoadPODetailsByPONum(PO) { //added by Belal 20 Aug 2020
        var dbModel = { "PO": PO };
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadPoDetailsByPoNumber',
            data: JSON.stringify(dbModel),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d != "" || output.d != null) {
                    var xmlData = new window.DOMParser().parseFromString(output.d, "text/xml");
                    var detailCount = xmlData.documentElement.getElementsByTagName("Detail").length;
                    var totalGrdQty = 0;
                    $('#fgrdPODetails tr').each(function () {
                        if ($(this).find("td").eq(7).text().trim() != "Total") {
                            totalGrdQty += parseInt($(this).find("td").eq(9).text().trim());
                        }
                    });
                    if (detailCount == totalGrdQty) {
                        PostDataToAPI(output.d, PO);
                    } else {
                        $.growl.error({ title: "", message: "Please try again later.." });
                    }
                }
                else
                    $.growl.error({ title: "", message: "No data found !!" });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });
    }
    function PostDataToAPI(XMLdata, PO) { //added by Belal 20 Aug 2020

        debugger;
        $.ajax({
            type: "POST",
            url: 'https://cloud.logiztikalliance.com:5005/logCloudWS/api/Pos/InsertarPosXmlClientesAlliance/99bOdf4S1W6ZCaC7d6dR9D6',
            data: XMLdata,
            contentType: "application/xml",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.isSuccess) {
     
                    InsertPOHistoryLog(PO, "AC POSTED");
                    SendMail(PO, XMLdata, "Success:: XML Posting for PO# " + PO);
                    Updatepoheaderstatus(PO, "AC POSTED");

                } else {
                    var msg = "";
                    $.each(output.message, function (i, item) {
                        $.growl.error({ title: "", message: item.message });
                        msg += item.message + " \r\n\r\n ";
                    });
                    InsertPOHistoryLog(PO, msg);
                    var msgWithXML = msg + XMLdata;
                    SendMail(PO, msgWithXML, "Failed:: XML Posting for PO# " + PO);
                    $("#PoPostMessage").html(msg);
                    $("#divPoPostMessageDialog").dialog("open");
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });
    }
    function CheckIfPOAlreadyPosted(PONumber) { //added by Belal 19 Sept 2020
        var dbModel = { "PONumber": PONumber };
        var returnMsg = "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CheckIfPOAlreadyPosted',
            data: JSON.stringify(dbModel),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                debugger;
                returnMsg = output.d;
            },
            error: function (xhr, ajaxOptions, thrownError) {
                returnMsg = "";
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });

        return returnMsg;
    }
    function Updatepoheaderstatus(PONumber,NewStatus) { //added by Belal 19 Sept 2020
        var dbModel = { "PONumber": PONumber, "NewStatus": NewStatus };
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/Updatepoheaderstatus',
            data: JSON.stringify(dbModel),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == "success") {
                    $.growl.notice({ title: "", message: "POH status has been changed to POSTED." });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });
    }
    function InsertPOHistoryLog(PONUM, LOGTEXT) { //added by Belal 03 Oct 2020
        var dbModel = { "PONUM": PONUM, "LOGTEXT": LOGTEXT };
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/InsertPOHistoryLog',
            data: JSON.stringify(dbModel),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == "success") {
                    $.growl.notice({ title: "", message: "PO history log has been added." });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });
    }
    function SendMail(PONUM, XMLString, Subject) { //added by Belal 03 Oct 2020
        var dbModel = { "PONUM": PONUM, "XMLString": XMLString, "Subject": Subject };
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SendMail',
            data: JSON.stringify(dbModel),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == "success") {
                    $.growl.notice({ title: "", message: "Mail has been sent!!" });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var msg = thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText;
                $.growl.error({ title: "", message: msg });
            }
        });
    }


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

    IntializePODetailsListGrid()

    function IntializePOHeaderListGrid() {
        isPOListFromDateChanged = true;
        isPOListToDateChanged = true;
        var fromdate = "", todate = "";
        fromdate = $("#txtPOListFromDate").val();
        todate = $("#txtPOListToDate").val();

        $("#fgrdPOHeaderList").flexigrid({
            url: 'BloomService.asmx/GetPurchaseOrderHeaderGridForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="ARINVselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'PO#', name: 'PO#', width: 80, sortable: true, align: 'left' },
                { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
                { display: 'FarmName', name: 'FarmName', width: 120, sortable: true, align: 'left' },
                { display: 'P.O DATE', name: 'P.O DATE', width: 60, sortable: true, align: 'left' },
                { display: 'STATUS', name: 'STATUS', width: 80, sortable: true, align: 'left' },
                { display: 'CARGO DTE', name: 'CARGO DTE', width: 60, sortable: true, align: 'left' },
                { display: 'CARGO DAY', name: 'CARGO DAY', width: 80, sortable: true, align: 'left' },
                { display: 'VIA', name: 'VIA', width: 40, sortable: true, align: 'left' },
                { display: 'WH', name: 'WH', width: 30, sortable: true, align: 'left' },
                { display: 'CARRIER', name: 'CARRIER', width: 30, sortable: true, align: 'left' },
                { display: 'FBE', name: 'FBE', width: 40, sortable: true, align: 'right' },
                { display: 'Pieces', name: 'Pieces', width: 30, sortable: true, align: 'right' },
                { display: 'Units', name: 'Units', width: 60, sortable: true, align: 'right' },
                { display: 'CONF', name: 'CONF', width: 40, sortable: true, align: 'right' },
                { display: 'AMOUNT', name: 'TOTALCOST', width: 100, sortable: true, align: 'right' },
                { display: 'GPM%', name: 'GPM%', width: 35, sortable: true, align: 'right' },
                { display: 'AWB', name: 'AWB', width: 80, sortable: true, align: 'left' },
                { display: 'Comments', name: 'Comments', width: 120, sortable: true, align: 'left' },
                { display: 'Emailed', name: 'Emailed', width: 35, sortable: true, align: 'left' },
                { display: '', name: '', width: 20, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'PO#', name: 'PO#', width: 70, sortable: true, align: 'left' },
                { display: 'Farm', name: 'Farm', width: 5, sortable: true, align: 'left' },
                { display: 'Vendor Name', name: 'Vendor Name', width: 25, sortable: true, align: 'left' },
                { display: 'P.O DATE', name: 'P.O DATE', width: 60, sortable: true, align: 'left' },
                { display: 'STATUS', name: 'STATUS', width: 30, sortable: true, align: 'left' },
                { display: 'CARGO DTE', name: 'CARGO DTE', width: 150, sortable: true, align: 'left' },
                { display: 'CARGO DAY', name: 'CARGO DAY', width: 34, sortable: true, align: 'right' },
                { display: 'FROM', name: 'FROM', width: 30, sortable: true, align: 'left' },
                { display: 'VIA', name: 'VIA', width: 40, sortable: true, align: 'right' },
                { display: 'WH', name: 'WH', width: 30, sortable: true, align: 'right' },
                { display: 'CARRIER', name: 'CARRIER', width: 30, sortable: true, align: 'right' },
                { display: 'FBE', name: 'FBE', width: 40, sortable: true, align: 'left' },
                { display: 'Pieces', name: 'Pieces', width: 40, sortable: true, align: 'left' },
                { display: 'Units', name: 'Units', width: 40, sortable: true, align: 'left' },
                { display: 'CONF', name: 'CONF', width: 40, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 50, sortable: true, align: 'left' }
            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: true,
            resizable: false,
            autoload: true,
            showTableToggleBtn: true,
            height: $(window).height() - 280,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'Fromdate', value: fromdate }, { name: 'Todate', value: todate }, { name: 'Buyer', value: '' }, { name: 'Farm', value: '' }, { name: 'Origin', value: '' }, { name: 'Status', value: '' }, { name: 'isCargo', value: true }, { name: 'PONUM', value: '' }
            ],
            onSuccess: function () {
                $('#fgrdPOHeaderList tr:last-child').addClass("TotalRows");
                $("#ExportCSV").show();
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
        $("#DivPOHeaderList .sDiv").css('float', 'left').css('width', '545px');
        $('#DivPOHeaderList .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivPOHeaderList .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivPOHeaderList .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivPOHeaderList .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        LoadPOListFilters(function (callback) { });
    }


    function IntializePODetailsListGrid() {
        $("#fgrdPODetails").flexigrid({
            url: 'BloomService.asmx/GetPODetailsByPONumberFromSQL',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="SelectAllD" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'LN', name: 'LN', width: 20, sortable: true, align: 'right' },
                { display: '', name: 'Type', width: 10, sortable: true, align: 'right' },
                { display: 'FARM', name: 'FARM', width: 30, sortable: true, align: 'left', hide: true },
                { display: 'CODE', name: 'CODE', width: 52, sortable: true, align: 'left' },
                { display: 'NAME', name: 'NAME', width: 250, sortable: true, align: 'left' },
                { display: 'BOX#', name: 'BOX#', width: 29, sortable: true, align: 'left' },
                { display: 'QTY', name: 'QTY', width: 40, sortable: true, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 25, sortable: true, align: 'left' },
                { display: 'BUNCH', name: 'BUNCH', width: 27, sortable: true, align: 'right' },
                { display: 'STEMS', name: 'STEMS', width: 26, sortable: true, align: 'right' },
                { display: 'PACK', name: 'PACK', width: 30, sortable: true, align: 'right' },
                { display: 'T/UNITS', name: 'T/UNITS', width: 40, sortable: true, align: 'right' },
                { display: 'PRICE', name: 'PRICE', width: 40, sortable: true, align: 'right' },
                { display: 'COST', name: 'COST', width: 40, sortable: true, align: 'right' },
                { display: 'TOTAL $', name: 'TOTAL $', width: 50, sortable: true, align: 'right' },
                { display: 'GM%', name: 'GM%', width: 29, sortable: true, align: 'right' },
                { display: 'CUST#', name: 'CUST#', width: 37, sortable: true, align: 'right' },
                { display: 'Customer', name: 'Customer', width: 60, sortable: true, align: 'left' },
                { display: 'Day', name: 'Day', width: 60, sortable: true, align: 'left' },
                { display: 'Cargo', name: 'Cargo', width: 60, sortable: true, align: 'left' },
                { display: 'Days', name: 'Days', width: 25, sortable: true, align: 'right' },
                { display: 'Order', name: 'Order', width: 50, sortable: true, align: 'left' },
                { display: 'BRAND', name: 'BRAND', width: 40, sortable: true, align: 'left' },
                { display: 'BoxCode', name: 'BoxCode', width: 60, sortable: true, align: 'left' },
                { display: 'Upc', name: 'Upc', width: 80, sortable: true, align: 'left' },
                { display: 'Description', name: 'Description', width: 60, sortable: true, align: 'left' },
                { display: 'Pull Date', name: 'Pull Date', width: 80, sortable: true, align: 'left' },
                { display: 'Price on Upc', name: 'Price on Upc', width: 80, sortable: true, align: 'right' },
                { display: 'Freight', name: 'Freight', width: 60, sortable: true, align: 'right' },
                { display: 'Duties', name: 'Duties', width: 60, sortable: true, align: 'right' },
                { display: 'COMMENT', name: 'COMMENT', width: 120, sortable: true, align: 'left' },
                { display: 'Cust. UOM', name: 'Cust. UOM', width: 80, sortable: true, align: 'left', hide: true },
                { display: 'STATUS', name: 'STATUS', width: 80, sortable: true, align: 'left' },
                { display: 'StandingID', name: 'StandingID', width: 80, sortable: true, align: 'left' },
                { display: 'Order2 ID', name: 'Order2 ID', width: 80, sortable: true, align: 'left' },
                { display: 'PONUM', name: 'PONUM', width: 80, sortable: true, align: 'left' },
                { display: 'PoKey', name: 'PoKey', width: 80, sortable: true, align: 'left', hide: true },
                { display: 'ID', name: 'ID', width: 80, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'LN', name: 'LN' },
                { display: 'FARM', name: 'FARM' },
                { display: 'CODE', name: 'CODE' },
                { display: 'NAME', name: 'NAME' },
                { display: 'BOX#', name: 'BOX#' },
                { display: 'QTY', name: 'QTY' },
                { display: 'UOM', name: 'UOM' },
                { display: 'BUNCH', name: 'BUNCH' },
                { display: 'STEMS', name: 'STEMS' },
                { display: 'PACK', name: 'PACK' },
                { display: 'T/UNITS', name: 'T/UNITS' },
                { display: 'PRICE', name: 'PRICE' },
                { display: 'COST', name: 'COST' },
                { display: 'TOTAL $', name: 'TOTAL $' },
                { display: 'GM%', name: 'GM%' },
                { display: 'CUST#', name: 'CUST#' },
                { display: 'Cargo', name: 'Cargo' },
                { display: 'Customer', name: 'Customer' },
                { display: 'Days', name: 'Days' },
                { display: 'Order', name: 'Order' },
                { display: 'BRAND', name: 'BRAND' },
                { display: 'BoxCode', name: 'BoxCode' },
                { display: 'Upc', name: 'Upc' },
                { display: 'Description', name: 'Description' },
                { display: 'Pull Date', name: 'Pull Date' },
                { display: 'Price on Upc', name: 'Price on Upc' },
                { display: 'Freight', name: 'Freight' },
                { display: 'Duties', name: 'Duties' },
                { display: 'COMMENT', name: 'COMMENT' },
                { display: 'STATUS', name: 'STATUS' },
                { display: 'StandingID', name: 'StandingID' },
                { display: 'Order2ID', name: 'Order2ID' },
                { display: 'PONUM', name: 'PONUM' },
                { display: 'PoKey', name: 'PoKey' },
                { display: 'ID', name: 'ID' },
            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "LN ASC",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: false,
            showTableToggleBtn: false,
            width: $(window).width() - 250,
            height: $(window).height() - 380,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'PONumber', value: '' },
            ],
            onSuccess: function () {
                $("#ExportCSV").show();
                $('#fgrdPODetails #row0').addClass("TotalRows");
                $('#fgrdPODetails #row0').removeClass("erow");

                if (selectedPOEditRow !== "") {
                    $("#fgrdPODetails tr").each(function () {
                        if (selectedPOEditRow === $(this).attr('ID')) {
                            $(this).addClass("trSelected");
                        }
                    });
                }
                selectedPOEditRow = "";
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivPODetailList .sDiv").css('float', 'left').css('width', '545px');
        $('#DivPODetailList .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivPODetailList .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivPODetailList .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivPODetailList .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetAirportList',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            //$("#DivPOCityControls").html(output.d);
            $('#originListDropdown').empty();
            $('#originListDropdown').append('<option value="ALL">ALL</option>');
            LoadFarmDetails("ALL");
            for (var i in output.d) {
                var Airport = output.d[i];
                $('#originListDropdown').append('<option value="' + Airport.Airport + '">' + Airport.Airport + '-' + Airport.Name + '(' + Airport.Freight.toFixed(2) + ')' + '</option>');
            }
        }
    });


    $("[id^=tab-]").die('click').live("click", function (e) {

        var id = $(this).attr('id').split("-")[1];
        $('.button-group').show()
        $(".tabcontent").css('display', 'none');
        $("#tabcontent-" + id).css("display", 'block');
        if (id == "POList") {
            if (POListGridIntialize == false) {
                $("#btnDateType").prop("value", "Cargo");
                IntializePOHeaderListGrid();
                POListGridIntialize = true;
                //$(".imgLoaderForUser").hide();
            } else {
                $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
            }
        }
        if (id == "AllPurchases") {
            if (POAllPurchaseGridIntialize == false) {
                IntializePOAllPurchaseGrid();
                POAllPurchaseGridIntialize = true;
                //$(".imgLoaderForUser").hide();
            }
        }
        if (id == "CreatePO") {
            //$('.button-group').hide()
            if (POCreatePOGridInitialize == false) {
                InitializePOCreatePOGrid();
                POCreatePOGridInitialize = true;
            }
        }
    });

    $("#btnNewPO").die("click").live("click", function () {
        $("#DialogEmailOrFaxtheOrder").dialog('option', 'title', 'NEW P.O');
        $("#DivPOSelectFarmDialog").dialog("open");
        $("input[name='grpcity'][value='ALL']").attr('checked', 'checked');
        //$("#DivRelatedCitiesByMainCity").html("ALL");
        LoadFarmDetails("ALL");
    });
    $("#btnView").die("click").live("click", function () {
        $("#txtSearchPONumber").val("");
        $("#POSearchDialog").dialog('option', 'title', "Search PO");
        $("#POSearchDialog").dialog("open");
    });
    $("#btnPORecalculate").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateFinalPOHeader',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                 $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
            }
        });
    });

    $("#btnHold").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintHoldStandingOrderList',
            data: "{}",
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
                    $.MessageBox("No data found!");
                    w.close();
                }
                else {
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }
            }
        });
    });

    $("#btnCreatePOGenSO").die("click").live("click", function () {
        LoadFarmListDropDownStandingOrder();
        $("#DivCreatePOGenerateStandingOrder").dialog('option', 'title', 'GENERATE STANDING ORDER');
        $("#DivCreatePOGenerateStandingOrder").dialog("open");
        //$("input[name='grpcity'][value='ALL']").attr('checked', 'checked');
        //$("#DivRelatedCitiesByMainCity").html("ALL");
        //LoadFarmDetails("ALL");

    });

    $("#DivCreatePOGenerateStandingOrder").dialog({
        autoOpen: false,
        resizable: false,
        width: 600,
        height: 350,
        modal: true,
        title: 'GENERATE STANDING ORDER PO',
        buttons: {
            PROCESS:
            {
                text: 'PROCESS S/O',
                click:
                    function () {
                        var Customer = $("#hdnCustomerSPORD").val();
                        var CargoDate = $("#txtCargoDate").val();
                        var AllWeek = "";
                        if ($("#ChkAllWeek").attr("src").indexOf("images/check-on.png") >= 0) {
                            AllWeek = 1;
                        }
                        else {
                            AllWeek = 0;
                        }
                        var Repeat = "";
                        if ($("#ChkRepeat").attr("src").indexOf("images/check-on.png") >= 0) {
                            Repeat = 1;
                        }
                        else {
                            Repeat = 0;
                        }
                        var Ignore = "";
                        if ($("#ChkIgnore").attr("src").indexOf("images/check-on.png") >= 0) {
                            Ignore = 1;
                        }
                        else {
                            Ignore = 0;
                        }
                        var AllFArm = "";
                        var Farm = "";
                        if ($("#rdoSelectFarm").attr("src").indexOf("images/check-on.png") >= 0) {
                            AllFArm = 0;
                            Farm = $("#lstFarmSPORD").val();
                        }
                        else {
                            AllFArm = 1;
                            Farm = "";
                        }
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GenerateStandingPurchaseOrders',
                            data: "{'Shipdate':'" + CargoDate + "','AllWeek':'" + AllWeek
                                + "','Repeat':'" + Repeat + "','FarmFlag':'" + AllFArm + "','FARM':'" + Farm + "','Customer':'" + Customer + "','IgnoreCustomer':'" + Ignore + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == 'LogOut') {
                                    window.location.href = "Login.aspx";
                                }
                                else if (output.d.indexOf("Not Exist") != "-1") {
                                    $.MessageBox("No Standing Order Found in F8");
                                }
                                else if (output.d.indexOf("Sorry") != "-1") {
                                    $.MessageBox(output.d);
                                }
                                else if (output.d == 'error') {
                                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                }
                                else {
                                    $.MessageBox(output.d);
                                    $("#DivCreatePOGenerateStandingOrder").dialog("close");
                                    $("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                                    $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                                }
                            }
                        });
                    }
            },
            CLOSE: function () {
                $("#DivCreatePOGenerateStandingOrder").dialog("close");
            }
        },
        open: function () {
            $("#rdoAllFarm").prop("src", "images/check-on.png");
            $(".ui-dialog-buttonpane button:contains('PROCESS')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#ChkAllWeek").die("click").live("click", function () {
        if ($("#ChkAllWeek").attr("src").indexOf("images/check-on.png") >= 0) {
            $("#ChkAllWeek").prop("src", "images/check-off.png");
        }
        else {
            $("#ChkAllWeek").prop("src", "images/check-on.png");
        }
    });

    $("#ChkRepeat").die("click").live("click", function () {
        if ($("#ChkRepeat").attr("src").indexOf("images/check-on.png") >= 0) {
            $("#ChkRepeat").prop("src", "images/check-off.png");
        }
        else {
            $("#ChkRepeat").prop("src", "images/check-on.png");
        }
    });

    $("#ChkIgnore").die("click").live("click", function () {
        if ($("#ChkIgnore").attr("src").indexOf("images/check-on.png") >= 0) {
            $("#ChkIgnore").prop("src", "images/check-off.png");
        }
        else {
            $("#ChkIgnore").prop("src", "images/check-on.png");
        }
    });
    $("#rdoAllFarm").die("click").live("click", function () {
        if ($("#rdoAllFarm").attr("src").indexOf("images/check-on.png") >= 0) {
            $("#rdoAllFarm").prop("src", "images/check-off.png");
        }
        else {
            $("#rdoSelectFarm").prop("src", "images/check-off.png");
            $("#rdoAllFarm").prop("src", "images/check-on.png");
            $("#trFarmSPORD").css("display", "none");
        }
    });
    $("#rdoSelectFarm").die("click").live("click", function () {
        if ($("#rdoSelectFarm").attr("src").indexOf("images/check-on.png") >= 0) {
            $("#rdoSelectFarm").prop("src", "images/check-off.png");
        }
        else {
            $("#rdoAllFarm").prop("src", "images/check-off.png");
            $("#rdoSelectFarm").prop("src", "images/check-on.png");
            $("#trFarmSPORD").css("display", "table-row");
        }
    });

    $("#txtCustomerSPORD").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name,
                            SalesMan: item.SalesMan
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
            $(".ui-menu").css("z-index", 1000);
        },
        select: function (e, i) {
            $("#txtCustomerSPORD").val(i.item.Customer);
            $("#hdnCustomerSPORD").val(i.item.Customer);
       },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtCustomerSPORD").val("");
                $("#txtCustomerSPORD").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function LoadFarmListDropDownStandingOrder() {
        try {
            J1_10($("#lstFarmSPORD")).selectize()[0].selectize.disable();
        }
        catch (er) {
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListFromMainCitySelection',
            data: "{'MainCity':'All'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {

                    try {
                        J1_10($('#lstFarmSPORD')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }
                    $('#lstFarmSPORD').html("");
                    $("#lstFarmSPORD").append(output.d);
                    try {
                        J1_10($("#lstFarmSPORD")).selectize()[0].selectize.enable();
                    }
                    catch (er) {
                    }
                    J1_10($("#lstFarmSPORD")).selectize({
                        load: function (query, callback) {
                            this.clearOptions();
                            this.renderCache = {};
                        }
                    });
                }
            }
        });
    }
    $("#btnPostMultiplePO").die("click").live("click", function () {
        var POList = [];
        $('#fgrdPOHeaderList tr').each(function (i, item) {
            debugger;
            if ($(this).attr("id") != "row0" && $(this).hasClass("trChecked")) {
                var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                var PoStatus = $(this).find("td").eq(6).text().trim();
                var obj = {
                    "PoNum": PONum,
                    "Status": PoStatus
                };
                POList.push(obj);
            }
        });
        $.each(POList, function (i, item) {
            var POStatus = CheckIfPOAlreadyPosted(item.PoNum);
            if (POStatus == "AC POSTED") {
                $("#RepostPoNum").val(item.PoNum);
                $("#divPOAcPostAgainConfirmDialog").dialog("open");
            } else {

                LoadPODetailsByPONum(item.PoNum);
            }

        });
    });
    $("#btnPOHeaderEmail").die("click").live("click", function () {
        var POList = "";
        var Cnt = 0;
        $('#fgrdPOHeaderList tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                    POList = POList + PONum + ",";
                    Cnt = Cnt + 1;
                }
            }
        });
        var PoListWithTrim = "";
        PoListWithTrim = POList.substring(0, POList.length - 1)
        if (PoListWithTrim == "") {
            $.MessageBox("Please Select Purchase Order For Mail..");
            return false;
        }
        if (parseInt(Cnt) > 0) {
            $("#DialogEmailPO").html("<p>Want To send <b>Bulk Email</b> ?</p>");
            $("#DialogEmailPO").dialog("open");
        }
        //else {
        //    var POList = "";
        //    var ID = "";
        //    var getIdOnly = "";
        //    var PONum = "";
        //    var Farm = "";
        //    var Shipdate = "";

        //    $('#fgrdPOHeaderList tr').each(function () {
        //        if ($(this).attr("id") != "row0") {
        //            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
        //                ID = sourceCtl.attr('id');
        //                getIdOnly = sourceCtl.attr('id').split('_')[1];
        //                PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
        //                Farm = $("#fgrdPOHeaderList tr#row" + getIdOnly + " td:eq(3)")[0].innerText;
        //                Shipdate = $("#fgrdPOHeaderList tr#row" + getIdOnly + " td:eq(7)")[0].innerText;
        //                SendIndividualEmail(PONum, Farm, Shipdate);
        //            }
        //        }
        //    });
        //}
    });

    function SendBulkEmail(PONumber) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ValidatePOEmailExist',
            data: '{"Polist": "' + PONumber + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var Result = output.d.split('~');
                if (Result[0] == "Success") {
                    //var POList = "";
                    //$('#fgrdPOHeaderList tr').each(function () {
                    //    if ($(this).attr("id") != "row0") {
                    //        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    //            var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                    //            POList = POList + PONum + ",";
                    //        }
                    //    }
                    //});

                    var PoListWithTrim = "";
                    var EmailList = "";
                    //var Body = $("#txtEmailBody").val().trim();
                    //PoListWithTrim = POList.substring(0, POList.length - 1)
                    PoListWithTrim = PONumber;
                    EmailList = $("#txtEmailIDsForPO").val().trim();
                    $("#DialogEmailPO").next('div').find('.msgui').show();
                    //SendEmail(PoListWithTrim, EmailList, Body, "");
                    //$.MessageBox("Mail Sent..");
                    $("#txtEmailIDsForPO").val(Result[1]);
                    $("#trSubject").css("display", "none");
                    $("#DialogEmailPO").dialog('option', 'title', 'Email To');
                    $("#DialogEmailPO").dialog("option", "width", 500);
                    $("#DialogEmailPO").dialog("option", "height", 350);
                    $("#DialogEmailPO").next('div').find('.msgui').remove();
                    $("#DialogEmailPO").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailPO").dialog("open");
                }
                else if (Result[0] == "Not Exist") {
                    $.MessageBox(output.d);
                    return false;
                }
                else if (Result[0] == "error") {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    return false;
                }
                else {
                    $.MessageBox(output.d);
                    return false;
                }
            }
        });
    }

    $("#DialogEmailPO").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Email To',
        buttons: {
            Yes: function () {
                $('#fgrdPOHeaderList tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                            var Farm = $("#fgrdPOHeaderList tr#row" + PONum + " td:eq(3)")[0].innerText;
                            var Shipdate = $("#fgrdPOHeaderList tr#row" + PONum + " td:eq(7)")[0].innerText;
                            alert(Farm + "~" + Shipdate);
                            SendIndividualEmail(PONum, Farm, Shipdate);
                        }
                    }
                });
                //var PoListWithTrim = "";
                //PoListWithTrim = POList.substring(0, POList.length - 1);
                //SendBulkEmail(PoListWithTrim);
            },
            No: function () {
                $("#DialogEmailPO").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    //$("#DialogEmailPO").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    width: 500,
    //    modal: true,
    //    title: 'Email To',
    //    buttons: {
    //        Send: function () {

    //            if ($("#txtEmailIDsForPO").val().trim() == "") {
    //                $.MessageBox("Emailid is required!!!");
    //                $("#txtEmailIDsForPO").focus();
    //                return;
    //            }
    //            var EmailID = ''
    //            EmailID = $("#DialogEmailPO").val();

    //            var POList = "";
    //            $('#fgrdPOHeaderList tr').each(function () {
    //                if ($(this).attr("id") != "row0") {
    //                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
    //                        var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
    //                        POList = POList + PONum + ",";
    //                    }
    //                }
    //            });
    //            var PoListWithTrim = "";
    //            var EmailList = "";
    //            var Body = $("#txtEmailBody").val().trim();
    //            PoListWithTrim = POList.substring(0, POList.length - 1)
    //            EmailList = $("#txtEmailIDsForPO").val().trim();
    //            $("#DialogEmailPO").next('div').find('.msgui').show();
    //            SendEmail(PoListWithTrim, EmailList, Body,"");
    //        },
    //        Close: function () {
    //            $("#DialogEmailPO").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
    //        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    //    },
    //});

    function SendEmail(PoListWithTrim, EmailList, Body, Subject) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SendPurchaseOrderEmail',
            data: '{"Polist": "' + PoListWithTrim + '","EmailList": "' + EmailList + '","Body": "' + Body + '","Subject":"' + Subject + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d.includes("success")) {
                    //2021/08/15, change PO status to Emailed
                    if ($("#lstPOSTATUS_EditPOHeader").val() == "PENDING") { 
                        $("#lstPOSTATUS_EditPOHeader").val("EMAILED");
                    }

                    var result = output.d.split('-');
                    $.growl.notice({ title: "", message: result[0] });
                    UpdateEmailLog(result[1], "PO", PoListWithTrim);
                }
                else
                    $.growl.error({ title: "", message: output.d });

            }
        });
    }
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

    $("#btnPODetailEmail").die("click").live("click", function () {
        var PONUM = $("#txtPONumber_EditPOHeader").val();
        //PONUM = PONUM.replace("*", "-");
        var Shipdate = $("#txtFarmShip_EDITPOHEADER").val();
        var Farm = $("#lstfarm_EditPOHeader").find('option:selected').html().split(']');
        SendIndividualEmail(PONUM, Farm[1], Shipdate);
    });

    function SendIndividualEmail(PONumber, Farm, Shipdate) {
        var PoListWithTrim = "";
        var Subject = "";
        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        //var Shipdate = $("#txtFarmShip_EDITPOHEADER").val();
        //var Farm = $("#lstfarm_EditPOHeader").find('option:selected').html();;
        var d = new Date(Shipdate)
        PoListWithTrim = PONumber
        Subject = '<%=ConfigurationManager.AppSettings("CompanyName").ToString()%>' + " Purchase_Order for" + Farm + " for shipment on " + Shipdate + " " + weekday[d.getDay()] + " #" + PoListWithTrim;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ValidatePOEmailExist',
            data: '{"Polist": "' + PoListWithTrim + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var Result = output.d.split('~');
                if (Result[0] == "Success") {

                    $("#txtEmailIDsForPODetail").val(Result[1]);
                    $("#txtEmailSubjectDetail").val(Subject);
                    $("#DialogEmailPODetail").dialog('option', 'title', 'Email To');
                    $("#DialogEmailPODetail").dialog("option", "width", 500);
                    $("#DialogEmailPODetail").dialog("option", "height", 350);
                    $("#DialogEmailPODetail").next('div').find('.msgui').remove();
                    $("#DialogEmailPODetail").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailPODetail").dialog("open");
                }
                else if (Result[0] == "Not Exist") {
                    //$.MessageBox(output.d);
                    //return false;
                    $("#txtEmailIDsForPODetail").val($("#ctl00_divLoginUserEmail").html());
                    $("#txtEmailSubjectDetail").val(Subject);
                    $("#DialogEmailPODetail").dialog('option', 'title', 'Email To');
                    $("#DialogEmailPODetail").dialog("option", "width", 500);
                    $("#DialogEmailPODetail").dialog("option", "height", 350);
                    $("#DialogEmailPODetail").next('div').find('.msgui').remove();
                    $("#DialogEmailPODetail").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailPODetail").dialog("open");
                }
                else if (Result[0] == "error") {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    return false;
                }
                else {
                    $.MessageBox(output.d);
                    return false;
                }
            }
        });
    }

    $("#DialogEmailPODetail").dialog({
        autoOpen: false,
        resizable: false,
        width: 700,
        modal: true,
        title: 'Email To',
        buttons: {
            Send: function () {

                if ($("#txtEmailIDsForPODetail").val().trim() == "") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtEmailIDsForPODetail").focus();
                    return;
                }
                var PoListWithTrim = "";
                var EmailList = "";
                var Subject = "";
                debugger;
                var Body = $("#txtEmailBodyDetail").val().trim();
                PoListWithTrim = $("#txtPONumber_EditPOHeader").val();
                //PoListWithTrim = PoListWithTrim.replace("*","-");
                EmailList = $("#txtEmailIDsForPODetail").val().trim();
                EmailList = EmailList.replace(";", ",");
                Subject = $("#txtEmailSubjectDetail").val().trim();
                //Subject = Subject.replace("*", "-");
                $("#DialogEmailPODetail").next('div').find('.msgui').show();
                SendEmail(PoListWithTrim, EmailList, Body, Subject);
                $("#DialogEmailPODetail").dialog("close");

                //2021/08/15, read PO
                var PONum = $("#txtPONumber_EditPOHeader").val();
                $("#PurchaseListselect_" + PONum).prop("src", "images/check-off.png");
            },
            Close: function () {
                $("#DialogEmailPODetail").dialog("close");
            }
        },
        open: function () {
            $("#txtEmailBodyDetail").focus();
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });


    $("#btnPOHeaderPrint").die("click").live("click", function () {

        var POList = "";
        $('#fgrdPOHeaderList tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).hasClass("trChecked")) {
                    if (typeof $(this).attr("id") !== 'undefined') {
                        var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                        POList = POList + PONum + ",";
                    }
                }
            }
        });

        if (POList == "") {
            $.MessageBox("Please Select a PO");
            return false;
        }

        var PoListWithTrim = "";
        PoListWithTrim = POList.substring(0, POList.length - 1)
        //PrintSalesSummaryReports(PoListWithTrim);
        PrintMultiplePurchaseOrders(PoListWithTrim);
    });
    $("#btnPOPrint").die("click").live("click", function () {
        var PO = $("#txtPONumber_EditPOHeader").val();
        PrintMultiplePurchaseOrders(PO);
    });

    function PrintMultiplePurchaseOrders(PONumList) {
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintPOReports',
            data: "{'PONumList':'" + PONumList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    w.print();
                }
            }
        });
    }

    $("#btnConfirmPO").die("click").live("click", function () {
        var PONUMBER = $("#txtPONumber_EditPOHeader").val();
        IntializeConfirmPOListGrid(PONUMBER);
        $("#fgrdConfirmPODetails").flexOptions({ params: [{ name: 'PONumber', value: PONUMBER }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
        $("#DivConfirmPO").dialog('option', 'title', 'CONFIRM PO : ' + PONUMBER);
        $("#DivConfirmPO").dialog("open");

    });

    $("#DivConfirmPO").dialog({
        autoOpen: false,
        resizable: false,
        width: $(window).width() - 750,
        height: $(window).height() - 230,
        modal: true,
        buttons: {
            "CONFIRM": function () {
                var POQDetailID = "";
                $('#fgrdConfirmPODetails tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            var DetID = $(this).attr("id").replace("Conselect_", "").replace("row", "");
                            POQDetailID = POQDetailID + DetID + ",";
                        }
                    }
                });
                var PoListWithTrim = "";
                PoListWithTrim = POQDetailID.substring(0, POQDetailID.length - 1)
                //alert(PoListWithTrim);
                if (PoListWithTrim == "") {
                    $.MessageBox("Please Select Product Order For Confirm..");
                    return false;
                }
                var XMLStr = "<root>";
                $('#fgrdConfirmPODetails tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            var DetID = $(this).attr("id").replace("Conselect_", "").replace("row", "");
                            //$("#fgrdInventoryDetailbyAWB tr#row-2")[0].innerText
                            var ProdCodQ = $("#txtProdCodQ_" + DetID).html(); //$("#fgrdConfirmPODetails tr#row" + DetID)[5].innerText;//$(this).find("td div").eq(0)[5].innerText;
                            var ProdNameQ = $("#txtProdNameQ_" + DetID).html(); //$("#fgrdConfirmPODetails tr#row" + DetID)[2].innerText;//$(this).find("td div").eq(0)[2].innerText;
                            var OrderQty = $("#txtOrderQTY_" + DetID).html(); //$("#fgrdConfirmPODetails tr#row" + DetID)[3].innerText;//$(this).find("td div").eq(0)[3].innerText;

                            var ConfirmQty = $("#editConfirmQTY_" + DetID).val();
                            if (ConfirmQty == "")
                                ConfirmQty = $("#editConfirmQTY_" + DetID).attr("placeholder");
                            XMLStr += "<CONFIRMDETAIL>"
                            XMLStr += "<PONUM>" + $("#txtPONumber_EditPOHeader").val() + "</PONUM>";
                            XMLStr += "<DetID>" + DetID + "</DetID>";
                            XMLStr += "<PRODCODQ>" + ProdCodQ + "</PRODCODQ>";
                            XMLStr += "<PRODNAMEQ>" + ProdNameQ + "</PRODNAMEQ>";
                            XMLStr += "<ORDERQTY>" + OrderQty + "</ORDERQTY>";
                            XMLStr += "<CONFIRMQTY>" + ConfirmQty + "</CONFIRMQTY>";
                            XMLStr += "</CONFIRMDETAIL>"
                        }
                    }
                });
                XMLStr += "</root>";

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ConfirmPurchaseOrderPO',
                    data: "{'XMLString':'" + XMLStr + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            $("#DivConfirmPO").dialog("close");
                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                            //2021/08/21, read the status from PO header
                            //$("#lstPOSTATUS_EditPOHeader").val("CONFIRMED");
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/CheckPOStatus',
                                data: "{'PONumber':'" + $("#txtPONumber_EditPOHeader").val() + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output) {
                                    if (output.d != "error") {
                                        $("#lstPOSTATUS_EditPOHeader").val(output.d);
                                    }
                                    else {
                                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue (CheckPOStatus).");
                                    }
                                }
                            });
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });
            },
            "CLOSE": function () {
                $("#DivConfirmPO").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('CONFIRM')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });
    function IntializeConfirmPOListGrid(PONumber) {
        $("#fgrdConfirmPODetails").flexigrid({
            url: 'BloomService.asmx/GetConfirmPOByPONumber',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="ConSelAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'FARM', name: 'Farm', width: 30, sortable: true, align: 'left', hide: true },
                { display: 'CODE', name: 'ProdCodeq', width: 52, sortable: true, align: 'left' },
                { display: 'NAME', name: 'ProdNameq', width: 156, sortable: true, align: 'left' },
                { display: 'ORDERED', name: 'QTYBOX', width: 60, sortable: true, align: 'right' },
                { display: 'CONFIRMED', name: 'QTYBCONF', width: 60, sortable: true, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 40, sortable: true, align: 'left' },
                { display: 'UNIT', name: 'QtyXBox', width: 35, sortable: true, align: 'right' },
                { display: 'T/UNITS', name: 'QtyUnit', width: 40, sortable: true, align: 'right' },
                { display: 'COST', name: 'UnitCosq', width: 35, sortable: true, align: 'right' },
                { display: 'CUSTOMER', name: 'CustNumber', width: 80, sortable: true, align: 'left' },
                { display: 'STATUS', name: 'PoStatus', width: 80, sortable: true, align: 'left' },
                { display: 'StandingID', name: 'SPORDID', width: 80, sortable: true, align: 'left' },
                { display: 'Order2ID', name: 'ORDER2ID', width: 80, sortable: true, align: 'left' },
                { display: 'PONUM', name: 'PONumber', width: 80, sortable: true, align: 'left' },
                { display: 'BOX#', name: 'BoxNumber', width: 29, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'CODE', name: 'ProdCodeq' },
                { display: 'NAME', name: 'ProdNameq' },
                { display: 'UOM', name: 'UOM' },
            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: false,
            showTableToggleBtn: false,
            width: $(window).width() - 770,
            height: $(window).height() - 390,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'PONumber', value: PONumber },
            ],
            onSuccess: function () {
                $("#ExportCSV").show();
                $('#fgrdConfirmPODetails #row0').addClass("TotalRows");
                $('#fgrdConfirmPODetails #row0').removeClass("erow");
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
        $("#DivConfirmPO .sDiv").css('float', 'left').css('width', '545px');
        $('#DivConfirmPO .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivConfirmPO .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivConfirmPO .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivConfirmPO .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }
    $("[id^=Conselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();
        var getIdOnly = sourceCtl.attr('id').split('_')[1];
        var OrderQty = $("#fgrdConfirmPODetails tr#row" + getIdOnly + " td:eq(4)")[0].innerText;
        //alert(OrderQty);

        var headers = ID.split('_');
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            $('#fgrdConfirmPODetails tr#row0').removeClass("trChecked");
            $("#txtConfirmQTY_" + headers[1]).hide();
            $("#editConfirmQTY_" + headers[1]).css("display", "table-row");

            $("#editConfirmQTY_" + headers[1]).focus();
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= selectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            $("#txtConfirmQTY_" + headers[1]).show();
            $("#editConfirmQTY_" + headers[1]).css("display", "none");
        }
    });
    function ValidateConfirmQty(CtrlID) {
        var ID = CtrlID;
        var headers = ID.split('_');
        var getIdOnly = headers[1];
        var OrderQty = $("#txtConfirmQTY_" + getIdOnly).val();
        var ConfirmQty = $("#editConfirmQTY_" + getIdOnly).val();
        if (parseInt(ConfirmQty) > parseInt(OrderQty)) {
            $.MessageBox("Confirm Qty Cannot be greater than Order Qty")
            $("#editConfirmQTY_" + headers[1]).val(OrderQty);
            return false;
        }
    }

    $("#btnPOComment").die("click").live("click", function () {
        var PONUMBER = $("#txtPONumber_EditPOHeader").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCommentByPONumber',
            data: "{'PONUMBER':'" + PONUMBER + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#txtPOCommentUpdate").val("");
                    $("#txtPOCommentUpdate").val(output.d);
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
        $("#DivPOComment").dialog('option', 'title', 'ADD COMMENT');
        $("#DivPOComment").dialog("open");
    });

    $("#DivPOComment").dialog({
        autoOpen: false,
        resizable: false,
        title: "ADD COMMENT",
        width: 600,
        height: 320,
        modal: true,
        buttons: {
            "SAVE": function () {
                var PONUMBER = $("#txtPONumber_EditPOHeader").val();
                var COMMENT = $("#txtPOCommentUpdate").val();
                if (COMMENT == "") {
                    $.MessageBox("Please Enter Some Comments...");
                    $("#txtPOCommentUpdate").html("")
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UPDATECOMMENT',
                    data: "{'PONUMBER':'" + PONUMBER + "','COMMENT':'" + COMMENT + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "success") {
                            $("#txtPOCommentUpdate").val("");
                            $("#DivPOComment").dialog("close");
                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });
            },
            "CLOSE": function () {
                $("#DivPOComment").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#btnPODuplicate").die("click").live("click", function () {
        var PONUMBER = $("#txtPONumber_EditPOHeader").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ValidateBeforeDuplicate',
            data: "{'PONUM':'" + PONUMBER + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d.indexOf("cannot") > 0) {
                    $.MessageBox(output.d);
                }
                else if (output.d == "Success") {
                    //$("#txtFarmShip_Duplicate").focusout();
                    $("#DivDuplicatePOConfirm").dialog("open");


                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    });
    $("#DivDuplicatePOConfirm").dialog({
        autoOpen: false,
        resizable: false,
        title: "DUPLICATE PO",
        width: 350,
        height: 150,
        modal: true,
        buttons: {
            "DUPLICATE": function () {
                var PONUMBER = $("#txtPONumber_EditPOHeader").val();
                var SHIPDATE = $("#txtFarmShip_Duplicate").val();
                if (SHIPDATE == "") {
                    $.MessageBox("Please Select Shipping Date...");
                    $("#txtFarmShip_Duplicate").val("")
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DuplicatePurchaseOrder',
                    data: "{'PONUMBER':'" + PONUMBER + "','SHIPDATE':'" + SHIPDATE + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                            $.MessageBox(output.d);
                        }
                        else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                            $.MessageBox(output.d);
                        }
                        else if (output.d == 'error') {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else {
                            $("#DivDuplicatePOConfirm").dialog("close");
                            $("#DivEDITPOHeaderDialog").dialog("close");
                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                        }
                    }
                });
            },
            "CLOSE": function () {
                $("#DivDuplicatePOConfirm").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('DUPLICATE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
            setTimeout(function () {

                $("#txtFarmShip_Duplicate").blur();
                $("#ui-datepicker-div").css("display", "none");
            }, 50)
        },
    });

    $("#btnPOCancelled").die("click").live("click", function () {
        var POList = "";
        var CancelledPo = "0";
        $('#fgrdPOHeaderList tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                    var Status = $(this).find("td div").eq(5)[0].textContent.trim();
                    POList = POList + PONum + ",";
                    if (Status == "CANCELLED" || Status == "VOIDED") {
                        CancelledPo = 1;
                    }
                }
            }
        });

        if (POList == "") {
            $.MessageBox("Please Select a PO");
            return false;
        }
        else if (CancelledPo != "0") {
            $.MessageBox("You have select already cancelled PO in list. Please de-select it");
            return false;
        }
        else {
            LoadCancelReason();
            $("#DivCancelPODialog").dialog('option', 'title', 'CANCEL PO');
            $("#DivCancelPODialog").dialog("open");
        }
    });
    $("#DivCancelPODialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "CANCEL PO",
        width: 400,
        height: 250,
        modal: true,
        buttons: {
            "CANCEL PO": function () {
                var POList = "";
                var COMMENT = $("#txtCancelComment").val();
                var Reason = $("#lstCancelReason").val();
                if (Reason == "") {
                    $.MessageBox("Please Select Reason");
                    $("#lstCancelReason").focus();
                    return false;
                }
                else {
                    $('#fgrdPOHeaderList tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                                POList = POList + PONum + ",";
                            }
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/CancelPurchaseOrder',
                        data: "{'POList':'" + POList + "','Reason':'" + Reason + "','COMMENT':'" + COMMENT + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d != "error" && output.d != "0") {
                                $("#DivCancelPODialog").dialog("close");
                                $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        }
                    });
                }
            },
            "CLOSE": function () {
                $("#DivCancelPODialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('CANCEL')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#btnPOVoid").die("click").live("click", function () {
        var POList = "";
        var Voided = "0";
        var POList = "";
        $('#fgrdPOHeaderList tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).hasClass("trChecked")) {
                    var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                    var Status = $(this).find("td div").eq(5)[0].textContent.trim();
                    POList = POList + PONum + ",";
                    if (Status == "CANCELLED" || Status == "VOIDED") {
                        Voided = "1";
                    }
                }
            }
        });

        if (POList == "") {
            $.MessageBox("Please select a PO");
            return false;
        }
        else if (Voided != "0") {
            $.MessageBox("You have select already Voided Or Cancelled PO in list. Please de-select it");
            return false;
        }
        else {
            LoadVoidReason();
            $("#DivVoidPODialog").dialog('option', 'title', 'VOID PO');
            $("#DivVoidPODialog").dialog("open");
        }
    });
    $("#DivVoidPODialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "VOID PO",
        width: 400,
        height: 250,
        modal: true,
        buttons: {
            "VOID PO": function () {
                var POList = "";
                var COMMENT = $("#txtVoidComment").val();
                var Reason = $("#lstVoidReason").val();
                if (Reason == "") {
                    $.MessageBox("Please Select Reason");
                    $("#lstVoidReason").focus();
                    return false;
                }
                else {
                    $('#fgrdPOHeaderList tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if ($(this).hasClass("trChecked")) {
                                var PONum = $(this).attr("id").replace("PurchaseListselect_", "").replace("row", "");
                                var Status = $(this).find("td div").eq(5)[0].textContent.trim();
                                POList = POList + PONum + ",";
                            }
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/VoidPurchaseOrder',
                        data: "{'POList':'" + POList + "','Reason':'" + Reason + "','COMMENT':'" + COMMENT + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d != "error" && output.d != "0") {
                                $("#DivVoidPODialog").dialog("close");

                                $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        }
                    });
                }
            },
            "CLOSE": function () {
                $("#DivVoidPODialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('VOID')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#ARINVselectall").die('click').live("click", function (e) {

        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdPOHeaderList tr:visible').addClass("trChecked");
            $('#fgrdPOHeaderList tr#row0').removeClass("trChecked");
            $("[id^=PurchaseListselect]:visible").prop("src", "images/check-on.png");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdPOHeaderList tr').removeClass("trChecked");
            $("[id^=PurchaseListselect]").prop("src", "images/check-off.png");
        }
    });
    $("[id^=PurchaseListselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            $('#fgrdPOHeaderList tr#row0').removeClass("trChecked");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= ARINVselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
        }
    });
    $("[id^=EmailedPoSelect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var SelectedPo = sourceCtl.context.id.split('_')[1];
        debugger;
        $("#fgrdEmailLogList").flexOptions({ params: [{ name: 'EmailType', value: 'PO' }, { name: 'EmailedDocumentNumber', value: SelectedPo }], query: "", newp: 1 }).flexReload();

        $("#DivEmailLog").dialog('option', 'title', 'EMAIL LOG');
        $("#DivEmailLog").dialog("open");
    });
    $("#SelectAllD").die('click').live("click", function (e) {

        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdPODetails tr:visible').addClass("trChecked");
            $('#fgrdPODetails tr#row0').removeClass("trChecked");
            $("[id^=Detselect]:visible").prop("src", "images/check-on.png");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdPODetails tr').removeClass("trChecked");
            $("[id^=Detselect]").prop("src", "images/check-off.png");
        }
    });
    $("[id^=Detselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            $('#fgrdPODetails tr#row0').removeClass("trChecked");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= SelectAllD]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
        }
    });

    $("#btnPODetailDROP").die("click").live("click", function () {
        var POList = "";
        $('#fgrdPODetails tr').each(function () {
            if ($(this).attr("id") != "row0") {
                //alert($(this).find("td div").eq(0)[0].childNodes[0].src);
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var PONum = $(this).attr("id").replace("Detselect_", "").replace("row", "");
                    POList = POList + PONum + ",";
                }
            }
        });
        if (POList == "") {
            $.MessageBox("Please Select a Product to Drop to another PO");
            return false;
        }
        else {
            var SHIPDATE = $("#txtFarmShip_Drop").val();
            var Farm = $("#lstfarm_EditPOHeader").val();
            var PONUM = $("#txtPONumber_EditPOHeader").val();
            $("#txtFarmShip_Drop").val(SHIPDATE);
            $("#DivDropPOItem").dialog('option', 'title', 'DROP ITEM INTO PO');
            BindPoListForDrop(Farm, PONUM);
            $("#fgrdDropPOList").flexOptions({ params: [{ name: 'Farm', value: Farm }, { name: 'PONUM', value: PONUM }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            $("#DivDropPOItem").dialog("open");
        }
    });
    $("#DivDropPOItem").dialog({
        autoOpen: false,
        resizable: false,
        title: "DROP ITEM INTO PO",
        width: 550,
        height: 540,
        modal: true,
        buttons: {
            "DROP": function () {
                var OldPOList = "";
                var NewPOList = "";
                var ORD = "";
                var POQId = "";
                var PONUMBER = $("#txtPONumber_EditPOHeader").val();

                $('#fgrdPODetails tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            //ORD = $(this).find("td div").eq(3)[0].textContent.trim();
                            POQId = $(this).attr("id").replace("row", "");
                            OldPOList = OldPOList + PONUMBER + "~" + POQId + ",";
                        }
                    }
                });
                $('#fgrdDropPOList tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            NewPOList = $(this).find("td div").eq(1)[0].textContent.trim();
                        }
                    }
                });
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DropItemToNewPO',
                    data: "{'OLDPONUMBER':'" + OldPOList + "','NEWPONUMER':'" + NewPOList + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                            $.MessageBox(output.d);
                        }
                        else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                            $.MessageBox(output.d);
                        }
                        else if (output.d == 'error') {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else {
                            $("#DivDropPOItem").dialog("close");
                            // $("#DivEDITPOHeaderDialog").dialog("close");
                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
                            //$.MessageBox('NEW PO# ' + output.d + ' created');
                            if (NewPOList != "") {
                                $.MessageBox('Dropped to PO# ' + output.d.split('~')[0] + ' Farm Shipping Date ' + output.d.split('~')[1]);
                            } else {
                                $.MessageBox('Dropped to NEW PO# ' + output.d.split('~')[0] + ' Farm Shipping Date ' + output.d.split('~')[1]);
                            }
                        }

                    }
                    /* Create New PO While Drop the Item
                    var SHIPDATE = $("#txtFarmShip_Drop").val();
                    if (SHIPDATE == "") {
                        $.MessageBox("Please Select Ship Date...");
                        $("#txtFarmShip_Drop").val("")
                        return false;
                    }
    
                    var POList = "";
                    var ORD = "";
                    var PONUMBER = $("#txtPONumber_EditPOHeader").val();
    
                    $('#fgrdPODetails tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                //var Status = $(this).find("td div").eq(5)[0].textContent.trim();    
                                //var Status = $(this).find("td div").eq(5)[0].textContent.trim();
                                ORD = $(this).find("td div").eq(3)[0].textContent.trim();
                                POList = POList + PONUMBER + "~" + ORD + ",";
                            }
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DropItemFromPO',
                        data: "{'PONUMBER':'" + POList + "','SHIPDATE':'" + SHIPDATE + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
    
                            if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                                $.MessageBox(output.d);
                            }
                            else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                                $.MessageBox(output.d);
                            }
                            else if (output.d == 'error') {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                            else {
                                $("#DivDropPOItem").dialog("close");
                                $("#DivEDITPOHeaderDialog").dialog("close");
                                $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                                //$("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
                                //$.MessageBox('NEW PO# ' + output.d + ' created');
                            }
    
                        }*/
                });
            },
            "CLOSE": function () {
                $("#DivDropPOItem").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('DROP')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function BindPoListForDrop(Farm, PONUM) {
        $("#fgrdDropPOList").flexigrid({
            url: 'BloomService.asmx/POListForDrop',
            dataType: 'xml',
            colModel: [
                { display: '', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'PONUM', name: 'PONumber', width: 80, sortable: true, align: 'left' },
                { display: 'SHIPDATE', name: 'ShipDate', width: 80, sortable: true, align: 'left' },
                { display: 'TOTAL AMT', name: 'TOTALVALUE', width: 80, sortable: true, align: 'right' },
            ],
            searchitems: [
                { display: 'PONUM', name: 'PONumber' },
            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: false,
            showTableToggleBtn: false,
            width: 500,
            height: 400,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'Farm', value: Farm },
                { name: 'PONUM', value: PONUM },
            ],
            onSuccess: function () {
                $("#ExportCSV").hide();
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
    }

    $("[id^=POselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            $("[id^=POselect]").prop("src", "images/check-off.png");
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            $('#fgrdDropPOList tr#row0').removeClass("trChecked");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");

        }
    });

    $("#DivPOSelectFarmDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "NEW P.O",
        width: 450,
        height: 250,
        modal: true,
        buttons: {
            "CREATE": function () {

                var Farm = $("#lstfarmADDPO")[0].value;
                if (Farm == "0" || Farm == "") {

                    $.MessageBox("Please choose farm...");
                    $("#TempSelectedFarm").html("")
                    $("#TempSelectedFarmName").html("");
                    return false;
                }
                else {
                    $("#TempSelectedFarm").html(Farm)
                    $("#TempSelectedFarmName").html($("#lstfarmADDPO").text().split("] ")[1]);
                }
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SavePurchaseListToTemp',
                    data: "{'Farm':'" + Farm + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error" && output.d != "0") {

                            $("#TempPOHeaderID").html(output.d);

                            $("#fgrdPOProductPurchaseDetailsTempGrid").flexOptions({ params: [{ name: 'TempPOHeaderID', value: $("#TempPOHeaderID").html() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                            $("#txtCARGODATEAdd").attr("disabled", true);
                            $("#CreatePOTempDialog").dialog('option', 'title', "ADD PO : " + $("#lstfarmADDPO").text().split("] ")[1]);
                            $("#CreatePOTempDialog").dialog("open");
                        }
                        else if (output.d = "0") {
                            $.MessageBox("No records found for selected vendor..");
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });
                $("#lstUOM_ADDEDITPO").empty();
                LoadUOM(function (callback) { });

            },
            "CANCEL": function () {
                $("#DivPOSelectFarmDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('CREATE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CANCEL')").addClass('dialogbuttonstyle icon-cancel red');
        },
    });

    //$('#DivPOCityControls').each(function (i, buttonGroup) {
    //    var $buttonGroup = $(buttonGroup);
    //    $buttonGroup.on('click', 'button', function () {
    //        $buttonGroup.find('.is-checked').removeClass('is-checked');
    //        $(this).addClass('is-checked');
    //        J1_10($("#lstfarm")).selectize()[0].selectize.destroy();
    //        J1_10($("#lstfarm")).selectize()[0].selectize.setValue("0");
    //        LoadFarmDetails($(this)[0].innerText);
    //    });
    //});

    function LoadFarmDetails(City) {

        //var SelectizeFarm = J1_10($("#lstfarm")).selectize();
        try {
            J1_10($("#lstfarmADDPO")).selectize()[0].selectize.disable();
        }
        catch (er) {

        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListFromMainCitySelection',
            data: "{'MainCity':'" + City + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {


                    try {
                        J1_10($('#lstfarmADDPO')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }
                    $('#lstfarmADDPO').html("");
                    $("#lstfarmADDPO").append(output.d);

                    try {
                        J1_10($("#lstfarmADDPO")).selectize()[0].selectize.enable();
                    }
                    catch (er) {

                    }

                    J1_10($("#lstfarmADDPO")).selectize({
                        load: function (query, callback) {

                            this.clearOptions();        // clear the data
                            this.renderCache = {};      // clear the html template cache
                        }
                    });
                }
            }
        });
    }


    function LoadFarmListDropDownEditPO() {

        try {
            J1_10($("#lstfarmEditPOHeader")).selectize()[0].selectize.disable();
        }
        catch (er) {

        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListFromMainCitySelection',
            data: "{'MainCity':'All'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {

                    try {
                        J1_10($('#lstfarmEditPOHeader')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }
                    $('#lstfarmEditPOHeader').html("");
                    $("#lstfarmEditPOHeader").append(output.d);

                    try {
                        J1_10($("#lstfarmEditPOHeader")).selectize()[0].selectize.enable();
                    }
                    catch (er) {

                    }
                    J1_10($("#lstfarmEditPOHeader")).selectize({
                        load: function (query, callback) {

                            this.clearOptions();        // clear the data
                            this.renderCache = {};      // clear the html template cache
                        }
                    });
                }
            }
        });
    }



    function MainCityClicked(selectedObject) {
        debugger;
        var City = selectedObject.value;
        //if (City == "ALL") {
        //    $("#DivRelatedCitiesByMainCity").html("ALL");
        //}
        //else if (City == "BOG") {
        //    $("#DivRelatedCitiesByMainCity").html("BOG!BGT");
        //}
        //else if (City == "SJO") {
        //    $("#DivRelatedCitiesByMainCity").html("SAN!SJO!CTR!COS");
        //}
        //else if (City == "UIO") {
        //    $("#DivRelatedCitiesByMainCity").html("UIO$QUI");
        //}
        //else if (City == "MDE") {
        //    $("#DivRelatedCitiesByMainCity").html("MDE!MED");
        //}
        //else if (City == "OTHERS") {
        //    $("#DivRelatedCitiesByMainCity").html("BOG!BGT!UIO!SJO!MDE!MED!SAN!MIA!CTR!COS!DOM!GUA");
        //}
        //else if (City == "MIA") {
        //    $("#DivRelatedCitiesByMainCity").html("MIA");
        //}
        //else if (City == "GUA") {
        //    $("#DivRelatedCitiesByMainCity").html("GUA");
        //}
        //else if (City == "D.R") {
        //    $("#DivRelatedCitiesByMainCity").html("DOM");
        //}

        //J1_10($("#lstfarm")).selectize()[0].selectize.destroy();
        //J1_10($("#lstfarm")).selectize()[0].selectize.setValue("0");
        LoadFarmDetails(City);
    }

    $("#CreatePOTempDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "ADD PO",
        width: 1200,
        height: 600,
        modal: true,
        buttons: {
            "SAVE & RECEIVE": function () {
                var Continue = false;
                var totalBoxes = 0;
                var totalUnits = 0;
                $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {

                    if ($(this).attr("id") != "row0") {
                        var DetailID = $(this).attr("id").replace("row", "");
                        var Boxes = parseInt($("#editBoxestextOnTempPODetailGrid_" + DetailID).val());
                        var Units = parseInt($("#editTotalUnitslinkOnTempPODetailGrid_" + DetailID).html());
                        totalBoxes += isNaN(Boxes) == true ? 0 : Boxes;
                        totalUnits += isNaN(Units) == true ? 0 : Units;
                    }
                })

                if (totalBoxes > 0 && totalUnits > 0) {
                    Continue = true;
                }
                Continue = true;
                if (Continue) {
                    $("#DivPOStatus").html("CONFIRMED");
                    //$.MessageBox("Is cargo date of " + $("#txtCARGODATEAdd").val() + " correct?");
                    $("#DivConfirmTransferToUserDialogNew").dialog("open");

                }
                else {
                    $.MessageBox("Can not save & receive, you have lines with either boxes or units at 0");
                }

            },
            "SAVE": function () {
                var Continue = false;

                var totalBoxes = 0;
                var totalUnits = 0;
                $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {

                    if ($(this).attr("id") != "row0") {
                        var DetailID = $(this).attr("id").replace("row", "");
                        var Boxes = parseInt($("#editBoxestextOnTempPODetailGrid_" + DetailID).val());
                        var Units = parseInt($("#editTotalUnitslinkOnTempPODetailGrid_" + DetailID).html());
                        totalBoxes += isNaN(Boxes) == true ? 0 : Boxes;
                        totalUnits += isNaN(Units) == true ? 0 : Units;
                    }
                })

                if (totalBoxes > 0 && totalUnits > 0) {
                    Continue = true;
                }
                Continue = true;
                if (Continue) {
                    $("#DivPOStatus").html("PENDING");
                    $("#msgCreatePOTempCargoDateConfirm").html("Is cargo date of " + $("#txtCARGODATEAdd").val() + " correct?");
                    $("#msgbox-CreatePOTempCargoDateConfirm").dialog("open");

                }
                else {
                    $.MessageBox("Can not save, you have lines with either boxes or units at 0");
                }

            },
            "SAVE & CONFIRMED": function () {
                var Continue = false;
                var totalBoxes = 0;
                var totalUnits = 0;
                $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {

                    if ($(this).attr("id") != "row0") {
                        var DetailID = $(this).attr("id").replace("row", "");
                        var Boxes = parseInt($("#editBoxestextOnTempPODetailGrid_" + DetailID).val());
                        var Units = parseInt($("#editTotalUnitslinkOnTempPODetailGrid_" + DetailID).html());
                        totalBoxes += isNaN(Boxes) == true ? 0 : Boxes;
                        totalUnits += isNaN(Units) == true ? 0 : Units;
                    }
                })

                if (totalBoxes > 0 && totalUnits > 0) {
                    Continue = true;
                }
                Continue = true;
                if (Continue) {
                    $("#DivPOStatus").html("CONFIRMED");
                    $("#msgCreatePOTempCargoDateConfirm").html("Is cargo date of " + $("#txtCARGODATEAdd").val() + " correct?");
                    $("#msgbox-CreatePOTempCargoDateConfirm").dialog("open");

                }
                else {
                    $.MessageBox("Can not save & confirm, you have lines with either boxes or units at 0");
                }

            },
            "CANCEL": function () {
                $("#CreatePOTempDialog").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save yellow hyellow');
            $(".ui-dialog-buttonpane button:contains('RECEIVE')").addClass('dialogbuttonstyle icon-save pink hpink');
            $(".ui-dialog-buttonpane button:contains('CONFIRM')").addClass('dialogbuttonstyle icon-save green hgreen');
            $(".ui-dialog-buttonpane button:contains('CANCEL')").addClass('dialogbuttonstyle icon-cancel red hred');
            $(".ui-state-focus").next().focus().addClass('fyellow');
            $("#txtCARGODATEAdd").attr("disabled", false);

        },
    });
    $("#POSearchDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "ADD PO",
        width: 350,
        height: 250,
        modal: true,
        buttons: {
            "SEARCH": function () {
                var iscargo = $("#btnDateType").val().toLowerCase() == "PO".toLowerCase() ? true : false;
                var po = $("#txtSearchPONumber").val();
                reloadPOListGrid("", "", "", "", "", "", iscargo, po);
                $("#POSearchDialog").dialog("close");

            },
            "CANCEL": function () {
                $("#POSearchDialog").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('SEARCH')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CANCEL')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#msgbox-CreatePOTempCargoDateConfirm").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {

                updatedetailToTempGridclicked();
                var TotalPODetailsCount = $('#fgrdPOProductPurchaseDetailsTempGrid tr').length
                var Status = $('#DivPOStatus').html();
                if (TotalPODetailsCount <= 1) {
                    $("#msgCreatePOTempCargoDateConfirm").html("No details were found to save");
                    $("#msgbox-CreatePOTempCargoDateConfirm").dialog("open");

                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CreatePO',
                    data: "{'TempPOHeaderID':'" + $("#TempPOHeaderID").html() + "','ShipDate':'" + $("#txtCARGODATEAdd").val()
                        + "','Farm':'" + $("#TempSelectedFarm").html() + "','TotalPODetailsCount':'" + TotalPODetailsCount + "','Status':'" + Status + "','AWB':'" + "" + "','Invoice':'" + "0" + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                            $.MessageBox(output.d);
                        }
                        else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                            $.MessageBox(output.d);
                        }
                        else if (output.d == 'error') {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else {
                            $("#msgbox-CreatePOTempCargoDateConfirm").dialog("close");

                            $("#CreatePOTempDialog").dialog("close");
                            $("#DivPOSelectFarmDialog").dialog("close");
                            $.MessageBox('NEW PO# ' + output.d + ' created');

                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
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
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
        }
    });

    //BELAL::17-APRIL-2021::Confirmation Dialog Before Transfer User 
    $("#DivConfirmTransferToUserDialogNew").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        title: 'Confirm Transfer',
        buttons: {
            Yes: function () {


                updatedetailToTempGridclicked();
                var AWB = $("#txtAwb").val();
                var Invoice = $("#txtInvoice").val();
                var TotalPODetailsCount = $('#fgrdPOProductPurchaseDetailsTempGrid tr').length
                var Status = $('#DivPOStatus').html();
                if (TotalPODetailsCount <= 1) {
                    $.MessageBox("No details were found to save");
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CreatePO',
                    data: "{'TempPOHeaderID':'" + $("#TempPOHeaderID").html() + "','ShipDate':'" + $("#txtCARGODATEAdd").val()
                        + "','Farm':'" + $("#TempSelectedFarm").html() + "','TotalPODetailsCount':'" + TotalPODetailsCount + "','Status':'" + Status + "','AWB':'" + AWB + "','Invoice':'" + Invoice + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                            $.MessageBox(output.d);
                        }
                        else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                            $.MessageBox(output.d);
                        }
                        else if (output.d == 'error') {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else {
                            $("#DivConfirmTransferToUserDialogNew").dialog("close");

                            $("#CreatePOTempDialog").dialog("close");
                            $("#DivPOSelectFarmDialog").dialog("close");
                            $.MessageBox('NEW PO# ' + output.d + ' created');

                            $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                        }
                    }
                });
            },
            No: function () {
                $("#DivConfirmTransferToUserDialogNew").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save ui-state-focus ui-state-hover');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            LoadWarehouse();
            //$("#txtTransferFile").val("");
            $("#txtFreightAmount_Transfer").focus();
        },
    });

    function LoadWarehouse() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadWareHouseDDLData',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                $("#lstWarehouse").empty();
                if (output.d.length > 0) {
                    $.each(output.d, function (i, item) {
                        $('#lstWarehouse').append($('<option></option>').val(item.Code).html(item.Name));
                    });
                } else {
                    $.MessageBox("You don't have any warehouse assigned!!");
                }
                var WH = $('#lstWarehouse').val();
                $('#DivWarehouse').html(WH);
            }
        });
    }

    $("#btnPOHeaderSave").die("click").live("click", function () {
        var Status = $("#lstPOSTATUS_EditPOHeader").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UPDATEPO',
            data: "{'PONUMBER':'" + $("#txtPONumber_EditPOHeader").val() + "','Farm':'" + $("#lstfarm_EditPOHeader").val() + "','Warehouse':'" + $("#lstWarehouse_EditPOHeader").val() + "','ShipDate':'" + $("#txtFarmShip_EDITPOHEADER").val()
                + "','Type':'" + $("#lstPOTYPE_EditPOHeader").val() + "','POStatus':'" + Status + "','Agency':'" + $("#lstAGENCY_EditPOHeader").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == 'LogOut') {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("Wait") != "-1") { //if constant dbf is locked by anouther user it will return message starting with "Wait"
                    $.MessageBox(output.d);
                }
                else if (output.d.indexOf("Sorry") != "-1") {//if sales person does not found it will show the popup "Sorry.... you must be set up as a sales person in the system"
                    $.MessageBox(output.d);
                }
                else if (output.d == 'error') {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
                else {
                    $("#msgbox-CreatePOTempCargoDateConfirm").dialog("close");
                    $("#DivConfirmTransferToUserDialogNew").dialog("close");
                    $("#CreatePOTempDialog").dialog("close");
                    $("#DivPOSelectFarmDialog").dialog("close");
                    $("#DivEDITPOHeaderDialog").dialog("close");
                    //$.MessageBox('PO# ' + $("#txtPONumber_EditPOHeader").val() + ' Updated');
                    //$("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                    //$("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });


    $("#fgrdPOProductPurchaseDetailsTempGrid").flexigrid({
        url: 'BloomService.asmx/GetPOProductPurchaseDetailsTempGrid',
        dataType: 'xml',
        colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'left' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'left', hide: true },
            { display: '<img style="Cursor:pointer;" id="POTempTickAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
            { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
            { display: 'Description', name: 'FlowerName', width: 180, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 22, sortable: true, align: 'left' },
            { display: 'Units/Bunch', name: 'UnitsPerBunch', width: 30, sortable: true, align: 'right' },
            { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
            { display: 'Total Units', name: 'Units', width: 50, sortable: true, align: 'right' },
            { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
            { display: 'Total Cost', name: 'TotalCost', width: 70, sortable: true, align: 'right' },
            { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'CustNumber', width: 28, sortable: true, align: 'left' },
            { display: 'Comments', name: 'Comments', width: 120, sortable: true, align: 'left' },
            { display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left' },
            { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left' },
        ],
        searchitems: [
            { display: 'Farm', name: 'Farm' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'FlowerName' },
            { display: 'Boxes', name: 'Quantity' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Units', name: 'Units' },
            { display: 'Cost', name: 'CostPerUnits' },
            { display: 'Cust#', name: 'CustNumber' }
        ],
        showTableToggleBtn: true,
        sortname: "",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "Header",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        colresize: false,
        autoload: false,
        showTableToggleBtn: false,
        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'TempPOHeaderID', value: '' }
        ],
        height: 400,
        width: 1160,
        striped: true,
        onSuccess: function () {



            $('#fgrdPOProductPurchaseDetailsTempGrid #row0').addClass("TotalRows")

            //For to show the error
            if ($("#DivProductPurchaseDetailsTemp tr#row-2").length > 0) {
                $("#DivProductPurchaseDetailsTemp tr#row-2").hide();
                $.MessageBox($("#DivProductPurchaseDetailsTemp tr#row-2")[0].innerText);
                return false;
            }

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
                            $(this).closest('tr').find('input')[i].value = "";
                            $(this).closest('tr').find('input')[i].focus();
                            return false;
                        }

                        else if (i == $(this).closest('tr').find('input').length - 1) {
                            if ($(this).closest('tr').next('tr').find('input').length > 0 && $(this).closest('tr').next('tr').find('input')[0].style.display != 'none') {
                                $(this).closest('tr').next('tr').find('input')[0].value = "";
                                $(this).closest('tr').next('tr').find('input')[0].focus();
                            }
                            else if ($(this).closest('tr').next('tr').next('tr').find('input').length > 0 && $(this).closest('tr').next('tr').next('tr').find('input')[0].style.display != 'none') {
                                $(this).closest('tr').next('tr').next('tr').find('input')[0].value = "";
                                $(this).closest('tr').next('tr').next('tr').find('input')[0].focus();
                            }
                            else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0) {
                                $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].value = "";
                                $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                            }
                            return false;
                        }
                    }
                }
            });


            $('#fgrdManualPODetail #row0').addClass("TotalRows")



            $("[id^=editUnitstextOnTempPODetailGrid_]").focusout(function () {
                var currentDetailID = $(this).attr('id').replace("editUnitstextOnTempPODetailGrid_", "");
                CalcuateTotalUnits(currentDetailID);
                CalculationTotalSummaryOfGrid();
            });



            $("[id^=editBoxestextOnTempPODetailGrid_]").focusout(function () {
                var currentDetailID = $(this).attr('id').replace("editBoxestextOnTempPODetailGrid_", "");
                CalcuateTotalUnits(currentDetailID);
                CalcuateTotalCost(currentDetailID);
                CalculationTotalSummaryOfGrid();
            });

            function CalcuateTotalUnits(currentDetailID) {

                var boxes = $("#editBoxestextOnTempPODetailGrid_" + currentDetailID).val();
                if (boxes == "")
                    boxes = $("#editBoxestextOnTempPODetailGrid_" + currentDetailID).attr("placeholder");
                var units = $("#editUnitstextOnTempPODetailGrid_" + currentDetailID).val();
                if (units == "")
                    units = $("#editUnitstextOnTempPODetailGrid_" + currentDetailID).attr("placeholder");

                $("#editTotalUnitslinkOnTempPODetailGrid_" + currentDetailID).html(parseInt(boxes) * parseInt(units));
            }

            $("[id^=editCosttextOnTempPODetailGrid_]").focusout(function () {
                var currentDetailID = $(this).attr('id').replace("editCosttextOnTempPODetailGrid_", "");
                CalcuateTotalCost(currentDetailID);
                CalculationTotalSummaryOfGrid();
            });


            function CalcuateTotalCost(currentDetailID) {
                var boxes = $("#editBoxestextOnTempPODetailGrid_" + currentDetailID).val();
                if (boxes == "")
                    boxes = $("#editBoxestextOnTempPODetailGrid_" + currentDetailID).attr("placeholder");
                var Cost = $("#editCosttextOnTempPODetailGrid_" + currentDetailID).val();
                if (Cost == "")
                    Cost = $("#editCosttextOnTempPODetailGrid_" + currentDetailID).attr("placeholder");
                var units = $("#editUnitstextOnTempPODetailGrid_" + currentDetailID).val();
                if (units == "")
                    units = $("#editUnitstextOnTempPODetailGrid_" + currentDetailID).attr("placeholder");
                $("#editTotalCostlinkOnTempPODetailGrid_" + currentDetailID).html("$" + (parseInt(boxes) * parseFloat(Cost) * parseInt(units)).toFixed(2));
            }

            function CalculationTotalSummaryOfGrid() {
                var totalBoxes = 0;
                var totalUnits = 0;
                var totalCost = 0.0;
                var table = $("#fgrdPOProductPurchaseDetailsTempGrid tbody");
                debugger;
                table.find('tr').each(function (i, el) {
                    debugger;
                    var $tds = $(this).find('td');
                    if ($tds.eq(5).text().trim() != "Total") {
                        var currentDetailID = $(this).attr('id').replace("editCosttextOnTempPODetailGrid_", "");
                        currentDetailID = currentDetailID.replace("row", "");
                        var boxes = $("#editBoxestextOnTempPODetailGrid_" + currentDetailID).val();
                        totalBoxes += isNaN(parseInt(boxes)) == true ? 0 : parseInt(boxes);
                        totalUnits += isNaN(parseInt($tds.eq(10).text().trim())) == true ? 0 : parseInt($tds.eq(10).text().trim());
                        totalCost += isNaN(parseFloat($tds.eq(12).text().trim().replace("$", ""))) == true ? 0 : parseFloat($tds.eq(12).text().trim().replace("$", ""));
                    }
                });
                table.find('tr').each(function (i, el) {
                    debugger;
                    var $tds = $(this).find('td');
                    if ($tds.eq(5).text().trim() == "Total") {
                        $tds.eq(6).html("<div style='text-align:right;'>" + totalBoxes + "</div>");
                        $tds.eq(10).html("<div style='text-align:right;'>" + totalUnits + "</div>");
                        $tds.eq(12).html("<div style='text-align:right;'> $" + totalCost.toFixed(2) + "</div>");
                    }
                });
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


            $(".restrictspecialcharacters").keypress(function (event) {
                return restrictspecialcharacters(event, this)
            });

            function restrictspecialcharacters(evt, element) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (((charCode >= 65) && (charCode <= 90) || (charCode >= 97) && (charCode <= 122) || (charCode >= 48) && (charCode <= 57) || (charCode == 8))) {
                    return true;
                }
                return false;
            }

            $("img#POTempTickAll").prop("src", "images/check-on.png");
            $("[id^=POTemptick_]").prop("src", "images/check-on.png");
            $('#fgrdPOProductPurchaseDetailsTempGrid tr').addClass("trChecked");

            //Boxes                    
            $("[id^=editBoxestextOnTempPODetailGrid_]").show();
            $("[id^=editBoxeslinkOnTempPODetailGrid_]").hide();

            //Units/box                    
            $("[id^=editUnitsBunchtextOnTempPODetailGrid_]").show();
            $("[id^=editUnitsBunchlinkOnTempPODetailGrid_]").hide();

            //Units/Bunch
            $("[id^=editUnitstextOnTempPODetailGrid_]").show();
            $("[id^=editUnitslinkOnTempPODetailGrid_]").hide();

            //Cost                    
            $("[id^=editCosttextOnTempPODetailGrid_]").show();
            $("[id^=editCostlinkOnTempPODetailGrid_]").hide();

            //BreakDown                    
            $("[id^=editCustNumbertextOnTempPODetailGrid_]").show();
            $("[id^=editCustNumberlinkOnTempPODetailGrid_]").hide();

            //Comments                    
            $("[id^=editCommentstextOnTempPODetailGrid_]").show();
            $("[id^=editCommentslinkOnTempPODetailGrid_]").hide();


            //Type                    
            $("[id^=editTypetextOnTempPODetailGrid_]").show();
            $("[id^=editTypelinkOnTempPODetailGrid_]").hide();

            //BreakDown                    
            $("[id^=editBreakDowntextOnTempPODetailGrid_]").show();
            $("[id^=editBreakDownlinkOnTempPODetailGrid_]").hide();

            //BoxCode
            $("[id^=editBoxCodetextOnTempPODetailGrid_]").show();
            $("[id^=editBoxCodelinkOnTempPODetailGrid_]").hide();
            //$("[id^=editBoxestextOnTempPODetailGrid_]")[0].focus();
        }
    });

    $("[id^=deletePOTempdetail_]").die("click").live("click", function () {
        var Id = $(this).attr('id').replace("deletePOTempdetail_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeletePOTempdetail',
            data: '{ "Id":' + Id + ' }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {
                    $.growl.notice({ title: "", message: output.d });
                    $("#fgrdPOProductPurchaseDetailsTempGrid").flexReload({ url: '/url/for/refresh' });
                } else {
                    $.growl.warning({ title: "", message: output.d });
                }
            }
        });
    });

    $("#DivProductPurchaseDetailsTemp .sDiv").hide();
    $('#DivProductPurchaseDetailsTemp .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivProductPurchaseDetailsTemp .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivProductPurchaseDetailsTemp .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivProductPurchaseDetailsTemp .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();


    $("#btnClose").die("click").live("click", function () {
        $("#DivEDITPOHeaderDialog").dialog("close");
    });

    $("#btnPOHistory").die('click').live('click', function () {
        var Value = $("#txtPONumber_EditPOHeader").val();
        var para = 'PONumber=' + Value;
        $(".imgLoaderForUser").show();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PagePOHistory.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'none');
                $("#DivOrderCallHSDialog").css('display', 'block');
                $('<div id="DivOrderCallHSDialog">/div>').dialog({
                    title: 'Activity Log :: ' + Value,
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

    $("#DivEDITPODetailPart2").dialog({
        autoOpen: false,
        width: 900,
        height: 360,
        modal: true,
        resizable: false,
        buttons:
        {
            //Save: {
            //    text: "Save",
            //    id: "btnPoEditDialogSavePart2",
            //    click: function () {

            //        var upc = $("#txtUPC_EDITPODetail2").val() == "" ? $("#txtUPC_EDITPODetail2").attr("Placeholder") : $("#txtUPC_EDITPODetail2").val();
            //        var upcDesc = $("#txtDescription_EDITPODetail2").val() == "" ? $("#txtDescription_EDITPODetail2").attr("Placeholder") : $("#txtDescription_EDITPODetail2").val();
            //        var upcPrice = $("#txtPriceOnUPC_EDITPODetail2").val() == "" ? $("#txtPriceOnUPC_EDITPODetail2").attr("Placeholder") : $("#txtPriceOnUPC_EDITPODetail2").val();
            //        var dateCode = $("#txtDateCode_EDITPODetail2").val() == "" ? $("#txtDateCode_EDITPODetail2").attr("Placeholder") : $("#txtDateCode_EDITPODetail2").val();
            //        var foodDesc = $("#txtFoodDesc_EDITPODetail2").val() == "" ? $("#txtFoodDesc_EDITPODetail2").attr("Placeholder") : $("#txtFoodDesc_EDITPODetail2").val();
            //        var pickDesc = $("#txtPickDesc_EDITPODetail2").val() == "" ? $("#txtPickDesc_EDITPODetail2").attr("Placeholder") : $("#txtPickDesc_EDITPODetail2").val();
            //        var sleeveDesc = $("#txtSleeveDesc_EDITPODetail2").val() == "" ? $("#txtSleeveDesc_EDITPODetail2").attr("Placeholder") : $("#txtSleeveDesc_EDITPODetail2").val();

            //        $("#txtUPC_EDITPODetail").html(upc);
            //        $("#txtDescription_EDITPODetail").html(upcDesc);
            //        $("#txtPriceOnUPC_EDITPODetail").html(upcPrice);
            //        $("#txtDateCode_EDITPODetail").html(dateCode);
            //        $("#txtFoodDesc_EDITPODetail").html(foodDesc);
            //        $("#txtPickDesc_EDITPODetail").html(pickDesc);
            //        $("#txtSleeveDesc_EDITPODetail").html(sleeveDesc);

            //        $("#DivEDITPODetailPart2").dialog("close");
            //    }
            //},
            //Cancel: function () {
            //    $(this).dialog("close");
            //},
            Upload: function () {
                debugger;
                UploadBouquetImages();
            },
            Recipe: function () {
                debugger;
                Recipefgrd();
            },
        },
        open: function () {
            //$(".YellowWarning").hide();
            //$(".Warning").hide();
            //$(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            //$(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')

            var Recipebtn = $(".ui-dialog-buttonpane button:contains('Recipe')").addClass('dialogbuttonstyle icon-save btntoleftWithoutImageAligment')
            $(Recipebtn).show();
            $(Recipebtn).attr('id', 'btnRecipeclick');
            var Uploadbtn = $(".ui-dialog-buttonpane button:contains('Upload')").addClass('dialogbuttonstyle icon-save')
            $(Uploadbtn).hide();
            $(Uploadbtn).html("Upload Images");
            $(Uploadbtn).attr('id', 'btnUploadImages');
        },
        close: function () {
            var upc = $("#txtUPC_EDITPODetail2").val() == "" ? $("#txtUPC_EDITPODetail2").attr("Placeholder") : $("#txtUPC_EDITPODetail2").val();
            var upcDesc = $("#txtDescription_EDITPODetail2").val() == "" ? $("#txtDescription_EDITPODetail2").attr("Placeholder") : $("#txtDescription_EDITPODetail2").val();
            var upcPrice = $("#txtPriceOnUPC_EDITPODetail2").val() == "" ? $("#txtPriceOnUPC_EDITPODetail2").attr("Placeholder") : $("#txtPriceOnUPC_EDITPODetail2").val();
            var dateCode = $("#txtDateCode_EDITPODetail2").val() == "" ? $("#txtDateCode_EDITPODetail2").attr("Placeholder") : $("#txtDateCode_EDITPODetail2").val();
            var foodDesc = $("#txtFoodDesc_EDITPODetail2").val() == "" ? $("#txtFoodDesc_EDITPODetail2").attr("Placeholder") : $("#txtFoodDesc_EDITPODetail2").val();
            var pickDesc = $("#txtPickDesc_EDITPODetail2").val() == "" ? $("#txtPickDesc_EDITPODetail2").attr("Placeholder") : $("#txtPickDesc_EDITPODetail2").val();
            var sleeveDesc = $("#txtSleeveDesc_EDITPODetail2").val() == "" ? $("#txtSleeveDesc_EDITPODetail2").attr("Placeholder") : $("#txtSleeveDesc_EDITPODetail2").val();

            $("#txtUPC_EDITPODetail").html(upc);
            $("#txtDescription_EDITPODetail").html(upcDesc);
            $("#txtPriceOnUPC_EDITPODetail").html(upcPrice);
            $("#txtDateCode_EDITPODetail").html(dateCode);
            $("#txtFoodDesc_EDITPODetail").html(foodDesc);
            $("#txtPickDesc_EDITPODetail").html(pickDesc);
            $("#txtSleeveDesc_EDITPODetail").html(sleeveDesc);
        }
    });
    $('#btnbouquetImg').on('click', function () {
        $("#btnUploadImages").show();
        GetImageByProdCode('bouquetImg')
        $("#btnRecipeclick").removeClass("btntoleftWithoutImageAligment");
        $("#btnRecipeclick").addClass("btntoleft");

    });
    $('#btnfoodImg').on('click', function () {
        $("#btnUploadImages").show();
        GetImageByProdCode('foodImg')
        $("#btnRecipeclick").removeClass("btntoleftWithoutImageAligment");
        $("#btnRecipeclick").addClass("btntoleft");

    });
    $('#btnpickImg').on('click', function () {
        $("#btnUploadImages").show();
        GetImageByProdCode('pickImg')
        $("#btnRecipeclick").removeClass("btntoleftWithoutImageAligment");
        $("#btnRecipeclick").addClass("btntoleft");

    });
    $('#btnsleeveImg').on('click', function () {
        $("#btnUploadImages").show();
        GetImageByProdCode('sleeveImg')
        $("#btnRecipeclick").removeClass("btntoleftWithoutImageAligment");
        $("#btnRecipeclick").addClass("btntoleft");

    });
    function GetImageByProdCode(ImgType) {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetImageByProdCode',
            data: "{'Prodcode':'" + $("#hfFlower_EDITPODetail").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                var PODetail = output.d;
                if (ImgType == 'bouquetImg') {
                    if (PODetail.bouquetImagePath != "" && (!!PODetail.bouquetImagePath)) {
                        $("#btnbouquetImg").hide();
                        $("<span class=\"pip\">" +
                            "<img id='img1' class=\"imageThumb\" src=\"" + PODetail.bouquetImagePath + "\" onclick=ShowPreview_edit('" + PODetail.ImgbouquetName + "') title=\"" + PODetail.ImgbouquetName + "\"  />" +
                            "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove'><i class=''></i></a></span>" +
                            "</span>").insertAfter("#bouquetImg");
                        $(".remove").click(function () {
                            $(this).parent(".pip").remove();
                        });
                    }
                    else {
                        $("#btnbouquetImg").show();
                        $('#bouquetImg').trigger('click');
                    }
                }
                else if (ImgType == 'foodImg') {
                    if (PODetail.foodImg != "" && (!!PODetail.foodImg)) {
                        $("#btnfoodImg").hide();
                        $("<span class=\"pip\">" +
                            "<img id='img2' class=\"imageThumb\" src=\"" + PODetail.foodImg + "\" onclick=ShowPreview_edit2('" + PODetail.ImgFoodName + "') title=\"" + PODetail.ImgFoodName + "\"  />" +
                            "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove'><i class=''></i></a></span>" +
                            "</span>").insertAfter("#foodImg");
                        $(".remove").click(function () {
                            $(this).parent(".pip").remove();
                        });
                    }
                    else {
                        $("#btnfoodImg").show();
                        $('#foodImg').trigger('click');
                    }
                }
                else if (ImgType == 'pickImg') {
                    if (PODetail.pickImg != "" && (!!PODetail.pickImg)) {
                        $("#btnpickImg").hide();
                        $("<span class=\"pip\">" +
                            "<img id='img3' class=\"imageThumb\" src=\"" + PODetail.pickImg + "\" onclick=ShowPreview3_edit2('" + PODetail.ImgPickName + "') title=\"" + PODetail.ImgPickName + "\"  />" +
                            "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove'><i class=''></i></a></span>" +
                            "</span>").insertAfter("#pickImg");
                        $(".remove").click(function () {
                            $(this).parent(".pip").remove();
                        });
                    }
                    else {
                        $("#btnpickImg").show();
                        $('#pickImg').trigger('click');
                    }
                }
                else {
                    if (PODetail.sleeveImg != "" && (!!PODetail.sleeveImg)) {
                        $("#btnsleeveImg").hide();
                        $("<span class=\"pip\">" +
                            "<img id='img4' class=\"imageThumb\" src=\"" + PODetail.sleeveImg + "\" onclick=ShowPreview4_edit2('" + PODetail.ImgSleeveName + "') title=\"" + PODetail.ImgSleeveName + "\"  />" +
                            "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove'><i class=''></i></a></span>" +
                            "</span>").insertAfter("#sleeveImg");
                        $(".remove").click(function () {
                            $(this).parent(".pip").remove();
                        });
                    }
                    else {
                        $("#btnsleeveImg").show();
                        $('#sleeveImg').trigger('click');
                    }
                }

            }
        });
    }

    if (window.File && window.FileList && window.FileReader) {
        $("#bouquetImg").on("change", function (e) {
            debugger;
            var files = e.target.files,
                filesLength = files.length;
            for (var i = 0; i < filesLength; i++) {
                var f = files[i]
                var fileReader = new FileReader();
                fileReader.onload = (function (e) {
                    var file = e.target;
                    debugger;
                    $("#btnbouquetImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img1' class=\"imageThumb\" src=\"" + e.target.result + "\" onclick=ShowPreview('" + f.name + "') title=\"" + f.name + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('bouquetImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#bouquetImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                });
                fileReader.readAsDataURL(f);
            }
        });
        $("#foodImg").on("change", function (e) {
            debugger;
            var files = e.target.files,
                filesLength = files.length;
            for (var i = 0; i < filesLength; i++) {
                var f = files[i]
                var fileReader = new FileReader();
                fileReader.onload = (function (e) {
                    var file = e.target;
                    debugger;
                    $("#btnfoodImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img2' class=\"imageThumb\" src=\"" + e.target.result + "\" onclick=ShowPreview2('" + f.name + "') title=\"" + f.name + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('foodImg')  ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#foodImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                });
                fileReader.readAsDataURL(f);
            }
        });
        $("#pickImg").on("change", function (e) {
            debugger;
            var files = e.target.files,
                filesLength = files.length;
            for (var i = 0; i < filesLength; i++) {
                var f = files[i]
                var fileReader = new FileReader();
                fileReader.onload = (function (e) {
                    var file = e.target;
                    debugger;
                    $("#btnpickImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img3' class=\"imageThumb\" src=\"" + e.target.result + "\" onclick=ShowPreview3('" + f.name + "') title=\"" + f.name + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('pickImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#pickImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                });
                fileReader.readAsDataURL(f);
            }
        });
        $("#sleeveImg").on("change", function (e) {
            debugger;
            var files = e.target.files,
                filesLength = files.length;
            for (var i = 0; i < filesLength; i++) {
                var f = files[i]
                var fileReader = new FileReader();
                fileReader.onload = (function (e) {
                    var file = e.target;
                    debugger;
                    $("#btnsleeveImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img4' class=\"imageThumb\" src=\"" + e.target.result + "\" onclick=ShowPreview4('" + f.name + "') title=\"" + f.name + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('sleeveImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#sleeveImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                });
                fileReader.readAsDataURL(f);
            }
        });
    } else {
        alert("Your browser doesn't support to File API")
    }

    function ShowPreview(imgName) {
        var newTab = window.open();
        newTab.document.body.innerHTML = '<img src="' + $("#img1").attr("src") + '" width="100px" height="100px">';
    }
    function ShowPreview_edit(imgName) {
        window.open($("#img1").attr("src"), '_blank');
    }
    function ShowPreview2(imgName) {
        var newTab = window.open();
        newTab.document.body.innerHTML = '<img src="' + $("#img2").attr("src") + '" width="100px" height="100px">';
    }
    function ShowPreview_edit2(imgName) {
        window.open($("#img2").attr("src"), '_blank');
    }
    function ShowPreview3(imgName) {
        var newTab = window.open();
        newTab.document.body.innerHTML = '<img src="' + $("#img3").attr("src") + '" width="100px" height="100px">';
    }
    function ShowPreview_edit3(imgName) {
        window.open($("#img3").attr("src"), '_blank');
    }
    function ShowPreview4(imgName) {
        var newTab = window.open();
        newTab.document.body.innerHTML = '<img src="' + $("#img4").attr("src") + '" width="100px" height="100px">';
    }
    function ShowPreview_edit4(imgName) {
        window.open($("#img4").attr("src"), '_blank');
    }
    function deleteImg(ImgType) {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteBouquetImage',
            data: "{'Prodcode':'" + $("#hfFlower_EDITPODetail").val() + "','POQID':'" + $("#POQId").html() + "','ImgType':'" + ImgType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == "Success") {
                    $.growl.notice({ title: "", message: output.d });
                }
                else
                    $.growl.error({ title: "", message: output.d });
                $("#DivEDITPODetailPart2").dialog("close");
                $("#DivEDITPODetail").dialog("close");
            }
        });
    }
    const UploadBouquetImages = async () => {
        var fileName = "";
        var fileName2 = "";
        var fileName3 = "";
        var fileName4 = "";
        var fileBase64Str = "";
        var fileBase64Str2 = "";
        var fileBase64Str3 = "";
        var fileBase64Str4 = "";
        if ($('#bouquetImg').val() != "") {
            fileName = $('#bouquetImg')[0].files[0].name;
            const result = await getBase64($('#bouquetImg')[0].files[0]).catch(e => Error(e));
            fileBase64Str = result;
        }
        if ($('#foodImg').val() != "") {
            fileName2 = $('#foodImg')[0].files[0].name;
            const result2 = await getBase64($('#foodImg')[0].files[0]).catch(e => Error(e));
            fileBase64Str2 = result2;
        }
        if ($('#pickImg').val() != "") {
            fileName3 = $('#pickImg')[0].files[0].name;
            const result3 = await getBase64($('#pickImg')[0].files[0]).catch(e => Error(e));
            fileBase64Str3 = result3;
        }
        if ($('#sleeveImg').val() != "") {
            fileName4 = $('#sleeveImg')[0].files[0].name;
            const result4 = await getBase64($('#sleeveImg')[0].files[0]).catch(e => Error(e));
            fileBase64Str4 = result4;
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UploadBouquetImage',
            data: "{'fileBase64Str':'" + fileBase64Str + "','fileBase64Str2':'" + fileBase64Str2 + "','fileBase64Str3':'" + fileBase64Str3 + "','fileBase64Str4':'" + fileBase64Str4 + "','fileName':'" + fileName + "','fileName2':'" + fileName2 + "','fileName3':'" + fileName3 + "','fileName4':'" + fileName4 + "','Prodcode':'" + $("#hfFlower_EDITPODetail").val() + "','POQID':'" + $("#POQId").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "Success") {
                    $.growl.notice({ title: "", message: output.d });
                }
                else
                    $.growl.error({ title: "", message: output.d });
            }
        });
        $("#DivEDITPODetailPart2").dialog("close");
        $("#DivEDITPODetail").dialog("close");


    }
    function getBase64(file, fname) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result, fname);
            reader.onerror = error => reject(error);
        });
    }
    function GetFlowerDetailsByCode(Flower) {
        debugger
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
    function Recipefgrd() {
        debugger
        $("#txtRecipetotcost").val("");
        var dt = new Array();
        dt = GetFlowerDetailsByCode($("#hfFlower_EDITPODetail").val());
        $("#divFlowerID").val(dt[0].ID)

        $("#fgrdRecipe").flexigrid({
            url: 'BloomService.asmx/GetRecipeForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'PRODUCT', name: 'Flower', width: 110, sortable: true, align: 'left' },
                { display: 'DESCRIPTION', name: 'Name', width: 180, sortable: true, align: 'left' },
                { display: 'QTY', name: 'Qty', width: 80, sortable: true, align: 'left' },
                { display: 'UOM', name: 'UOM', width: 80, sortable: true, align: 'left' },
                { display: 'COST', name: 'Cost', width: 80, sortable: true, align: 'left' },
                { display: 'TYPE', name: 'Type', width: 80, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'Product', name: 'Flower' },
                { display: 'Description', name: 'Name' },
                { display: 'Qty', name: 'Units' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Cost', name: 'Cost' },
                { display: 'Type', name: 'Type' },
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "desc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 250,
            width: 755,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' },
                { name: 'RecipeProductID', value: $("#divFlowerID").val() }
            ],
            onSuccess: function () {
                debugger
                $("#DivRecipeForFgrd #ExportCSV").show();
                $('#fgrdRecipe #row0').addClass("TotalRows")
                var totcost = 0.000;
                var sel = jQuery("#DivRecipeForFgrd .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {

                            var tds = jQuery(sel[x]).children('td');
                            totcost += parseFloat($(tds[6]).find('div').text()) * parseFloat($(tds[4]).find('div').text());
                        }
                    }
                }
                totcost = totcost.toFixed(3);
                $("#txtRecipetotcost").val("$" + " " + totcost);
            }
        });
        $("#DivViewRecipeForFgrd").dialog("open");
    }
    $("#DivViewRecipeForFgrd").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Recipe",
        width: 770,
        open: function (e) {
            debugger
            $("#DivViewRecipeForFgrd").dialog('option', { 'title': "Recipe:: " + $("#hfRecipeFlower").val() });
            $("#fgrdRecipe").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }, { name: 'RecipeProductID', value: $("#divFlowerID").val() }], query: "", newp: 1 }).flexReload();
        },
        close: function () {

        }
    });
    $("#ProductRecipeDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Add Recipe",
        width: 500,
        height: 250,
        buttons: {
            Save: function () {
                debugger
                SaveUpdateRecipe();
            },
            Cancel: function () {
                $("#ProductRecipeDialog").dialog("close");
            },
        },
        open: function (e) {
            debugger
            $("#ProductRecipeDialog").next('div').find('.msgui').remove();
            $("#ProductRecipeDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;position:fixed'></div>").css('height', '35px');
            $("#ProductRecipeDialog").next('div').find(".msgui").css("width", '250px');
            $("#ProductRecipeDialog").next('div').find('.msgui').hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {

        }
    });
    function addRecipeclicked() {
        RecipeID = "0"
        $("#txtRecipeProduct").val("");
        $("#hfRecipeProduct").val("");
        $("#hfRecipeProductID").val("");
        $("#txtRecipeUOM").val("ST");
        $("#hfRecipeUOM").val("");
        $("#txtRecipeQTY").val("");
        $("#txtRecipeQTY").attr("placeholder", "0");
        $("#txtRecipeCost").val("");
        $("#txtRecipeCost").attr("placeholder", "0.000");
        $("#lstRecipeType").val("");
        $("#hfRecipeType").val("");
        LoadTypeForRecipe(function (callback) { });
        $("#ProductRecipeDialog").dialog('option', 'title', "Add Product");
        $("#ProductRecipeDialog").dialog("open");
    }

    $("#txtRecipeProduct").autocomplete({
        source: function (request, response) {
            debugger
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
                            Name: flr.Name,
                            ID: flr.ID,
                            Flower: flr.Flower,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            UNITS: flr.UNITS
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
            $("#txtRecipeProduct").attr("placeholder", "");
            $("#txtRecipeProduct").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfRecipeProductID").val(i.item.ID.trim());
            $("#hfRecipeProduct").val(i.item.Flower.trim());
        },
        change: function (e, i) {
            debugger;
            if (i.item == null || i.item == undefined) {
                $("#txtRecipeProduct").val("");
                $("#hfRecipeProductID").val("0");
                $("#txtRecipeProduct").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function SaveUpdateRecipe() {
        debugger
        var ProductID = $("#divFlowerID").val();
        var Product = $("#hfRecipeProduct").val()
        if ($("#txtRecipeProduct").val() == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Product..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeProduct"));
            return false;
        }
        var QTY = (($("#txtRecipeQTY").val() == "") ? $("#txtRecipeQTY").attr('placeholder') : $("#txtRecipeQTY").val());
        if (QTY == "0" || QTY == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Qty..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeQTY"));
            return false;
        }
        var UOM = $('#txtRecipeUOM').val();
        if (UOM == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Add UOM..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeUOM"));
            return false;
        }
        var Cost = (($("#txtRecipeCost").val() == "") ? $("#txtRecipeCost").attr('placeholder') : $("#txtRecipeCost").val());
        //if (parseFloat(Cost) == 0 || Cost == "") {
        //    $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Cost..");
        //    $("#ProductRecipeDialog").next('div').find('.msgui').show();
        //    ctrlFocus($("#txtRecipeCost"));
        //    return false;
        //}
        var Type = $("#lstRecipeType").val();
        if (Type == 0) {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Select Type..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#lstRecipeType"));
            return false;
        }
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveRecipeDetails",
            data: "{'RecipeID':" + RecipeID + ",'ProductID':" + ProductID + ",'Product':'" + Product + "','QTY':" + QTY + ",'UOM':'" + UOM + "','Cost':" + Cost + ",'Type':'" + Type + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var res = output.d;
                if (output.d != "error") {
                    $("#ProductRecipeDialog").dialog("close");
                    $("#fgrdRecipe").flexReload({ url: '/url/for/refresh' });
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function LoadTypeForRecipe(callback) {
        debugger;
        var length = $('#lstRecipeType > option').length;
        if (length <= 0) {
            $('#lstRecipeType').append('<option value="0">Select</option>');
            $('#lstRecipeType').append('<option value="F">[F]Flower</option>');
            $('#lstRecipeType').append('<option value="L">[L]Labour</option>');
            $('#lstRecipeType').append('<option value="M">[M]Material</option>');
            $('#lstRecipeType').append('<option value="O">[O]Other</option>');
            if ($("#lstRecipeType").val() != "" && $("#hfRecipeType").val() != 0)
                $('#lstRecipeType').val($("#hfRecipeType").val());
            else
                $("#lstRecipeType").val("F");
        }
        else {
            $('#lstRecipeType').val($("#hfRecipeType").val());
            callback(true);
        }
    }

    $("[id^=EditRecipe_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        RecipeID = ID.replace("EditRecipe_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetRecipeByID',
            data: '{"ID":"' + RecipeID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != null) {
                    debugger;
                    var RecipeDet = output.d;
                    $("#txtRecipeProduct").val("[" + RecipeDet.Flower.trim() + "] " + RecipeDet.Name.trim());
                    $("#hfRecipeProductID").val(RecipeDet.ProductID.trim())
                    $("#hfRecipeProduct").val(RecipeDet.CODE.trim())
                    $("#txtRecipeQTY").val("");
                    $("#txtRecipeQTY").attr("Placeholder", RecipeDet.UNITS);
                    $("#txtRecipeUOM").attr("Placeholder", RecipeDet.UOM);

                    $("#txtRecipeCost").val("");
                    $("#txtRecipeCost").attr("Placeholder", RecipeDet.Cost);
                    $("#hfRecipeType").val(RecipeDet.Type);
                    LoadTypeForRecipe(function (callback) { });
                    $("#ProductRecipeDialog").dialog('option', 'title', "Edit Recipe:: " + RecipeDet.Flower);
                    $("#ProductRecipeDialog").dialog("open");

                }
            }
        });
    });
    $("[id^=DeleteRecipe_]").die("click").live("click", function () {
        debugger
        var RecipeDelID = $(this).attr("id").replace("DeleteRecipe_", "").trim();
        $("#msgRECIPEDelhtml").html("Are you sure you want to delete?");
        $("#msgbox-RECIPEDel").data("inData", { RECIPEDELID: RecipeDelID }).dialog("open");

    });

    $("#EditPOPart2").die("click").live("click", function () {

        //var POQId = $("#POQId").html();
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetPOQDetailForUpdatePart2',
        //    data: '{"POQId":"' + POQId + '"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output) {
        //        var PODetail = output.d;

        //        $("#txtUPC_EDITPODetail2").val("");
        //        $("#txtUPC_EDITPODetail2").attr("Placeholder", PODetail.Upc);

        //        $("#txtPriceOnUPC_EDITPODetail2").val("");
        //        $("#txtPriceOnUPC_EDITPODetail2").attr("Placeholder", PODetail.UpcPrice);

        //        $("#txtDescription_EDITPODetail2").val("");
        //        $("#txtDescription_EDITPODetail2").attr("Placeholder", PODetail.UpcDesc);

        //        $("#txtDateCode_EDITPODetail2").val("");
        //        $("#txtDateCode_EDITPODetail2").attr("Placeholder", PODetail.DateCode);

        //        $("#txtFoodDesc_EDITPODetail2").val("");
        //        $("#txtFoodDesc_EDITPODetail2").attr("Placeholder", PODetail.FoodDesc);

        //        $("#txtPickDesc_EDITPODetail2").val("");
        //        $("#txtPickDesc_EDITPODetail2").attr("Placeholder", PODetail.PickDesc);

        //        $("#txtSleeveDesc_EDITPODetail2").val("");
        //        $("#txtSleeveDesc_EDITPODetail2").attr("Placeholder", PODetail.SleeveDesc);

        //    }
        //});

        $("#DivEDITPODetailPart2").dialog("open");
        $("#DivEDITPODetailPart2").dialog('option', 'title', "Bouquet/Consumer Bunch Information");
    });



    $("#btnAddPODetailItem").die("click").live("click", function () {
        $('#lstUOM_EDITPODetail').find('option').remove();
        $("#txtFlower_EDITPODetail").val("");
        $("#txtFlower_EDITPODetail").attr("Placeholder", "");
        LoadUOMForEditPO();
        $("#hfFlower_EDITPODetail").val("");
        $("#txtPO_EDITPODetail").val("");
        $("#txtPO_EDITPODetail").attr("Placeholder", "");
        $("#txtQuantity_EDITPODetail").attr("Placeholder", "1");
        $("#lstUOM_EDITPODetail").val("QB");
        $("#txtUnits_EDITPODetail").val("");
        $("#txtUnits_EDITPODetail").attr("Placeholder", "");
        $("#txtUnitsPerBunch_EDITPODetail").val("");
        $("#txtUnitsPerBunch_EDITPODetail").attr("Placeholder", "");
        $("#txtUnitsPerBox_EDITPODetail").val("");
        $("#txtUnitsPerBox_EDITPODetail").attr("Placeholder", "");
        $("#txtCostPerUnit_EDITPODetail").val("");
        $("#txtCostPerUnit_EDITPODetail").attr("Placeholder", "");
        $("#txtType_EDITPODetail").attr("Placeholder", "M");
        $("#txtComments_EDITPODetail").val("");
        $("#txtComments_EDITPODetail").attr("Placeholder", "");
        $("#txtCustNo_EDITPODetail").val("");
        $("#txtCustNo_EDITPODetail").attr("Placeholder", "");
        $("#txtBoxCode_EDITPODetail").val("");
        $("#txtBoxCode_EDITPODetail").attr("Placeholder", "");
        $("#txtBreakdown_EDITPODetail").val("");
        $("#txtBreakdown_EDITPODetail").attr("Placeholder", "");
        $("#DetailFlag").html("I");
        $("#ORDNo").html("0");
        $("#POQId").html("0");
        //2021/05/31, empty sub dialog input before open
        $("#txtUPC_EDITPODetail").html("");
        $("#txtDescription_EDITPODetail").html("");
        $("#txtPriceOnUPC_EDITPODetail").html("");
        $("#txtDateCode_EDITPODetail").html("");
        $("#txtFoodDesc_EDITPODetail").html("");
        $("#txtPickDesc_EDITPODetail").html("");
        $("#txtSleeveDesc_EDITPODetail").html("");
        //empty sub dialog placeholders
        $("#txtUPC_EDITPODetail").attr("Placeholder", "");
        $("#txtDescription_EDITPODetail").attr("Placeholder", "");
        $("#txtPriceOnUPC_EDITPODetail").attr("Placeholder", "");
        $("#txtDateCode_EDITPODetail").attr("Placeholder", "");
        $("#txtFoodDesc_EDITPODetail").attr("Placeholder", "");
        $("#txtPickDesc_EDITPODetail").attr("Placeholder", "");
        $("#txtSleeveDesc_EDITPODetail").attr("Placeholder", "");
        ////
        $("#txtUPC_EDITPODetail2").val("");
        $("#txtUPC_EDITPODetail2").attr("Placeholder", "");
        $("#txtPriceOnUPC_EDITPODetail2").val("");
        $("#txtPriceOnUPC_EDITPODetail2").attr("Placeholder", "");
        $("#txtDescription_EDITPODetail2").val("");
        $("#txtDescription_EDITPODetail2").attr("Placeholder", "");
        $("#txtDateCode_EDITPODetail2").val("");
        $("#txtDateCode_EDITPODetail2").attr("Placeholder", "");
        $("#txtFoodDesc_EDITPODetail2").val("");
        $("#txtFoodDesc_EDITPODetail2").attr("Placeholder", "");
        $("#txtPickDesc_EDITPODetail2").val("");
        $("#txtPickDesc_EDITPODetail2").attr("Placeholder", "");
        $("#txtSleeveDesc_EDITPODetail2").val("");
        $("#txtSleeveDesc_EDITPODetail2").attr("Placeholder", "");

        //////////


        $("#DivEDITPODetail").dialog("open");
        $("#DivEDITPODetail").dialog('option', 'title', "Add Detail");
    });

    $("[id^=editPOdetail_]").die("click").live("click", function () {

        var sourceCtl = $(this);
        var POQId = $(this).closest('tr').attr('id').replace("row", "");
        var IDStr = sourceCtl.attr('id').replace('editPOdetail_', '');
        var SplitStr = "";
        SplitStr = IDStr.split("~");
        var PONUMBER = SplitStr[0];
        var ORD = SplitStr[1];

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPOQDetailForUpdate',
            data: '{"PONumber":"' + PONUMBER + '","ORD":"' + ORD + '","POQId":"' + POQId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                var PODetail = output.d;
                $("#txtFlower_EDITPODetail").val("");
                $("#txtFlower_EDITPODetail").attr("Placeholder", "[" + PODetail.Flower.trim() + "] " + PODetail.Flowername.trim());
                $("#hfFlower_EDITPODetail").val(PODetail.Flower.trim());
                $("#hfRecipeFlower").val(PODetail.Flowername.trim());
                LoadUOMForEditPO();

                $("#txtQuantity_EDITPODetail").val("");
                $("#txtQuantity_EDITPODetail").attr("Placeholder", PODetail.QTYBOX);

                $("#lstUOM_EDITPODetail").val(PODetail.UOM.trim());
                $("#hfUOM_EDITPODetail").val(PODetail.UOM.trim());

                $("#txtUnitsPerBunch_EDITPODetail").val("");
                $("#txtUnitsPerBunch_EDITPODetail").attr("Placeholder", PODetail.UnitsPerBunch);

                $("#txtUnitsPerBox_EDITPODetail").val("");
                $("#txtUnitsPerBox_EDITPODetail").attr("Placeholder", PODetail.QtyXBox);

                $("#txtTotalUnits_EDITPODetail").val("");
                $("#txtTotalUnits_EDITPODetail").attr("Placeholder", PODetail.QtyUnit);

                $("#txtCostPerUnit_EDITPODetail").val("");
                $("#txtCostPerUnit_EDITPODetail").attr("Placeholder", PODetail.UnitCosq);

                $("#txtType_EDITPODetail").val("");
                $("#txtType_EDITPODetail").attr("Placeholder", PODetail.Type);

                $("#txtComments_EDITPODetail").val("");
                $("#txtComments_EDITPODetail").attr("Placeholder", PODetail.Comments);

                $("#txtCustNo_EDITPODetail").val("");
                $("#txtCustNo_EDITPODetail").attr("Placeholder", PODetail.CustNumber);

                $("#txtBoxCode_EDITPODetail").val("");
                $("#txtBoxCode_EDITPODetail").attr("Placeholder", PODetail.BoxNumber);
                $("#txtBoxCode_EDITPODetail").val("");
                $("#txtBoxCode_EDITPODetail").attr("Placeholder", PODetail.BoxCode);

                $("#txtUPC_EDITPODetail").html(PODetail.Upc);
                $("#txtDescription_EDITPODetail").html(PODetail.UpcDesc);
                $("#txtPriceOnUPC_EDITPODetail").html(PODetail.UpcPrice);
                $("#txtDateCode_EDITPODetail").html(PODetail.DateCode);
                $("#txtFoodDesc_EDITPODetail").html(PODetail.FoodDesc);
                $("#txtPickDesc_EDITPODetail").html(PODetail.PickDesc);
                $("#txtSleeveDesc_EDITPODetail").html(PODetail.SleeveDesc);

                //$("#txtBoxCode_EDITPODetail").prop("readonly", true);
                //2021/05/31, fill sub fialog data here instead of calling ajax to get its data when open the dialog
                $("#txtUPC_EDITPODetail2").val(PODetail.Upc);
                $("#txtUPC_EDITPODetail2").attr("Placeholder", PODetail.Upc);
                $("#txtPriceOnUPC_EDITPODetail2").val(PODetail.UpcPrice);
                $("#txtPriceOnUPC_EDITPODetail2").attr("Placeholder", PODetail.UpcPrice);
                $("#txtDescription_EDITPODetail2").val(PODetail.UpcDesc);
                $("#txtDescription_EDITPODetail2").attr("Placeholder", PODetail.UpcDesc);
                $("#txtDateCode_EDITPODetail2").val(PODetail.DateCode);
                $("#txtDateCode_EDITPODetail2").attr("Placeholder", PODetail.DateCode);
                $("#txtFoodDesc_EDITPODetail2").val(PODetail.FoodDesc);
                $("#txtFoodDesc_EDITPODetail2").attr("Placeholder", PODetail.FoodDesc);
                $("#txtPickDesc_EDITPODetail2").val(PODetail.PickDesc);
                $("#txtPickDesc_EDITPODetail2").attr("Placeholder", PODetail.PickDesc);
                $("#txtSleeveDesc_EDITPODetail2").val(PODetail.SleeveDesc);
                $("#txtSleeveDesc_EDITPODetail2").attr("Placeholder", PODetail.SleeveDesc);
                ////
                // AddedBy Anubhuti
                $(".pip").remove();
                $("#bouquetImg").val("");
                $("#foodImg").val("");
                $("#pickImg").val("");
                $("#sleeveImg").val("");
                debugger;
                if (PODetail.bouquetImagePath != "" && PODetail.bouquetImagePath != "undefined") {
                    $("#btnbouquetImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img1' class=\"imageThumb\" src=\"" + PODetail.bouquetImagePath + "\" onclick=ShowPreview_edit('" + PODetail.ImgbouquetName + "') title=\"" + PODetail.ImgbouquetName + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove'  onclick=deleteImg('bouquetImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#bouquetImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                }
                else {
                    $("#btnbouquetImg").show();
                }
                if (PODetail.FoodImagePath != "" && PODetail.FoodImagePath != "undefined") {
                    $("#btnfoodImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img2' class=\"imageThumb\" src=\"" + PODetail.FoodImagePath + "\" onclick=ShowPreview_edit2('" + PODetail.ImgFoodName + "') title=\"" + PODetail.ImgFoodName + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('foodImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#foodImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                }
                else {
                    $("#btnfoodImg").show();
                }
                if (PODetail.PickImagePath != "" && PODetail.PickImagePath != "undefined") {
                    $("#btnpickImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img3' class=\"imageThumb\" src=\"" + PODetail.PickImagePath + "\" onclick=ShowPreview_edit3('" + PODetail.ImgPickName + "') title=\"" + PODetail.ImgPickName + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('pickImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#pickImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                }
                else {
                    $("#btnpickImg").show();
                }
                if (PODetail.SleeveImagePath != "" && PODetail.SleeveImagePath != "undefined") {
                    $("#btnsleeveImg").hide();
                    $("<span class=\"pip\">" +
                        "<img id='img4' class=\"imageThumb\" src=\"" + PODetail.SleeveImagePath + "\" onclick=ShowPreview_edit4('" + PODetail.ImgSleeveName + "') title=\"" + PODetail.ImgSleeveName + "\"  />" +
                        "<br/><span class=\"remove\"><a class='fileuploader-action fileuploader-action-remove' onclick=deleteImg('sleeveImg') ><i class=''></i></a></span>" +
                        "</span>").insertAfter("#sleeveImg");
                    $(".remove").click(function () {
                        $(this).parent(".pip").remove();
                    });
                }
                else {
                    $("#btnsleeveImg").show();
                }
                ////
                $("#DetailFlag").html("U");
                $("#ORDNo").html(ORD);
                $("#POQId").html(POQId);
            }
        });

        $("#DivEDITPODetail").dialog("open");
        $("#DivEDITPODetail").dialog("option", "title", "Edit Detail");
    });

    $("#DivEDITPODetail").dialog({
        autoOpen: false,
        width: 800,
        height: 420,
        modal: true,
        resizable: false,
        buttons:
        {
            Save: {
                text: "Save",
                id: "btnPoEditDialogSave",
                click: function () {
                    Flower = $("#hfFlower_EDITPODetail").val();
                    if (Flower == "") {
                        $(".YellowWarning").html("Please choose flower..");
                        $(".YellowWarning").show();
                        $("#txtFlower_EDITPODetail").focus();
                        return false;
                    }

                    var Quantity = $("#txtQuantity_EDITPODetail").val();
                    if (Quantity == "")
                        Quantity = $("#txtQuantity_EDITPODetail").attr("Placeholder")
                    if (Quantity == "") {
                        $(".YellowWarning").html("Please enter Quantity..");
                        $(".YellowWarning").show();
                        $("#txtQuantity_EDITPODetail").focus();;
                        return false;
                    }
                    var UOM = $("#lstUOM_EDITPODetail").val();
                    if (UOM == 0) {
                        $(".YellowWarning").html("Please Choose UOM..");
                        $(".YellowWarning").show();
                        $("#lstUOM_EDITPODetail").focus();;
                        return false;
                    }

                    var UnitsPerBunch = $("#txtUnitsPerBunch_EDITPODetail").val() == "" ? "0" : $("#txtUnitsPerBunch_EDITPODetail").val();
                    if ($("#txtUnitsPerBunchEDITPODetail").val() == "")
                        UnitsPerBunch = $("#txtUnitsPerBunch_EDITPODetail").attr("Placeholder");

                    var UnitsPerBox = $("#txtUnitsPerBox_EDITPODetail").val();
                    if (UnitsPerBox == "")
                        UnitsPerBox = $("#txtUnitsPerBox_EDITPODetail").attr("Placeholder")
                    if (UnitsPerBox == "") {
                        $(".YellowWarning").html("Please enter Units Per Box..");
                        $(".YellowWarning").show();
                        $("#txtUnitsPerBox_EDITPODetail").focus();;
                        return false;
                    }

                    var CostPerUnits = $("#txtCostPerUnit_EDITPODetail").val();
                    if (CostPerUnits == "")
                        CostPerUnits = $("#txtCostPerUnit_EDITPODetail").attr("Placeholder")
                    if (CostPerUnits == "") {
                        $(".YellowWarning").html("Please enter Cost per Unit..");
                        $(".YellowWarning").show();
                        $("#txtCostPerUnit_EDITPODetail").focus();;
                        return false;
                    }
                    var Type = $("#txtType_EDITPODetail").val().toString().toUpperCase();
                    if (Type == "")
                        Type = $("#txtType_EDITPODetail").attr("Placeholder").toString().toUpperCase();
                    if (Type == 0) {
                        $(".YellowWarning").html("Please enter type..");
                        $(".YellowWarning").show();
                        $("#txtType_EDITPODetail").focus();;
                        return false;
                    }
                    var Comments = $("#txtComments_EDITPODetail").val() == "" ? $("#txtComments_EDITPODetail").attr("Placeholder") : $("#txtComments_EDITPODetail").val();
                    var BreakDown = $("#txtBreakdown_EDITPODetail").val();
                    var CustNumber = $("#txtCustNo_EDITPODetail").val() == "" ? $("#txtCustNo_EDITPODetail").attr("Placeholder") : $("#txtCustNo_EDITPODetail").val();
                    var boxcode = $("#txtBoxCode_EDITPODetail").val() == "" ? $("#txtBoxCode_EDITPODetail").attr("Placeholder") : $("#txtBoxCode_EDITPODetail").val();
                    var Flag = $("#DetailFlag").html();
                    var ORD = $("#ORDNo").html();
                    var POQId = $("#POQId").html();

                    var upc = $("#txtUPC_EDITPODetail").html();
                    var upcDesc = $("#txtDescription_EDITPODetail").html();
                    var upcPrice = $("#txtPriceOnUPC_EDITPODetail").html();
                    var dateCode = $("#txtDateCode_EDITPODetail").html();
                    var foodDesc = $("#txtFoodDesc_EDITPODetail").html();
                    var pickDesc = $("#txtPickDesc_EDITPODetail").html();
                    var sleeveDesc = $("#txtSleeveDesc_EDITPODetail").html();

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ADDUPDATEPODetailToPOQ',
                        data: '{"PONumber":"' + $("#txtPONumber_EditPOHeader").val() + '","Farm":"' + $("#lstfarm_EditPOHeader").val() +
                            '","Flower":"' + Flower + '","Boxes":"' + Quantity + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                            '","CostPerUnits":"' + CostPerUnits + '","Type":"' + Type + '","Comments":"' + Comments + '","CustNumber":"' + CustNumber +
                            '","BoxCode":"' + boxcode + '","BreakDown":"' + BreakDown + '","Flag":"' + Flag + '","ORD":"' + ORD + '","POQId":"' + POQId +
                            '","UPC":"' + upc + '","UPCDesc":"' + upcDesc + '","UPCPrice":"' + upcPrice + '","DateCode":"' + dateCode + '" ,"FoodDesc":"' + foodDesc + '","PickDesc":"' + pickDesc + '","SleeveDesc":"' + sleeveDesc + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d == "success") {

                                $("#DivEDITPODetail").dialog("close");
                                $("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
                                $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });

                                $("#txtUPC_EDITPODetail").html("");
                                $("#txtDescription_EDITPODetail").html("");
                                $("#txtPriceOnUPC_EDITPODetail").html("");
                                $("#txtDateCode_EDITPODetail").html("");
                                $("#txtFoodDesc_EDITPODetail").html("");
                                $("#txtPickDesc_EDITPODetail").html("");
                                $("#txtSleeveDesc_EDITPODetail").html("");
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        }
                    });
                }
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".YellowWarning").hide();
            $(".Warning").hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("[id^=deletePOdetail_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var POQId = $(this).closest('tr').attr('id').replace("row", "");
        var IDStr = sourceCtl.attr('id').replace('deletePOdetail_', '');
        $("#PODetailNumber").html(IDStr + "~" + POQId);
        var row_index = $(this).parent().index();
        var Flower = $('#fgrdPODetails tr').find("td div").eq(5)[row_index].textContent.trim();
        var FlowerName = $('#fgrdPODetails tr').find("td div").eq(6)[row_index].textContent.trim();

        $("#DeleteconfirmPODetail").html("<p>Are you sure to delete<b> [" + Flower + '] - ' + FlowerName + "</b> ?</p>");
        $("#DeleteconfirmPODetail").dialog("open");
    });

    /*Delete terms details from table by Abi*/
    $("#DeleteconfirmPODetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons:
        {
            Yes: function () {
                var adialog = $(this);
                var ID = $("#PODetailNumber").html();
                var SplitStr = "";
                SplitStr = ID.split("~");
                var PONUMBER = SplitStr[0];
                //var ORD = SplitStr[1];
                var POQId = SplitStr[2];
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DELETEPORDetail',
                    data: '{"PONUMBER":"' + PONUMBER + '","POQId":"' + POQId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdPODetails").flexReload({ url: '/url/for/refresh' });
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

    $("[id^=aCustomer_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var POQId = $(this).closest('tr').attr('id').replace("row", "");
        var IDStr = sourceCtl.attr('id').replace('aCustomer_', '');
        var para = 'Customer=' + IDStr;
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
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {

                    },
                });
                $("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer ::' + IDStr);
                $("#DivSPORDDialog").html(output.d).dialog("open");
            }
        });
    });

    $("[id^=POTemptick_]").die("click").live("click", function () {
        var sourceCtl = $(this);

        var img = sourceCtl.attr("src").toLowerCase();

        var SelectedID = sourceCtl.attr('id').replace("POTemptick_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");

            //Boxes                    
            $("#editBoxestextOnTempPODetailGrid_" + SelectedID).show();
            $("#editBoxeslinkOnTempPODetailGrid_" + SelectedID).hide();

            //Units/box                    
            $("#editUnitsBunchtextOnTempPODetailGrid_" + SelectedID).show();
            $("#editUnitsBunchlinkOnTempPODetailGrid_" + SelectedID).hide();

            //Units/Bunch
            $("#editUnitstextOnTempPODetailGrid_" + SelectedID).show();
            $("#editUnitslinkOnTempPODetailGrid_" + SelectedID).hide();

            //Cost                    
            $("#editCosttextOnTempPODetailGrid_" + SelectedID).show();
            $("#editCostlinkOnTempPODetailGrid_" + SelectedID).hide();

            //BreakDown                    
            $("#editCustNumbertextOnTempPODetailGrid_" + SelectedID).show();
            $("#editCustNumberlinkOnTempPODetailGrid_" + SelectedID).hide();

            //Comments                    
            $("#editCommentstextOnTempPODetailGrid_" + SelectedID).show();
            $("#editCommentslinkOnTempPODetailGrid_" + SelectedID).hide();


            //Type                    
            $("#editTypetextOnTempPODetailGrid_" + SelectedID).show();
            $("#editTypelinkOnTempPODetailGrid_" + SelectedID).hide();

            //BreakDown                    
            $("#editBreakDowntextOnTempPODetailGrid_" + SelectedID).show();
            $("#editBreakDownlinkOnTempPODetailGrid_" + SelectedID).hide();

            //BoxCode
            $("#editBoxCodetextOnTempPODetailGrid_" + SelectedID).show();
            $("#editBoxCodelinkOnTempPODetailGrid_" + SelectedID).hide();

            $("[id^=editBoxestextOnTempPODetailGrid_]")[0].focus();

        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");

            //Boxes                    
            $("#editBoxestextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editBoxeslinkOnTempPODetailGrid_" + SelectedID).show();

            //Units/box                    
            $("#editUnitsBunchtextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editUnitsBunchlinkOnTempPODetailGrid_" + SelectedID).show();

            //Units/Bunch
            $("#editUnitstextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editUnitslinkOnTempPODetailGrid_" + SelectedID).show();

            //Cost                    
            $("#editCosttextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editCostlinkOnTempPODetailGrid_" + SelectedID).show();

            //BreakDown                    
            $("#editCustNumbertextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editCustNumberlinkOnTempPODetailGrid_" + SelectedID).show();

            //Comments                    
            $("#editCommentstextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editCommentslinkOnTempPODetailGrid_" + SelectedID).show();


            //Type                    
            $("#editTypetextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editTypelinkOnTempPODetailGrid_" + SelectedID).show();

            //BreakDown                    
            $("#editBreakDowntextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editBreakDownlinkOnTempPODetailGrid_" + SelectedID).show();

            //BoxCode
            $("#editBoxCodetextOnTempPODetailGrid_" + SelectedID).hide();
            $("#editBoxCodelinkOnTempPODetailGrid_" + SelectedID).show();

        }
    });

    $("#POTempTickAll").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $("[id^=POTemptick_]").prop("src", "images/check-on.png");
            $('#fgrdPOProductPurchaseDetailsTempGrid tr').addClass("trChecked");

            //Boxes                    
            $("[id^=editBoxestextOnTempPODetailGrid_]").show();
            $("[id^=editBoxeslinkOnTempPODetailGrid_]").hide();

            //Units/box                    
            $("[id^=editUnitsBunchtextOnTempPODetailGrid_]").show();
            $("[id^=editUnitsBunchlinkOnTempPODetailGrid_]").hide();

            //Units/Bunch
            $("[id^=editUnitstextOnTempPODetailGrid_]").show();
            $("[id^=editUnitslinkOnTempPODetailGrid_]").hide();

            //Cost                    
            $("[id^=editCosttextOnTempPODetailGrid_]").show();
            $("[id^=editCostlinkOnTempPODetailGrid_]").hide();

            //BreakDown                    
            $("[id^=editCustNumbertextOnTempPODetailGrid_]").show();
            $("[id^=editCustNumberlinkOnTempPODetailGrid_]").hide();

            //Comments                    
            $("[id^=editCommentstextOnTempPODetailGrid_]").show();
            $("[id^=editCommentslinkOnTempPODetailGrid_]").hide();


            //Type                    
            $("[id^=editTypetextOnTempPODetailGrid_]").show();
            $("[id^=editTypelinkOnTempPODetailGrid_]").hide();

            //BreakDown                    
            $("[id^=editBreakDowntextOnTempPODetailGrid_]").show();
            $("[id^=editBreakDownlinkOnTempPODetailGrid_]").hide();

            //BoxCode
            $("[id^=editBoxCodetextOnTempPODetailGrid_]").show();
            $("[id^=editBoxCodelinkOnTempPODetailGrid_]").hide();
            $("[id^=editBoxestextOnTempPODetailGrid_]")[0].focus();

        }
        else {
            $("[id^=POTemptick_]").prop("src", "images/check-off.png");
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdPOProductPurchaseDetailsTempGrid tr').removeClass("trChecked");

            //Boxes                    
            $("[id^=editBoxestextOnTempPODetailGrid_]").hide();
            $("[id^=editBoxeslinkOnTempPODetailGrid_]").show();

            //Units/box                    
            $("[id^=editUnitsBunchtextOnTempPODetailGrid_]").hide();
            $("[id^=editUnitsBunchlinkOnTempPODetailGrid_]").show();

            //Units/Bunch
            $("[id^=editUnitstextOnTempPODetailGrid_]").hide();
            $("[id^=editUnitslinkOnTempPODetailGrid_]").show();

            //Cost                    
            $("[id^=editCosttextOnTempPODetailGrid_]").hide();
            $("[id^=editCostlinkOnTempPODetailGrid_]").show();

            //BreakDown                    
            $("[id^=editCustNumbertextOnTempPODetailGrid_]").hide();
            $("[id^=editCustNumberlinkOnTempPODetailGrid_]").show();

            //Comments                    
            $("[id^=editCommentstextOnTempPODetailGrid_]").hide();
            $("[id^=editCommentslinkOnTempPODetailGrid_]").show();


            //Type                    
            $("[id^=editTypetextOnTempPODetailGrid_]").hide();
            $("[id^=editTypelinkOnTempPODetailGrid_]").show();

            //BreakDown                    
            $("[id^=editBreakDowntextOnTempPODetailGrid_]").hide();
            $("[id^=editBreakDownlinkOnTempPODetailGrid_]").show();

            //BoxCode
            $("[id^=editBoxCodetextOnTempPODetailGrid_]").hide();
            $("[id^=editBoxCodelinkOnTempPODetailGrid_]").show();
        }
    });


    function updatedetailToTempGridclicked() {
        var Details = "";
        Details = "<TempPODetails>"
        $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    var ID = $(this).attr("id").replace("row", "");

                    if ($("#editBoxestextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editBoxestextOnTempPODetailGrid_" + ID).val($("#editBoxestextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val($("#editUnitsBunchtextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editUnitstextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editUnitstextOnTempPODetailGrid_" + ID).val($("#editUnitstextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editCosttextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editCosttextOnTempPODetailGrid_" + ID).val($("#editCosttextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editCustNumbertextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editCustNumbertextOnTempPODetailGrid_" + ID).val($("#editCustNumbertextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editCommentstextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editCommentstextOnTempPODetailGrid_" + ID).val($("#editCommentstextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editTypetextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editTypetextOnTempPODetailGrid_" + ID).val($("#editTypetextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editBreakDowntextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editBreakDowntextOnTempPODetailGrid_" + ID).val($("#editBreakDowntextOnTempPODetailGrid_" + ID).attr("placeholder"));
                    if ($("#editBoxCodetextOnTempPODetailGrid_" + ID).val() == "")
                        $("#editBoxCodetextOnTempPODetailGrid_" + ID).val($("#editBoxCodetextOnTempPODetailGrid_" + ID).attr("placeholder"));


                    Details += "<TempPODetail>" +
                        "<DetailsID>" + ID + "</DetailsID>" +
                        "<boxes>" + $("#editBoxestextOnTempPODetailGrid_" + ID).val() + "</boxes>" +
                        "<unitperbox>" + $("#editUnitstextOnTempPODetailGrid_" + ID).val() + "</unitperbox>" +
                        "<unitperbunch>" + $("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val() + "</unitperbunch>" +
                        "<costperunit>" + $("#editCosttextOnTempPODetailGrid_" + ID).val() + "</costperunit>" +
                        "<comments>" + $("#editCommentstextOnTempPODetailGrid_" + ID).val() + "</comments>" +
                        "<breakdown>" + $("#editBreakDowntextOnTempPODetailGrid_" + ID).val() + "</breakdown>" +
                        "<boxcode>" + $("#editBoxCodetextOnTempPODetailGrid_" + ID).val() + "</boxcode>" +
                        "<custnumber>" + $("#editCustNumbertextOnTempPODetailGrid_" + ID).val() + "</custnumber>" +
                        "<type>" + $("#editTypetextOnTempPODetailGrid_" + ID).val().toUpperCase() + "</type>" +
                        "</TempPODetail>";
                }
            }
        });
        Details += "</TempPODetails>"

        if (Details != "<TempPODetails></TempPODetails>") {
            $("#ImgProcessing").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateInlineEditDetailsTempPurchaseDetails',
                data: "{'Details':'" + Details + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $("#ImgProcessing").hide();
                    if (output.d == "success") {

                        $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {

                            if ($(this).attr("id") != "row0") {

                                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                    var ID = $(this).attr("id").replace("row", "");
                                    $("#editBoxeslinkOnTempPODetailGrid_" + ID).html($("#editBoxestextOnTempPODetailGrid_" + ID).val())
                                    $("#editUnitsBunchlinkOnTempPODetailGrid_" + ID).html($("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val());
                                    $("#editUnitslinkOnTempPODetailGrid_" + ID).html($("#editUnitstextOnTempPODetailGrid_" + ID).val());
                                    $("#editCostlinkOnTempPODetailGrid_" + ID).html($("#editCosttextOnTempPODetailGrid_" + ID).val());
                                    $("#editCustNumberlinkOnTempPODetailGrid_" + ID).html($("#editCustNumbertextOnTempPODetailGrid_" + ID).val());
                                    $("#editCommentslinkOnTempPODetailGrid_" + ID).html($("#editCommentstextOnTempPODetailGrid_" + ID).val());
                                    $("#editTypelinkOnTempPODetailGrid_" + ID).html($("#editTypetextOnTempPODetailGrid_" + ID).val());
                                    $("#editBreakDownlinkOnTempPODetailGrid_" + ID).html($("#editBreakDowntextOnTempPODetailGrid_" + ID).val());
                                    $("#editBoxCodelinkOnTempPODetailGrid_" + ID).html($("#editBoxCodetextOnTempPODetailGrid_" + ID).val());

                                    $("#editBoxestextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editBoxestextOnTempPODetailGrid_" + ID).val());
                                    $("#editUnitsBunchtextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val());
                                    $("#editUnitstextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editUnitstextOnTempPODetailGrid_" + ID).val());
                                    $("#editCosttextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editCosttextOnTempPODetailGrid_" + ID).val());
                                    $("#editCustNumbertextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editCustNumbertextOnTempPODetailGrid_" + ID).val());
                                    $("#editCommentstextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editCommentstextOnTempPODetailGrid_" + ID).val());
                                    $("#editTypetextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editTypetextOnTempPODetailGrid_" + ID).val());
                                    $("#editBreakDowntextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editBreakDowntextOnTempPODetailGrid_" + ID).val());
                                    $("#editBoxCodetextOnTempPODetailGrid_" + ID).attr("placeholder", $("#editBoxCodetextOnTempPODetailGrid_" + ID).val());

                                    $("#editBoxestextOnTempPODetailGrid_" + ID).val("");
                                    $("#editUnitsBunchtextOnTempPODetailGrid_" + ID).val("");
                                    $("#editUnitstextOnTempPODetailGrid_" + ID).val("");
                                    $("#editCosttextOnTempPODetailGrid_" + ID).val("");
                                    $("#editCustNumbertextOnTempPODetailGrid_" + ID).val("");
                                    $("#editCommentstextOnTempPODetailGrid_" + ID).val("");
                                    $("#editTypetextOnTempPODetailGrid_" + ID).val("");
                                    $("#editBreakDowntextOnTempPODetailGrid_" + ID).val("");
                                    $("#editBoxCodetextOnTempPODetailGrid_" + ID).val("");

                                    //$('#DivConfirmedPOs [value="Clear"]').click();
                                }
                            }
                        });

                        $('#fgrdPOProductPurchaseDetailsTempGrid tr').removeClass("trChecked");

                        //Boxes                    
                        $("[id^=editBoxestextOnTempPODetailGrid_]").hide();
                        $("[id^=editBoxeslinkOnTempPODetailGrid_]").show();

                        //Units/box                    
                        $("[id^=editUnitsBunchtextOnTempPODetailGrid_]").hide();
                        $("[id^=editUnitsBunchlinkOnTempPODetailGrid_]").show();

                        //Units/Bunch
                        $("[id^=editUnitstextOnTempPODetailGrid_]").hide();
                        $("[id^=editUnitslinkOnTempPODetailGrid_]").show();

                        //Cost                    
                        $("[id^=editCosttextOnTempPODetailGrid_]").hide();
                        $("[id^=editCostlinkOnTempPODetailGrid_]").show();

                        //BreakDown                    
                        $("[id^=editCustNumbertextOnTempPODetailGrid_]").hide();
                        $("[id^=editCustNumberlinkOnTempPODetailGrid_]").show();

                        //Comments                    
                        $("[id^=editCommentstextOnTempPODetailGrid_]").hide();
                        $("[id^=editCommentslinkOnTempPODetailGrid_]").show();


                        //Type                    
                        $("[id^=editTypetextOnTempPODetailGrid_]").hide();
                        $("[id^=editTypelinkOnTempPODetailGrid_]").show();

                        //BreakDown                    
                        $("[id^=editBreakDowntextOnTempPODetailGrid_]").hide();
                        $("[id^=editBreakDownlinkOnTempPODetailGrid_]").show();

                        //BoxCode
                        $("[id^=editBoxCodetextOnTempPODetailGrid_]").hide();
                        $("[id^=editBoxCodelinkOnTempPODetailGrid_]").show();

                        $("img#POTempTickAll").prop("src", "images/check-off.png");
                        $("[id^=POTemptick_]").attr("src", "images/check-off.png");
                        CalcuateTotalForPOTempGrid()
                        DeleteZeroValueInTempPOGrid();
                    }
                    else
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        }
        else if (Details == "<TempPODetails></TempPODetails>") {
            $.MessageBox("Please choose details to update!!!");
        }

    }

    function DeleteZeroValueInTempPOGrid() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteZeroValueInTempPO',
            data: "{'TempPOHeaderID':'" + $("#TempPOHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {

                    $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            var ID = $(this).attr("id").replace("row", "");
                            if ($("#editBoxeslinkOnTempPODetailGrid_" + ID).html() == 0) {
                                $("#row" + ID).remove();
                            }
                        }
                    });
                    CalcuateTotalForPOTempGrid();
                }
                else if (output.d == 'LogOut') {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    }

    function CalcuateTotalForPOTempGrid() {
        var Boxes = 0; var TotalUnits = 0; var TotalCost = 0;

        $('#fgrdPOProductPurchaseDetailsTempGrid tr').each(function () {
            if ($(this).attr("id") != "row0") {
                var DetailID = $(this).attr("id").replace("row", "");
                Boxes += parseInt($("#editBoxeslinkOnTempPODetailGrid_" + DetailID).html());
                TotalUnits += parseInt($("#editTotalUnitslinkOnTempPODetailGrid_" + DetailID).html());

                TotalCost += parseFloat($("#editTotalCostlinkOnTempPODetailGrid_" + DetailID).html().replace("$", ""));
            }
        });

        $('#DivProductPurchaseDetailsTemp #row0 td:nth-child(7) div').text(Boxes);
        $('#DivProductPurchaseDetailsTemp #row0 td:nth-child(11) div').text(TotalUnits);
        $('#DivProductPurchaseDetailsTemp #row0 td:nth-child(13) div').text("$" + TotalCost.toFixed(2));

    }


    $("#DivADDEDITPO").dialog({
        autoOpen: false,
        width: 800,
        height: 420,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {
                //var DetailID = $("#PODetailID").html();
                //var HeaderID = $("#POHeaderID").html();
                //var Mode = 0;
                //if (DetailID == "0")
                //    Mode = 1;
                //else
                //    Mode = 2;


                Flower = $("#hfFlower_ADDEDITPO").val();
                if (Flower == "") {
                    $(".YellowWarning").html("Please choose flower..");
                    $(".YellowWarning").show();
                    $("#txtFlower_ADDEDITPO").focus();
                    return false;
                }


                var Quantity = $("#txtQuantity_ADDEDITPO").val();
                if (Quantity == "")
                    Quantity = $("#txtQuantity_ADDEDITPO").attr("Placeholder")
                if (Quantity == "") {
                    $(".YellowWarning").html("Please enter Quantity..");
                    $(".YellowWarning").show();
                    $("#txtQuantity_ADDEDITPO").focus();;
                    return false;
                }
                var UOM = $("#lstUOM_ADDEDITPO").val();
                if (UOM == 0) {
                    $(".YellowWarning").html("Please Choose UOM..");
                    $(".YellowWarning").show();
                    $("#lstUOM_ADDEDITPO").focus();;
                    return false;
                }


                var UnitsPerBunch = $("#txtUnitsPerBunch_ADDEDITPO").val() == "" ? "0" : $("#txtUnitsPerBunch_ADDEDITPO").val();
                if ($("#txtUnitsPerBunch_ADDEDITPO").val() == "")
                    UnitsPerBunch = $("#txtUnitsPerBunch_ADDEDITPO").attr("Placeholder");


                var UnitsPerBox = $("#txtUnitsPerBox_ADDEDITPO").val();
                if (UnitsPerBox == "")
                    UnitsPerBox = $("#txtUnitsPerBox_ADDEDITPO").attr("Placeholder")
                if (UnitsPerBox == "") {
                    $(".YellowWarning").html("Please enter Units Per Box..");
                    $(".YellowWarning").show();
                    $("#txtUnitsPerBox_ADDEDITPO").focus();;
                    return false;
                }

                var CostPerUnits = $("#txtCostPerUnit_ADDEDITPO").val();
                if (CostPerUnits == "")
                    CostPerUnits = $("#txtCostPerUnit_ADDEDITPO").attr("Placeholder")
                if (CostPerUnits == "") {
                    $(".YellowWarning").html("Please enter Cost per unit..");
                    $(".YellowWarning").show();
                    $("#txtCostPerUnit_ADDEDITPO").focus();;
                    return false;
                }
                var Type = $("#txtType_ADDEDITPO").val();
                if (Type == "")
                    Type = $("#txtType_ADDEDITPO").attr("Placeholder")
                if (Type == 0) {
                    $(".YellowWarning").html("Please enter type..");
                    $(".YellowWarning").show();
                    $("#txtType_ADDEDITPO").focus();;
                    return false;
                }
                var Comments = $("#txtComments_ADDEDITPO").val();
                var BreakDown = $("#txtBreakdown_ADDEDITPO").val();
                var CustNumber = $("#txtCustNo_ADDEDITPO").val();
                var boxcode = $("#txtBoxCode_ADDEDITPO").val();

                var upc = $("#txtUPC_ADDPODetail").val();
                var upcDesc = $("#txtDescription_ADDPODetail").val();
                var upcPrice = $("#txtPriceOnUPC_ADDPODetail").val();
                var dateCode = $("#txtDateCode_ADDPODetail").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditTempPODetails',
                    data: '{"TempPOHeaderID":"' + $("#TempPOHeaderID").html() + '","Farm":"' + $("#TempSelectedFarm").html() +
                        '","Flower":"' + Flower +
                        '","Boxes":"' + Quantity + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                        '","CostPerUnits":"' + CostPerUnits + '","Type":"' + Type + '","Comments":"' + Comments + '","CustNumber":"' + CustNumber +
                        '","BoxCode":"' + boxcode + '","UPC":"' + upc + '","UPCDesc":"' + upcDesc + '","UPCPrice":"' + upcPrice + '","DateCode":"' + dateCode + '","BreakDown":"' + BreakDown + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "success") {
                            $("#DivADDEDITPO").dialog("close");
                            $("#fgrdPOProductPurchaseDetailsTempGrid").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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
            $(".Warning").hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    function AddEditPOclicked() {
        $("#lstUOM_ADDEDITPO").empty();
        LoadUOM(function (callback) { });
        $("#txtFlower_ADDEDITPO").val("");
        $("#txtFlower_ADDEDITPO").attr("Placeholder", "");
        $("#hfFlower_ADDEDITPO").val("");
        $("#txtPO_ADDEDITPO").val("");
        $("#txtPO_ADDEDITPO").attr("Placeholder", "");
        $("#txtQuantity_ADDEDITPO").attr("Placeholder", "1");
        $("#lstUOM_ADDEDITPO").val("QB");
        $("#txtUnits_ADDEDITPO").val("");
        $("#txtUnits_ADDEDITPO").attr("Placeholder", "");
        $("#txtUnitsPerBunch_ADDEDITPO").val("");
        $("#txtUnitsPerBunch_ADDEDITPO").attr("Placeholder", "");
        $("#txtUnitsPerBox_ADDEDITPO").val("");
        $("#txtUnitsPerBox_ADDEDITPO").attr("Placeholder", "");
        $("#txtCostPerUnit_ADDEDITPO").val("");
        $("#txtCostPerUnit_ADDEDITPO").attr("Placeholder", "");
        $("#txtType_ADDEDITPO").attr("Placeholder", "M");
        $("#txtComments_ADDEDITPO").val("");
        $("#txtComments_ADDEDITPO").attr("Placeholder", "");
        $("#txtCustNo_ADDEDITPO").val("");
        $("#txtCustNo_ADDEDITPO").attr("Placeholder", "");
        $("#txtBoxCode_ADDEDITPO").val("");
        $("#txtBoxCode_ADDEDITPO").attr("Placeholder", "");

        $("#txtUPC_ADDPODetail").val("");
        $("#txtUPC_ADDPODetail").attr("Placeholder", "");

        $("#txtDescription_ADDPODetail").val("");
        $("#txtDescription_ADDPODetail").attr("Placeholder", "");

        $("#txtPriceOnUPC_ADDPODetail").val("");
        $("#txtPriceOnUPC_ADDPODetail").attr("Placeholder", "");

        $("#txtDateCode_ADDPODetail").val("");
        $("#txtDateCode_ADDPODetail").attr("Placeholder", "");

        $("#txtBreakdown_ADDEDITPO").val("");
        $("#txtBreakdown_ADDEDITPO").attr("Placeholder", "");

        $("#DivADDEDITPO").dialog("open");
        $("#DivADDEDITPO").dialog('option', 'title', "Add Detail");
        //LoadFlowers();     
    }

    function LoadUOM(callback) {

        var length = $('#lstUOM_ADDEDITPO > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForManualPOByFarm',
                data: "{'FarmCode':'" + $("#lstfarmADDPO")[0].value + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_ADDEDITPO').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_ADDEDITPO').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_ADDEDITPO').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']' + '</option>');
                    }

                    if ($("#hfUOM_ADDEDITPO").val() != "" && $("#hfUOM_ADDEDITPO").val() != 0)
                        $('#lstUOM_ADDEDITPO').val($("#hfUOM_ADDEDITPO").val());
                    else
                        $("#lstUOM_ADDEDITPO").val("QB");

                }
            });
            callback(true);
        }
        else {
            $('#lstUOM_ADDEDITPO').val($("#hfUOM_ADDEDITPO").val());
            callback(true);
        }
    }

    $("#txtFlower_EDITPODetail").autocomplete({
        source: function (request, response) {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteFarmwise',
                data: "{'Searchtext': '" + request.term + "','FarmCode': '" + $("#lstfarm_EditPOHeader").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            Qty: flr.UNITS,
                            UnitPerBunch: flr.BUNCH
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
            $("#txtFlower_EDITPODetail").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfFlower_EDITPODetail").val(i.item.Flower.trim());
            $("#txtUnitsPerBunch_EDITPODetail").val(i.item.UnitPerBunch);
            $("#txtUnitsPerBox_EDITPODetail").val(i.item.Qty);
            $("#txtQuantity_EDITPODetail").focus();
            LoadUOMForEditPO();
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtFlower_EDITPODetail").val("");
                $("#txtFlower_EDITPODetail").focus();
                $("#txtUnitsPerBunch_EDITPODetail").val("");
                $("#txtQuantity_EDITPODetail").val("");
                $(".ui-menu").css("display", "none");
                LoadUOMForEditPO();
            }
        },
        minLength: 1,
        autoFocus: true
    });

    $("#txtQuantity_EDITPODetail").blur(function (event) {

        var QuantityVal = $("#txtQuantity_EDITPODetail").val() == "" ? $("#txtQuantity_EDITPODetail").attr("Placeholder") : $("#txtQuantity_EDITPODetail").val();
        var CostVal = $("#txtUnitsPerBox_EDITPODetail ").val() == "" ? $("#txtUnitsPerBox_EDITPODetail ").attr("Placeholder") : $("#txtUnitsPerBox_EDITPODetail ").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtTotalUnits_EDITPODetail").val(QuantityVal * CostVal);

    });

    $("#txtUnitsPerBox_EDITPODetail").blur(function (event) {
        var QuantityVal = $("#txtQuantity_EDITPODetail").val() == "" ? $("#txtQuantity_EDITPODetail").attr("Placeholder") : $("#txtQuantity_EDITPODetail").val();
        var CostVal = $("#txtUnitsPerBox_EDITPODetail ").val() == "" ? $("#txtUnitsPerBox_EDITPODetail ").attr("Placeholder") : $("#txtUnitsPerBox_EDITPODetail ").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtTotalUnits_EDITPODetail").val(QuantityVal * CostVal);

    });

    function LoadUOMForEditPO() {
        //var length = $('#lstUOM_ADDEDITPO > option').length; 
        //if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForManualPOByFarm',
                data: '{"FarmCode":"' + $("#lstfarm_EditPOHeader").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstUOM_EDITPODetail').empty();
                    var UOMdata = output.d;
                    if (UOMdata.length == 0) {
                        $.MessageBox('Box sizes not on Box Size Table, PLEASE FIX!!!');
                        return false;
                    }
                    $('#lstUOM_EDITPODetail').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_EDITPODetail').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']' + '</option>');
                    }

                    if ($("#hfUOM_EDITPODetail").val() != "" && $("#hfUOM_EDITPODetail").val() != 0)
                        $('#lstUOM_EDITPODetail').val($("#hfUOM_EDITPODetail").val());
                    else
                        $("#lstUOM_EDITPODetail").val("QB");

                }
            });
        //}
        //else {
        //    $('#lstUOM_EDITPODetail').val($("#hfUOM_EDITPODetail").val());
        //}
    }

    $("#txtFlower_ADDEDITPO").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteFarmwise',
                data: "{'Searchtext': '" + request.term + "','FarmCode': '" + $("#lstfarmADDPO")[0].value + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            Qty: flr.UNITS,
                            UnitPerBunch: flr.BUNCH
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

            $("#txtFlower_ADDEDITPO").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfFlower_ADDEDITPO").val(i.item.Flower.trim());
            $("#txtUnitsPerBunch_ADDEDITPO").attr("placeholder", i.item.UnitPerBunch);
            $("#txtUnitsPerBox_ADDEDITPO").attr("placeholder", i.item.Qty);
            $("#txtQuantity_ADDEDITPO").focus();
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtFlower_ADDEDITPO").val("");
                $("#txtFlower_ADDEDITPO").focus();
                $("#txtUnitsPerBunch_ADDEDITPO").val(i.item.UnitPerBunch);
                $("#txtUnitsPerBox_ADDEDITPO").val(i.item.Qty);
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    $("#txtQuantity_ADDEDITPO").blur(function (event) {

        var QuantityVal = $("#txtQuantity_ADDEDITPO").val() == "" ? $("#txtQuantity_ADDEDITPO").attr("Placeholder") : $("#txtQuantity_ADDEDITPO").val();
        var CostVal = $("#txtUnitsPerBox_ADDEDITPO").val() == "" ? $("#txtUnitsPerBox_ADDEDITPO").attr("Placeholder") : $("#txtUnitsPerBox_ADDEDITPO").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtTotalUnits_ADDEDITPO").val(QuantityVal * CostVal);

    });

    $("#txtUnitsPerBox_ADDEDITPO").blur(function (event) {

        var QuantityVal = $("#txtQuantity_ADDEDITPO").val() == "" ? $("#txtQuantity_ADDEDITPO").attr("Placeholder") : $("#txtQuantity_ADDEDITPO").val();
        var CostVal = $("#txtUnitsPerBox_ADDEDITPO").val() == "" ? $("#txtUnitsPerBox_ADDEDITPO").attr("Placeholder") : $("#txtUnitsPerBox_ADDEDITPO").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtTotalUnits_ADDEDITPO").val(QuantityVal * CostVal);

    });

    $("[id^=editPOHeader_]").die("click").live("click", function () {

        var PONumber = $(this).attr('id').replace("editPOHeader_", "")
        LoadFarmListDropDownEditPO(function (callback) {
            if (callback == true) {

                LoadWarehouseListDropDownEditPO(function (callback1) {
                    if (callback1 == true) {

                        LoadPOTypeDropDownEditPO(function (callback2) {
                            if (callback2 == true) {

                                LoadPOStatusDropDownEditPO(function (callback3) {
                                    if (callback3 == true) {

                                        LoadCarrierDropDownEditPO(function (callback4) {
                                            if (callback4 == true) {
                                                FetchAndFillPOHeaderDatas(PONumber);
                                                $("#fgrdPODetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'PONumber', value: PONumber }], query: "", newp: 1 }).flexReload();
                                                $("#DivEDITPOHeaderDialog").dialog("open");
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });
    });

    function FetchAndFillPOHeaderDatas(PONumber) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPOHeaderDataByPONumber',
            contentType: "application/json; charset=utf-8",
            data: "{'PONumber':'" + PONumber + "'}",
            dataType: "json",
            success: function (output) {
                var POHeader = output.d;
                J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.setValue(POHeader.Farm);
                $("#TempSelectedFarm").html(POHeader.Farm);
                $("#txtPONumber_EditPOHeader").val(POHeader.PONumber);
                $("#lblAirport_EDITPOHEADER").html(POHeader.Airport);
                $("#lstWarehouse_EditPOHeader").val(POHeader.Warehouse);
                $("#txtFarmShip_EDITPOHEADER").val(POHeader.ShipDate);
                $("#lstPOTYPE_EditPOHeader").val(POHeader.POType);
                $("#lstPOSTATUS_EditPOHeader").val(POHeader.PoStatus);
                $("#lstAGENCY_EditPOHeader").val(POHeader.Carrier);
                $("#txtBuyer_EDITPOHEADER").val(POHeader.PassName);
                var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
                var dateParts = $("#txtFarmShip_EDITPOHEADER").val().split("/");
                var d = new Date(dateParts[2], dateParts[0] - 1, dateParts[1]);
                $("#DivDayofShip").html(weekday[d.getDay()])
                var Status = POHeader.PoStatus;
                if (Status != 'PENDING') {
                    J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.disable();
                }
                else {
                    J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.enable();
                }
            }
        });
    }
    $("#lstPOSTATUS_EditPOHeader").change(function (event) {
        var Status = $("#lstPOSTATUS_EditPOHeader").val();
        if (Status != 'PENDING') {
            var Farm = $("#TempSelectedFarm").html();
            J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.setValue(Farm);
            J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.disable();
        }
        else {
            J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.enable();
        }
    });
    $("#txtFarmShip_EDITPOHEADER").change(function (event) {
        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var dateParts = $("#txtFarmShip_EDITPOHEADER").val().split("/");
        var d = new Date(dateParts[2], dateParts[0] - 1, dateParts[1]);
        $("#DivDayofShip").html(weekday[d.getDay()]);
    });

    $("#DivEDITPOHeaderDialog").dialog({
        autoOpen: false,
        resizable: true,
        title: "EDIT P.O.: ",
        width: $(window).width() - 200,
        height: $(window).height() - 80,
        modal: true,
        buttons: {

        }
    });

    function LoadPOTypeDropDownEditPO(callback) {
        $("#lstPOTYPE_EditPOHeader").empty();
        $("#lstPOTYPE_EditPOHeader").append("<option value='FOB'>FOB</option>");
        callback(true)
    }

    function LoadWarehouseListDropDownEditPO(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseList',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstWarehouse_EditPOHeader').empty();
                for (var i in data) {
                    var WH = data[i];
                    $('#lstWarehouse_EditPOHeader').append('<option value="' + WH.WH + '">[' + WH.WH + ']' + WH.Name + '</option>');
                }
                callback(true)
            }
        });
    }

    function LoadPOStatusDropDownEditPO(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPOStatus',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstPOSTATUS_EditPOHeader').empty();
                for (var i in data) {
                    var POSTATUS = data[i];
                    $('#lstPOSTATUS_EditPOHeader').append('<option value="' + POSTATUS.PoStatus + '">' + POSTATUS.PoStatus + '</option>');
                }
                callback(true)
            }
        });
    }

    function LoadCarrierDropDownEditPO(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadCarrierForPOEdit',
            data: '{"Airline":"C"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstAGENCY_EditPOHeader').empty();
                for (var i in data) {
                    var Carrier = data[i];
                    $('#lstAGENCY_EditPOHeader').append('<option value="' + Carrier.Carrier + '">[' + Carrier.Carrier + "]" + Carrier.Name + '</option>');
                }
                callback(true)
            }
        });
    }



    function LoadFarmListDropDownEditPO(callback) {

        try {
            J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.disable();
        }
        catch (er) {

        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListFromMainCitySelection',
            data: "{'MainCity':'All'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {

                    try {
                        J1_10($('#lstfarm_EditPOHeader')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }
                    $('#lstfarm_EditPOHeader').html("");
                    $("#lstfarm_EditPOHeader").append(output.d);

                    try {
                        J1_10($("#lstfarm_EditPOHeader")).selectize()[0].selectize.enable();
                    }
                    catch (er) {

                    }
                    J1_10($("#lstfarm_EditPOHeader")).selectize({
                        load: function (query, callback) {
                            this.clearOptions();        // clear the data
                            this.renderCache = {};      // clear the html template cache
                        }
                    });
                    callback(true)
                }
            }
        });
    }

    function LoadCancelReason() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCancelReason',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstCancelReason').empty();
                for (var i in data) {
                    var REASON = data[i];
                    $('#lstCancelReason').append('<option value="' + REASON.CancelVoidReason + '">' + REASON.CancelVoidReason + '</option>');
                }
            }
        });
    }
    function LoadVoidReason() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetVoidReason',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstVoidReason').empty();
                for (var i in data) {
                    var REASON = data[i];
                    $('#lstVoidReason').append('<option value="' + REASON.CancelVoidReason + '">' + REASON.CancelVoidReason + '</option>');
                }
            }
        });
    }

    //Region "All Purchases"
    $("#txtPurchaseOrderFromDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function () {
            //setAllPurchaseFiltervalues();
            isAllPurchaseFromDateChanged = true;
        }
    }).datepicker("setDate", new Date());

    $("#txtPurchaseOrderToDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function () {
            //setAllPurchaseFiltervalues();
            isAllPurchaseToDateChanged = true;
        }
    }).datepicker("setDate", new Date());

    $("#txtCargoDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function () {
            //setAllPurchaseFiltervalues();
            isAllPurchaseFromDateChanged = true;
        }
    }).datepicker("setDate", new Date());

    $("#txtPOListFromDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function () {
            //setAllPurchaseFiltervalues();
            isAllPurchaseFromDateChanged = true;
        }
    }).datepicker("setDate", new Date());



    $("#txtPOListToDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function () {
            // setAllPurchaseFiltervalues();
            isAllPurchaseToDateChanged = true;
        }
    }).datepicker("setDate", new Date());

    function IntializePOAllPurchaseGrid() {

        isAllPurchaseFromDateChanged = true;
        isAllPurchaseToDateChanged = true;
        var fromdate = "", todate = "";
        fromdate = $("#txtPurchaseOrderFromDate").val();
        todate = $("#txtPurchaseOrderToDate").val();
        $("#fgrdAllPurchasesList").flexigrid({
            url: 'BloomService.asmx/GetAllPurchasesGrid',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="ARINVselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', hide: true },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center', hide: true },
                { display: 'PO#', name: 'PONumber', width: 65, sortable: true, align: 'left' },
                { display: 'FARM', name: 'FARM', width: 35, sortable: true, align: 'left' },
                { display: 'FARM NAME', name: 'FARMNAME', width: 100, sortable: true, align: 'left' },
                { display: 'ORIGIN', name: 'ORIGEN', width: 40, sortable: true, align: 'left' },
                { display: 'AIRPORT', name: 'AIRPORT', width: 80, sortable: true, align: 'left', hide: true },
                { display: 'Truck Date', name: 'TRUCKDATE', width: 65, sortable: true, align: 'center' },
                { display: 'Cargo Date', name: 'SHIPDATE', width: 65, sortable: true, align: 'center' },
                { display: 'Status', name: 'POSTAT', width: 65, sortable: true, align: 'left' },
                { display: 'Code', name: 'PRODCODQ', width: 80, sortable: true, align: 'left', hide: true },
                { display: 'Description', name: 'PRODNAMQ', width: 220, sortable: true, align: 'left' },
                { display: 'Qty', name: 'QTYBOX', width: 25, sortable: true, align: 'right' },
                { display: 'Uom', name: 'UOM', width: 25, sortable: true, align: 'right' },
                { display: 'FBE', name: 'FBE', width: 35, sortable: true, align: 'right' },
                { display: 'Pack', name: 'QTYXBOX', width: 30, sortable: true, align: 'right' },
                { display: 'Totl.Units', name: 'QTYUNIT', width: 45, sortable: true, align: 'right' },
                { display: 'U/B', name: 'STEMXBUN', width: 30, sortable: true, align: 'right' },
                { display: 'Cost', name: 'UNITCOSQ', width: 60, sortable: true, align: 'right' },
                { display: 'Cust#', name: 'CUSTOMER', width: 30, sortable: true, align: 'right' },
                { display: 'Market', name: 'MARKET', width: 120, sortable: true, align: 'left', hide: true },
                { display: 'Comments', name: 'COMMENTQ', width: 120, sortable: true, align: 'left' },
                { display: 'Order', name: 'ORDER', width: 120, sortable: true, align: 'left', hide: true },
                { display: 'Passname', name: 'PASSNAME', width: 120, sortable: true, align: 'left', hide: true },
                { display: 'Pokey', name: 'POKEY', width: 120, sortable: true, align: 'left', hide: true },
                { display: 'Fullboxes', name: 'FULLBOXES', width: 60, sortable: true, align: 'right' },
                //{ display: '', name: '', width: 20, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'PO#', name: 'PONumber', width: 70, sortable: true, align: 'left' },
                { display: 'Farm', name: 'FARM', width: 5, sortable: true, align: 'left' },
                { display: 'Truck Date', name: 'TRUCKDATE', width: 65, sortable: true, align: 'center' },
                { display: 'Cargo Date', name: 'SHIPDATE', width: 65, sortable: true, align: 'center' },
                { display: 'Status', name: 'POSTAT', width: 50, sortable: true, align: 'left' },
                { display: 'Code', name: 'PRODCODQ', width: 80, sortable: true, align: 'left' },
                { display: 'Description', name: 'PRODNAMQ', width: 120, sortable: true, align: 'left' },
                { display: 'Qty', name: 'QTYBOX', width: 25, sortable: true, align: 'right' },
                { display: 'Uom', name: 'UOM', width: 25, sortable: true, align: 'right' },
                { display: 'FBE', name: 'FBE', width: 35, sortable: true, align: 'right' },
                { display: 'Pack', name: 'QTYXBOX', width: 30, sortable: true, align: 'right' },
                { display: 'Totl.Units', name: 'QTYUNIT', width: 30, sortable: true, align: 'right' },
                { display: 'U/B', name: 'STEMXBUN', width: 30, sortable: true, align: 'right' },
                { display: 'Cost', name: 'UNITCOSQ', width: 60, sortable: true, align: 'right' },
                { display: 'Cust#', name: 'CUSTOMER', width: 30, sortable: true, align: 'right' },
                { display: 'Fullboxes', name: 'FULLBOXES', width: 60, sortable: true, align: 'right' },
            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 275,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'Fromdate', value: fromdate }, { name: 'Todate', value: todate }, { name: 'isCargo', value: true }, { name: 'Buyer', value: '' }, { name: 'Farm', value: '' }, { name: 'Origin', value: '' }, { name: 'Status', value: '' }, { name: 'Prod', value: '' }, { name: 'Uom', value: '' }, { name: 'Cust', value: '' }
            ],
            onSuccess: function () {

                $("#ExportCSV").show();
                if (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) {
                    LoadAllPurchaseFilters(function (callback) {
                        isAllPurchaseFromDateChanged = false;
                        isAllPurchaseToDateChanged = false;
                    });
                }

                $('#fgrdAllPurchasesList #row0').addClass("TotalRows")
                var totqty = $("#aAllPurchaseTotQty_0").text();
                var totfbe = $("#aAllPurchaseTotFBE_0").text();
                $("#txtDetPieces").val(totqty);
                $("#txtDetFBE").val(totfbe);
                $('#fgrdAllPurchasesList tr:last td').hide();
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivAllPurchases .sDiv").css('float', 'left').css('width', '545px');
        $('#DivAllPurchases .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivAllPurchases .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivAllPurchases .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivAllPurchases .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }

    $("#btnDateType").die("click").live("click", function () {

        if ($(this).val() == "PO")
            $(this).val("Cargo")
        else
            $(this).val("PO")
    })

    $("#btnPurchaseOrderCargoTruck").die("click").live("click", function () {

        if ($(this).val() == "Cargo")
            $(this).val("Truck")
        else
            $(this).val("Cargo")
    })

    $("#btnAllPurchaseRefresh").die("click").live("click", function () {
        //ClearAllPurchaseFiltervalues();
        isAllPurchaseFromDateChanged = true;
        isAllPurchaseToDateChanged = true;
        LoadAllPurchaseFilters(function (callback) {
        });
        setAllPurchaseFiltervalues();
    })

    $("#btnPOListRefresh").die("click").live("click", function () {
        //ClearAllPurchaseFiltervalues();
        isPOListFromDateChanged = true;
        isPOListToDateChanged = true;
        LoadPOListFilters(function (callback) {
        });
        setPOListFiltervalues();
    })

    function LoadAllPurchaseFilters(callback) {

        var fromdate = $("#txtPurchaseOrderFromDate").val();
        var todate = $("#txtPurchaseOrderToDate").val();
        if (new Date(fromdate) > new Date(todate)) {
            $.MessageBox("To-Date cannot be lesser than From-Date...");
            return;
        }
        var iscargo = $("#btnPurchaseOrderCargoTruck").val().toLowerCase() == "Cargo".toLowerCase() ? true : false;
        var buyer = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrBuyer");
        var selfarm = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrFarm");
        var origin = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrOrigin");
        var status = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrStatus");
        var prod = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrDesc");
        var uom = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("lstAllPurchaseOdrUOM");
        var cust = (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) ? "" : setFiltervalue("hfAllPurchaseOdrCust");

        if (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) {
            $('#lstAllPurchaseOdrBuyer').empty();
            $('#lstAllPurchaseOdrFarm').empty();
            $('#lstAllPurchaseOdrOrigin').empty();
            $('#lstAllPurchaseOdrStatus').empty();
            $('#lstAllPurchaseOdrDesc').empty();
            $('#lstAllPurchaseOdrUOM').empty();
            $('#lstAllPurchaseOdrCust').empty();
        }

        var length = $('#lstAllPurchaseOdrBuyer > option').length;
        var SearchOrderType = ($('#lstAllPurchaseOdrBuyer').val() == null || $('#lstAllPurchaseOdrBuyer').val() == "null" || $('#lstAllPurchaseOdrBuyer').val() == undefined ? "" : $('#lstAllPurchaseOdrBuyer').val().trim());

        if (length <= 0) {
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadAllFiltersDataForAllPurchase',
                data: "{'Fromdate':'" + fromdate + "','Todate':'" + todate + "','isCargo':" + iscargo + ",'Buyer':'" + buyer + "','Farm':'" + selfarm + "','Origin':'" + origin + "','Status':'" + status + "','Prod':'" + prod + "','Uom':'" + uom + "','Cust':'" + cust + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $('#lstAllPurchaseOdrBuyer').empty();
                    var data = output.d;
                    data.sort(function (a, b) {
                        return parseFloat(a.PONumber) - parseFloat(b.PONumber);
                    });
                    for (var i in data) {
                        var itm = data[i];
                        if (itm.PONumber != "") {
                            //Load Empty option
                            if (i == 0) {
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrBuyer", "Buyer");
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrFarm", "Farm");
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrOrigin", "Origen");
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrStatus", "Status");
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrDesc", "Flower");
                                LoadDefaultOptionWithValue("lstAllPurchaseOdrUOM", "UOM");
                                // LoadDefaultOption("lstAllPurchaseOdrBuyer");
                            }

                            //Load Buyer
                            if ($("#lstAllPurchaseOdrBuyer").html().indexOf('<option value="' + itm.PassName + '">' + itm.PassName + '</option>') == -1) {
                                if (itm.PassName.toString().trim() != "") {
                                    $('#lstAllPurchaseOdrBuyer').append('<option value="' + itm.PassName + '">' + itm.PassName + '</option>');
                                }
                            }

                            //Load Farm
                            if ($("#lstAllPurchaseOdrFarm").html().indexOf('<option value="' + itm.Farm + '">' + itm.FarmName + '</option>') == -1) {
                                $('#lstAllPurchaseOdrFarm').append('<option value="' + itm.Farm + '">' + itm.FarmName + '</option>');
                            }

                            //Load Origen
                            if ($("#lstAllPurchaseOdrOrigin").html().indexOf('<option value="' + itm.FarmDetails.City + '">' + itm.FarmDetails.City + '</option>') == -1) {
                                if (itm.FarmDetails.City.toString().trim() != "") {
                                    $('#lstAllPurchaseOdrOrigin').append('<option value="' + itm.FarmDetails.City + '">' + itm.FarmDetails.City + '</option>');
                                }
                            }

                            //Load Status
                            if ($("#lstAllPurchaseOdrStatus").html().indexOf('<option value="' + itm.PROStatus + '">' + itm.PROStatus + '</option>') == -1) {
                                if (itm.PROStatus.toString().trim() != "") {
                                    $('#lstAllPurchaseOdrStatus').append('<option value="' + itm.PROStatus + '">' + itm.PROStatus + '</option>');
                                }
                            }

                            //Load Productname
                            if ($("#lstAllPurchaseOdrDesc").html().indexOf('<option value="' + itm.ProdCodeq + '">' + itm.ProdNameq + '</option>') == -1) {
                                if (itm.ProdCodeq.toString().trim() != "") {
                                    $('#lstAllPurchaseOdrDesc').append('<option value="' + itm.ProdCodeq + '">' + itm.ProdNameq + '</option>');
                                }
                            }

                            //Load UOM
                            if ($("#lstAllPurchaseOdrUOM").html().indexOf('<option value="' + itm.UOM + '">' + itm.UOM + '</option>') == -1) {
                                if (itm.UOM.toString().trim() != "") {
                                    $('#lstAllPurchaseOdrUOM').append('<option value="' + itm.UOM + '">' + itm.UOM + '</option>');
                                }
                            }

                            ////Load Cust
                            //if ($("#lstAllPurchaseOdrCust").html().indexOf('<option value="' + itm.UOM + '">' + itm.UOM + '</option>') == -1) {
                            //    $('#lstAllPurchaseOdrCust').append('<option value="' + itm.UOM + '">' + itm.UOM + '</option>');
                            //}
                        }
                    }
                    callback(true);
                },
            });
        }
        else {
            //Buyer
            $('#lstAllPurchaseOdrBuyer').val($("#hfAllPurchaseOdrBuyer").val());
            //Farm
            $('#lstAllPurchaseOdrFarm').val($("#hfAllPurchaseOdrFarm").val());
            //Origen
            $('#lstAllPurchaseOdrOrigin').val($("#hfAllPurchaseOdrOrigin").val());
            //Status
            $('#lstAllPurchaseOdrStatus').val($("#hfAllPurchaseOdrStatus").val());
            //Productname
            $('#lstAllPurchaseOdrDesc').val($("#hfAllPurchaseOdrStatus").val());
            //UOM
            $('#lstAllPurchaseOdrUOM').val($("#hfAllPurchaseOdrUOM").val());
            callback(true);
        }
    }

    function LoadPOListFilters(callback) {

        var fromdate = $("#txtPOListFromDate").val();
        var todate = $("#txtPOListToDate").val();
        if (new Date(fromdate) > new Date(todate)) {
            $.MessageBox("To-Date cannot be lesser than From-Date...");
            return;
        }
        var iscargo = $("#btnDateType").val().toLowerCase() == "po".toLowerCase() ? true : false;
        var buyer = (isPOListFromDateChanged || isPOListToDateChanged) ? "" : setFiltervalue("lstAllPolistBuyer");
        var selfarm = (isPOListFromDateChanged || isPOListToDateChanged) ? "" : setFiltervalue("lstAllPOListFarm");
        var origin = (isPOListFromDateChanged || isPOListToDateChanged) ? "" : setFiltervalue("lstAllPOListOrigin");
        var status = (isPOListFromDateChanged || isPOListToDateChanged) ? "" : setFiltervalue("lstAllPOListStatus");


        //if (isPOListFromDateChanged  || isAllPurchaseToDateChanged) {
        $('#lstAllPolistBuyer').empty();
        $('#lstAllPOListFarm').empty();
        $('#lstAllPOListOrigin').empty();
        $('#lstAllPOListStatus').empty();
        //}

        var length = $('#lstAllPolistBuyer > option').length;
        var SearchOrderType = ($('#lstAllPolistBuyer').val() == null || $('#lstAllPolistBuyer').val() == "null" || $('#lstAllPolistBuyer').val() == undefined ? "" : $('#lstAllPolistBuyer').val().trim());

        if (length <= 0) {
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadAllFiltersDataForPOList',
                data: "{'Fromdate':'" + fromdate + "','Todate':'" + todate + "','Buyer':'" + buyer + "','Farm':'" + selfarm + "','Origin':'" + origin + "','Status':'" + status + "','isCargo':" + iscargo + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstAllPolistBuyer').empty();
                    $('#lstAllPOListFarm').empty();
                    $('#lstAllPOListOrigin').empty();
                    $('#lstAllPOListStatus').empty();

                    var data = output.d;
                    data.sort(function (a, b) {
                        return parseFloat(a.PONumber) - parseFloat(b.PONumber);
                    });
                    for (var i in data) {
                        var itm = data[i];
                        if (itm.PONumber != "") {
                            //Load Empty option
                            if (i == 0) {
                                LoadDefaultOptionWithValue("lstAllPolistBuyer", "Buyer");
                                LoadDefaultOptionWithValue("lstAllPOListFarm", "Farm");
                                LoadDefaultOptionWithValue("lstAllPOListOrigin", "Origen");
                                LoadDefaultOptionWithValue("lstAllPOListStatus", "Status");
                            }

                            //Load Buyer                            
                            if ($("#lstAllPolistBuyer").html().indexOf('<option value="' + itm.PassName + '">' + itm.PassName + '</option>') == -1) {
                                if (itm.PassName.toString().trim() != "") {
                                    $('#lstAllPolistBuyer').append('<option value="' + itm.PassName + '">' + itm.PassName + '</option>');
                                }
                            }

                            //Load Farm                            
                            if ($("#lstAllPOListFarm").html().indexOf('<option value="' + itm.Farm + '">' + itm.FarmName + '</option>') == -1) {
                                $('#lstAllPOListFarm').append('<option value="' + itm.Farm + '">' + itm.FarmName + '</option>');
                            }

                            //Load Origen                            
                            if ($("#lstAllPOListOrigin").html().indexOf('<option value="' + itm.FarmDetails.City + '">' + itm.FarmDetails.City + '</option>') == -1) {
                                if (itm.FarmDetails.City.toString().trim() != "") {
                                    $('#lstAllPOListOrigin').append('<option value="' + itm.FarmDetails.City + '">' + itm.FarmDetails.City + '</option>');
                                }
                            }

                            //Load Status                            
                            if ($("#lstAllPOListStatus").html().indexOf('<option value="' + itm.PROStatus + '">' + itm.PROStatus + '</option>') == -1) {
                                if (itm.PROStatus.toString().trim() != "") {
                                    $('#lstAllPOListStatus').append('<option value="' + itm.PROStatus + '">' + itm.PROStatus + '</option>');
                                }
                            }
                        }
                    }
                    callback(true);
                    $('#lstAllPolistBuyer').val("");
                    $('#lstAllPOListFarm').val("");
                    $('#lstAllPOListOrigin').val("");
                    $('#lstAllPOListStatus').val("");
                },
            });
        }
        else {
            //Buyer
            $('#lstAllPolistBuyer').val($("#hfAllPOListBuyer").val());
            //Farm
            $('#lstAllPOListFarm').val($("#hfAllPOListFarm").val());
            //Origen
            $('#lstAllPOListOrigin').val($("#hfAllPOListOrigin").val());
            //Status
            $('#lstAllPOListStatus').val($("#hfAllPOListStatus").val());
            callback(true);
        }
    }

    function LoadDefaultOption(lst) {
        if ($("#" + lst + "").html().indexOf("<option></option>") == -1) {
            $("#" + lst + "").append("<option></option>")
        }
        //$("#" + lst + "").index = -1;
    }

    function LoadDefaultOptionWithValue(lst, OptionValue) {
        if ($("#" + lst + "").html().indexOf("<option></option>") == -1) {
            $("#" + lst + "").append('<option value="">Select ' + OptionValue + '</option>')
        }
        //$("#" + lst + "").index = -1;
    }

    function setFiltervalue(lst, filterval) {
        filterval = $("#" + lst + "").val() == null ? "" : ($("#" + lst + "").val().trim().toLowerCase() == "N/A".toLocaleLowerCase() ? "" : $("#" + lst + "").val());
        return filterval;
    }

    function setAllPurchaseFiltervalues() {

        var fromdate = $("#txtPurchaseOrderFromDate").val();
        var todate = $("#txtPurchaseOrderToDate").val();
        if (new Date(fromdate) > new Date(todate)) {
            $.MessageBox("To-Date cannot be lesser than From-Date...");
            return;
        }
        var iscargo = $("#btnPurchaseOrderCargoTruck").val().toLowerCase() == "Cargo".toLowerCase() ? true : false;
        var buyer = setFiltervalue("lstAllPurchaseOdrBuyer");
        var selfarm = setFiltervalue("lstAllPurchaseOdrFarm");
        var origin = setFiltervalue("lstAllPurchaseOdrOrigin");
        var status = setFiltervalue("lstAllPurchaseOdrStatus");
        var prod = setFiltervalue("lstAllPurchaseOdrDesc");
        var uom = setFiltervalue("lstAllPurchaseOdrUOM");
        var cust = setFiltervalue("hfAllPurchaseOdrCust");
        $("#txtDetPieces").val("");
        $("#txtDetFBE").val("");
        if (isAllPurchaseFromDateChanged || isAllPurchaseToDateChanged) {
            reloadAllPurchaseGrid(fromdate, todate, iscargo, "", "", "", "", "", "", "");
        }
        else {
            reloadAllPurchaseGrid(fromdate, todate, iscargo, buyer, selfarm, origin, status, prod, uom, cust);
        }
    }

    function setPOListFiltervalues() {

        var fromdate = $("#txtPOListFromDate").val();
        var todate = $("#txtPOListToDate").val();
        if (new Date(fromdate) > new Date(todate)) {
            $.MessageBox("To-Date cannot be lesser than From-Date...");
            return;
        }
        var buyer = setFiltervalue("lstAllPolistBuyer");
        var selfarm = setFiltervalue("lstAllPOListFarm");
        var origin = setFiltervalue("lstAllPOListOrigin");
        var status = setFiltervalue("lstAllPOListStatus");
        var iscargo = $("#btnDateType").val().toLowerCase() == "PO".toLowerCase() ? true : false;

        if (isPOListFromDateChanged || isPOListToDateChanged) {
            reloadPOListGrid(fromdate, todate, "", "", "", "", iscargo, "");
        }
        else {
            reloadPOListGrid(fromdate, todate, buyer, selfarm, origin, status, iscargo, "");
        }
    }

    function ClearAllPurchaseFiltervalues() {
        $("#txtPurchaseOrderFromDate").val(new Date().toString("MM/dd/yyyy"));
        $("#txtPurchaseOrderToDate").val(new Date().toString("MM/dd/yyyy"));
        $("#lstAllPurchaseOdrBuyer").val("");
        $("#lstAllPurchaseOdrFarm").val("");
        $("#lstAllPurchaseOdrOrigin").val("");
        $("#lstAllPurchaseOdrStatus").val("");
        $("#lstAllPurchaseOdrDesc").val("");
        $("#lstAllPurchaseOdrUOM").val("");
        $("#hfAllPurchaseOdrCust").val("");
    }

    function reloadAllPurchaseGrid(fromdate, todate, isCargo, Buyer, Farm, Origin, Status, Prod, Uom, Cust) {
        $("#fgrdAllPurchasesList").flexOptions({
            params: [{ name: 'ExportCSV', value: '' }, { name: 'Fromdate', value: fromdate }, { name: 'Todate', value: todate }, { name: 'isCargo', value: isCargo }, { name: 'Buyer', value: Buyer }, { name: 'Farm', value: Farm }, { name: 'Origin', value: Origin }, { name: 'Status', value: Status }, { name: 'Prod', value: Prod }, { name: 'Uom', value: Uom }, { name: 'Cust', value: Cust }], query: "", newp: 1
        }).flexReload();
    }

    function reloadPOListGrid(fromdate, todate, Buyer, Farm, Origin, Status, iscargo, PONUM) {
        $("#fgrdPOHeaderList").flexOptions({
            params: [{ name: 'ExportCSV', value: '' }, { name: 'Fromdate', value: fromdate }, { name: 'Todate', value: todate }, { name: 'Buyer', value: Buyer }, { name: 'Farm', value: Farm }, { name: 'Origin', value: Origin }, { name: 'Status', value: Status }, { name: 'isCargo', value: iscargo }, { name: 'PONUM', value: PONUM }], query: "", newp: 1
        }).flexReload();
    }

    $("#lstAllPurchaseOdrBuyer").change(function () {
        setAllPurchaseFiltervalues();
    })

    $("#lstAllPurchaseOdrFarm").change(function () {
        setAllPurchaseFiltervalues();
    })

    $("#lstAllPurchaseOdrOrigin").change(function () {
        setAllPurchaseFiltervalues();
    })

    $("#lstAllPurchaseOdrStatus").change(function () {
        setAllPurchaseFiltervalues();
    })

    $("#lstAllPurchaseOdrDesc").change(function () {
        setAllPurchaseFiltervalues();
    })

    $("#lstAllPurchaseOdrUOM").change(function () {
        setAllPurchaseFiltervalues();
    })

    //POList 
    $("#lstAllPolistBuyer").change(function () {
        isPOListFromDateChanged = false;
        isPOListToDateChanged = false;
        setPOListFiltervalues();
    })

    $("#lstAllPOListFarm").change(function () {
        isPOListFromDateChanged = false;
        isPOListToDateChanged = false;
        setPOListFiltervalues();
    })

    $("#lstAllPOListOrigin").change(function () {
        isPOListFromDateChanged = false;
        isPOListToDateChanged = false;
        setPOListFiltervalues();
    })

    $("#lstAllPOListStatus").change(function () {
        isPOListFromDateChanged = false;
        isPOListToDateChanged = false;
        setPOListFiltervalues();
    })

    //End Region

    //Region "Create PO"
    function InitializePOCreatePOGrid() {
        $("#fgrdCreatePO").flexigrid({
            url: 'BloomService.asmx/LoadDataForCreatePOGrid',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 15, sortable: false, align: 'center' },
                { display: '', name: '', width: 15, sortable: false, align: 'center' },
                { display: 'Name', name: 'FLOWERNAME', width: 170, sortable: true, align: 'left' },
                { display: 'Qty', name: 'BOXES', width: 20, sortable: true, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 25, sortable: true, align: 'left' },
                { display: 'Pack', name: 'UNITS', width: 25, sortable: true, align: 'right' },
                { display: 'U.Bunch', name: 'UNITSBUNCH', width: 25, sortable: true, align: 'right' },
                { display: 'Price', name: 'PRICE', width: 35, sortable: true, align: 'right' },
                { display: 'Cust./ShipDate', name: 'ShipDateVal', width: 52, sortable: true, align: 'left' },
                { display: 'Cargo', name: 'CargoDateVal', width: 52, sortable: true, align: 'left' },
                { display: 'Future', name: 'Future', width: 30, sortable: true, align: 'left' },
                { display: 'Type', name: 'TYPENAME', width: 95, sortable: true, align: 'left' },
                { display: 'Farm', name: 'FARM', width: 40, sortable: true, align: 'left' },
                { display: 'Cost', name: 'COST', width: 40, sortable: true, align: 'right' },
                { display: 'Order', name: 'ORDER', width: 40, sortable: true, align: 'right' },
                { display: 'Cust#', name: 'CUSTNAME', width: hideCustOnGrid==true?40:130, sortable: true, align: hideCustOnGrid==true?'right':'left' },
                { display: 'Sales#', name: 'SALESMAN_NAME', width: 55, sortable: true, align: 'left' },
                { display: 'CA', name: 'CARRIER', width: 20, sortable: true, align: 'left' },
                { display: 'VIA', name: 'AGENCY', width: 20, sortable: true, align: 'left' },
                { display: 'T.Units', name: 'TOTALUNITS', width: 55, sortable: true, align: 'right' },
                { display: 'T.$Sales', name: 'TOTALSALES', width: 55, sortable: true, align: 'right' },
                { display: 'Comments', name: 'COMMENTS', width: 140, sortable: true, align: 'left' },
                { display: 'UPC', name: 'UPC', width: 70, sortable: true, align: 'left' },           //UPC,BOXCODE,DATECODE added by Anand[08/15/2021]
                { display: 'BOXCODE', name: 'BOXCODE', width: 70, sortable: true, align: 'left' },   //UPC,BOXCODE,DATECODE added by Anand[08/15/2021]
                { display: 'DATECODE', name: 'DATECODE', width: 70, sortable: true, align: 'left' }, //UPC,BOXCODE,DATECODE added by Anand[08/15/2021]
                { display: 'Created On', name: 'ADDDATE', width: 120, sortable: true, align: 'Center', hide: false },
                { display: 'SHIPDATE', name: 'SHIPDATE', width: 20, sortable: true, align: 'left', hide: true },
                { display: 'CargoDate', name: 'SHIPBOGOTA', width: 20, sortable: true, align: 'left', hide: true },
                { display: '', name: 'SaveFlag', width: 20, sortable: true, align: 'left', hide: true },
                { display: '', name: '', width: 10, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Farm', name: 'Farm' },
                { display: 'Description', name: 'FlowerName' },
                { display: 'Boxes', name: 'Quantity' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Units', name: 'Units' },
                { display: 'Cost', name: 'CostPerUnits' },
                { display: 'Cust#', name: 'CustNumber' }

            ],
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 265,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                $("#ExportCSV").show();
                $('#fgrdCreatePO #row0').addClass("TotalRows")
                $('#fgrdCreatePO tr:last td').hide();
                var totsales = $("#aCreatePOTotSales_0").text();
                $("#txtCreatePOTotSale").val(totsales);

                $('#fgrdCreatePO').css("font-weight", "bold");
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#divCreatePOgrid .sDiv").css('float', 'left').css('width', '545px');
        $('#divCreatePOgrid .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#divCreatePOgrid .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#divCreatePOgrid .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#divCreatePOgrid .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }



    $("[id^=PurchasePOselect_]").die("click").live("click", function () {
        var SpordID = $(this).attr("id").replace("PurchasePOselect_", "").trim();
        sqlIdForCreatePO = SpordID;

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("PurchasePOselect_", "");
        var SaveFlag = $("#aCreatePOSaveFlag_" + SpordID).text();

        $("#divSaveFlag").html(SaveFlag);

        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        var page = window.location.href;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'Orderselected');
            if (parseInt(SpordID) != 0 && SpordID != "" && SpordID != undefined) {
                LoadDataToCreatePO(SpordID, sourceCtl, SaveFlag)
            }
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unOrderselected');
        }
    });

    function LoadDataToCreatePO(SpordID, sourceCtl, SaveFlag) {
        isFromCreatePOEdit = false;
        
        setplaceholderforCPOtextboxes(function (callback1) {
            if (callback1 == true) {
                LoadCreatePODropdowns(function (callback) {
                    isFromCreatePOEdit = true;
                    if (callback == true) {
                        if (SaveFlag == "SP") {
                            $.ajax({
                                type: "POST",
                                url: "BloomService.asmx/GetSPORDEditDetails",
                                data: "{'SpordID':'" + SpordID + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                async: false,
                                success: function (output, status) {

                                    isSPORDCPOeditclicked = true
                                    res = output.d;
                                    debugger
                                    //Calc of tot-sales & tot-cost
                                    var totsales = calcTotSalesandTotCost(res[0].Boxes, res[0].Fob, res[0].Cost, res[0].Units, true);
                                    var totcost = calcTotSalesandTotCost(res[0].Boxes, res[0].Fob, res[0].Cost, res[0].Units, false);
                                    $("#hfCPOdetSPORDID").val(SpordID);
                                    $("#txtCPOdetProdName").val("[" + res[0].Flower + "]" + res[0].FlowerName);
                                    $("#hfCPOdetProd").val(res[0].Flower);
                                    $("#txtCPOdetQty").val("");                                   
                                    var gridQty = $("#row" + SpordID).children("td")[3];
                                    var qty = $(gridQty).children().text();
                                    $("#txtCPOdetQty").attr('placeholder', parseInt(qty));
                                    $("#txtCPOdetPrice").val("");
                                    $("#txtCPOdetPrice").attr('placeholder', parseFloat(res[0].Fob).toFixed(4));
                                    $("#txtCPOdetTotSales").val("");
                                    $("#txtCPOdetTotSales").attr('placeholder', parseFloat(totsales).toFixed(2));
                                    $("#txtCPOdetCost").val("");
                                    $("#txtCPOdetCost").attr('placeholder', parseFloat(res[0].Cost).toFixed(4));
                                    $("#txtCPOdetTotCost").val("");
                                    $("#txtCPOdetTotCost").attr('placeholder', parseFloat(totcost).toFixed(2));
                                    $("#txtCPOdetPack").val("");
                                    $("#txtCPOdetPack").attr('placeholder', parseInt(res[0].Units));
                                    $("#txtCPOdetFreight").val("");
                                    $("#txtCPOdetFreight").attr('placeholder', parseFloat(res[0].FREIGHT).toFixed(3));
                                    $("#txtCPOdetHandling").val("");
                                    $("#txtCPOdetHandling").attr('placeholder', parseFloat(res[0].HANDLING).toFixed(3));
                                    $("#txtCPOdetDuty").attr('placeholder', parseFloat(0.00).toFixed(3));
                                    $("#txtCPOdetGPM").val("");
                                    $("#txtCPOdetGPM").attr('placeholder', parseFloat(0.00).toFixed(1));

                                    //$("#txtCPOdetBoxCode").attr('placeholder', (res[0].BoxCode == "" ? "" : parseInt(res[0].BoxCode)));
                                    $("#txtCPOdetBoxCode").attr('placeholder', (res[0].BoxCode == "" ? "" : res[0].BoxCode));

                                    $("#txtCPOdetFarmCom1").val(res[0].COMMENTS);
                                    $("#txtCPOdetFarmCom2").val(res[0].COMMENTS2);
                                    $("#txtCPOdetIntercom").val(res[0].COMMENSINT);
                                    $("#txtCPOdetUPC").val(res[0].UPC);
                                    $("#txtCPOdetDateCode").val(res[0].DateCode);
                                    //2021/08/14, UPCPrice is not a number
                                    //$("#txtCPOdetUPCPrice").attr('placeholder', (res[0].UPCPrice == "" ? "" : parseFloat(res[0].UPCPrice).toFixed(4)));
                                    //2021/09/11
                                    //$("#txtCPOdetUPCPrice").attr('placeholder', res[0].UPCPrice);
                                    $("#txtCPOdetUPCPrice").val(res[0].UPCPrice);
                                    $("#txtCPOdetDesc").val(res[0].UPCDESC);
                                    $("#txtCPOdetType").val(res[0].Type);

                                    //Binding values to list
                                    $("#hfCPOdetFBE").val(res[0].FBE);
                                    $("#hfCPOdetUOM").val(res[0].UOM);
                                    LoadCreatePODropdowns(function (callback) { });
                                    $("#hfCPOdetVIA").val(res[0].Agency);
                                    LoadCreatePODropdowns(function (callback) { });

                                    var TodayDate = new Date();
                                    var Cargodate = new Date(res[0].CargoDate);
                                    var one_day = 1000 * 60 * 60 * 24
                                    var Difference = (Math.round(Cargodate.getTime() - TodayDate.getTime()) / (one_day)).toFixed(0);
                                    if (Difference < 0) {
                                        var twoDigitMonth = (TodayDate.getMonth() + 1) + "";
                                        if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                                        var twoDigitDate = (TodayDate.getDate()) + "";
                                        if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                                        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + TodayDate.getFullYear();
                                        $("#hfCPOdetCargoDate").val(currentDate);
                                    }
                                    else {
                                        $("#hfCPOdetCargoDate").val(res[0].CargoDate);
                                    }
                                    LoadCreatePODropdowns(function (callback) { });
                                    $("#hfCPOdetWH").val(res[0].WH);
                                    LoadCreatePODropdowns(function (callback) { });
                                    $('#hfCPOdetOrigin').val(res[0].ORIGIN);
                                    //LoadCreatePODropdowns(function (callback) { });
                                    $("#hfCPOdetFarm").val(res[0].Farm);

                                    $("#lstCPOdetOrigin").val(res[0].ORIGIN);
                                    $("#lstCPOdetOrigin").val(res[0].ORIGIN).triggerHandler("change");

                                    //2021/11/04, set default values for empty farm and origion from the latest PO that already created
                                    if ((!res[0].ORIGIN || res[0].ORIGIN == 0 || res[0].ORIGIN.trim() == "") && window.PagePO_Airport != 0) {
                                        $('#hfCPOdetOrigin').val(window.PagePO_Airport);
                                        $("#lstCPOdetOrigin").val(window.PagePO_Airport);
                                        $("#lstCPOdetOrigin").val(window.PagePO_Airport).triggerHandler("change");
                                    }
                                    if ((!res[0].Farm || res[0].Farm == 0 || res[0].Farm.trim() == "") && window.PagePO_Farm != 0) {
                                        $('#hfCPOdetFarm').val(window.PagePO_Farm);
                                    }
                                    /////

                                    $("#lstCPOdetFarm").val($("#hfCPOdetFarm").val());

                                    //setting local-variable values
                                    getcpo_oldqty = parseInt(res[0].Boxes);
                                    getcpo_oldpack = parseInt(res[0].Units);
                                    getcpo_oldcost = parseFloat(res[0].Cost).toFixed(4);
                                    getcpo_oldprice = parseFloat(res[0].Fob).toFixed(4);

                                    $("#DivCreatePOPurchaseDialog").data("SPORDEditData", { SpordID: SpordID, CargoDate: res[0].CargoDate, SourceCtrl: sourceCtl }).dialog("open");
                                }
                            });
                        }
                        else {

                            $.ajax({
                                type: "POST",
                                url: "BloomService.asmx/GetOrderDetailsForPOByID",
                                data: "{'OrderDetailID':'" + SpordID + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                async: false,
                                success: function (output, status) {
                                    debugger;
                                    //isSPORDCPOeditclicked = true
                                    res = output.d;
                                    //Calc of tot-sales & tot-cost
                                    var totsales = calcTotSalesandTotCost(res.Boxes, res.FOB, res.Cost, res.Units, true);
                                    var totcost = calcTotSalesandTotCost(res.Boxes, res.FOB, res.Cost, res.Units, false);
                                    $("#hfCPOdetSPORDID").val(SpordID);
                                    $("#txtCPOdetProdName").val("[" + res.Flower + "]" + res.NAME);
                                    $("#hfCPOdetProd").val(res.Flower);
                                    $("#txtCPOdetQty").val("");
                                    $("#txtCPOdetQty").attr('placeholder', parseInt(res.Boxes));
                                    $("#txtCPOdetPrice").val("");
                                    $("#txtCPOdetPrice").attr('placeholder', parseFloat(res.FOB).toFixed(4));
                                    $("#txtCPOdetTotSales").val("");
                                    $("#txtCPOdetTotSales").attr('placeholder', parseFloat(totsales).toFixed(2));
                                    $("#txtCPOdetCost").val("");
                                    $("#txtCPOdetCost").attr('placeholder', parseFloat(res.Cost).toFixed(4));
                                    $("#txtCPOdetTotCost").val("");
                                    $("#txtCPOdetTotCost").attr('placeholder', parseFloat(totcost).toFixed(2));
                                    $("#txtCPOdetPack").val("");
                                    $("#txtCPOdetPack").attr('placeholder', parseInt(res.Units));
                                    $("#txtCPOdetFreight").val("");
                                    $("#txtCPOdetFreight").attr('placeholder', parseFloat(0).toFixed(3));
                                    $("#txtCPOdetHandling").val("");
                                    $("#txtCPOdetHandling").attr('placeholder', parseFloat(0).toFixed(3));
                                    $("#txtCPOdetDuty").attr('placeholder', parseFloat(0.00).toFixed(3));
                                    $("#txtCPOdetGPM").val("");
                                    $("#txtCPOdetGPM").attr('placeholder', parseFloat(0.00).toFixed(1));

                                    //2021/08/09
                                    //$("#txtCPOdetFarmCom1").val("");
                                    $("#txtCPOdetFarmCom1").val(res.Notes);

                                    $("#txtCPOdetFarmCom2").val("");
                                    $("#txtCPOdetIntercom").val("");
                                    //2021/09/11
                                    //$("#txtCPOdetDateCode").val("");
                                    $("#txtCPOdetDateCode").val(res.DateCode);

                                    //2021/08/14
                                    //$("#txtCPOdetUPCPrice").attr('placeholder', (0).toFixed(4));
                                    //2021/09/11
                                    //$("#txtCPOdetUPCPrice").attr('placeholder', res.UPCPRICE);
                                    $("#txtCPOdetUPCPrice").val(res.UPCPRICE);
                                    //$("#txtCPOdetDesc").val("");
                                    //2021/09/11
                                    //$("#txtCPOdetDesc").val("");
                                    $("#txtCPOdetDesc").val(res.UPCDESC);

                                    $("#txtCPOdetType").val(res.Type);

                                    //2021/08/09
                                    //$("#txtCPOdetBoxCode").attr('placeholder', "");
                                    //$("#txtCPOdetUPC").val("");
                                    debugger;
                                    //$("#txtCPOdetBoxCode").attr('placeholder', (res.BoxCode == "" ? "" : parseInt(res.BoxCode)));
                                    $("#txtCPOdetBoxCode").attr('placeholder', (res.BoxCode == "" ? "" : res.BoxCode));
                                    $("#txtCPOdetUPC").val(res.UPC);

                                    //Binding values to list
                                    $("#hfCPOdetFBE").val("0.000");
                                    $("#hfCPOdetUOM").val(res.UOM);
                                    $("#hfCPOdetVIA").val("");
                                    LoadCreatePODropdowns(function (callback) { });

                                    //var TodayDate = new Date();
                                    //var Cargodate = new Date(res.DateRec);
                                    //var Diff =new Date(Cargodate-TodayDate)
                                    //alert(Diff);
                                    //var one_day = 1000 * 60 * 60 * 24
                                    //var Difference = ( Diff/1000/60/60/24).toFixed(0);
                                    //alert(Difference);
                                    //if (Difference < 0) {
                                    //    var twoDigitMonth = (TodayDate.getMonth() + 1) + "";
                                    //    if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                                    //    var twoDigitDate = (TodayDate.getDate()) + "";
                                    //    if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                                    //    var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + TodayDate.getFullYear();
                                    //    $("#hfCPOdetCargoDate").val(currentDate);
                                    //}
                                    //else {
                                    //alert(res.CargoDate);
                                    $("#hfCPOdetCargoDate").val(res.CargoDate);
                                    //}
                                    LoadCreatePODropdowns(function (callback) { });
                                    //$("#hfCPOdetWH").val("");
                                    $("#hfCPOdetWH").val(res.wh);

                                    LoadCreatePODropdowns(function (callback) { });
                                    $('#hfCPOdetOrigin').val(res.Origin);
                                    LoadCreatePODropdowns(function (callback) { });
                                    $("#hfCPOdetFarm").val(res.FarmCode);

                                    $("#lstCPOdetOrigin").val(res.Origin);
                                    $("#lstCPOdetOrigin").val(res.Origin).triggerHandler("change");

                                    //2021/11/04, set default values for empty farm and origion from the latest PO that already created
                                    if ((!res.ORIGIN || res.ORIGIN == 0 || res.ORIGIN == "") && window.PagePO_Airport != 0) {
                                        $('#hfCPOdetOrigin').val(window.PagePO_Airport);
                                        $("#lstCPOdetOrigin").val(window.PagePO_Airport);
                                        $("#lstCPOdetOrigin").val(window.PagePO_Airport).triggerHandler("change");
                                    }
                                    if ((!res.Farm || res.Farm == 0 || res.Farm == "") && window.PagePO_Farm != 0) {
                                        $('#hfCPOdetFarm').val(window.PagePO_Farm);
                                    }
                                    /////

                                    $("#lstCPOdetFarm").val($("#hfCPOdetFarm").val());

                                    //setting local-variable values
                                    getcpo_oldqty = parseInt(res.Boxes);
                                    getcpo_oldpack = parseInt(res.Units);
                                    getcpo_oldcost = parseFloat(res.Cost).toFixed(4);
                                    getcpo_oldprice = parseFloat(res.Fob).toFixed(4);

                                    $("#DivCreatePOPurchaseDialog").data("SPORDEditData", { SpordID: SpordID, CargoDate: res.CargoDate, SourceCtrl: sourceCtl }).dialog("open");
                                }
                            });
                        }
                    }
                })
            }
        })
    }

    $("#DivCreatePOPurchaseDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Purchase",
        modal: true,
        width: 1300,
        buttons: {
            //Deny: function () {
            //    var SoucreCtl = $("#DivCreatePOPurchaseDialog").data('SPORDEditData')["SourceCtrl"];
            //    var SPORDID = SoucreCtl.attr('id').replace('PurchasePOselect_', '');
            //},
            BuyAndConfirm: {
                text: 'Buy And Confirm',
                click: function () {
                    var SoucreCtl = $("#DivCreatePOPurchaseDialog").data('SPORDEditData')["SourceCtrl"];
                    var SPORDID = SoucreCtl.attr('id').replace('PurchasePOselect_', '');
                    var Flower = $("#hfCPOdetProd").val();
                    if (Flower == "") {
                        $.MessageBox("Please choose flower..");
                        $("#txtCPOdetProdName").focus();
                        return false;
                    }
                    var Quantity = $("#txtCPOdetQty").val();
                    if (Quantity == "")
                        Quantity = $("#txtCPOdetQty").attr("Placeholder")
                    if (Quantity == "") {
                        $.MessageBox("Please enter Quantity..");
                        $("#txtCPOdetQty").focus();
                        return false;
                    }
                    var CostPerUnit = $("#txtCPOdetCost").val();
                    if (CostPerUnit == "")
                        CostPerUnit = $("#txtCPOdetCost").attr("Placeholder")
                    if (CostPerUnit == "") {
                        $.MessageBox("Please enter Cost..");
                        $("#txtCPOdetCost").focus();
                        return false;
                    }
                    var TotalCost = $("#txtCPOdetTotCost").val();
                    if (TotalCost == "")
                        TotalCost = $("#txtCPOdetTotCost").attr("Placeholder")
                    if (TotalCost == "") {
                        $.MessageBox("Please enter TotalCost..");
                        $("#txtCPOdetTotCost").focus();
                        return false;
                    }
                    var UnitsPerBox = $("#txtCPOdetPack").val();
                    if (UnitsPerBox == "")
                        UnitsPerBox = $("#txtCPOdetPack").attr("Placeholder")
                    if (UnitsPerBox == "") {
                        $.MessageBox("Please enter Units Per Box..");
                        $("#txtCPOdetPack").focus();
                        return false;
                    }
                    var UOM = $("#lstCPOdetUOM").val();
                    if (UOM == 0) {
                        $.MessageBox("Please Choose UOM..");
                        $("#lstCPOdetUOM").focus();
                        return false;
                    }
                    var Airport = $("#lstCPOdetOrigin").val();
                    if (Airport == 0) {
                        $.MessageBox("Please Choose Origin..");
                        $("#lstCPOdetOrigin").focus();
                        return false;
                    }
                    var Warehouse = $("#lstCPOdetWH").val();
                    if (Warehouse == 0) {
                        $.MessageBox("Please Choose Warehouse..");
                        $("#lstCPOdetWH").focus();
                        return false;
                    }
                    var Carrier = $("#lstCPOdetVIA").val() == null ? "" : $("#lstCPOdetVIA").val();
                    //if (Carrier == 0) {
                    //    $.MessageBox("Please Choose VIA..");
                    //    $("#lstCPOdetVIA").focus();
                    //    return false;
                    //}
                    var Farm = $("#lstCPOdetFarm").val();
                    if (Farm == 0) {
                        $.MessageBox("Please Choose Farm..");
                        $("#lstCPOdetFarm").focus();
                        return false;
                    }
                    var ShipDate = $("#txtCPOdetCargoDate").val();
                    if (ShipDate == "") {
                        $.MessageBox("Please Select Cargo Date..");
                        $("#txtCPOdetCargoDate").focus();
                        return false;
                    }
                    var FarmComm1 = $("#txtCPOdetFarmCom1").val();
                    var FarmComm2 = $("#txtCPOdetFarmCom2").val();
                    var InternalComment = $("#txtCPOdetIntercom").val();
                    var UPC = $("#txtCPOdetUPC").val();
                    var Type = $("#txtCPOdetType").val();
                    var Description = $("#txtCPOdetDesc").val();
                    var DateCode = $("#txtCPOdetDateCode").val();
                    var UPCPrice = $("#txtCPOdetUPCPrice").val();
                    //2021/08/14, no need to make it zero
                    //if (UPCPrice == "") {
                    //    UPCPrice = "0"
                    //}
                    var Freight = $("#txtCPOdetFreight").val();
                    if (Freight == "")
                        Freight = $("#txtCPOdetFreight").attr("Placeholder")

                    var Handling = $("#txtCPOdetHandling").val();
                    if (Handling == "")
                        Handling = $("#txtCPOdetHandling").attr("Placeholder")

                    var Andean = $("#txtCPOdetDuty").val();
                    if (Andean == "")
                        Andean = $("#txtCPOdetDuty").attr("Placeholder")

                    var BoxCode = $("#txtCPOdetBoxCode").val();
                    var SalesValue = $("#txtCPOdetTotSales").attr("Placeholder");

                    var Price = $("#txtCPOdetPrice").val();
                    if (Price == "")
                        Price = $("#txtCPOdetPrice").attr("Placeholder");

                    var UnitsPerBunch = 0;
                    var SaveFlag = $("#divSaveFlag").html();
                    //2021/11/04//
                    window.PagePO_Airport = Airport;
                    window.PagePO_Farm = Farm;
                    /////
                    if (SaveFlag == "SP") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/CreatePOPurchase',
                            data: '{"SPORDID":"' + SPORDID + '","Farm":"' + Farm + '","Flower":"' + Flower + '","Boxes":"' + Quantity + '","UOM":"' + UOM +
                                '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                                '","CostPerUnits":"' + CostPerUnit + '","Type":"' + Type + '","BoxCode":"' + escapeJSON(BoxCode) + '","FarmComm1":"' + escapeJSON(FarmComm1) + '","FarmComm2":"' + escapeJSON(FarmComm2) +
                                '","InternalComment":"' + escapeJSON( InternalComment) + '","UPC":"' + UPC + '","Description":"' + Description +
                                '","DateCode":"' + DateCode + '","UPCPrice":"' + UPCPrice + '","SalesValue":"' + SalesValue + '","Carrier":"' + Carrier + '","ShipDate":"' + ShipDate +
                                '","Status":"CONFIRMED","Airport":"' + Airport + '","WH":"' + Warehouse + '","Freight":"' + Freight + '","Handling":"' + Handling + '","Andean":"' + Andean +
                                '","Price":"' + Price + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                if (output.d == "Success") {
                                    //$("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                                    //for better performance, remove the row from grid instead of refresh
                                     // $("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });

                                    var gridQty = $("#row" + SPORDID).children("td")[3];
                                    var qty = $(gridQty).children().text();

                                    if (qty == Quantity) {
                                        $("#row" + SPORDID).remove();
                                    } else {
                                        $(gridQty).children().text(parseInt(qty) - parseInt(Quantity));

                                    }
                                    $("#DivCreatePOPurchaseDialog").dialog("close");

                                }
                                else {
                                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                }
                            }
                        });
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/CreatePOPurchaseForOrder',
                            data: '{"OrderDetId":"' + SPORDID + '","Farm":"' + Farm + '","Flower":"' + Flower + '","Boxes":"' + Quantity + '","UOM":"' + UOM +
                                '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                                '","CostPerUnits":"' + CostPerUnit + '","Type":"' + Type + '","BoxCode":"' + BoxCode + '","FarmComm1":"' + FarmComm1 + '","FarmComm2":"' + FarmComm2 +
                                '","InternalComment":"' + InternalComment + '","UPC":"' + UPC + '","Description":"' + Description +
                                '","DateCode":"' + DateCode + '","UPCPrice":"' + UPCPrice + '","SalesValue":"' + SalesValue + '","Carrier":"' + Carrier + '","ShipDate":"' + ShipDate +
                                '","Status":"CONFIRMED","Airport":"' + Airport + '","WH":"' + Warehouse + '","Freight":"' + Freight + '","Handling":"' + Handling + '","Andean":"' + Andean +
                                '","Price":"' + Price + '"}',
                            contentType: "application/json; charset=utf-8",

                            dataType: "json",
                            success: function (output) {
                                if (output.d == "Success") {
                                    //$("#DivCreatePOPurchaseDialog").dialog("close");
                                    //$("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                                    //for better performance, remove the row from grid instead of refresh
                                    //if ($("#row" + SPORDID)) {
                                    //    $("#row" + SPORDID).remove();
                                    //}
                                    //$("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });

                                    var gridQty = $("#row" + SPORDID).children("td")[3];
                                    var qty = $(gridQty).children().text();

                                    if (qty == Quantity) {
                                        $("#row" + SPORDID).remove();
                                    } else {
                                        $(gridQty).children().text(parseInt(qty) - parseInt(Quantity));

                                    }
                                    $("#DivCreatePOPurchaseDialog").dialog("close");

                                }
                                else {
                                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                }
                            }
                        });
                    }
                }
            },
            Buy: function () {
                var SoucreCtl = $("#DivCreatePOPurchaseDialog").data('SPORDEditData')["SourceCtrl"];
                var SPORDID = SoucreCtl.attr('id').replace('PurchasePOselect_', '');
                var Flower = $("#hfCPOdetProd").val();
                if (Flower == "") {
                    $.MessageBox("Please choose flower..");
                    $("#txtCPOdetProdName").focus();
                    return false;
                }
                var Quantity = $("#txtCPOdetQty").val();
                if (Quantity == "")
                    Quantity = $("#txtCPOdetQty").attr("Placeholder")
                if (Quantity == "") {
                    $.MessageBox("Please enter Quantity..");
                    $("#txtCPOdetQty").focus();
                    return false;
                }
                var CostPerUnit = $("#txtCPOdetCost").val();
                if (CostPerUnit == "")
                    CostPerUnit = $("#txtCPOdetCost").attr("Placeholder")
                if (CostPerUnit == "") {
                    $.MessageBox("Please enter Cost..");
                    $("#txtCPOdetCost").focus();
                    return false;
                }
                var TotalCost = $("#txtCPOdetTotCost").val();
                if (TotalCost == "")
                    TotalCost = $("#txtCPOdetTotCost").attr("Placeholder")
                if (TotalCost == "") {
                    $.MessageBox("Please enter TotalCost..");
                    $("#txtCPOdetTotCost").focus();
                    return false;
                }
                var UnitsPerBox = $("#txtCPOdetPack").val();
                if (UnitsPerBox == "")
                    UnitsPerBox = $("#txtCPOdetPack").attr("Placeholder")
                if (UnitsPerBox == "") {
                    $.MessageBox("Please enter Units Per Box..");
                    $("#txtCPOdetPack").focus();
                    return false;
                }
                var UOM = $("#lstCPOdetUOM").val();
                if (UOM == 0) {
                    $.MessageBox("Please Choose UOM..");
                    $("#lstCPOdetUOM").focus();
                    return false;
                }
                var Airport = $("#lstCPOdetOrigin").val();
                if (Airport == 0) {
                    $.MessageBox("Please Choose Origin..");
                    $("#lstCPOdetOrigin").focus();
                    return false;
                }
                var Warehouse = $("#lstCPOdetWH").val();
                if (Warehouse == 0) {
                    $.MessageBox("Please Choose Warehouse..");
                    $("#lstCPOdetWH").focus();
                    return false;
                }
                var Carrier = $("#lstCPOdetVIA").val();
                //if (Carrier == 0) {
                //    $.MessageBox("Please Choose VIA..");
                //    $("#lstCPOdetVIA").focus();
                //    return false;
                //}
                var Farm = $("#lstCPOdetFarm").val();
                if (Farm == 0) {
                    $.MessageBox("Please Choose Farm..");
                    $("#lstCPOdetFarm").focus();
                    return false;
                }
                var ShipDate = $("#txtCPOdetCargoDate").val();
                if (ShipDate == "") {
                    $.MessageBox("Please Select Cargo Date..");
                    $("#txtCPOdetCargoDate").focus();
                    return false;
                }
                var FarmComm1 = $("#txtCPOdetFarmCom1").val();
                var FarmComm2 = $("#txtCPOdetFarmCom2").val();
                var InternalComment = $("#txtCPOdetIntercom").val();
                var UPC = $("#txtCPOdetUPC").val();
                var Type = $("#txtCPOdetType").val();
                var Description = $("#txtCPOdetDesc").val();
                var DateCode = $("#txtCPOdetDateCode").val();
                var UPCPrice = $("#txtCPOdetUPCPrice").val();
                //2021/08/14, no need to make it zero
                //if (UPCPrice == "") {
                //    UPCPrice = "0"
                //}
                var Freight = $("#txtCPOdetFreight").val();
                if (Freight == "")
                    Freight = $("#txtCPOdetFreight").attr("Placeholder")

                var Handling = $("#txtCPOdetHandling").val();
                if (Handling == "")
                    Handling = $("#txtCPOdetHandling").attr("Placeholder")

                var Andean = $("#txtCPOdetDuty").val();
                if (Andean == "")
                    Andean = $("#txtCPOdetDuty").attr("Placeholder")

                var Price = $("#txtCPOdetPrice").val();
                if (Price == "")
                    Price = $("#txtCPOdetPrice").attr("Placeholder");

                var BoxCode = $("#txtCPOdetBoxCode").val();
                var SalesValue = $("#txtCPOdetTotSales").attr("Placeholder");

                var UnitsPerBunch = 0;
                var SaveFlag = $("#divSaveFlag").html();
                //2021/11/04//
                window.PagePO_Airport = Airport;
                window.PagePO_Farm = Farm;
                /////
                if (SaveFlag == "SP") {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/CreatePOPurchase',
                        data: '{"SPORDID":"' + SPORDID + '","Farm":"' + Farm + '","Flower":"' + Flower + '","Boxes":"' + Quantity + '","UOM":"' + UOM +
                            '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                            '","CostPerUnits":"' + CostPerUnit + '","Type":"' + Type + '","BoxCode":"' + BoxCode + '","FarmComm1":"' + FarmComm1 + '","FarmComm2":"' + FarmComm2 +
                            '","InternalComment":"' + InternalComment + '","UPC":"' + UPC + '","Description":"' + Description +
                            '","DateCode":"' + DateCode + '","UPCPrice":"' + UPCPrice + '","SalesValue":"' + SalesValue + '","Carrier":"' + Carrier + '","ShipDate":"' + ShipDate +
                            '","Status":"PENDING","Airport":"' + Airport + '","WH":"' + Warehouse + '","Freight":"' + Freight + '","Handling":"' + Handling + '","Andean":"' + Andean +
                            '","Price":"' + Price + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d == "Success") {
                                $("#DivCreatePOPurchaseDialog").dialog("close");
                                //$("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                                //for better performance, remove the row from grid instead of refresh
                                //if ($("#row" + SPORDID)) {
                                //    $("#row" + SPORDID).remove();
                                //}
                                //$("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });
                        
                                var gridQty = $("#row" + SPORDID).children("td")[3];
                                var qty = $(gridQty).children().text();

                                if (qty == Quantity) {
                                    $("#row" + SPORDID).remove();
                                } else {
                                    $(gridQty).children().text(parseInt(qty) - parseInt(Quantity));

                                }
                                $("#DivCreatePOPurchaseDialog").dialog("close");
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/CreatePOPurchaseForOrder',
                        data: '{"OrderDetId":"' + SPORDID + '","Farm":"' + Farm + '","Flower":"' + Flower + '","Boxes":"' + Quantity + '","UOM":"' + UOM +
                            '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                            '","CostPerUnits":"' + CostPerUnit + '","Type":"' + Type + '","BoxCode":"' + BoxCode + '","FarmComm1":"' + FarmComm1 + '","FarmComm2":"' + FarmComm2 +
                            '","InternalComment":"' + InternalComment + '","UPC":"' + UPC + '","Description":"' + Description +
                            '","DateCode":"' + DateCode + '","UPCPrice":"' + UPCPrice + '","SalesValue":"' + SalesValue + '","Carrier":"' + Carrier + '","ShipDate":"' + ShipDate +
                            '","Status":"PENDING","Airport":"' + Airport + '","WH":"' + Warehouse + '","Freight":"' + Freight + '","Handling":"' + Handling + '","Andean":"' + Andean +
                            '","Price":"' + Price + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d == "Success") {
                               
                                //$("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                                //for better performance, remove the row from grid instead of refresh
                                //if ($("#row" + SPORDID)) {
                                //    $("#row" + SPORDID).remove();
                                //}
                                //$("#fgrdPOHeaderList").flexReload({ url: '/url/for/refresh' });

                                debugger;
                                var gridQty = $("#row" + SPORDID).children("td")[3];
                                var qty = $(gridQty).children().text();

                                if (qty == Quantity) {
                                    $("#row" + SPORDID).remove();
                                } else {
                                    $(gridQty).children().text(parseInt(qty) - parseInt(Quantity));
                                }

                                $("#DivCreatePOPurchaseDialog").dialog("close");
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        }
                    });
                }
            },
            Close: function () {
                $(this).dialog("close");
            },
            Deny: function () {
            },
        },
        open: function () {
            //$("#txtCPOdetQty").focus();
            //call Qty focus because there is a code in focus out event and must be called before go to cost field
            $("#txtCPOdetQty").focus();
            //make the focus on cost first
            $("#txtCPOdetCost").focus();

            //$(".ui-dialog-buttonpane button:contains('Deny')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('BuyAndConfirm')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Buy')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Deny')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
             var Denybtn = $(".ui-dialog-buttonpane button:contains('Deny')").addClass('dialogbuttonstyle')
            $(Denybtn).css("margin-right", "840px")
            $(Denybtn).css("float", "left")
            $(Denybtn).attr('id', 'btnDeny1')
        },
        close: function () {
            var sourceCtl = $("#DivCreatePOPurchaseDialog").data('SPORDEditData')["SourceCtrl"];
            sourceCtl.prop("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unOrderselected');
            isSPORDCPOeditclicked = false;
        }
    });
    $("#btnsearch").click(function () {
        $("#tblLoadPurchasesByProductForPageFlowers").flexOptions({ params: [{ name: 'FARMCODE', value: '' }, { name: 'Product', value: $("#hfCPOdetProd").val() }] }).flexReload();
        $("#DivLoadPurchasesByProductForPageFlowers").dialog("open");
        LoadPurchasesByProduct('', $("#hfCPOdetProd").val());
    });
    $("#DivLoadPurchasesByProductForPageFlowers").dialog({
        autoOpen: false,
        resizable: false,
        width: 1250,
        modal: true,
        title: 'Purchases by Product',
        buttons: {
            Cancel: function () {
                $(this).dialog("close");
            }

        },
        open: function () {
            $("#DivLoadPurchasesByProductForPageFlowers").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });
    function LoadPurchasesByProduct(Farmcode, Product) {
        debugger;
        $("#tblLoadPurchasesByProductForPageFlowers").flexigrid({
            url: 'BloomService.asmx/LoadPurchasesByProduct',
            dataType: 'xml',
            colModel: [
                { display: 'WH', name: 'WH', width: 30, padding: 5, sortable: true, align: 'left' },
                { display: 'FARM', name: 'FARM', width: 30, padding: 5, sortable: true, align: 'left' },
                { display: 'AWB', name: 'LOT', width: 40, padding: 5, sortable: true, align: 'left' },
                { display: 'Date Received', name: 'DATEREC', width: 60, sortable: true, align: 'left' },
                { display: 'Description', name: 'Description', width: 250, sortable: true, align: 'left' },
                { display: 'Pieces', name: 'BOXES', width: 40, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                { display: 'U/B', name: 'UNITSBUNCH', width: 40, sortable: false, align: 'right' },
                { display: 'PACK', name: 'UNITS', width: 40, sortable: false, align: 'right' },
                { display: 'Total Units', name: 'TotalUnits', width: 70, sortable: false, align: 'right' },
                { display: 'COST', name: 'COST', width: 70, sortable: false, align: 'right' },
                { display: 'TYPE', name: 'TYPE', width: 40, sortable: false, align: 'right' },
                { display: 'FLAG', name: 'FLAG', width: 30, sortable: false, align: 'right' },
                { display: 'CUST', name: 'CUST', width: 40, sortable: false, align: 'right' },
                { display: 'PO', name: 'PO', width: 120, sortable: false, align: 'center' },
                { display: 'INVOICE', name: 'INVOICE', width: 70, sortable: false, align: 'right' }
            ],

            showTableToggleBtn: true,
            sortname: "LOT",
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
            params: [
                { name: 'FARMCODE', value: Farmcode },
                { name: 'Product', value: Product }
            ],
            height: 400,
            width: 1200,
            striped: true,

            onSuccess: function () {
                //$("#DivLoadPurchasesByProductForPageFlowers").dialog("open");
            }
        });
    }
    $("#txtCPOdetProdName").autocomplete({
        source: function (request, response) {

            var SearchBy = "";
            var Farm = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteInSPORD',
                data: "{'Searchtext': '" + request.term + "','Farm':'" + Farm + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

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

            $("#txtCPOdetProdName").val("")
            $("#txtCPOdetProdName").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfCPOdetProd").val(i.item.Flower.trim());
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtCPOdetProdName").val("");
                $("#hfCPOdetProd").val("");
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function LoadCreatePODropdowns(callback) {
        if (!isFromCreatePOEdit) {
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            cpomode = parseInt(1);
            LoadCreatePODropdownsBymode(function (callback1) {

                if (callback1 == true) {
                    cpomode = parseInt(2);
                    LoadCreatePODropdownsBymode(function (callback2) {

                        if (callback2 == true) {
                            cpomode = parseInt(4);
                            LoadCreatePODropdownsBymode(function (callback2) {
                                if (callback2 == true) {
                                    cpomode = parseInt(0);
                                    cpoorigin = "";
                                    callback(true);
                                }
                            })
                        }
                    })
                }
            })
        }
        else {
            $('#lstCPOdetUOM').val($("#hfCPOdetUOM").val());
            $('#lstCPOdetOrigin').val($("#hfCPOdetOrigin").val());
            $('#lstCPOdetVIA').val($("#hfCPOdetVIA").val());
            $('#lstCPOdetFarm').val($("#hfCPOdetFarm").val());
            $('#txtCPOdetCargoDate').val($("#hfCPOdetCargoDate").val());
            $('#lstCPOdetWH').val($("#hfCPOdetWH").val());
            GetFBE();
            FreightAndHandlingForCreatePO();
            CalculateDuty();
            CalculateGPM();
            callback(true);
        }
    }

    function LoadCreatePODropdownsBymode(callback) {
        var SaveFlag = $("#divSaveFlag").html();
        //var sqlId = $("#hfCPOdetSPORDID").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadCreatePODropdowns',
            data: "{'sqlId':" + sqlIdForCreatePO + ",'mode':" + cpomode + ",'origin':'" + cpoorigin + "','SaveFlag':'" + SaveFlag + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var data = output.d;
                if (parseInt(cpomode) == parseInt(1)) {
                    $('#lstCPOdetUOM').empty();
                    $('#lstCPOdetVIA').empty();
                    //$('#txtCPOdetCargoDate').empty();
                    $('#lstCPOdetWH').empty();
                    debugger;
                    //data.sort(function (a, b) {
                    //    return parseFloat(a.SpordID) - parseFloat(b.SpordID);
                    //});
                    for (var i in data) {
                        var itm = data[i];
                        //if (itm.SpordID != "") {
                        //Load Empty option
                        if (i == 0) {
                            LoadDefaultOption("lstCPOdetUOM");
                            LoadDefaultOption("lstCPOdetVIA");
                            //LoadDefaultOption("lstCPOdetCargoDate");
                            LoadDefaultOption("lstCPOdetWH");
                        }

                        //Load UOM
                        if ($("#lstCPOdetUOM").html().indexOf('<option value="' + itm.UOM + '">' + itm.UOMSize + '</option>') == -1) {
                            if (itm.UOM.toString().trim() != "") {
                                $('#lstCPOdetUOM').append('<option value="' + itm.UOM + '">' + itm.UOMSize + '</option>');
                            }
                        }

                        //Load VIA
                        //if ($("#lstCPOdetVIA").html().indexOf('<option value="' + itm.Agency + '">' + itm.Agency + '</option>') == -1) {
                        //     if (itm.Agency.toString().trim() != "") {
                        //         $('#lstCPOdetVIA').append('<option value="' + itm.Agency + '">' + itm.Agency + '</option>');
                        //      }
                        // }
                        //Load CargoDate
                        //if ($("#lstCPOdetCargoDate").html().indexOf('<option value="' + itm.CargoDate + '">' + itm.CargoDate + '</option>') == -1) {
                        //    if (itm.CargoDate.toString().trim() != "") {
                        //        $('#lstCPOdetCargoDate').append('<option value="' + itm.CargoDate + '">' + itm.CargoDate + '</option>');
                        //    }
                        //}

                        //Load WH
                        if ($("#lstCPOdetWH").html().indexOf('<option value="' + itm.WH + '">' + itm.WH + '</option>') == -1) {
                            if (itm.WH.toString().trim() != "") {
                                $('#lstCPOdetWH').append('<option value="' + itm.WH + '">' + itm.WH + '</option>');
                            }
                        }
                        //}
                    }
                }
                else if (parseInt(cpomode) == parseInt(2)) {
                    $('#lstCPOdetOrigin').empty();
                    //data.sort(function (a, b) {
                    //    return parseFloat(a.AirportDetails.AirportID) - parseFloat(b.AirportDetails.AirportID);
                    //});
                    for (var i in data) {
                        var itm = data[i];
                        if (itm.AirportDetails.AirportID != "") {
                            //Load Empty option
                            if (i == 0) {
                                LoadDefaultOption("lstCPOdetOrigin");
                            }

                            //Load Origin
                            if ($("#lstCPOdetOrigin").html().indexOf('<option value="' + itm.AirportDetails.Airport + '">[' + itm.AirportDetails.Airport + "] " + itm.AirportDetails.Name + " - " + itm.AirportDetails.Country + '</option>') == -1) {
                                $('#lstCPOdetOrigin').append('<option value="' + itm.AirportDetails.Airport + '">[' + itm.AirportDetails.Airport + "] " + itm.AirportDetails.Name + " - " + itm.AirportDetails.Country + '</option>');
                            }
                        }
                    }
                }
                else if (parseInt(cpomode) == parseInt(3)) {
                    $('#lstCPOdetFarm').empty();
                    debugger;
                    //data.sort(function (a, b) {
                    //    return parseFloat(a.FarmDetails.ID) - parseFloat(b.FarmDetails.ID);
                    //});
                    for (var i in data) {
                        var itm = data[i];
                        if (itm.FarmDetails.ID != "") {
                            //Load Empty option
                            if (i == 0) {
                                LoadDefaultOption("lstCPOdetFarm");
                            }

                            //Load Farm
                            if ($("#lstCPOdetFarm").html().indexOf('<option value="' + itm.FarmDetails.Farm + '">[' + itm.FarmDetails.Farm + "] " + itm.FarmDetails.Name + '</option>') == -1) {
                                if (itm.FarmDetails.Farm.toString().trim() != "") {
                                    $('#lstCPOdetFarm').append('<option value="' + itm.FarmDetails.Farm + '">[' + itm.FarmDetails.Farm + "] " + itm.FarmDetails.Name + '</option>');
                                }
                            }
                        }
                    }
                    if ($("#hfCPOdetFarm").val() != "" || $("#hfCPOdetFarm").val() != null || $("#hfCPOdetFarm").val() != undefined) {
                        $("#lstCPOdetFarm").val($("#hfCPOdetFarm").val()).change();
                    }
                }
                else if (parseInt(cpomode) == parseInt(4)) {
                    $('#lstCPOdetVIA').empty();
                    data.sort(function (a, b) {
                        return parseFloat(a.CarrierDetails.ID) - parseFloat(b.CarrierDetails.ID);
                    });
                    for (var i in data) {
                        var itm = data[i];
                        if (itm.CarrierDetails.ID != "") {
                            //Load Empty option
                            if (i == 0) {
                                LoadDefaultOption("lstCPOdetVIA");
                            }
                            //Load VIA
                            if ($("#lstCPOdetVIA").html().indexOf('<option value="' + itm.CarrierDetails.Carrier + '">[' + itm.CarrierDetails.Carrier + ']' + itm.CarrierDetails.Name + '</option>') == -1) {
                                if (itm.CarrierDetails.Carrier.toString().trim() != "") {
                                    $('#lstCPOdetVIA').append('<option value="' + itm.CarrierDetails.Carrier + '">[' + itm.CarrierDetails.Carrier + ']' + itm.CarrierDetails.Name + '</option>');
                                }
                            }
                        }
                    }
                }
                callback(true);
            },
        });
    }

    $("#lstCPOdetOrigin").change(function () {

        cpoorigin = "";
        cpoorigin = $('option:selected', this).val();
        cpomode = parseInt(3);
        LoadCreatePODropdownsBymode(function (callback) {
            if (callback == true) {
                cpoorigin = "";
                cpomode = parseInt(0);
            }
        });
        GetFBE();
        FreightAndHandlingForCreatePO();
        CalculateDuty();
        CalculateGPM();
    });

    $("#lstCPOdetFarm").change(function () {
        GetFBE();
        FreightAndHandlingForCreatePO();
        CalculateDuty();
        CalculateGPM();
    });

    $("#lstCPOdetUOM").change(function () {
        GetFBE();
        FreightAndHandlingForCreatePO();
        CalculateDuty();
        CalculateGPM();
    });
    function GetFBE() {
        var Flower = "";
        var FARM = "";
        var UOM = "";
        Flower = $("#hfCPOdetProd").val();
        FARM = $("#lstCPOdetFarm").val() == null || $("#lstCPOdetFarm").val() == "undefined" ? "" : $("#lstCPOdetFarm").val();
        UOM = $("#lstCPOdetUOM").val();
        //ignore farm 
        //if (Flower != "" && FARM != "" && UOM != "") {
        if (Flower != "" && UOM != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFBE',
                data: '{"Flower":"' + Flower + '","Farm":"' + FARM + '","UOM":"' + UOM + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d;
                    $("#hfCPOdetFBE").val(result);
                }
            });
        }
    }

    function setplaceholderforCPOtextboxes(callback) {
        $("#txtCPOdetQty").attr("placeholder", parseInt(0));
        $("#txtCPOdetTotSales").attr("placeholder", parseFloat(0.00).toFixed(4));
        $("#txtCPOdetPrice").attr("placeholder", parseFloat(0.00).toFixed(4));
        $("#txtCPOdetCost").attr("placeholder", parseFloat(0.00).toFixed(4));
        $("#txtCPOdetTotCost").attr("placeholder", parseFloat(0.00).toFixed(4));
        $("#txtCPOdetPack").attr("placeholder", parseInt("0"));
        $("#txtCPOdetFreight").attr("placeholder", parseFloat(0.00).toFixed(3));
        $("#txtCPOdetHandling").attr("placeholder", parseFloat(0.00).toFixed(3));
        $("#txtCPOdetDuty").attr("placeholder", parseFloat(0.00).toFixed(3));
        $("#txtCPOdetGPM").attr("placeholder", parseFloat(0.00).toFixed(1));

        //$("#txtCPOdetBoxCode").attr("placeholder", parseInt("0"));
        $("#txtCPOdetBoxCode").attr("placeholder", "0");
        //2021/08/14
        //$("#txtCPOdetUPCPrice").attr("placeholder", parseFloat(0.00).toFixed(4));
        $("#txtCPOdetUPCPrice").attr("placeholder", "");
        callback(true);
    }

    $("#txtCPOdetQty").focusout(function () {

        var getcurrentqty = parseInt(0);
        getcurrentqty = parseInt($("#txtCPOdetQty").val());
        if (getcpo_oldqty != getcurrentqty) {
            onchangePriceAndCost(false);                //To calculate Total Cost
            onchangePriceAndCost(true);                 //To calculate Total Sales
        }
    });

    $("#txtCPOdetPack").focusout(function () {

        var getcurrentpack = parseInt(0);
        getcurrentpack = parseInt($("#txtCPOdetPack").val());
        if (getcpo_oldpack != getcurrentpack) {
            onchangePriceAndCost(false);                //To calculate Total Cost
            onchangePriceAndCost(true);                 //To calculate Total Sales
        }
    });

    $("#txtCPOdetCost").focusout(function () {

        var getcurrentcost = parseFloat(0.00).toFixed(2);
        getcurrentcost = parseFloat($("#txtCPOdetCost").val()).toFixed(2);
        if (getcpo_oldcost != getcurrentcost) {
            onchangePriceAndCost(false); //To calculate Total Cost
            CalculateDuty();
            CalculateGPM();
        }
    });

    $("#btnDeny1").die("click").live("click", function () {
        $("#DivDenyPO").dialog("open");
    });

    $("#DivDenyPO").dialog({
        autoOpen: false,
        resizable: false,
        width: 450,
        modal: true,
        title: 'Deny Order',
        buttons: {
            Ok: function () {
                var DenyPOReason = $("#txtDenyPOReason").val();
                var SpordId = $("#hfCPOdetSPORDID").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DenyStandingOrder',
                    data: '{"SpordSqlId":"' + SpordId + '","Comment":"' + DenyPOReason + '" ,  "SalesType":"' + $("#txtCPOdetType").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#DivDenyPO").dialog("close");
                        $("#DivCreatePOPurchaseDialog").dialog("close");
                        $("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
                    }
                });
            },
            Cancel: function () {
                $("#DivDenyPO").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    //$("#btnDeny").die("click").live("click", function () {
    //    //var InternalComment = $("#txtCPOdetIntercom").val();
    //    //if (InternalComment == "") {
    //    //    $.MessageBox("Internal Comment is required!!!");
    //    //    $("#txtCPOdetIntercom").focus();
    //    //    return;
    //    //}
    //    var FlowerName = $("#txtCPOdetProdName").val();
    //    var Qty = $("#txtCPOdetQty").attr("placeholder") // $("#txtCPOdetQty").val();
    //    var Units = $("#txtCPOdetPack").attr("placeholder");
    //    var UOM = $("#lstCPOdetUOM option:selected").text()
    //    var SalesType = $("#txtCPOdetType").val();
    //    if (SalesType == 'P') {
    //        SalesType = "PREBOOK";
    //    }
    //    else if (SalesType == 'O') {
    //        SalesType = "FUTURE ORDER";
    //    }
    //    else if (SalesType == "S") {
    //        SalesType = "STANDING ORDER";
    //    }
    //    $("#DivDenyPO").html("<p>Are you sure you want to deny this " + SalesType + " for <b>" + Qty + 'x' + UOM + " - " + FlowerName + " Packed " + Units + "</b> ?</p>");
    //    $("#DivDenyPO").dialog("open");
    //});

    //$("#DivDenyPO").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    width: 350,
    //    modal: true,
    //    title: 'Deny Order',
    //    buttons: {
    //        Deny: function () {
    //            var InternalComment = $("#txtCPOdetIntercom").val();
    //            var SpordId = $("#hfCPOdetSPORDID").val();
    //            $.ajax({
    //                type: "POST",
    //                url: 'BloomService.asmx/DenyStandingOrder',
    //                data: '{"SpordSqlId":"' + SpordId + '","Comment":"' + InternalComment + '" ,  "SalesType":"' + $("#txtCPOdetType").val() + '"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (output, status) {
    //                    $("#DivDenyPO").dialog("close");
    //                    $("#DivCreatePOPurchaseDialog").dialog("close");
    //                    $("#fgrdCreatePO").flexReload({ url: '/url/for/refresh' });
    //                }
    //            });
    //        },
    //        Close: function () {
    //            $("#DivDenyPO").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Deny')").addClass('dialogbuttonstyle icon-save');
    //        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    //    },
    //});

    $("#txtCPOdetPrice").focusout(function () {

        var getcurrentprice = parseFloat(0.00).toFixed(2);
        getcurrentprice = parseFloat($("#txtCPOdetPrice").val()).toFixed(2);
        if (getcpo_oldprice != getcurrentprice) {
            onchangePriceAndCost(true);                 //To calculate Total Sales
            CalculateDuty();
            CalculateGPM();
        }
    });

    function onchangePriceAndCost(isTotSales) {
        var gettotal = parseFloat(0.00), qty = parseInt(0), pack = parseInt(0), cost = parseFloat(0.00), price = parseFloat(0.00);
        qty = getcpotextboxvalues("txtCPOdetQty");
        pack = getcpotextboxvalues("txtCPOdetPack");
        cost = getcpotextboxvalues("txtCPOdetCost");
        price = getcpotextboxvalues("txtCPOdetPrice");
        if (isTotSales) {
            gettotal = calcTotSalesandTotCost(qty, price, cost, pack, isTotSales);
            $("#txtCPOdetTotSales").val("");
            $("#txtCPOdetTotSales").attr('placeholder', parseFloat(gettotal).toFixed(2));
        }
        else {
            gettotal = calcTotSalesandTotCost(qty, price, cost, pack, isTotSales);
            $("#txtCPOdetTotCost").val("");
            $("#txtCPOdetTotCost").attr('placeholder', parseFloat(gettotal).toFixed(2));
        }
    }

    function FreightAndHandlingForCreatePO() {
        var Airport = "";
        var FBE = "";
        var WH = "";
        Airport = $("#lstCPOdetOrigin").val();
        FBE = $("#hfCPOdetFBE").val() == "" || $("#hfCPOdetFBE").val() == "undefined" ? "0" : $("#hfCPOdetFBE").val();
        WH = $("#lstCPOdetWH").val();
        if (Airport != "" && WH != "" && FBE != "0") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFreightByAirportAndHandlingByWarehouse',
                data: '{"Airport":"' + Airport + '","Warehouse":"' + WH + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d.split("~");
                    var FreightAmount = result[0];
                    var HandlingCharge = result[1];
                    $("#txtCPOdetFreight").val((parseFloat(FreightAmount) * parseFloat(FBE)).toFixed(3));
                    $("#txtCPOdetHandling").val((parseFloat(HandlingCharge) * parseFloat(FBE)).toFixed(3));
                }
            });
        }
    }
    function CalculateDuty() {
        var Flower = "";
        var Airport = "";
        var Cost = "";
        Flower = $("#hfCPOdetProd").val();
        Airport = $("#lstCPOdetOrigin").val();
        Cost = $("#txtCPOdetCost").val();
        if (Cost == "")
            Cost = $("#txtCPOdetCost").attr("Placeholder");

        if (Flower != "" && Airport != "" && Cost != "0.0000") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetDutyPerUnit',
                data: '{"Flower":"' + Flower + '","Airport":"' + Airport + '","Cost":"' + Cost + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d
                    $("#txtCPOdetDuty").val(parseFloat(parseFloat(result) * 100).toFixed(3));
                }
            })
        }
        else {
            $("#txtCPOdetDuty").val(parseFloat(0.000).toFixed(3));
        }
    }
    function CalculateGPM() {
        var Cost = 0;
        var Freight = 0;
        var Handling = 0;
        var UnitPerBox = 0;
        var Price = 0;
        var Duty = 0;
        var LandedCost = 0;
        var GPM = 0;

        Cost = $("#txtCPOdetCost").val();
        if (Cost == "")
            Cost = $("#txtCPOdetCost").attr("Placeholder");
        if (Cost != "0.0000") {
            Freight = $("#txtCPOdetFreight").val();
            if (Freight == "")
                Freight = $("#txtCPOdetFreight").attr("Placeholder");

            Handling = $("#txtCPOdetHandling").val();
            if (Handling == "")
                Handling = $("#txtCPOdetHandling").attr("Placeholder");

            UnitPerBox = $("#txtCPOdetPack").val();
            if (UnitPerBox == "")
                UnitPerBox = $("#txtCPOdetPack").attr("Placeholder");

            Duty = $("#txtCPOdetDuty").val();
            if (Duty == "")
                Duty = $("#txtCPOdetDuty").attr("Placeholder");

            Price = $("#txtCPOdetPrice").val();
            if (Price == "")
                Price = $("#txtCPOdetPrice").attr("Placeholder");

            //alert(Cost + " ~ " + Freight + " ~ " + Handling + " ~ " + UnitPerBox + " ~ " + Duty + " ~ " + Price);
            LandedCost = 0;
            var FreightPerUnit = ((parseFloat(Freight) / parseFloat(UnitPerBox)).toFixed(3));
            var HandlingPerUnit = ((parseFloat(Handling) / parseFloat(UnitPerBox)).toFixed(3));
            var DutyPerBox = ((parseFloat(Duty) / parseFloat(UnitPerBox)).toFixed(3));
            LandedCost = parseFloat(Cost) + parseFloat(FreightPerUnit) + parseFloat(HandlingPerUnit) + parseFloat(DutyPerBox);
            if ((parseFloat(Price) - parseFloat(LandedCost)) > 0 && parseFloat(Price) > 0){
                GPM = ((parseFloat(Price) - parseFloat(LandedCost)) / parseFloat(Price)).toFixed(3);
            }
            $("#txtCPOdetGPM").val((parseFloat(GPM) * 100).toFixed(1));
        }
        else {
            $("#txtCPOdetGPM").attr("placeholder", parseFloat(0.00).toFixed(1));
        }
    }

    function calcTotSalesandTotCost(qty, price, cost, units, isTotSales) {

        var result = parseFloat(0.00), cpoqty = parseInt(0), cpoprice = parseFloat(0.00), cpounits = parseInt(0), cpocost = parseFloat(0.00);
        cpoqty = (qty == undefined ? cpoqty : parseInt(qty));
        cpoprice = (price == undefined ? cpoprice : parseFloat(price).toFixed(4));
        cpounits = (units == undefined ? cpounits : parseInt(units));
        cpocost = (cost == undefined ? cpocost : parseFloat(cost).toFixed(4));
        if (isTotSales) {
            result = parseFloat(((cpoqty * cpounits) * cpoprice).toFixed(2));
        }
        else {
            result = parseFloat(((cpoqty * cpounits) * cpocost).toFixed(2));
        }
        return result;
    }

    function getcpotextboxvalues(txtbox) {
        var txtboxval = parseInt(0);
        txtboxval = $("#" + txtbox + "").val() == "" ? $("#" + txtbox + "").attr('placeholder') : $("#" + txtbox + "").val();
        return txtboxval;
    }
    function escapeJSON(value) {
        return value.replace(/\"/g, '\"');
    }
</script>
