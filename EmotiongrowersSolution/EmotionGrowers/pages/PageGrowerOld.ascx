<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageGrower.ascx.vb" Inherits="pages_PageGrower" %>
<link rel="stylesheet" href="css/Filters.css">
<script type="text/javascript" src="js/jquery.fileDownload.js"></script>
<script src="zoom_assets/jquery.smoothZoom.min.js"></script>
<link rel="stylesheet" href="css/progressbar.css">
<script type="text/javascript" src="js/progressbar.js"></script>

<style type="text/css">
    ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
        font-weight: 500;
    }

    :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        opacity: 1;
        font-weight: 500;
    }

    ::-moz-placeholder { /* Mozilla Firefox 19+ */
        opacity: 1;
        font-weight: 500;
    }

    :-ms-input-placeholder { /* Internet Explorer 10-11 */
        font-weight: 500;
    }


    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    #row0 {
        /*position: absolute;
    margin-top: -63px;*/
        color: red;
        text-decoration: none;
    }

        #row0 td {
            /*background-color: #f3f3f3;*/
            border: 0px;
        }

            #row0 td.sorted {
                /*background-color: #708090;*/
                background-color: #72C97D;
                border: 0px;
            }


            /*css color and alignment for row above the grid*/
            #row0 td:nth-child(2) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; */
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; */
                /* line-height: 30px; */
                padding-bottom: 3px;
                font-size: 14px;
            }

            #row0 td:nth-child(3) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; */
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; */
                /* line-height: 30px; */
                padding-bottom: 3px;
                font-size: 14px;
            }

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .GrowerImport {
        background: url(images/dl_icon_sm.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 16px;
        cursor: pointer;
        color: #2D7929;
        font-weight: bold;
    }


    .GrowerInsert {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 16px;
        cursor: pointer;
        color: #2D7929;
        font-weight: bold;
    }

    .filter {
        /*background: url(images/EmptyFilter.png) no-repeat 10px 0px;*/
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
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

    .trSelectedHeader {
        background-color: red !important;
    }

    .SmallButton:hover {
        background-color: #378de5;
        color: #ffffff;
    }

    .tdclass {
        padding: 5px;
        background-color: #D9E4ED;
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
        width: 135px;
        border-right: 1px solid gray;
        border-bottom: 1px solid gray;
        height: 48px;
        font-size: 12px;
        margin-top: 2px;
        font-weight: bold;
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


    #DivGrowerDetailDialog table td {
        padding: 6px;
    }

    #DivGrowerDetailDialog input[type=text] {
        background-color: rgb(214, 214, 255);
    }

    #DivGrowerDetailDialog select {
        background-color: rgb(214, 214, 255);
    }

    #DivGrowerDetailDialog input[type="text"]:focus {
        background-color: cornsilk;
    }

    #DivGrowerDetailDialog select:focus {
        background-color: cornsilk;
    }

    .selectize-input {
        width: 307px;
    }

    .boldfont {
        font-weight: bold;
    }

    input[type="checkbox"] + label span {
        float: right;
        margin-left: 4px;
    }

    .import {
        background: url(images/dl_icon_sm.png) no-repeat 10px -2px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 18px;
    }

    div.ibutton-label-off {
        background-color: rgb(132, 160, 84);
    }

    div.ibutton-label-on {
        color: #fff;
        text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.4);
        left: 0;
        padding-top: 2px;
        z-index: 1;
        background-color: rgb(132, 160, 84);
    }

    #import_File_process {
        display: none;
    }

    #upload_File_process {
        float: right;
        display: none;
    }

    #import_FarmFile_process {
        display: none;
    }

    #upload_FarmFile_process {
        float: right;
        display: none;
    }
    .AWBListtd {
        border-width: 1px;
        padding: 7px;
        border-style: solid;
        border-color: #666666;
    }
</style>

<script type="text/javascript">
    document.title = "Grower Reports";
</script>
<div>
     <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
     <input type="hidden" id="hdnExpenseID" />
    <div class="slidediv" style="overflow: visible; display: block; height: 50px;">
        <table>
            <tr>
                <td style="vertical-align: top" colspan="2">
                    <table>
                        <tr>
                            <td>
                                <div class="filterbutton" id="divGrowerHeaderDate">
                                    <table style="width: 100%; height: 100%;" id="tblGrowerHeaderDate">
                                        <tr>
                                            <td style="font-size: 11px">
                                                <img id="imgGrowerHeaderDate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                                DATE PERIOD
                                            </td>
                                        </tr>
                                        <tr id="trGrowerHeader" style="height: 18px; text-align: center;">
                                            <td>
                                                <label class="DivFilterLabelStyle" id="lblGrowerHeaderchosendate"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblGrowerHeaderchosendate1"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblGrowerHeaderchosendate2"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td style="border-right: black; border-width: 5px;">
                                <span id="btnImport" class="GrowerImport">Import</span>
                            </td>
                            <td style="border-right: black; padding-left: 6px; padding-right: 48px; border-right: 1px solid darkgray;">
                                <span id="btnInsert" class="GrowerInsert">Insert</span>
                            </td>



                            <td style="padding-left: 30px; padding-right: 25px;">
                                <input type="checkbox" id="chkByAWBFarm" />
                                <%--<table>
                                    <tbody><tr>
                                        <td style="display:none;"> Consolidate by</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="button-group" id="DivGrowerAWBFarmType" style="float: left">
                                                <button class="button is-checked" type="button" name="btnByAWB" value="0" id="btnByAWB" style="width: 100px; height: 26px; border-radius: 4px;">AWB</button>
                                                <button class="button" type="button" name="btnByFarm" value="1" id="btnByFarm" style="width: 100px; height: 26px; border-radius: 4px;">Farm</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody></table>--%>

                            </td>

                            <%--<td>
                                <input id="btnFOBDetailed" type="button" class="BloomButtonEnabled" value="FOB Detailed" style="margin-left: 14px;">
                            </td>
                            <td>
                                <input id="btnFOBSummary" type="button" class="BloomButtonEnabled" value="FOB Summary" style="margin-left: 14px;">
                            </td>
                            <td>
                                <input id="btnConsignmentDetailed" type="button" class="BloomButtonEnabled" value="Consignment Detailed" style="margin-left: 14px;">
                            </td>
                            <td>
                                <input id="btnConsignmentSummary" type="button" class="BloomButtonEnabled" value="Consignment Summary" style="margin-left: 14px;">
                            </td>--%>

                            <td style="padding-left: 6px;">
                                <input class="Reports" type="checkbox" id="chkFarmDetailed">
                                <label for="chkFarmDetailed"><span style="padding: 1px;"></span>Farm Detailed</label>
                            </td>
                            <td style="padding-left: 10px;">
                                <input class="Reports" type="checkbox" id="chkFOBDetailed">
                                <label for="chkFOBDetailed"><span style="padding: 1px;"></span>FOB Detailed</label>
                            </td>

                            <td style="padding-left: 10px;">
                                <input class="Reports" type="checkbox" id="chkFOBSummary">
                                <label for="chkFOBSummary"><span style="padding: 1px;"></span>FOB Summary</label>
                            </td>
                            <td style="padding-left: 10px;">
                                <input class="Reports" type="checkbox" id="chkConsignmentDetailed">
                                <label for="chkConsignmentDetailed"><span style="padding: 1px;"></span>CONS Detailed</label>
                            </td>
                            <td style="padding-left: 10px;">
                                <input class="Reports" type="checkbox" id="chkConsignmentSummary">
                                <label for="chkConsignmentSummary" style="width: 166px;"><span style="padding: 1px;"></span>CONS Summary</label>
                            </td>
                            <td style="width: 34px;">
                                <img style='cursor: pointer; height: 26px;' src='images/printer-icon.png' id="imgPrintReports" />
                            </td>
                            <%--  <td>
                                <input id="btnImportGrowCg" type="button" class="BloomButtonEnabled" value="Import Growcg" style="margin-left: 14px; display: block;">
                            </td>--%>
                            <td>
                                <input id="btnGrowCg" type="button" class="BloomButtonEnabled" value="Deductions" style="margin-left: 14px; display: block;">
                            </td>
                            <td>
                                <input id="btnFarmEmail" type="button" class="BloomButtonEnabled" value="Emails" style="margin-left: 14px; display: block;">
                            </td>
                           <td>
                                <%--<input id="btnImportCharges" type="button" class="BloomButtonEnabled" value="Charges" style="margin-left: 14px; display: block;">--%>
                                <input id="btnExpenses" type="button" class="BloomButtonEnabled" value="Expenses" style="margin-left: 14px; display: block;">
                  </td>

                            <td style="padding-left: 20px; display: none">
                                <input type="checkbox" checked="checked" id="chkHeaderISActive">
                                <label for="chkHeaderISActive"><span style="padding: 1px;"></span>IsActive</label>
                            </td>
                            <%--<td>
                                <input id="btnByFarm" type="button" class="BloomButtonEnabled" value="By Farm" style="margin-left: 14px; display: block;">
                            </td>
                            <td>
                                <input id="btnByAWB" type="button" class="BloomButtonEnabled" value="By AWB" style="margin-left: 14px; display: block;">
                            </td>--%>
                        </tr>
                    </table>
                </td>

            </tr>
            <tr class="rowcss" id="trGrowerHeaderdatetitle">
                <td style="vertical-align: top">
                    <div id="divGrowerHeaderdateFilter" class="filterdiv" style="display: none; width: 450px; height: 240px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 450px; height: 240px;">
                            <table>
                                <tr>
                                    <td>From
                                    </td>
                                    <td>
                                        <input type="text" id="txtGrowerHeaderfrmdate" style="width: 80px;" />

                                    </td>
                                    <td>To
                                    </td>
                                    <td>
                                        <input type="text" id="txtGrowerHeadertodate" style="width: 80px" />

                                    </td>
                                    <td>
                                        <input type="button" class="SmallButton" id="btnGrowerHeaderdateok" value="Ok" />

                                    </td>
                                    <%--<td>
                                    <input type="button" class="SmallButton" id="btndateclear" value="Clear" />
                                </td>--%>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top;">
                                        <div id="divGrowerHeaderFromDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                    <td colspan="3" style="vertical-align: top;">
                                        <div id="divGrowerHeaderToDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <table>
        <tr>
            <td style="vertical-align: top;">
                <div id="DivGrowerHeader">
                    <table id="fgrdGrowerHeader" style="display: block;"></table>
                </div>
            </td>
            <%--<td id="tdhide" style="background-color: rgb(200, 157, 157); cursor: pointer; display: none">
                <span id="btnhide" style="font-size: initial;"><<</span>
            </td>--%>

            <td id="tdhide" style="background-color: rgb(200, 157, 157); cursor: pointer; display: none; vertical-align: top;">
                <span id="btnhide" style="font-size: initial; line-height: 500px;"><<</span>
            </td>
            <td style="vertical-align: top;">
                <div id="DivGrowerAWBHeader">
                    <table id="fgrdGrowerAWBHeader" style="display: block;"></table>
                </div>
                <div id="DivGrowerFarmHeader" style="display: none;">
                    <table id="fgrdGrowerFarmHeader" style="display: block;"></table>
                </div>
            </td>

            <td style="vertical-align: top;">
                <div id="DivGrowerFarmDetail">
                    <table id="fgrdGrowerFarmDetail" style="display: block;"></table>
                </div>
            </td>

        </tr>
    </table>
</div>

<%-- Grower Header Edit Dialog --%>
<div id="DivGrowerHeaderDialog" style="display: none;" align="center">
    <table style="text-align: left; width: 100%">
        <tr style="height: 27px">
            <td colspan="6">
                <div class="HeaderWarning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="HeaderYellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table style="margin-left: 16px">
                    <tr>
                        <td align="left">From</td>
                        <td>
                            <input type="text" id="txtGrowerHeaderFromdate" style="width: 250px; height: 16px; float: left" class="AllUpperCaseTextBox" />
                        </td>
                    </tr>

                    <tr>
                        <td align="left">To</td>
                        <td>
                            <input type="text" id="txtGrowerHeaderTodate" style="width: 250px; height: 16px; float: left" class="AllUpperCaseTextBox" />

                        </td>
                    </tr>

                    <tr>
                        <td align="left">Report Name</td>
                        <td colspan="3">
                            <input type="text" id="txtReportName" style="width: 250px; height: 16px; float: left" value="" class="AllUpperCaseTextBox" />
                        </td>
                    </tr>

                    <tr id="trRptNum">
                        <td align="left">Report #</td>
                        <td>
                            <input type="text" id="txtReportNumber" style="width: 250px; height: 16px; float: left" value="" maxlength="2" class="AllUpperCaseTextBox" />
                        </td>
                    </tr>
                </table>
                <table style="margin-left: 16px">
                    <tr>
                        <td align="left" style="padding:5px 0px;">
                            <input class="ImportChk" type="checkbox" value="0" id="chkImportFromPerviousSystem">
                            <label for="chkImportFromPerviousSystem"><span style="padding: 1px;"></span>Import from Previous system</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="ImportChk" type="checkbox" value="1" id="chkImportByReceivingDate">
                            <label for="chkImportByReceivingDate"><span style="padding: 1px;"></span>By receiving Dates</label> 
                        </td>
                    </tr>
                </table>
            </td>

        </tr>

    </table>
</div>

<%-- Grower Details Edit Dialog --%>
<div id="DivGrowerDetailDialog" style="display: none;" align="center">
    <table style="text-align: left; border-collapse: collapse;">
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
        <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
        <tr style="height: 50px;">
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; display: none;" class="boldfont">Flower</td>
                        <td colspan="2" style="display: none;">
                            <select placeholder='Choose Flower...' id="lstGrowerDetailFlower" style="width: auto;" value="" />
                            <input type="hidden" id="hfGrowerDetailFlower" />
                        </td>
                        <td class="boldfont" style="padding-left: 3px; padding-right: 35px;">Flower</td>
                        <td>
                            <input type="text" style="width: 111px" maxlength="15" id="txtGrowerDetailFlowerCode" disabled />
                        </td>
                        <td class="boldfont" style="padding-left: 6px; padding-right: 26px;">Desc</td>
                        <td>
                            <input type="text" style="width: 368px" maxlength="15" id="txtGrowerDetailFlowerDesc" disabled />
                            <input type="hidden" id="hfFarm" />
                        </td>
                    </tr>
                </table>
            </td>

        </tr>

        <tr>
            <td colspan="2">
                <table>
                    <tbody>
                        <tr>
                            <td class="boldfont" style="padding-left: 3px; padding-right: 25px;">Qty_Rec</td>
                            <td>
                                <input type="text" id="txtGrowerDetailQuantity_rec" style="width: 52px; text-align: right;" class="NumbersOnly" maxlength="5">
                                <select id="lstGrowerDetailUOM" style="width: 55px; height: 23px">
                                </select>
                                <input type="hidden" id="hfGrowerDetailUOM">
                            </td>
                            <td class="boldfont" style="padding-right: 24px;">Units</td>
                            <td>
                                <input type="text" id="txtGrowerDetailUnits" style="width: 52px; text-align: right;" class="NumbersOnly" maxlength="4"></td>
                            <td class="boldfont">Total Units</td>
                            <td>
                                <input type="text" id="txtGrowerDetailTotalUnits" style="width: 70px; text-align: right;" disabled></td>
                            <td class="boldfont">
                                <label class="boldfont">Cost/Unit</label></td>
                            <td>
                                <input type="text" id="txtGrowerDetailCost" class="DecimalsOnly" style="width: 52px; text-align: right">
                            </td>
                            <td class="boldfont" colspan="3">
                                <label class="boldfont" style="padding-right: 25px;">Total$</label></td>
                            <td>
                                <input type="text" id="txtGrowerDetailGross" class="DecimalsOnly" style="width: 52px; text-align: right">
                            </td>

                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <table>
                    <tbody>
                        <tr>
                            <td class="boldfont" style="padding-left: 3px; padding-right: 21px;">Qty_Sold</td>
                            <td style="">
                                <input type="text" id="txtGrowerDetailQuantity" style="width: 52px; text-align: right;" class="NumbersOnly" maxlength="5">
                                <label class="boldfont" style="padding-left: 65px; padding-right: 18px;">
                                    Adjust</label>
                            </td>
                            <td style="padding-left: 0px;" class="boldfont">
                                <input style="width: 52px; text-align: right" type="text" id="txtGrowerDetailAdjust" class="DecimalsOnly">
                            </td>
                            <td class="boldfont" style="padding-left: 2px; padding-right: 5px;">
                                <label style="padding-right: 33px; padding-left: 3px;">
                                    Freight</label>
                                <input style="width: 70px; text-align: right" type="text" id="txtGrowerDetailFreight" class="DecimalsOnly">
                            </td>
                            <td class="boldfont" style="padding-right: 26px;">Duties</td>
                            <td>
                                <input style="width: 52px; text-align: right" type="text" id="txtGrowerDetailDuties" class="DecimalsOnly">
                            </td>
                            <td class="boldfont">
                                <label style="padding-right: 10px;">
                                    Sold Price</label>
                                <input type="text" id="txtGrowerDetailPrice" class="DecimalsOnly" style="width: 52px; text-align: right">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>

        </tr>

        <tr>
            <td colspan="2">
                <table>
                    <tbody>
                        <tr>
                            <td class="boldfont" style="padding-left: 3px;">Fumigation</td>
                            <td>
                                <input type="text" id="txtGrowerDetailFumigation" style="width: 52px; text-align: right" class="DecimalsOnly">
                                <label style="/* text-align: right; */padding-left: 65px; padding-right: 18px;" class="boldfont">Other</label></td>
                            <td>
                                <input type="text" id="txtGrowerDetailOther" class="DecimalsOnly" style="width: 52px; text-align: right">
                            </td>
                            <td class="boldfont" style="padding-left: 3px; padding-right: 25px;">DateRec</td>
                            <td>
                                <input type="text" id="txtGrowerDetailDaterec" style="width: 70px; text-align: right">
                            </td>
                            <td class="boldfont" style="padding-left: 7px; padding-right: 36px;">AWB</td>
                            <td>
                                <input type="text" id="txtGrowerDetailAwb" class="NumbersOnly" maxlength="12" style="width: 100px; text-align: right">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>



        <tr>
            <td colspan="2">
                <table>
                    <tbody>
                        <tr>
                            <td class="boldfont" style="padding-left: 3px; padding-right: 35px;">Invoice</td>
                            <td style="padding-left: 3px;">
                                <input type="text" id="txtGrowerDetailInvoice" class="DecimalsOnly" style="width: 52px; text-align: right">
                            </td>

                            <td style="/* text-align: right; */padding-left: 61px;" class="boldfont">Boxnum</td>
                            <td>
                                <input type="text" id="txtGrowerDetailBoxnum" style="width: 52px; text-align: right;" disabled>
                                <label style="padding-left: 8px; padding-right: 40px; font-weight: bold;">
                                    Type</label>
                            </td>
                            <td>
                                <input type="text" id="txtGrowerDetailType" style="width: 15px; text-align: left;" maxlength="1" class="AllUpperCaseTextBox SpecifiedCharOnly"></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>




    </table>
</div>

<%-- Grower Image Upload Dialog --%>
<div id="DivInvoiceImageDialog" style="display: none">
    <table style="width: 100%">
        <tr style="height: 30px">
            <td>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr id="trUploadInvoiceFiles" style="display: none;">
            <td>
                <form action="UploadGrowerInvoiceFiles.aspx" method="post" enctype="multipart/form-data" id="invoicefileuploader" target="upload_target" onsubmit="startInvoiceFileUpload();">
                    <input type="text" name="hdndetailid" id="hdndetailid" style="display: none;" />
                    <input type="text" name="hdninvoice" id="hdninvoice" style="display: none;" />
                    <input type="text" name="hdnawb" id="hdnawb" style="display: none;" />
                    <p id="upload_File_process">
                        Uploading...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="import_File_process">
                        Importing...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="upload_File_form" align="left">
                        <%--<input name="GrowerInvoiceFile" id="GrowerInvoiceFile" accept=".pdf,.png" type="file" size="30" />--%>
                        <input name="GrowerInvoiceFile" id="GrowerInvoiceFile" type="file" size="30" />
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivShowInvoiceImage" style="width: 665px; height: 440px;">
                    <p id="ShowFileName" style="text-align: center; font-weight: bold;"></p>
                    <div id="HeaderImagezoom_container"></div>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-select" class="DialogDiv" style="display: none;" title="Alert">
    <div class="DialogBreak">
        <p id="msg" class="DeleteDialogMsg"></p>
    </div>
</div>

<div id="Pleasewait-Dialog" class="DialogDiv" style="display: none;" title="Alert">
    <div class="DialogBreak">
        <p id="Pleasewait-msg"></p>
    </div>
</div>



<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="MsgDetailWarning" style="display: none;">
    <p id="MsgDetailHtml"></p>
</div>


<div id="DialogChangeLockStatus" style="display: none;">
    <p id="MsgChangeLockStatus"></p>
</div>


<div id="GetFarmAndDateRangeDialogBeforePrint" style="display: none; background: #ebf3f3;">
    <table>

        <tr>
            <td>Farm
                <select id="lstFarmForHeaderReport" style="width: 84px; height: 23px; margin-left: 25px;"></select>
            </td>

            <td style="width: 122px;">
                <div class="chkGrowerReportAsSinglePdf">
                    <input type="checkbox" id="chkGrowerReportAsSinglePdf">
                    <label for="chkGrowerReportAsSinglePdf" style="width: 149px;"><span style="padding: 1px;"></span>As Single PDF</label>
                </div>
            </td>


            <td style="padding-left: 95px;">
                <input type="checkbox" id="chkEmailToFarm">
                <label for="chkEmailToFarm" style="width: 149px;"><span style="padding: 1px;"></span>Email Farm</label>
            </td>
            <%--<input type="checkbox" id="chkEmailMeOnly">
                <label for="chkEmailMeOnly" style="width: 166px;"><span style="padding: 1px;"></span>Me Only</label>--%>
            <%--<td style="padding-left: 27px;">
                
            </td>--%>
        </tr>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td>From
                        </td>
                        <td>
                            <input type="text" id="txtGrowerReportfrmdate" style="width: 80px;" />

                        </td>
                        <td>To
                        </td>
                        <td>
                            <input type="text" id="txtGrowerReporttodate" style="width: 80px" />

                        </td>
                        <%--<td>
                                    <input type="button" class="SmallButton" id="btndateclear" value="Clear" />
                                </td>--%>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div id="divGrowerReportFromDate" style="max-height: 162px; vertical-align: top;"></div>
                        </td>
                        <td colspan="3">
                            <div id="divGrowerReportToDate" style="max-height: 162px; vertical-align: top;"></div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
</div>


<div id="GrowerDetailNotesDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr style="display: none;">
            <td>Note#
            </td>
            <td>
                <input type="text" id="txtGrowerNoteNo" style="width: 80px; display: none;" />
            </td>
        </tr>
        <tr>
            <td>Notes</td>
            <td>
                <input type="text" id="txtGrowerNotes" style="width: 300px;">
            </td>
            <td>Amount</td>
            <td>
                <input type="text" id="txtGrowerNotesAmount" class="" style="width: 80px;">
            </td>
            <td>
                <button type="button" id="btnAddGrowerNotes" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Add Note</span></button>
                <%--<button id="btnAddGrowerNotes" class="dialogbuttonstyle icon-save NumbersOnly" type="button" style="margin-left: 5px;">Add Notes</button>--%>
            </td>
        </tr>

        <tr>
            <td colspan="5">
                <div id="DivFgrdGrowerDetailNotes">
                    <table id="fgrdGrowerDetailNotes" style="display: block;"></table>
                </div>
            </td>
        </tr>

    </table>
</div>

<div id="NoteID" style="display: none;">0</div>


<div id="GrowCgDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>
                <div id="DivFgrdGrowerCg">
                    <table id="fgrdGrowerCg" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>


<div id="DivExpensesDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>
                <div id="DivExpenses">
                    <table id="fgrdExpenses" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivExpensesSaveDialog" style="display: none; background: #ebf3f3;">
    <table>

        <tr>
            <td>AWB #</td>
            <td>
                <input type="text" id="txtAWB"  style="width: 120px;"/>
                <input type="hidden" id="txtExpenseID" />
            </td>
            <td><img style="height: 26px;" src='images/search.png' id="ImgAvailableAWBs" /></td>
        </tr>
        <tr style="">
            <td>FARM</td>
            <td> <select id="txtFARM" class="enterKeyPressControl1" style="width: 125px; height: 23px">
                </select>
                <%--<input type="text" id="txtFARM"  style="width: 120px;text-transform:uppercase;" />--%>
            </td>
        </tr>
        <tr>
            <td>INVOICE</td>
            <td><input type="text" id="txtINVOICE"  style="width: 120px;" /></td>
        </tr>
        <tr>
            <td>ENTRYNUM</td>
            <td><input type="text" id="txtENTRYNUM"  style="width: 120px;" /></td>
        </tr>
        <tr>
            <td>DATE</td>
            <td><input type="text" id="txtDATE"  style="width: 120px;" /></td>
        </tr>
        <tr>
            <td>FULL BOXES</td>
            <td><input type="text" id="txtBOXES"  style="width: 120px; text-align:right;" placeholder="0" /></td>
        </tr>
        <tr>
            <td>TOT.FREIGHT</td>
            <td><input type="text" id="txtFREIGHT"  style="width: 120px; text-align:right;" placeholder="0.00" /></td>
        </tr>
        <tr>
            <td>TOT.HANDLING</td>
            <td><input type="text" id="txtHandling"  style="width: 120px; text-align:right;" placeholder="0.00" /></td>
        </tr>
     
        <tr>
            <td>FUMIGATION</td>
            <td><input type="text" id="txtFUMIGATION"  style="width: 120px; text-align:right;" placeholder="0.00"/></td>
        </tr>
        <tr>
            <td>OTHER CHARGES</td>
            <td><input type="text" id="txtOtherCharges"  style="width: 120px; text-align:right;" placeholder="0.00"/></td>
        </tr>
    </table>
</div>

<div id="DivExpensesAWBListDialog" style="display: none; background: #ebf3f3;">
    <div style="height:400px !important;overflow:auto !important;">
        <table id="awbList" style="width: 100%; height: 100%;" border="1">
            <thead>
                <tr>
                    <td class='AWBListtd' style="text-align: center; vertical-align: middle;">AWB</td>
                    <td class='AWBListtd' style="text-align: center; vertical-align: middle;">Date</td>
                    <td class='AWBListtd' style="text-align: center; vertical-align: middle;">Pieces</td>
                    <td class='AWBListtd' style="text-align: center; vertical-align: middle;">FBE</td>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>


<div id="GrowerCgSaveDialog" style="display: none; background: #ebf3f3;">
    <table>

        <tr>
            <td>Farm
            </td>
            <td>
                <input type="text" id="txtGrowCgFarm" class="AllUpperCaseTextBox" style="width: 80px;" />
            </td>
        </tr>

        <tr>
            <td>Date 
            </td>
            <td>
                <input type="text" id="txtGrowCgDate" style="width: 80px;" />
            </td>
        </tr>
        <tr>
            <td>Amount</td>
            <td>
                <input type="text" id="txtGrowCgAmount" class="" style="width: 80px; text-align: right;">
            </td>
        </tr>

        <tr>
            <td>Reason</td>
            <td>
                <input type="text" id="txtGrowCgReason" class="AllUpperCaseTextBox" style="width: 256px;">
            </td>
        </tr>
    </table>
</div>

<div id="DivGrowerInv" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>
                <div id="DivFgrdGrowerInv">
                    <table id="fgrdGrowerInv" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<%-- Grower Farm Header Image Upload Dialog --%>
<div id="DivFarmImageDialog" style="display: none">
    <table style="width: 100%">
        <tr style="height: 30px">
            <td>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr id="trUploadFarmFiles" style="display: none;">
            <td>
                <form action="UploadGrowerFarmFiles.aspx" method="post" enctype="multipart/form-data" id="farmfileuploader" target="upload_target" onsubmit="startFarmFileUpload();">
                    <input type="text" name="hdnfarmheaderid" id="hdnfarmheaderid" style="display: none;" />
                    <input type="text" name="hdnfarmcode" id="hdnfarmcode" style="display: none;" />
                    <input type="text" name="hdnfarmdetailid" id="hdnfarmdetailid" style="display: none;" />
                    <p id="upload_FarmFile_process">
                        Uploading...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="import_FarmFile_process">
                        Importing...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="upload_FarmFile_form" align="left">
                        <%--<input name="GrowerFarmFile" id="GrowerFarmFile" accept=".pdf,.png" type="file" size="30" />--%>
                        <input name="GrowerFarmFile" id="GrowerFarmFile" type="file" size="30" />
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivShowFarmImage" style="width: 665px; height: 440px;">
                    <p id="ShowFarmFileName" style="text-align: center; font-weight: bold;"></p>
                    <div id="HeaderFarmImagezoom_container"></div>
                    <div id="HeaderFarmPdfzoom_container" style="display: none">
                        <iframe id="IfrmPDFFile" width="665" height="440"></iframe>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

<div style="display: none" id="DivHeaderID">0</div>
<div style="display: none" id="DivDetailID">0</div>
<div style="display: none" id="DivDetailID1">0</div>
<div style="display: none" id="DivFarmOrAWB">0</div>
<div style="display: none" id="DivFarmID">0</div>
<div id="DivGrowerDetailFlowerCategory" style="display: none"></div>
<div id="DivGrowerDetailFlowerColorCode" style="display: none"></div>

<div style="display: none" id="DivGrowcgID">0</div>


<div id="DivReinsertFarmDialog" style="display: none;" align="center">
    <table style="text-align: left; width: 100%">
        <tr style="height: 27px">
            <td colspan="6">
                <div class="HeaderWarning_Reinsert" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="HeaderYellowWarning_Reinsert" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr>
            <td align="left">From</td>
            <td>
                <input type="text" id="txtGrowerHeaderFromdate_Reinsert" style="width: 250px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td align="left">To</td>
            <td>
                <input type="text" id="txtGrowerHeaderTodate_Reinsert" style="width: 250px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td align="left">Report Name</td>
            <td colspan="3">
                <input type="text" id="txtReportName_Reinsert" style="width: 250px; height: 16px; float: left" value="" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td align="left">Farm</td>
            <td>
                <input type="text" id="txtFarmForReinsert" style="width: 100px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>
    </table>
</div>


<div id="DivFarmEmailDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>
                <div id="DivFgrdFarmEmail">
                    <table id="fgrdFarmEmail" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<div style="display: none" id="DivFarmEmailID">0</div>

<div id="DivFarmEmailSaveDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>Farm
            </td>
            <td>
                <input type="text" id="txtGrowerFarm" class="AllUpperCaseTextBox" style="width: 80px;" />
            </td>
        </tr>

        <tr>
            <td>Email</td>
            <td>
                <textarea cols="5" rows="5" id="txtGrowerEmail" class="" style="width: 385px;"></textarea>
            </td>
        </tr>
    </table>
</div>

<div id="IsGrowerDelete" runat="server"></div>



<script type="text/javascript">

    $(document).ready(new function () {
        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";
        var IsGrowerAWBHeaderInitialize = false;
        var IsGrowerFarmHeaderInitialize = false;
        var IsGrowerFarmDetailInitialize = false;

        $("#txtAWB").keypress(function (e) {
            debugger;
            if (e.keyCode == 13) {
                $("#txtINVOICE").focus();
            }
        });
        $("#chkByAWBFarm").iButton({
            labelOn: "AWB",
            labelOff: "Farm"
        });

        $("#chkByAWBFarm").iButton("toggle", true);
        //   $("#DivGrowerAWBFarmType").find('button:first').addClass('is-checked');

        var ScopeHeaderID, ScopeFarmCode;
        $("#msgbox-select").dialog({
            autoOpen: false,
            resizable: false,
            width: 320,
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


        $("#Pleasewait-Dialog").dialog({
            autoOpen: false,
            resizable: false,
            width: 320,
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

        $('.ImportChk').on('change', function () {
            $('.ImportChk').not(this).prop('checked', false);
        });

        //For date filter

        $(function () {
            $("#divGrowerHeaderFromDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtGrowerHeaderfrmdate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#divGrowerHeaderToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtGrowerHeadertodate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#txtGrowerHeaderfrmdate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txtGrowerHeadertodate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });

        //For date filter

        $(function () {
            $("#divGrowerReportFromDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtGrowerReportfrmdate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#divGrowerReportToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtGrowerReporttodate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#txtGrowerReportfrmdate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txtGrowerReporttodate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });

        // function LoadDate() {


        var d = new Date();
        //d.setMonth(d.getMonth() - 3);
        d.setYear(d.getFullYear() - 1);
        var fromdate = d.toString('MM/dd/yyyy');
        var todate = new Date();
        //alert(new Date('MM/dd/yyyy'));

        $("#txtGrowerHeaderfrmdate").val(fromdate);
        $("#txtGrowerHeadertodate").val(todate.toString('MM/dd/yyyy'));
        $("#lblGrowerHeaderchosendate").html(fromdate + ' to ' + todate.toString('MM/dd/yyyy'));
        $("#lblGrowerHeaderchosendate1").html(fromdate);
        $("#lblGrowerHeaderchosendate2").html(todate.toString('MM/dd/yyyy'));
        $("#divGrowerHeaderFromDate").datepicker("setDate", Date.parse(fromdate));
        $("#divGrowerHeaderToDate").datepicker("setDate", Date.parse(todate.toString('MM/dd/yyyy')));
        $("#imgGrowerHeaderDate").attr("src", "images/Filter.png");
        $("#trGrowerHeader").addClass('FilterDivStyle');
        //}

        //For to focus the next Textbox on enter key press
        $('input').keypress(function (e) {
            var key = e.which;
            if (key == 13) // the enter key code
            {

                if ($(this).attr('id') == "txtGrowerNotesAmount") {
                    $("#btnAddGrowerNotes")[0].focus();
                }

                for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                    var a;
                    if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                        a = i;
                    }

                    if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
                    $(this).closest('tr').find('input')[i].type != "hidden") {
                        // $(this).closest('tr').find('input')[i].value = "";
                        $(this).closest('tr').find('input')[i].focus();
                        return false;
                    }
                    else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != 'btnGrowerHeaderdateok') {
                        if ($(this).closest('tr').next('tr').find('input').length > 0) {
                            //$(this).closest('tr').next('tr').find('input')[0].value = "";
                            $(this).closest('tr').next('tr').find('input')[0].focus();
                        }
                        else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0) {
                            // $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].value = "";
                            $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                        }
                        else if ($(this).attr('id') == "txtReportNumber" || $(this).attr('id') == "txtGrowCgReason" || $(this).attr('id') == "txtGrowerDetailType")
                            $(this).closest('div').next('div').find('button')[0].focus();
                        return false;
                    }
                }
            }
        });


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

        $(".SpecifiedCharOnly").keypress(function (event) {
            return isSpecified(event, this)
        });

        function isSpecified(evt, element) {

            if ($(element)[0].id == "txtGrowerDetailType" >= 0) {
                //M-77, m-109 ,P-80, p-112 ,S-83, s-115 ,B-66, b-98 
                var charCode = (evt.which) ? evt.which : event.keyCode
                //if ((charCode == 77 || charCode == 109 || charCode == 80 || charCode == 112 || charCode == 83 ||
                //charCode == 115 || charCode == 66 || charCode == 98 || charCode == 8)) {
                $(element).val("");
                return true;
                //}
                //return false;
            }
        }

        var rest = $("#txtGrowerHeaderfrmdate").val();
        //For GrowerHeader grid
        $("#fgrdGrowerHeader").flexigrid({
            url: 'BloomService.asmx/GetGrowerHeaderForFgrd',
            dataType: 'xml',
            colModel: [
            //{ display: '', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
            { display: 'From', name: 'GrowerFromDate', width: 40, sortable: true, align: 'Left', process: GrowerHeaderRowClick },
            { display: 'To', name: 'GrowerToDate', width: 40, sortable: true, align: 'Left', process: GrowerHeaderRowClick },
            { display: 'Name', name: 'ReportName', width: 90, sortable: true, align: 'left', process: GrowerHeaderRowClick },
            { display: 'Rpt #', name: 'ReportNumber', width: 25, sortable: true, align: 'left', process: GrowerHeaderRowClick },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: 'XL', name: '', width: 15, sortable: true, align: 'left' },
            { display: 'GrowerLockContent', name: 'GrowerLockContent', width: 15, sortable: true, align: 'left', hide: true },
            ],
            showTableToggleBtn: true,
            sortname: "GrowerFromDate desc",
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
            autoload: true,
            showTableToggleBtn: false,
            rp: 30000,
            height: $(window).height() - 283,
            width: 355,//385,350
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() },
                { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() },
                { name: 'IsActive', value: 1 },
            ],
            searchitems: [
                 { display: 'Name', name: 'ReportName' },
                 { display: 'Report #', name: 'ReportNumber' },
            ],
            onSuccess: function () {

                //For to show the error
                if ($("#fgrdGrowerHeader tr#row-2").length > 0) {
                    $("#fgrdGrowerHeader tr#row-2").hide();
                    $.MessageBox($("#fgrdGrowerHeader tr#row-2")[0].innerText);
                    return false;
                }
                $("#DivGrowerHeader #ExportCSV").show();

                $("#fgrdGrowerHeader td:nth-child(1)").show();
                $("#fgrdGrowerHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();


                if ($("#ctl00_IsGrowerDelete").html() == "1") {
                    $("#fgrdGrowerHeader td:nth-child(1)").show();
                    $("#fgrdGrowerHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                }
                else {
                    $("#fgrdGrowerHeader td:nth-child(1)").hide();
                    $("#fgrdGrowerHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                }


                //if ($("#fgrdGrowerHeader td:nth-child(1)")[0].innerHTML.trim() == "" || $("#fgrdGrowerHeader td:nth-child(1)")[0].innerHTML.trim() =='<div style="text-align: center; width: 15px;">&nbsp;</div>') {
                //    $("#fgrdGrowerHeader td:nth-child(1)").hide();
                //    $("#fgrdGrowerHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                //}
                //else {
                //    $("#fgrdGrowerHeader td:nth-child(1)").show();
                //    $("#fgrdGrowerHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                //}

                if ($("#DivHeaderID").html() != "0" && $("#fgrdGrowerHeader #row" + $("#DivHeaderID").html()).css('display') == "table-row") {
                    var id = $("#DivHeaderID").html();
                    $("#fgrdGrowerHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrowerHeader td.unsorted").addClass("sorted");
                    $("#fgrdGrowerHeader td.sorted").removeClass("unsorted");
                    $("#fgrdGrowerHeader #row" + id).addClass("trSelectedHeader");
                    $("#fgrdGrowerHeader #row" + id).removeClass("trSelected");
                    $("#fgrdGrowerHeader #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdGrowerHeader #row" + id + " td.unsorted").removeClass("sorted");


                    //var FilterQuery = "HeaderID=" + id;

                    //if ($("#DivFarmOrAWB").html() == "0") {
                    //    if (IsGrowerAWBHeaderInitialize == false) {
                    //        LoadGrowerAWBHeader(FilterQuery);
                    //        IsGrowerAWBHeaderInitialize = true;
                    //    }
                    //    else {
                    //        $("#fgrdGrowerAWBHeader").empty();
                    //        $("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    //    }
                    //}
                    //else if ($("#DivFarmOrAWB").html() == "1") {
                    //    if (IsGrowerFarmHeaderInitialize == false) {
                    //        LoadGrowerFarmHeader(FilterQuery);
                    //        IsGrowerFarmHeaderInitialize = true;
                    //    }
                    //    else {
                    //        $("#fgrdGrowerFarmHeader").empty();
                    //        $("#fgrdGrowerFarmHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    //    }
                    //}
                }
            }
        });

        $("#DivGrowerHeader .pcontrol input").css("width", "40px")
        $("#DivGrowerHeader .btnseparator:eq(0)").hide();
        $("#DivGrowerHeader .pSearch").hide();
        $("#DivGrowerHeader .sDiv2").css("width", "290px");
        $("#DivGrowerHeader .pDiv2").css("width", "300px").css("margin-top", "3px");
        $('#DivGrowerHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivGrowerHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivGrowerHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

        //for GrowerHeaderFromDate datepicker
        $("#txtGrowerHeaderFromdate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

        //for GrowerHeaderToDate datepicker
        $("#txtGrowerHeaderTodate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

        //for GrowerHeaderFromDate datepicker
        $("#txtGrowerHeaderFromdate_Reinsert").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

        //for GrowerHeaderToDate datepicker
        $("#txtGrowerHeaderTodate_Reinsert").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

        //for date filter getDateSession
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetDateSession',
        //    data: "{}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (dateoutput, status) {

        //        var date = dateoutput.d;
        //        if (date == null || date == "" || date[0] === "" && date[1] === "") {
        //            var fdate = "Today: " + $("#txtGrowerHeadertodate").val();
        //            $("#lblGrowerHeaderchosendate").html(fdate);
        //            $("#lblGrowerHeaderchosendate1").html($("#txtGrowerHeaderfrmdate").val());
        //            $("#lblGrowerHeaderchosendate2").html($("#txtGrowerHeadertodate").val());
        //            $("#divGrowerHeaderFromDate").datepicker("setDate", new Date());
        //            $("#divGrowerHeaderToDate").datepicker("setDate", new Date());
        //            $("#imgGrowerHeaderDate").attr("src", "images/Filter.png");
        //            $("#trGrowerHeader").addClass('FilterDivStyle');
        //        }
        //        else {
        //            var fdate = date[0] + " to " + date[1];
        //            $("#txtGrowerHeaderfrmdate").val(date[0]);
        //            $("#txtGrowerHeadertodate").val(date[1]);
        //            $("#lblGrowerHeaderchosendate").html(fdate);
        //            $("#lblGrowerHeaderchosendate1").html(date[0]);
        //            $("#lblGrowerHeaderchosendate2").html(date[1]);
        //            $("#divGrowerHeaderFromDate").datepicker("setDate", Date.parse(date[0]));
        //            $("#divGrowerHeaderToDate").datepicker("setDate", Date.parse(date[1]));
        //            $("#imgGrowerHeaderDate").attr("src", "images/Filter.png");
        //            $("#trGrowerHeader").addClass('FilterDivStyle');
        //        }
        //    }
        //});

        function GrowerHeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {
                $("#chkByAWBFarm").iButton("toggle", true);
                if ($("#DivFarmOrAWB").html() == "0") {
                    $("#DivGrowerAWBHeader").show();
                    $("#DivGrowerFarmHeader").show();
                }
                else if ($("#DivFarmOrAWB").html() == "1") {
                    $("#DivGrowerFarmHeader").show();
                    $("#DivGrowerAWBHeader").show();
                }
                $("#DivGrowerFarmDetail").hide();
                $("#tdhide").show();

                if (id != 0) {
                    var FilterQuery = "";
                    FilterQuery = "HeaderID=" + id;
                    ScopeHeaderID = id;

                    if (IsGrowerAWBHeaderInitialize == false && IsGrowerFarmHeaderInitialize == false) {
                        if (id.toString() != $("#DivHeaderID").html()) {
                            LoadGrowerAWBHeader(FilterQuery);
                            IsGrowerAWBHeaderInitialize = true;

                            LoadGrowerFarmHeader(FilterQuery);
                            IsGrowerFarmHeaderInitialize = true;
                        }
                    }
                    else {
                        if (id.toString() != $("#DivHeaderID").html()) {
                            $("#fgrdGrowerAWBHeader").empty();
                            $("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

                            $("#fgrdGrowerFarmHeader").empty();
                            $("#fgrdGrowerFarmHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }

                    $("#DivHeaderID").html(id.toString());

                    $("#fgrdGrowerHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrowerHeader #row" + id).addClass("trSelectedHeader");
                    $("#fgrdGrowerHeader td.unsorted").addClass("sorted");
                    $("#fgrdGrowerHeader td.sorted").removeClass("unsorted");
                    $("#fgrdGrowerHeader #row" + id).removeClass("trSelected");
                    $("#fgrdGrowerHeader #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdGrowerHeader #row" + id + " td.unsorted").removeClass("sorted");
                    $("#DivDetailID").html("");
                    $("#DivFarmID").html("0");
                }
            });
        }

        //Grid for AWBHeader
        function LoadGrowerAWBHeader(FilterQuery) {

            $("#fgrdGrowerAWBHeader").flexigrid({
                url: 'BloomService.asmx/GetGrowerAWBHeaderForFgrd',
                dataType: 'xml',
                colModel: [
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: 'Awb', name: 'Awb', width: 75, sortable: true, align: 'right', process: GrowerAWBHeaderRowClick },
                { display: 'Received', name: 'ReceivingDate', width: 55, sortable: true, align: 'left', process: GrowerAWBHeaderRowClick },
                { display: 'FBE_rec', name: 'FBE_rec', width: 60, sortable: true, align: 'right', process: GrowerAWBHeaderRowClick },
                { display: 'FBE_Sold', name: 'FBE_Sold', width: 60, sortable: true, align: 'right', process: GrowerAWBHeaderRowClick },
                ],
                showTableToggleBtn: true,
                sortname: "Awb desc",
                sortorder: "",
                usepager: true,
                title: false,
                useRp: true,
                qtype: "Awb",
                nomsg: 'No records found!',
                singleSelect: true,
                showToggleBtn: false,
                resizable: false,
                colresize: false,
                autoload: true,
                showTableToggleBtn: false,
                rp: 30000,
                height: $(window).height() - 287,
                width: 340, //305,//1060
                striped: true,
                searchitems: [
                     { display: 'Awb', name: 'Awb' },
                     { display: 'Received', name: 'ReceivingDate' },
                ],
                params: [
                     { name: 'Filter', value: FilterQuery },
                     { name: 'ExportCSV', value: '' }
                ],
                onSuccess: function () {

                    //For to show the error
                    if ($("#fgrdGrowerAWBHeader tr#row-2").length > 0) {
                        $("#fgrdGrowerAWBHeader tr#row-2").hide();
                        $.MessageBox($("#fgrdGrowerAWBHeader tr#row-2")[0].innerText);
                        return false;
                    }

                    var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
                    var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();


                    $("#fgrdGrowerAWBHeader td:nth-child(1)").show();
                    $("#fgrdGrowerAWBHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();

                    if ($("#ctl00_IsGrowerDelete").html() == "1") {
                        if (IsLocked.trim() != "") {
                            $("#fgrdGrowerAWBHeader td:nth-child(1)").hide();
                            $("#fgrdGrowerAWBHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                        }
                        else {
                            $("#fgrdGrowerAWBHeader td:nth-child(1)").show();
                            $("#fgrdGrowerAWBHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                        }

                    }
                    else {
                        $("#fgrdGrowerAWBHeader td:nth-child(1)").hide();
                        $("#fgrdGrowerAWBHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                    }

                    $("#DivGrowerAWBHeader #ExportCSV").show();

                    //For TotalRows

                    $('#fgrdGrowerAWBHeader #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                    $('#fgrdGrowerAWBHeader #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                    $('#fgrdGrowerAWBHeader #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });

                    $('#fgrdGrowerAWBHeader #row0').addClass("TotalRows");

                    if ($("#DivHeaderID").html() != "0" && $("#DivDetailID").html() != "" && $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).css('display') == "table-row") {

                        var id = $("#DivDetailID").html();
                        $("#fgrdGrowerAWBHeader [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdGrowerAWBHeader td.unsorted").addClass("sorted");
                        $("#fgrdGrowerAWBHeader td.sorted").removeClass("unsorted");
                        $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
                        $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
                        $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
                        $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");
                        $("#DivFarmID").html("0");

                        var awb = $("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(2) div").html().replace(/\-/g, '');;
                        var recdate = $("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(3) div").html();

                        if (awb === "" || awb == null || awb === "&nbsp;") {
                            awb = '0';
                        }

                        var FilterQuery = "HeaderID=" + $("#DivHeaderID").html() + " and Awb='" + awb + "' and ReceivingDate='" + recdate + "'";
                        if (IsGrowerFarmDetailInitialize == false) {
                            LoadGrowerFarmDetail(FilterQuery);
                            IsGrowerFarmDetailInitialize = true;
                        }
                        else {
                            $("#fgrdGrowerFarmDetail").empty();
                            $("#fgrdGrowerFarmDetail").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }
                }
            });

            $("#DivGrowerAWBHeader .pcontrol input").css("width", "40px")
            $("#DivGrowerAWBHeader .btnseparator:eq(0)").hide();
            $("#DivGrowerAWBHeader .pSearch").hide();
            $("#DivGrowerAWBHeader .sDiv2").css("width", "270px");
            $("#DivGrowerAWBHeader .sDiv2 input.qsbox").css('width', '110px');
            $('#DivGrowerAWBHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivGrowerAWBHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivGrowerAWBHeader .pDiv").find(".pDiv2").find(".pReload").show();
            $("#DivGrowerAWBHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -45px').show();
            $("#DivGrowerAWBHeader .pDiv").find(".pDiv2").find(".pPageStat").attr('style', 'margin-left: -10px').show();
        }

        //Grid for FarmHeader
        function LoadGrowerFarmHeader(FilterQuery) {

            $("#fgrdGrowerFarmHeader").flexigrid({
                url: 'BloomService.asmx/GetGrowerFarmHeaderForFgrd',
                dataType: 'xml',
                colModel: [
                    { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                    { display: 'Farm', name: 'Farm', width: 26, sortable: true, align: 'left', process: GrowerFarmHeaderRowClick },
                    { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                    { display: 'Type', name: 'FOB', width: 5, sortable: true, align: 'left', process: GrowerFarmHeaderRowClick },
                    { display: 'Boxes_rec', name: 'Boxes_rec', width: 45, sortable: true, align: 'right', process: GrowerFarmHeaderRowClick },
                    { display: 'FBE_rec', name: 'FBE_rec', width: 45, sortable: true, align: 'right', process: GrowerFarmHeaderRowClick },
                    { display: '$ AMOUNT', name: 'GROSS', width: 67, sortable: true, align: 'right', process: GrowerFarmHeaderRowClick },
                    { display: '', name: '', width: 15, sortable: false, align: 'left' },
                    { display: 'Airport', name: '', width: 15, sortable: false, align: 'left', hide: true },
                    { display: 'Country', name: '', width: 15, sortable: false, align: 'left', hide: true },
                    { display: 'Name', name: '', width: 15, sortable: false, align: 'left', hide: true },
                    { display: '', name: '', width: 15, sortable: false, align: 'left' }
                ],
                showTableToggleBtn: true,
                sortname: "Farm asc",
                sortorder: "",
                usepager: true,
                title: false,
                useRp: true,
                qtype: "Farm",
                nomsg: 'No records found!',
                singleSelect: true,
                showToggleBtn: false,
                resizable: false,
                colresize: false,
                autoload: true,
                showTableToggleBtn: false,
                rp: 30000,
                height: $(window).height() - 287,
                width: 340, //305,//1060//315//310,402
                striped: true,
                searchitems: [
                     { display: 'Farm', name: 'Farm' },
                     { display: 'Name', name: 'FarmName' },
                     { display: 'Type', name: 'FOB' },
                     { display: 'Boxes_rec', name: 'Boxes_rec' },
                     { display: 'Airport', name: 'FarmAirport' },
                     { display: 'Country', name: 'FarmCountry' },
                ],
                params: [
                     { name: 'Filter', value: FilterQuery },
                     { name: 'ExportCSV', value: '' }
                ],
                onSuccess: function () {
                    //For to show the error
                    if ($("#fgrdGrowerFarmHeader tr#row-2").length > 0) {
                        $("#fgrdGrowerFarmHeader tr#row-2").hide();
                        $.MessageBox($("#fgrdGrowerFarmHeader tr#row-2")[0].innerText);
                        return false;
                    }

                    $("#DivGrowerFarmHeader #ExportCSV").show();


                    var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
                    var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();


                    $("#fgrdGrowerFarmHeader td:nth-child(1)").show();
                    $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();

                    if ($("#ctl00_IsGrowerDelete").html() == "1") {
                        if (IsLocked.trim() != "") {
                            $("#fgrdGrowerFarmHeader td:nth-child(1)").hide();
                            $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                        }
                        else {
                            $("#fgrdGrowerFarmHeader td:nth-child(1)").show();
                            $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                        }

                    }
                    else {
                        $("#fgrdGrowerFarmHeader td:nth-child(1)").hide();
                        $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                    }


                    //if ($("#fgrdGrowerFarmHeader td:nth-child(1)")[0].innerHTML.trim() == "" || $("#fgrdGrowerFarmHeader td:nth-child(1)")[0].innerHTML.trim() == '<div style="text-align: center; width: 13px;">&nbsp;</div>') {
                    //    $("#fgrdGrowerFarmHeader td:nth-child(1)").hide();
                    //    $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                    //}
                    //else {
                    //    $("#fgrdGrowerFarmHeader td:nth-child(1)").show();
                    //    $("#fgrdGrowerFarmHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                    //}




                    //For TotalRows

                    $('#fgrdGrowerFarmHeader #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    $('#fgrdGrowerFarmHeader #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    $('#fgrdGrowerFarmHeader #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    $('#fgrdGrowerFarmHeader #row0 td:nth-child(7) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                    $('#fgrdGrowerFarmHeader td:nth-child(8) div').css({ 'padding-top': '2px', 'padding-bottom': '2px' });

                    $('#fgrdGrowerFarmHeader #row0').addClass("TotalRows");

                    if ($("#DivHeaderID").html() != "0" && $("#DivDetailID").html() != "" && $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).css('display') == "table-row") {
                        var id = $("#DivDetailID").html();
                        $("#fgrdGrowerFarmHeader [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdGrowerFarmHeader td.unsorted").addClass("sorted");
                        $("#fgrdGrowerFarmHeader td.sorted").removeClass("unsorted");
                        $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
                        $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
                        $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
                        $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");

                        var Farm = $("#fgrdGrowerFarmHeader #row" + id + " td:nth-child(2) div span").html();
                        //var recdate = $("#fgrdGrowerFarmHeader #row" + id + " td:nth-child(2) div").html();

                        if (Farm === "" || Farm == null || Farm === "&nbsp;") {
                            Farm = '';
                        }

                        var FilterQuery = "HeaderID=" + $("#DivHeaderID").html() + " and Farm='" + Farm + "'";
                        if (IsGrowerFarmDetailInitialize == false) {
                            LoadGrowerFarmDetail(FilterQuery);
                            IsGrowerFarmDetailInitialize = true;
                        }
                        else {
                            $("#fgrdGrowerFarmDetail").empty();
                            $("#fgrdGrowerFarmDetail").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }
                }
            });

            $("#DivGrowerFarmHeader .pcontrol input").css("width", "40px")
            $("#DivGrowerFarmHeader .btnseparator:eq(0)").hide();
            $("#DivGrowerFarmHeader .pSearch").hide();
            $("#DivGrowerFarmHeader .sDiv2").css("width", "270px");
            $("#DivGrowerFarmHeader .sDiv2 input.qsbox").css('width', '110px');
            $('#DivGrowerFarmHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivGrowerFarmHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivGrowerFarmHeader .pDiv").find(".pDiv2").find(".pReload").show();
            $("#DivGrowerFarmHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -45px').show();
            $("#DivGrowerFarmHeader .pDiv").find(".pDiv2").find(".pPageStat").attr('style', 'margin-left: -10px').show();
            $("#DivGrowerFarmHeader .hDiv").find(".hDivBox").find("table tr th:nth-child(4)").css({ "color": '#eee' });//for FOB column
        }


        function GrowerAWBHeaderRowClick(celDiv, id) {

            $(celDiv).click(function () {
                $("#DivGrowerFarmDetail").show();
                if (id != "0") {
                    var FilterQuery = "";
                    var awb = $("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(2) div").html().replace(/\-/g, '');
                    var recdate = $("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(3) div").html();

                    if (awb.trim() === "" || awb == null || awb.trim() === "&nbsp;") {
                        awb = '0';
                    }
                    FilterQuery = "HeaderID=" + ScopeHeaderID + " and Awb='" + awb + "' and ReceivingDate='" + recdate + "'";
                    ScopeFarmCode = id;

                    if (IsGrowerFarmDetailInitialize == false) {
                        if (id.toString() != $("#DivDetailID").html()) {
                            LoadGrowerFarmDetail(FilterQuery);
                            IsGrowerFarmDetailInitialize = true;
                        }
                    }
                    else {
                        if (id.toString() != $("#DivDetailID").html()) {
                            $("#fgrdGrowerFarmDetail").empty();
                            $("#fgrdGrowerFarmDetail").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }

                    $("#DivDetailID").html(id.toString());

                    $("#fgrdGrowerAWBHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
                    $("#fgrdGrowerAWBHeader td.unsorted").addClass("sorted");
                    $("#fgrdGrowerAWBHeader td.sorted").removeClass("unsorted");
                    $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
                    $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
                    $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");
                    $("#DivFarmID").html("0");
                }
            });
        }

        function GrowerFarmHeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {
                $("#DivGrowerFarmDetail").show();
                if (id != "0") {
                    var FilterQuery = "";

                    var Farm = $("#fgrdGrowerFarmHeader #row" + id + " td:nth-child(2) div span").html();
                    //var recdate = $("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(2) div").html();

                    if (Farm.trim() === "" || Farm == null || Farm.trim() === "&nbsp;") {
                        Farm = '';
                    }

                    FilterQuery = "HeaderID=" + ScopeHeaderID + " and Farm='" + Farm + "'";
                    ScopeFarmCode = id;

                    if (IsGrowerFarmDetailInitialize == false) {
                        if (id.toString() != $("#DivDetailID").html()) {
                            LoadGrowerFarmDetail(FilterQuery);
                            IsGrowerFarmDetailInitialize = true;
                        }
                    }
                    else {
                        if (id.toString() != $("#DivDetailID").html()) {
                            $("#fgrdGrowerFarmDetail").empty();
                            $("#fgrdGrowerFarmDetail").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }

                    $("#DivDetailID").html(id.toString());

                    $("#DivFarmID").html(Farm);

                    $("#fgrdGrowerFarmHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
                    $("#fgrdGrowerFarmHeader td.unsorted").addClass("sorted");
                    $("#fgrdGrowerFarmHeader td.sorted").removeClass("unsorted");
                    $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
                    $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
                    $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");

                }
            });
        }

        //Grid for GrowerFarmDetail

        function LoadGrowerFarmDetail(FilterQuery) {
            $("#fgrdGrowerFarmDetail").flexigrid({
                url: 'BloomService.asmx/GetGrowerFarmDetailForFgrd',
                dataType: 'xml',
                colModel: [
                { display: '', name: 'Delete', width: 15, sortable: false, align: 'left' },//1
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'left' },//2
                { display: '', name: ' ', width: 15, sortable: false, align: 'left' },//3
                { display: 'Farm', name: 'Farm', width: 40, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//4
                { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//4->5
                { display: 'Name', name: 'FlowerName', width: 180, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//5->6
                { display: 'Boxes_rec', name: 'Boxes_rec', width: 50, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//35 ->21->7
                { display: 'Boxes_Sold', name: 'Boxes', width: 55, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//6->8
                { display: 'Uom', name: 'Uom', width: 20, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//7->9
                { display: 'Units', name: 'Units', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//8->10
                { display: 'TotalUnits', name: 'TotalUnits', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//9->11
                { display: 'Cost', name: 'Cost', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//12->10->12
                { display: 'Tot.Cost', name: 'Tot.Cost', width: 60, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//11->10->11->13
                { display: 'FBE_rec', name: 'FBE_rec', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//10->11->12->14
                { display: 'DateRec', name: 'ReceivingDate', width: 45, sortable: true, align: 'left', hide: true, process: GrowerFarmDetailRowClick },//13->15
                { display: 'Cust', name: 'Customer', width: 45, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//14->16
                { display: 'Awb', name: 'Awb', width: 45, sortable: true, align: 'right', hide: true, process: GrowerFarmDetailRowClick },//14->17
                { display: 'Boxnum', name: 'Boxnum', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//15->18
                { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//16->19
                { display: 'Notes', name: 'Notes', width: 100, sortable: true, align: 'left', hide: true, process: GrowerFarmDetailRowClick },//17->20
                { display: 'PurchaseType', name: 'FOB', width: 20, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//18->21
                { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left', process: GrowerFarmDetailRowClick },//19->22
                { display: 'Credits', name: 'Adjust', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//21 -> 20->23
                { display: 'Boxchg', name: 'Boxchg', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//20 ->22->24               
                { display: 'Freight', name: 'Freight', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//22 ->23->25
                { display: 'Duties', name: 'Duties', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//23 ->24->26
                { display: 'Fuel', name: 'Fuel', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//24 ->25->27
                { display: 'Fumigation', name: 'Fumigation', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//25->26->28
                { display: 'Other', name: 'Other', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//26->27->29
                { display: 'Comm', name: 'Commission', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//27->28->30
                { display: 'Packing', name: 'Packing', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//28->29->31
                { display: 'Handling', name: 'Handling', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//29->30->32
                { display: 'Price', name: 'Price', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//30->31->33
                { display: 'Tax1', name: 'Tax1', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//31->32->34
                { display: 'Tax2', name: 'Tax2', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//32->33->35
                { display: 'Tax3', name: 'Tax3', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//33->34->36
                { display: 'FuelPaid', name: 'FuelPaid', width: 40, sortable: true, align: 'right', process: GrowerFarmDetailRowClick },//34->35->37
                ],
                showTableToggleBtn: true,
                sortname: "Farm asc,ReceivingDate asc,AWB asc,Boxnum asc",
                sortorder: "",
                usepager: true,
                title: false,
                useRp: true,
                qtype: "Awb",
                nomsg: 'No records found!',
                singleSelect: true,
                showToggleBtn: false,
                resizable: false,
                colresize: false,
                autoload: true,
                showTableToggleBtn: false,
                rp: 30000,
                height: $(window).height() - 258,
                width: $(window).width() - 725, //655,725,730,700,690,675
                striped: true,
                searchitems: [
                     { display: 'Farm', name: 'Farm' },
                     { display: 'Name', name: 'FlowerName' },
                     { display: 'Uom', name: 'Uom' },
                     { display: 'Units', name: 'Units' },
                     { display: 'Price', name: 'Price' },
                     { display: 'DateRec', name: 'DateRec' },
                     { display: 'Awb', name: 'Awb' },
                     { display: 'Boxnum', name: 'Boxnum' },
                     { display: 'Invoice', name: 'Invoice' },
                     { display: 'Type', name: 'Type' },
                     { display: 'TotalUnits', name: 'TotalUnits' },
                     { display: 'Boxes_Sold', name: 'Boxes' },
                ],
                params: [
                     { name: 'Filter', value: FilterQuery },
                     { name: 'ExportCSV', value: '' }
                ],
                onSuccess: function () {

                    //For to show the error
                    if ($("#fgrdGrowerFarmDetail tr#row-2").length > 0) {
                        $("#fgrdGrowerFarmDetail tr#row-2").hide();
                        $.MessageBox($("#fgrdGrowerFarmDetail tr#row-2")[0].innerText);
                        return false;
                    }

                    $("#DivGrowerFarmDetail #ExportCSV").show();


                    $("#fgrdGrowerFarmDetail td:nth-child(1)").show();
                    $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();

                    var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
                    var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();
                    if (IsLocked.trim() != "") {
                        $("#fgrdGrowerFarmDetail td:nth-child(1)").hide();
                        $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                    }

                    //if ($("#fgrdGrowerFarmDetail td:nth-child(1)")[0].innerHTML.trim() == "" || $("#fgrdGrowerFarmDetail td:nth-child(1)")[0].innerHTML.trim() == '<div style="text-align: left; width: 15px;">&nbsp;</div>') {
                    //    $("#fgrdGrowerFarmDetail td:nth-child(1)").hide();
                    //    $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").hide();
                    //}
                    //else {
                    //    $("#fgrdGrowerFarmDetail td:nth-child(1)").show();
                    //    $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1) ").show();
                    //}


                    //For TotalRows

                    /*Total*/   $('#fgrdGrowerFarmDetail #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*BOXES*/   $('#fgrdGrowerFarmDetail #row0 td:nth-child(7) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*BOXES*/   $('#fgrdGrowerFarmDetail #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*TOTAL UNITS*/   $('#fgrdGrowerFarmDetail #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*FBE*/   $('#fgrdGrowerFarmDetail #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*Origross*///  $('#fgrdGrowerFarmDetail #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                    /*gross*/  $('#fgrdGrowerFarmDetail #row0 td:nth-child(14) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    /*Credits*/  $('#fgrdGrowerFarmDetail #row0 td:nth-child(23) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                    $('#fgrdGrowerFarmDetail #row0').addClass("TotalRows");


                    if ($("#DivHeaderID").html() != "0" && $("#DivDetailID1").html() != "0" && $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).css('display') == "table-row") {
                        var id = $("#DivDetailID1").html();
                        $("#fgrdGrowerFarmDetail [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdGrowerFarmDetail td.unsorted").addClass("sorted");
                        $("#fgrdGrowerFarmDetail td.sorted").removeClass("unsorted");
                        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).addClass("trSelectedHeader");
                        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).removeClass("trSelected");
                        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.sorted").addClass("unsorted");
                        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.unsorted").removeClass("sorted");

                    }

                    var chkByAWBFarm = $("#chkByAWBFarm").is(":checked") ? "0" : "1";
                    if (chkByAWBFarm == "1") {
                        $('#fgrdGrowerFarmDetail td:nth-child(15)').show();
                        $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(15) ").show();

                        $('#fgrdGrowerFarmDetail td:nth-child(17)').show();
                        $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(17) ").show();
                    }
                    else {
                        $('#fgrdGrowerFarmDetail td:nth-child(15)').hide();
                        $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(15) ").hide();
                        $('#fgrdGrowerFarmDetail td:nth-child(17)').hide();
                        $("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(17) ").hide();

                    }
                }
            });

            $("#DivGrowerFarmDetail .pcontrol input").css("width", "40px")
            $("#DivGrowerFarmDetail .btnseparator:eq(0)").hide();
            $("#DivGrowerFarmDetail .pSearch").hide();
            $("#DivGrowerFarmDetail .sDiv2").css("width", "635px");
            $("#DivGrowerFarmDetail .pDiv2").css("width", "645px").css("margin-top", "3px");
            $('#DivGrowerFarmDetail .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivGrowerFarmDetail .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivGrowerFarmDetail .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

        }

        function GrowerFarmDetailRowClick(celDiv, id) {
            $(celDiv).click(function () {
                if (id != "0") {
                    $("#DivDetailID1").html(id.toString());

                    $("#fgrdGrowerFarmDetail [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).addClass("trSelectedHeader");
                    $("#fgrdGrowerFarmDetail td.unsorted").addClass("sorted");
                    $("#fgrdGrowerFarmDetail td.sorted").removeClass("unsorted");
                    $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).removeClass("trSelected");
                    $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.sorted").addClass("unsorted");
                    $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.unsorted").removeClass("sorted");

                }
            });
        }
    });

    $("#fgrdFarmEmail").flexigrid({
        url: 'BloomService.asmx/GetGrowerFarmEmailForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 40, sortable: true, align: 'left' },
            { display: 'Email', name: 'Email', width: 700, sortable: true, align: 'left' },
            { display: 'Type', name: 'FOB', width: 5, sortable: true, align: 'left', hide: true },
            { display: 'Airport', name: '', width: 15, sortable: false, align: 'left', hide: true },
            { display: 'Country', name: '', width: 15, sortable: false, align: 'left', hide: true },
            { display: 'Name', name: '', width: 15, sortable: false, align: 'left', hide: true }
        ],
        searchitems: [
                 { display: 'Farm', name: 'Farm' },
                 { display: 'Name', name: 'FarmName' },
                 { display: 'Type', name: 'FOB' },
                 { display: 'Airport', name: 'FarmAirport' },
                 { display: 'Country', name: 'FarmCountry' },
        ],
        buttons: [
            { name: 'Import Emails', bclass: 'import', onpress: ImportFarmEmail },
            { name: 'Add Farm Email', bclass: 'add', onpress: AddFarmEmail },
        ],
        showTableToggleBtn: true,
        sortname: "Farm",
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
        height: "350",
        width: "860",
        striped: true,
        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'HeaderID', value: '0' }
        ],
        onSuccess: function () {
            $("#DivFgrdFarmEmail #ExportCSV").show();
        }
    });
    $("#DivFgrdFarmEmail .pcontrol input").css("width", "40px")
    $("#DivFgrdFarmEmail .btnseparator:eq(0)").hide();
    $("#DivFgrdFarmEmail .pSearch").hide();
    $("#DivFgrdFarmEmail .sDiv2").css("width", "620px");
    $("#DivFgrdFarmEmail .pDiv2").css("width", "620px").css("margin-top", "3px");
    $('#DivFgrdFarmEmail .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivFgrdFarmEmail .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivFgrdFarmEmail .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    $("#btnImport").die("click").live("click", function () {
        $("#txtReportName").val("");
        $("#txtReportNumber").val("");
        $("#txtGrowerHeaderFromdate").datepicker("setDate", new Date());
        $("#txtGrowerHeaderFromdate").attr("disabled", true);
        $("#txtGrowerHeaderTodate").datepicker("setDate", new Date());
        $("#txtGrowerHeaderTodate").attr("disabled", true);
        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        $("#DivHeaderID").html("0");
        $("#DivDetailID").html("");
        $("#chkImportByReceivingDate").prop('checked', true);
        $("#chkImportFromPerviousSystem").prop('checked', false);
        $("#DivGrowerHeaderDialog").dialog('option', 'title', "Add Report");
        $("#DivGrowerHeaderDialog").dialog("open");
    });


    $("#txtGrowerHeaderfrmdate").mask("99/99/9999");
    $("#txtGrowerHeadertodate").mask("99/99/9999");

    $("#DivGrowerHeaderDialog").dialog({

        autoOpen: false,
        width: 450,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {

                if ($("#txtGrowerHeaderFromdate").val().trim() == "") {
                    $(".HeaderYellowWarning").html("Please choose date");
                    $(".HeaderYellowWarning").show();
                    $("#txtGrowerHeaderFromdate").focus();
                    return false;
                }

                if ($("#txtGrowerHeaderTodate").val().trim() == "") {
                    $(".HeaderYellowWarning").html("Please choose date");
                    $(".HeaderYellowWarning").show();
                    $("#txtGrowerHeaderTodate").focus();
                    return false;
                }

                if ($("#txtReportName").val().trim() == "") {
                    $(".HeaderYellowWarning").html("Please enter ReportName!!!");
                    $(".HeaderYellowWarning").show();
                    $("#txtReportName").focus();
                    return false;
                }

                //if ($("#txtReportNumber").val().trim() == "") {
                //    $(".HeaderYellowWarning").html("Please enter ReportNumber!!!");
                //    $(".HeaderYellowWarning").show(); // Commented by Belal, this filed is now optinal 
                //    $("#txtReportNumber").focus();
                //    return false;
                //}

                var ImportGrowerfromDbfCheckBoxValue = $("#chkImportFromPerviousSystem").prop("checked");
                var NewSystemCheckBoxValue = $("#chkImportByReceivingDate").prop("checked");
                debugger;
                if (!ImportGrowerfromDbfCheckBoxValue && !NewSystemCheckBoxValue) {
                    $(".HeaderYellowWarning").html("Please select one checkbox at least!!!");
                    $(".HeaderYellowWarning").show();
                    return false;
                }

                $(".HeaderYellowWarning").hide();
                $(".ui-dialog-buttonpane div.dialogProgress").show();
                var ID = $("#DivHeaderID").html() == "" ? "0" : $("#DivHeaderID").html();
                var IsImportGrowerfromDbf = ImportGrowerfromDbfCheckBoxValue == true ? ImportGrowerfromDbfCheckBoxValue : false;


                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveGrowerHeader',
                    data: '{"HeaderID":"' + ID + '","HeaderFromDate":"' + $("#txtGrowerHeaderFromdate").val() + '","HeaderToDate":"' + $("#txtGrowerHeaderTodate").val() + '",ReportName:"' + $("#txtReportName").val() + '","ReportNumber":"' + $("#txtReportNumber").val() + '","IsImportGrowerfromDbf":"' + IsImportGrowerfromDbf + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "No data found") {
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $(".HeaderYellowWarning").html("could not find any records for the given Report!!!");
                            $(".HeaderYellowWarning").show();
                            $("#txtReportNumber").focus();
                        }
                        else if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                            //ReloadFromUpdate = false;
                            // $("#POHeaderID").html(output.d);
                            //  $("#fgrdGrowerHeader").flexReload({ url: '/url/for/refresh' });
                            $("#DivHeaderID").html("0");
                            $("#DivDetailID").html("");
                            $("#DivFarmID").html("0");
                            $("#fgrdGrowerHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() }, { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() }, { name: 'IsActive', value: $("#chkHeaderISActive").is(":checked") ? "1" : "0" }], query: "", newp: 1 }).flexReload();


                            //$("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Filter', value: 'HeaderID=' + ID }], query: "", newp: 1 }).flexReload();
                            //$("#fgrdGrowerFarmDetail").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Filter', value: 'HeaderID=' + ID+' and Awb='+$("#DivDetailID")}], query: "", newp: 1 }).flexReload();
                            // $("#fgrdGrowerFarmDetail").flexReload({ url: '/url/for/refresh' });
                            $("#DivGrowerAWBHeader").hide();
                            $("#DivGrowerFarmHeader").hide();
                            $("#DivGrowerFarmDetail").hide();

                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#DivGrowerHeaderDialog").dialog("close");
                        }
                        else if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else {
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#DivGrowerHeaderDialog").dialog("close");
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");

                        }
                    }
                });
            },
            Cancel: function () {
                $("#DivGrowerHeaderDialog").dialog("close");
            }
        },
        open: function () {

            var ID = $("#DivHeaderID").html() == "" ? "0" : $("#DivHeaderID").html();

            if (ID == "0") {
                $("#trRptNum").show();
            }
            else {
                $("#trRptNum").hide();
            }
            $(".ui-dialog-buttonpane div.dialogProgress").remove();
            $(".ui-dialog-buttonpane").append("<div class='dialogProgress' style='float:left;margin:10px;display:none;'><b>Loading...</b><img src='images/ajax-loader.gif' /></div>")
            $("#txtGrowerHeaderFromdate").attr("disabled", false);
            $("#txtGrowerHeaderTodate").attr("disabled", false);
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    $("#DivGrowerDetailDialog").dialog({

        autoOpen: false,
        width: 900,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {

                var ID = $("#DivDetailID1").html();

                //var flowerssplit = $("#lstGrowerDetailFlower")[0].value.split('~');
                //if (flowerssplit[0] == "" || flowerssplit[0] == "0") {
                //    $('.YellowWarning').html("Please choose flower..");
                //    $('.YellowWarning').show();
                //    return false;
                //}
                //var Flower = flowerssplit[0];
                ////var FlowerCat = flowerssplit[2];

                //var FlowerName = $("#txtGrowerDetailFlowerDesc").val();
                //if (FlowerName == "") {
                //    $(".YellowWarning").html("Please enter flower desc..");
                //    $(".YellowWarning").show();
                //    $("#txtGrowerDetailFlowerDesc").focus();
                //    return false;
                //}



                var Flower = $("#txtGrowerDetailFlowerCode").val();
                var FlowerName = '';

                var Quantity = $("#txtGrowerDetailQuantity").val();
                if (Quantity == "")
                    Quantity = $("#txtGrowerDetailQuantity").attr("Placeholder")
                if (Quantity == "") {
                    $(".YellowWarning").html("Please enter Quantity Sold..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtGrowerDetailQuantity"));
                    return false;
                }

                var Quantity_rec = $("#txtGrowerDetailQuantity_rec").val();
                if (Quantity_rec == "")
                    Quantity_rec = $("#txtGrowerDetailQuantity_rec").attr("Placeholder")
                if (Quantity_rec == "") {
                    $(".YellowWarning").html("Please enter Quantity..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtGrowerDetailQuantity_rec"));
                    return false;
                }



                var UOM = $("#lstGrowerDetailUOM").val();
                if (UOM == 0) {
                    $(".YellowWarning").html("Please Choose UOM..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#lstGrowerDetailUOM"));
                    return false;
                }
                var Units = $("#txtGrowerDetailUnits").val();
                if (Units == "")
                    Units = $("#txtGrowerDetailUnits").attr("Placeholder")
                if (Units == "") {
                    $(".YellowWarning").html("Please enter Units..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtGrowerDetailUnits"));
                    return false;
                }

                var Cost = $("#txtGrowerDetailCost").val().trim() == "" ? $("#txtGrowerDetailCost").attr("Placeholder") : $("#txtGrowerDetailCost").val();
                var Adjust = $("#txtGrowerDetailAdjust").val().trim() == "" ? $("#txtGrowerDetailAdjust").attr("Placeholder") : $("#txtGrowerDetailAdjust").val();
                var Freight = $("#txtGrowerDetailFreight").val().trim() == "" ? $("#txtGrowerDetailFreight").attr("Placeholder") : $("#txtGrowerDetailFreight").val();
                var Duties = $("#txtGrowerDetailDuties").val().trim() == "" ? $("#txtGrowerDetailDuties").attr("Placeholder") : $("#txtGrowerDetailDuties").val();
                var Price = $("#txtGrowerDetailPrice").val().trim() == "" ? $("#txtGrowerDetailPrice").attr("Placeholder") : $("#txtGrowerDetailPrice").val();
                var Fumigation = $("#txtGrowerDetailFumigation").val().trim() == "" ? $("#txtGrowerDetailFumigation").attr("Placeholder") : $("#txtGrowerDetailFumigation").val();
                var Other = $("#txtGrowerDetailOther").val().trim() == "" ? $("#txtGrowerDetailOther").attr("Placeholder") : $("#txtGrowerDetailOther").val();
                var Awb = $("#txtGrowerDetailAwb").val().trim() == "" ? $("#txtGrowerDetailAwb").attr("Placeholder") : $("#txtGrowerDetailAwb").val();
                var Invoice = $("#txtGrowerDetailInvoice").val().trim() == "" ? $("#txtGrowerDetailInvoice").attr("Placeholder") : $("#txtGrowerDetailInvoice").val();
                var Type = $("#txtGrowerDetailType").val().trim() == "" ? $("#txtGrowerDetailType").attr("Placeholder") : $("#txtGrowerDetailType").val();

                var Daterec = $("#txtGrowerDetailDaterec").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveGrowerDetail',
                    data: '{"ID":"' + ID + '","Farm":"' + $("#hfFarm").val() + '","Flower":"' + Flower + '",FlowerName:"'
                            + FlowerName + '","Boxes":"' + Quantity + '","Boxes_rec":"' + Quantity_rec + '","Units":"'
                            + Units + '","UOM":"' + UOM + '","Adjust":"' + Adjust + '","Freight":"' + Freight
                            + '","Duties":"' + Duties + '","Fumigation":"' + Fumigation + '","Other":"' + Other
                            + '","Cost":"' + Cost + '","Price":"' + Price
                            + '","Invoice":"' + Invoice + '","Type":"' + Type + '","ReceivingDate":"' + Daterec + '","Awb":"' + Awb + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                            $("#GrowerDetailFarm_" + ID).html($("#hfFarm").val());
                            $("#GrowerDetailBoxes_" + ID).html(Quantity);
                            $("#GrowerDetailBoxes_rec_" + ID).html(Quantity_rec);

                            $("#GrowerDetailUOM_" + ID).html(UOM);

                            $("#GrowerDetailUnits_" + ID).html(Units);
                            $("#GrowerDetailTotalUnits_" + ID).html(Quantity_rec * Units);

                            $("#GrowerDetailType_" + ID).html(Type);
                            $("#GrowerDetailAdjust_" + ID).html(Adjust);
                            $("#GrowerDetailFreight_" + ID).html(Freight);
                            $("#GrowerDetailDuties_" + ID).html(Duties);
                            $("#GrowerDetailFumigation_" + ID).html(Fumigation);
                            $("#GrowerDetailOther_" + ID).html(Other);
                            $("#GrowerDetailCost_" + ID).html(Cost);
                            var TotalCost = Quantity_rec * Units * Cost
                            $("#GrowerDetailTotCost_" + ID).html(TotalCost.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#GrowerDetailInvoice_" + ID).html(Invoice);

                            $("#GrowerDetailPrice_" + ID).html(Price);
                            var sdate = new Date(Daterec);
                            $("#GrowerDetailReceivingDate_" + ID).html(sdate.toString("MM-dd"));
                            if (Awb != "") {
                                if (Awb.length > 4) {
                                    $("#GrowerDetailAwb_" + ID).html(Awb.substring(Awb.length - 4));
                                }
                                else {
                                    $("#GrowerDetailAwb_" + ID).html(Awb);
                                }
                            }
                            //$("#GrowerDetailFlowerCode_" + ID).html(Flower);
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#DivGrowerDetailDialog").dialog("close");
                            $("#DivGrowerFarmDetail .sDiv2 > input[type='button']")[1].click();//trigger clear button to refresh totals

                        }
                        else if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                    }
                });
            },
            Cancel: function () {
                $("#DivGrowerDetailDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane div.dialogProgress").remove();
            $(".ui-dialog-buttonpane").append("<div class='dialogProgress' style='float:left;margin:10px;display:none;'><b>Loading...</b><img src='images/ajax-loader.gif' /></div>")
            //$("#txtGrowerHeaderFromdate").attr("disabled", false);
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    //For Edit GrowerHeader
    $("[id^=editGrowerHeader_]").die("click").live("click", function () {
        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        var ID = $(this)[0].id.replace("editGrowerHeader_", "");

        //CheckGrowerReportIsAlreadyLocked(ID, function (Alreadylocked) {
        //    if (Alreadylocked.indexOf("is locked") != "-1") {
        //        $.MessageBox(Alreadylocked);
        //    }

        var IsLocked = $('#fgrdGrowerHeader #row' + ID + ' td:nth-child(9) div').text();
        if (IsLocked.trim() != "") {
            $.MessageBox(IsLocked);
        }
        else {
            $("#DivHeaderID").html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetGrowerHeaderByID',
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    $("#txtReportName").val(output.d.ReportName);
                    $("#txtReportNumber").val(output.d.ReportNumber);

                    var GrowerFromDate = output.d.GrowerFromDate;
                    var substringedDate = GrowerFromDate.substring(6); //substringedDate= 1291548407008)/
                    var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                    var sdate = new Date(parsedIntDate);

                    if (GrowerFromDate != "")
                        $("#txtGrowerHeaderFromdate").val(sdate.toString("MM/dd/yyyy"));
                    else
                        $("#txtGrowerHeaderFromdate").datepicker("setDate", new Date());

                    $("#txtGrowerHeaderFromdate").attr("disabled", true);

                    var GrowerToDate = output.d.GrowerToDate;
                    var substringedDate = GrowerToDate.substring(6); //substringedDate= 1291548407008)/
                    var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                    var sdate = new Date(parsedIntDate);

                    if (GrowerToDate != "")
                        $("#txtGrowerHeaderTodate").val(sdate.toString("MM/dd/yyyy"));
                    else
                        $("#txtGrowerHeaderTodate").datepicker("setDate", new Date());

                    $("#txtGrowerHeaderTodate").attr("disabled", true);
                    $("#DivGrowerHeaderDialog").dialog('option', 'title', "Grower Report  ::  " + output.d.ReportNumber);
                    $("#DivGrowerHeaderDialog").dialog("open");

                }
            });
        }
        //});


    });


    //For Delete GrowerHeader
    $("[id^=deleteGrowerHeader_]").die("click").live("click", function () {

        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ReportID = ID.replace("deleteGrowerHeader_", "");
        //CheckGrowerReportIsAlreadyLocked(ReportID, function (Alreadylocked) {
        //    if (Alreadylocked.indexOf("is locked") != "-1") {
        //        $.MessageBox(Alreadylocked);
        //    }
        var IsLocked = $('#fgrdGrowerHeader #row' + ReportID + ' td:nth-child(9) div').text();
        if (IsLocked.trim() != "") {
            $.MessageBox(IsLocked);
        }
        else {
            $("#DivHeaderID").html(ReportID);

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetIsGrowerDelete',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                        if (output.d.toLowerCase() == "valid") {
                            $("#MsgHtml").html("Are you sure to delete the Report and its details ?");
                            $("#MsgWarning").dialog("open");
                        }
                        else {
                            $("#msg").html("You are not authorised to delete this report..");
                            $("#msgbox-select").dialog("open");
                        }
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        }

        //  });

    });

    //Dialog box for report delete

    $("#MsgWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ReportID = $("#DivHeaderID").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteGrowerHeaderWithDetailsByID',
                    data: '{"ID":"' + ReportID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != null && output.d == "valid") {
                            $("#MsgWarning").dialog("close");
                            $("#fgrdGrowerHeader").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdGrowerFarmDetail").flexReload({ url: '/url/for/refresh' });
                            $("#DivGrowerAWBHeader").hide();
                            $("#DivGrowerFarmHeader").hide();
                            $("#DivGrowerFarmDetail").hide();
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


    //For DeleteGrowerFarmDetail click
    $("[id^=deleteGrowerFarmDetail_]").die("click").live("click", function () {

        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        $(".YellowWarning").hide();
        $(".Warning").hide();
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ReportDetailID = ID.replace("deleteGrowerFarmDetail_", "");
        var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
        //CheckGrowerReportIsAlreadyLocked(HeaderID, function (Alreadylocked) {
        //    if (Alreadylocked.indexOf("is locked") != "-1") {
        //        $.MessageBox(Alreadylocked);
        //    }
        var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();
        if (IsLocked.trim() != "") {
            $.MessageBox(IsLocked);
        }
        else {
            $("#DivDetailID1").html(ReportDetailID);
            $("#MsgDetailHtml").html("Are you sure to delete the Report details ?");
            $("#MsgDetailWarning").dialog("open");
        }
        //});
    });

    //Dialog box for report detail delete
    $("#MsgDetailWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ReportDetailID = $("#DivDetailID1").html();
                //var ReportDetailAwb=$("#fgrdGrowerAWBHeader #row" + id + " td:nth-child(1) div").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteGrowerDetailsByID',
                    data: '{"ID":"' + ReportDetailID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "valid") {
                            $("#MsgDetailWarning").dialog("close");

                            //$("#GrowerDetailRowID" + ReportDetailID).remove();
                            $("#fgrdGrowerFarmDetail #row" + ReportDetailID).remove();
                            $("#DivGrowerFarmDetail .sDiv2 > input[type='button']")[1].click();//trigger clear button to refresh totals
                            //$("#fgrdGrowerFarmDetail").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdGrowerFarmDetail").flexReload({ url: '/url/for/refresh' });
                            //$("#DivGrowerAWBHeader").hide();
                            //$("#DivGrowerFarmDetail").hide();
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

    //For load flowers in dropdownlist

    function LoadGrowerDetailFlowers() {

        var length = $('#lstGrowerDetailFlower > option').length;
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


                    $('#lstGrowerDetailFlower').empty();
                    var data = output.d;

                    //$('#lstInventoryFlower').append('<option value="0">Choose Flower...</option>');
                    for (var i in data) {
                        var flower = data[i];
                        if (flower.Flower.trim() != "") {
                            $('#lstGrowerDetailFlower').append('<option value="' + flower.Flower.trim() + '~' + flower.Name.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                        }
                    }

                    J1_10($("#lstGrowerDetailFlower")).selectize({

                        onChange: function () {

                            var flowerssplit = $("#lstGrowerDetailFlower")[0].value.split('~');
                            if (flowerssplit[0] != "0" && flowerssplit[0] != "") {
                                $("#txtGrowerDetailFlowerDesc").val(flowerssplit[1]);
                                //$("#DivGrowerDetailFlowerCategory").html(flowerssplit[2]);
                                //$("#DivGrowerDetailFlowerColorCode").html(flowerssplit[3]);
                                //  $("#txtUnitsPerBunch").val(flowerssplit[3]);
                                $("#txtGrowerDetailQuantity_rec").focus();
                                $(".YellowWarning").hide();
                            }
                            else {
                                $("#txtGrowerDetailFlowerDesc").val("");
                                $("#DivGrowerDetailFlowerCategory").html("");
                                $("#DivGrowerDetailFlowerColorCode").html(0);
                                // $("#txtInventoryUnitsPerBunch").val(0);
                            }

                        }
                    });
                    J1_10($("#lstGrowerDetailFlower")).selectize()[0].selectize.setValue($("#hfGrowerDetailFlower").val());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                },
            });
        }
        else {
            J1_10($("#lstGrowerDetailFlower")).selectize()[0].selectize.setValue($("#hfGrowerDetailFlower").val());
        }

    }

    function LoadGrowerDetailUOM() {
        var length = $('#lstGrowerDetailUOM > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForManualPO',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstGrowerDetailUOM').empty();
                    var UOMdata = output.d;
                    $('#lstGrowerDetailUOM').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstGrowerDetailUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
                    }

                    if ($("#hfGrowerDetailUOM").val() != "" && $("#hfGrowerDetailUOM").val() != 0)
                        $('#lstGrowerDetailUOM').val($("#hfGrowerDetailUOM").val());
                    else
                        $("#lstGrowerDetailUOM").val("QB");

                }
            });
        }
        else {
            $('#lstGrowerDetailUOM').val($("#hfGrowerDetailUOM").val());
        }
    }

    $("#txtGrowerDetailQuantity_rec").change(function (event) {


        var QuantityVal = $("#txtGrowerDetailQuantity_rec").val() == "" ? $("#txtGrowerDetailQuantity_rec").attr("Placeholder") : $("#txtGrowerDetailQuantity_rec").val();
        var Units = $("#txtGrowerDetailUnits").val() == "" ? $("#txtGrowerDetailUnits").attr("Placeholder") : $("#txtGrowerDetailUnits").val();
        var Cost = $("#txtGrowerDetailCost").val() == "" ? $("#txtGrowerDetailCost").attr("Placeholder") : $("#txtGrowerDetailCost").val();
        if (QuantityVal != "" && Units != "")
            $("#txtGrowerDetailTotalUnits").val(QuantityVal * Units);

        //var PriceVal = $("#txtGrowerDetailPrice").val() == "" ? $("#txtGrowerDetailPrice").attr("Placeholder") : $("#txtGrowerDetailPrice").val();
        //var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        //if (PriceVal != "" && TotalUnitsVal != "") {
        //    if (TotalUnitsVal != "0") {
        //        $("#txtGrowerDetailGross").val((PriceVal * TotalUnitsVal).toFixed(2));
        //    }
        //}
        var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        if (Cost != "" && TotalUnitsVal != "") {
            $("#txtGrowerDetailGross").val((Cost * TotalUnitsVal).toFixed(2));
        }

    });

    $("#txtGrowerDetailUnits").change(function (event) {


        var QuantityVal = $("#txtGrowerDetailQuantity_rec").val() == "" ? $("#txtGrowerDetailQuantity_rec").attr("Placeholder") : $("#txtGrowerDetailQuantity_rec").val();
        var Units = $("#txtGrowerDetailUnits").val() == "" ? $("#txtGrowerDetailUnits").attr("Placeholder") : $("#txtGrowerDetailUnits").val();
        var Cost = $("#txtGrowerDetailCost").val() == "" ? $("#txtGrowerDetailCost").attr("Placeholder") : $("#txtGrowerDetailCost").val();
        if (QuantityVal != "" && Units != "")
            $("#txtGrowerDetailTotalUnits").val(QuantityVal * Units);

        //var PriceVal = $("#txtGrowerDetailPrice").val() == "" ? $("#txtGrowerDetailPrice").attr("Placeholder") : $("#txtGrowerDetailPrice").val();
        //var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        //if (PriceVal != "" && TotalUnitsVal != "") {
        //    if (TotalUnitsVal != "0") {
        //        $("#txtGrowerDetailGross").val((PriceVal * TotalUnitsVal).toFixed(2));
        //    }
        //}
        var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        if (Cost != "" && TotalUnitsVal != "") {
            $("#txtGrowerDetailGross").val((Cost * TotalUnitsVal).toFixed(2));
        }

    });


    $("#txtGrowerDetailCost").change(function (event) {
        var Cost = $("#txtGrowerDetailCost").val() == "" ? $("#txtGrowerDetailCost").attr("Placeholder") : $("#txtGrowerDetailCost").val();
        var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        if (Cost != "" && TotalUnitsVal != "") {
            $("#txtGrowerDetailGross").val((Cost * TotalUnitsVal).toFixed(2));
        }

    });

    $("#txtGrowerDetailGross").change(function (event) {
        var grossval = $("#txtGrowerDetailGross").val() == "" ? $("#txtGrowerDetailGross").attr("placeholder") : $("#txtGrowerDetailGross").val();
        var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("placeholder") : $("#txtGrowerDetailTotalUnits").val();
        debugger;
        if (grossval != "" && TotalUnitsVal != "") {
            if (TotalUnitsVal != "0") {
                $("#txtGrowerDetailCost").val((grossval / TotalUnitsVal).toFixed(4));
            }
            else {
                $("#txtGrowerDetailCost").val("0.0000");
                //$("#txtgrowerdetailgross").val("0.00");
            }
        }
    });


    //For EditGrowerFarmDetail click
    $("[id^=editGrowerFarmDetail_]").die("click").live("click", function () {
        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        $(".YellowWarning").hide();
        $(".Warning").hide();
        var ID = $(this)[0].id.replace("editGrowerFarmDetail_", "");

        var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
        $("#Pleasewait-msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
        $("#Pleasewait-Dialog").dialog("open");

        //CheckGrowerReportIsAlreadyLocked(HeaderID, function (Alreadylocked) {
        //    if (Alreadylocked.indexOf("is locked") != "-1") {
        //        $("#Pleasewait-Dialog").dialog("close");
        //        $.MessageBox(Alreadylocked);
        //    }
        var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();
        if (IsLocked.trim() != "") {
            $("#Pleasewait-Dialog").dialog("close");
            $.MessageBox(IsLocked);
        }
        else {

            $("#DivDetailID1").html(ID);

            $("#fgrdGrowerFarmDetail [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).addClass("trSelectedHeader");
            $("#fgrdGrowerFarmDetail td.unsorted").addClass("sorted");
            $("#fgrdGrowerFarmDetail td.sorted").removeClass("unsorted");
            $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).removeClass("trSelected");
            $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.sorted").addClass("unsorted");
            $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.unsorted").removeClass("sorted");

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetGrowerDetailByID',
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var res = output.d;

                    $("#txtGrowerDetailFlowerDesc").val($("#GrowerDetailFlower_" + ID).html());
                    //$("#DivGrowerDetailFlowerColorCode").html(res.FlowerDetails.ColorCode);
                    //$("#DivGrowerDetailFlowerCategory").html(res.FlowerCategory);
                    $("#hfGrowerDetailFlower").val(res.Flower.trim() + '~' + res.FlowerName.trim());
                    $("#txtGrowerDetailFlowerCode").val(res.Flower.trim())
                    $("#hfFarm").val(res.Farm);

                    $("#txtGrowerDetailQuantity").val("");
                    $("#txtGrowerDetailQuantity").attr("Placeholder", res.Boxes);
                    $("#txtGrowerDetailQuantity_rec").val("");
                    $("#txtGrowerDetailQuantity_rec").attr("Placeholder", res.Boxes_rec);
                    $("#hfGrowerDetailUOM").val(res.UOM);
                    LoadGrowerDetailUOM();

                    $("#txtGrowerDetailUnits").val("");
                    $("#txtGrowerDetailUnits").attr("Placeholder", res.Units);

                    $("#txtGrowerDetailTotalUnits").val("");
                    $("#txtGrowerDetailTotalUnits").attr("Placeholder", res.TotalUnits);

                    $("#txtGrowerDetailType").val("");
                    $("#txtGrowerDetailType").attr("Placeholder", res.Type);


                    $("#txtGrowerDetailAdjust").val("");
                    $("#txtGrowerDetailAdjust").attr("Placeholder", res.Adjust.toFixed(2));

                    $("#txtGrowerDetailFreight").val("");
                    $("#txtGrowerDetailFreight").attr("Placeholder", res.Freight.toFixed(2));

                    $("#txtGrowerDetailDuties").val("");
                    $("#txtGrowerDetailDuties").attr("Placeholder", res.Duties.toFixed(2));

                    $("#txtGrowerDetailFumigation").val("");
                    $("#txtGrowerDetailFumigation").attr("Placeholder", res.Fumigation.toFixed(2));

                    $("#txtGrowerDetailOther").val("");
                    $("#txtGrowerDetailOther").attr("Placeholder", res.Other.toFixed(2));

                    $("#txtGrowerDetailCost").val("");
                    $("#txtGrowerDetailCost").attr("Placeholder", res.Cost.toFixed(4));

                    $("#txtGrowerDetailGross").val("");
                    $("#txtGrowerDetailGross").attr("Placeholder", (res.Boxes_rec * res.Units * res.Cost).toFixed(2));

                    $("#txtGrowerDetailInvoice").val("");
                    $("#txtGrowerDetailInvoice").attr("Placeholder", res.Invoice);

                    $("#txtGrowerDetailBoxnum").val("");
                    $("#txtGrowerDetailBoxnum").attr("Placeholder", res.Boxnum);

                    var GrowerDaterec = res.ReceivingDate;
                    var substringedDate = GrowerDaterec.substring(6); //substringedDate= 1291548407008)/
                    var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                    var sdate = new Date(parsedIntDate);

                    if (GrowerDaterec != "")
                        $("#txtGrowerDetailDaterec").val(sdate.toString("MM/dd/yyyy"));
                    else
                        $("#txtGrowerDetailDaterec").datepicker("setDate", new Date());

                    $("#txtGrowerDetailAwb").val("");
                    $("#txtGrowerDetailAwb").attr("Placeholder", res.Awb);

                    $("#txtGrowerDetailPrice").val("");
                    $("#txtGrowerDetailPrice").attr("Placeholder", res.Price.toFixed(4));

                    $("#Pleasewait-Dialog").dialog("close");
                    $("#DivGrowerDetailDialog").dialog("open");
                    $("#DivGrowerDetailDialog").dialog('option', 'title', "Edit Detail :: " + (res.Awb + "-" + res.Farm + "-" + res.Flower));
                    $("#txtGrowerDetailQuantity_rec").focus();

                    //LoadGrowerDetailFlowers();

                }
            });
        }
        // });

    });

    //For date filter operations begin
    $('#divGrowerHeaderDate').click(function (event) {
        // 
        $(".rowcss").hide();
        $("#trGrowerHeaderdatetitle").show();
        if ($('#divGrowerHeaderdateFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divGrowerHeaderdateFilter").slideToggle();
        }
        else {
            $("#divGrowerHeaderdateFilter").slideToggle();
        }

    });

    //For date filter OK button click
    $("[id^=btnGrowerHeaderdateok]").live("click", function () {

        if ($("#txtGrowerHeaderfrmdate").val() != "" && $("#txtGrowerHeadertodate").val() == "") {
            $("#msg").html("Please choose ToDate!");
            $("#msgbox-select").dialog("open");

            return false;
        }
        else if ($("#txtGrowerHeaderfrmdate").val() == "" && $("#txtGrowerHeadertodate").val() != "") {
            $("#msg").html("Please choose From Date!");
            $("#msgbox-select").dialog("open");
            return false;
        }
        else if ($("#txtGrowerHeaderfrmdate").val() == "" && $("#txtGrowerHeadertodate").val() == "") {
            $("#msg").html("Please choose From Date and ToDate!");
            $("#msgbox-select").dialog("open");
            return false;
        }

        //$.ajax({ //save date to the session 
        //    url: 'BloomService.asmx/SaveDateSession',
        //    type: 'POST',
        //    data: "{'FromDate':'" + $("#txtGrowerHeaderfrmdate").val() + "','ToDate':'" + $("#txtGrowerHeadertodate").val() + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        //    }
        //});

        var fdate = $("#txtGrowerHeaderfrmdate").val() + " to " + $("#txtGrowerHeadertodate").val();
        $("#lblGrowerHeaderchosendate").html(fdate);
        $("#trGrowerHeader").addClass('FilterDivStyle');
        $("#lblGrowerHeaderchosendate1").html($("#txtGrowerHeaderfrmdate").val());
        $("#lblGrowerHeaderchosendate2").html($("#txtGrowerHeadertodate").val());

        $("#divGrowerHeaderFromDate").datepicker("setDate", Date.parse($("#txtGrowerHeaderfrmdate").val()));
        $("#divGrowerHeaderToDate").datepicker("setDate", Date.parse($("#txtGrowerHeadertodate").val()));

        $("#imgGrowerHeaderDate").attr("src", "images/Filter.png");
        $("#divGrowerHeaderdateFilter").slideToggle();
        $("#fgrdGrowerHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() }, { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() }, { name: 'IsActive', value: $("#chkHeaderISActive").is(":checked") ? "1" : "0" }], query: "", newp: 1 }).flexReload();
        $("#DivGrowerHeader").show();
        $("#DivGrowerAWBHeader").hide();
        $("#DivGrowerFarmHeader").hide();
        $("#DivGrowerFarmDetail").hide();
        $("#tdhide").hide();
        $("#DivHeaderID").html("0");
        $("#DivDetailID").html("");
        //var OrderDateFilter = "";
        //if ($("#lblGrowerHeaderchosendate1").html() != "" && $("#lblGrowerHeaderchosendate2").html() != "")
        //    OrderDateFilter = "OrderDate >= ctod('" + $("#lblGrowerHeaderchosendate1").html() + "') and OrderDate <= ctod('" + $("#lblGrowerHeaderchosendate2").html() + "')";

        //$("#fgrdOrderSummary").flexOptions({ params: [{ name: 'Filter', value: "CUSTOMER<>0 and " + OrderDateFilter }, { name: 'ExportCSV', value: '' }, { name: 'Exclude', value: '' }], query: "", newp: 1 }).flexReload();

    });

    //For date filter Image button click
    $("[id^=imgGrowerHeaderDate]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {

            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtGrowerHeaderfrmdate").val(today);
            $("#txtGrowerHeadertodate").val(today);
            var fdate = "Today: " + today;
            $("#lblGrowerHeaderchosendate").html(fdate);
            $("#lblGrowerHeaderchosendate1").html(today);
            $("#lblGrowerHeaderchosendate2").html(today);

            $("#divGrowerHeaderFromDate").datepicker("setDate", Date.parse(today));
            $("#divGrowerHeaderToDate").datepicker("setDate", Date.parse(today));

            $("#imgGrowerHeaderDate").attr("src", "images/Filter.png");
            $("#trGrowerHeader").addClass('FilterDivStyle');
            $("#divGrowerHeaderdateFilter").hide();

            //$.ajax({ //save date to the session 
            //    url: 'BloomService.asmx/SaveDateSession',
            //    type: 'POST',
            //    data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //});

            //var OrderDateFilter = "";
            //if ($("#lblGrowerHeaderchosendate1").html() != "" && $("#lblGrowerHeaderchosendate2").html() != "")
            //    OrderDateFilter = "OrderDate >= ctod('" + $("#lblGrowerHeaderchosendate1").html() + "') and OrderDate <= ctod('" + $("#lblGrowerHeaderchosendate2").html() + "')";

            $("#fgrdGrowerHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() }, { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() }, { name: 'IsActive', value: $("#chkHeaderISActive").is(":checked") ? "1" : "0" }], query: "", newp: 1 }).flexReload();
            $("#DivGrowerHeader").show();
            $("#DivGrowerAWBHeader").hide();
            $("#DivGrowerFarmHeader").hide();
            $("#DivGrowerFarmDetail").hide();
            $("#tdhide").hide();
            $("#DivHeaderID").html("0");
            $("#DivDetailID").html("");

            e.stopPropagation();
        }
    });

    //For date filter operations end

    $("#tdhide").die("click").live("click", function () {

        if ($("#btnhide").html() === "&lt;&lt;") {
            $("#DivGrowerHeader").hide("slide", { direction: "left" }, 1000);
            $("#btnhide").html(">>");
            $("#DivGrowerFarmDetail div.flexigrid").css("width", $(window).width() - 370);//338,345
        }

        else {
            $("#DivGrowerHeader").show("slide", { direction: "left" }, 1000);
            $("#btnhide").html("<<");
            $("#DivGrowerFarmDetail div.flexigrid").css("width", $(window).width() - 700);//635,725,730,700,690,675
        }
    });

    //mani:select individual checkbox on the header
    //$("[id^=GrowerHeaderselect_]").die("click").live("click", function () {

    //    var sourceCtl = $(this);
    //    var ID = sourceCtl.attr('id');
    //    var img = sourceCtl.attr("src").toLowerCase();

    //    var headers = ID.replace("GrowerHeaderselect_", "");
    //    var Selected = "0";
    //    if (img.indexOf("off") > 0) {
    //        Selected = "1";
    //    }

    //    if (Selected == "1" && $("#fgrdGrowerHeader .trChecked").length == 0) {
    //        sourceCtl.prop("src", "images/check-on.png");
    //        sourceCtl.closest('tr').addClass("trChecked");
    //    }
    //    else {
    //        sourceCtl.prop("src", "images/check-off.png");
    //        $("[id ^= GrowerHeaderselectall]").attr("src", "images/check-off.png");
    //        sourceCtl.closest('tr').removeClass("trChecked");
    //    }
    //});


    $("#GetFarmAndDateRangeDialogBeforePrint").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: "500",
        height: "330",
        buttons: {
            Print: function () {
                $(".msguiForPrintDialog").remove();
                $("#GetFarmAndDateRangeDialogBeforePrint").next('div').append("<div class='msguiForPrintDialog'  style='margin-left: 10px;margin-top: 10px;height: 17px;background:none;'></div>").css('height', '35px');
                $(".msguiForPrintDialog").html("Processing Please wait...  <img src='images/ajax-loader.gif' />")
                //var HeaderID = $("#fgrdGrowerHeader .trChecked").attr('id').replace('row', '');

                var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
                var w0 = '';
                var w1 = '';
                var w2 = '';
                var w3 = '';
                var w4 = '';
                var PrintFOBDetailedReport = 0;
                var PrintFOBSummaryReport = 0;
                var PrintConsDetailedReport = 0;
                var PrintConsignmentSummary = 0;
                var PrintFarmDetailedReport = 0;


                if ($('#chkFarmDetailed').is(':checked')) {
                    PrintFarmDetailedReport = 1
                }
                if ($('#chkFOBDetailed').is(':checked')) {
                    PrintFOBDetailedReport = 1
                }
                if ($('#chkFOBSummary').is(':checked')) {
                    PrintFOBSummaryReport = 1
                }
                if ($('#chkConsignmentDetailed').is(':checked')) {
                    PrintConsDetailedReport = 1
                }
                if ($('#chkConsignmentSummary').is(':checked')) {
                    PrintConsignmentSummary = 1
                }

                var SendEmailToFarm = 0;

                if ($('#chkEmailToFarm').is(':checked')) {
                    SendEmailToFarm = 1;
                }
                var AllFarmsAsOnePDF = 0;

                if ($('#chkGrowerReportAsSinglePdf').is(':checked')) {
                    AllFarmsAsOnePDF = 1;
                }

                var Farm = $("#lstFarmForHeaderReport").val();
                if (Farm == "0" && AllFarmsAsOnePDF == 0) { //if all farm selected in print as seperate pdf's
                    if ($('#chkFarmDetailed:checked,#chkFOBDetailed:checked,#chkFOBSummary:checked,#chkConsignmentDetailed:checked,#chkConsignmentSummary:checked').length != 1) {
                        $(".msguiForPrintDialog").hide();
                        $.MessageBox("Please select only one report for <b>All Farms</b> Print option");
                    }
                    else {


                        Farm = ''
                        $("#lstFarmForHeaderReport option").each(function () {

                            if ($(this).val() != '0') {
                                Farm += (Farm == '' ? '' : ',') + $(this).val();
                            }
                        });

                        var ArrW = new Array();
                        for (var j = 0; j < Farm.split(",").length; j++) {
                            ArrW[j] = window.open('GeneratingPDF.html', '_blank');
                        }

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/PrintMultipleReportsInGrowerForAllFarmOption',
                            data: "{'PrintFarmDetailedReport':'" + PrintFarmDetailedReport
                                   + "','PrintFOBDetailedReport':'" + PrintFOBDetailedReport
                                   + "','PrintFOBSummaryReport':'" + PrintFOBSummaryReport
                                   + "','PrintConsDetailedReport':'" + PrintConsDetailedReport
                                   + "','PrintConsignmentSummary':'" + PrintConsignmentSummary
                                   + "','HeaderID':'" + HeaderID
                                   + "','FarmsList':'" + Farm
                                   + "','FromDate':'" + $("#txtGrowerReportfrmdate").val()
                                   + "','ToDate':'" + $("#txtGrowerReporttodate").val()
                                   + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {

                                $(".msguiForPrintDialog").hide();
                                if (output.d == null) {
                                    for (var j = 0; j < Farm.split(",").length; j++) {
                                        ArrW[j].close()
                                    }
                                }
                                else {
                                    //ReportsResult has three objects with [0]Farm,[1]FarmEmail,[2]pdf                                    
                                    var ReportsResult = output.d;
                                    for (var i = 0; i < ReportsResult.length; i++) {
                                        ArrW[i].location = ReportsResult[i][2];
                                    }
                                    if (SendEmailToFarm == 1) {
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/GetGrowerReportMailContent',
                                            data: "{}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (result, status) {
                                                var contres = result.d;
                                                for (var i = 0; i < ReportsResult.length; i++) {
                                                    var ToFarm = ReportsResult[i][0]; //Farm
                                                    var Tomail = ReportsResult[i][1]; //FarmEmail
                                                    var Content = contres[0].GrowerMailContent;
                                                    var subject = 'Grower Reports For Farm: ' + ToFarm + ' From : ' + $("#txtGrowerReportfrmdate").val() + ' To : ' + $("#txtGrowerReporttodate").val();
                                                    var msg = "Report Attachment's : ";
                                                    var emailBody = "";
                                                    emailBody = emailBody + ' %0D%0A ' + ReportsResult[i][2];
                                                    window.location.href = "mailto:" + Tomail + "?subject=" + subject + "&body=" + encodeURIComponent(Content) + "%0D%0A %0D%0A" + msg + emailBody;
                                                }
                                            }
                                        });
                                    }
                                }
                            }
                        });
                    }
                }
                else {

                    var SelectedReportsCount = $(".Reports:checked").length;
                    var ArrW = new Array();
                    for (var j = 0; j < SelectedReportsCount; j++) {
                        ArrW[j] = window.open('GeneratingPDF.html', '_blank');
                    }

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/PrintMultipleReportsInGrower',
                        data: "{'PrintFOBDetailedReport':'" + PrintFOBDetailedReport
                               + "','PrintFOBSummaryReport':'" + PrintFOBSummaryReport
                               + "','PrintConsDetailedReport':'" + PrintConsDetailedReport
                               + "','PrintConsignmentSummary':'" + PrintConsignmentSummary
                               + "','PrintFarmDetailedReport':'" + PrintFarmDetailedReport
                               + "','HeaderID':'" + HeaderID
                               + "','Farm':'" + Farm
                               + "','FromDate':'" + $("#txtGrowerReportfrmdate").val()
                               + "','ToDate':'" + $("#txtGrowerReporttodate").val()
                               + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $(".msguiForPrintDialog").hide();
                            if (output.d == "LogOut") {
                                for (var j = 0; j < ReportsResult.length; j++) {
                                    ArrW[j].close()
                                }
                                window.location.href = "Login.aspx";
                            }
                            else if (output.d.indexOf("error") >= 0) {
                                for (var j = 0; j < ReportsResult.length; j++) {
                                    ArrW[j].close()
                                }
                                $("#msgbox-select").dialog("close");
                                $.MessageBox(output.d.substring(5, output.d.length));
                            }
                            else {
                                var ReportsResult = output.d.split("*~*")

                                if (ReportsResult == null) {
                                    for (var j = 0; j < ReportsResult.length; j++) {
                                        ArrW[j].close()
                                    }
                                }
                                else {
                                    var PdfResults = $.grep(ReportsResult, function (v) {
                                        return v.indexOf(".xls") == "-1";
                                    });


                                    var XlsReports = $.grep(ReportsResult, function (v) {
                                        return v.indexOf(".xls") != "-1";
                                    });

                                    for (var i = 0; i < PdfResults.length; i++) {
                                        ArrW[i].location = PdfResults[i];
                                    }

                                    for (var i = 0; i < XlsReports.length; i++) {
                                        window.open(XlsReports[i]);
                                    }




                                    ////to download excel output 
                                    //if (PrintFOBSummaryReport == 1) {
                                    //    window.location = splitedstring[splitedstring.length - 1] //last result in array is Excel report for fob summary 
                                    //    if (splitedstring.length == "2") {
                                    //        w0.location = splitedstring[0]
                                    //        //w1.close();
                                    //        //w2.close();
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "3") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        //w2.close();
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "4") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "5") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        w3.location = splitedstring[3]
                                    //    }
                                    //    else if (splitedstring.length == "6") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        w3.location = splitedstring[3]
                                    //        w4.location = splitedstring[4]
                                    //    }
                                    //}
                                    //else {
                                    //    if (splitedstring.length == "1") {
                                    //        w0.location = splitedstring[0]
                                    //        //w1.close();
                                    //        //w2.close();
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "2") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        //w2.close();
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "3") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        //w3.close();
                                    //    }
                                    //    else if (splitedstring.length == "4") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        w3.location = splitedstring[3]
                                    //    }
                                    //    else if (splitedstring.length == "5") {
                                    //        w0.location = splitedstring[0]
                                    //        w1.location = splitedstring[1]
                                    //        w2.location = splitedstring[2]
                                    //        w3.location = splitedstring[3]
                                    //        w4.location = splitedstring[4]
                                    //    }
                                    //}

                                    if (SendEmailToFarm == 1) {
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/GetGrowerFarmEmailByCode',
                                            data: "{'Farm':'" + Farm + "'}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (output, status) {

                                                var FarmEmailres = output.d;
                                                $.ajax({
                                                    type: "POST",
                                                    url: 'BloomService.asmx/GetGrowerReportMailContent',
                                                    data: "{}",
                                                    contentType: "application/json; charset=utf-8",
                                                    dataType: "json",
                                                    success: function (result, status) {

                                                        var Growercontres = result.d;

                                                        var ToFarm = Farm;
                                                        var Tomail = FarmEmailres.Email;
                                                        var Content = Growercontres[0].GrowerMailContent;
                                                        var subject = 'Grower Reports For Farm: ' + ToFarm + ' From : ' + $("#txtGrowerReportfrmdate").val() + ' To : ' + $("#txtGrowerReporttodate").val();
                                                        var msg = "Report Attachment's : ";

                                                        var emailBody = "";
                                                        for (var j = 0; j < PdfResults.length; j++) {
                                                            emailBody = emailBody + ' %0D%0A ' + PdfResults[j];
                                                        }
                                                        window.location.href = "mailto:" + Tomail + "?subject=" + subject + "&body=" + encodeURIComponent(Content) + "%0D%0A %0D%0A" + msg + emailBody;
                                                    }
                                                });
                                                //document.location = "mailto:" + Tomail + "?subject=" + subject + "&body=" + msg + emailBody;
                                            }
                                        });
                                    }
                                }
                            }
                        }
                    });

                }

            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#chkEmailToFarm").attr("checked", false);


            //var FromDate = $("#fgrdGrowerHeader .trSelectedHeader.trSelected td:nth-child(3) div").html();
            //var ToDate = $("#fgrdGrowerHeader .trSelectedHeader.trSelected td:nth-child(4) div").html();

            var FromDate = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(3) div").html().replace(/-/g, '/');
            var ToDate = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(4) div").html().replace(/-/g, '/');
            var frmdate = new Date(FromDate);
            var todate = new Date(ToDate);
            if (frmdate.getFullYear() < 1970) {
                frmdate.setFullYear(frmdate.getFullYear() + 100);
            }
            if (todate.getFullYear() < 1970) {
                todate.setFullYear(todate.getFullYear() + 100);
            }
            $("#txtGrowerReportfrmdate").val(frmdate.toString("MM/dd/yyyy"));
            $("#txtGrowerReporttodate").val(todate.toString("MM/dd/yyyy"));

            $("#divGrowerReportFromDate").datepicker("setDate", frmdate.toString("MM/dd/yyyy"));
            $("#divGrowerReportToDate").datepicker("setDate", todate.toString("MM/dd/yyyy"));

            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    $("#imgPrintReports").click(function () {
        var SelectedHeader = [];
        if ($("#fgrdGrowerHeader .trSelectedHeader").length > 0) {

            if ($('#chkFarmDetailed').is(':checked') == false && $('#chkFOBDetailed').is(':checked') == false && $('#chkConsignmentDetailed').is(':checked') == false && $('#chkFOBSummary').is(':checked') == false && $('#chkConsignmentSummary').is(':checked') == false) {
                $.MessageBox("Please choose report before print!!!");
                return false;
            }

            var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');

            var FilterCondition = ""
            var Query = $("#fgrdGrowerFarmHeader").flexOptions()[0].p.query;
            var qtype = $("#fgrdGrowerFarmHeader").flexOptions()[0].p.qtype;
            if (Query != "")
                FilterCondition = qtype + " = " + "'" + Query + "'";


            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadAllFarmByGrowerHeaderID',
                data: "{'HeaderID':'" + HeaderID + "','Query':'" + Query + "','qtype':'" + qtype + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $('#lstFarmForHeaderReport').empty();
                    var Farmdata = output.d;
                    if (Farmdata != null && Farmdata.length > 0) {
                        //if (Farmdata.length > 1 && $("#DivFarmID").html() == "0") {
                        if (Farmdata.length > 1) {
                            $('#lstFarmForHeaderReport').append('<option value="0">All</option>');
                        }
                        for (var i in Farmdata) {
                            var Farms = Farmdata[i];
                            $('#lstFarmForHeaderReport').append('<option value="' + Farms.Farm.trim() + '">' + Farms.Farm.trim() + '</option>');
                        }
                        $("#lstFarmForHeaderReport").val($("#DivFarmID").html());
                        $("#chkGrowerReportAsSinglePdf").prop("checked", false)
                        if ($("#lstFarmForHeaderReport").val() == "0") {
                            $(".chkGrowerReportAsSinglePdf").show();
                        }
                        else {
                            $(".chkGrowerReportAsSinglePdf").hide();
                        }
                        var ReportNum = $("#fgrdGrowerHeader #row" + HeaderID + " td:nth-child(5) div").html();

                        $("#GetFarmAndDateRangeDialogBeforePrint").dialog('option', 'title', 'Report :: ' + ReportNum.toString());
                        $("#GetFarmAndDateRangeDialogBeforePrint").dialog("open");
                    }
                    else {
                        $.MessageBox("No records found for the selected header!!!");
                    }
                }
            });

        }
        else {
            $.MessageBox("Please select header to print!!!");
        }
    });

    $("#lstFarmForHeaderReport").change(function (event) {
        $("#chkGrowerReportAsSinglePdf").prop("checked", false)
        if ($("#lstFarmForHeaderReport").val() == "0") {
            
            $(".chkGrowerReportAsSinglePdf").show();
        }
        else {
            $(".chkGrowerReportAsSinglePdf").hide();
        }
    });



    $("#fgrdGrowerDetailNotes").flexigrid({
        url: 'BloomService.asmx/GetGrowerNotesByDetailIDForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: '', name: 'NoteNo', width: 20, sortable: false, align: 'left' },
            { display: 'Notes', name: 'Notes', width: 400, sortable: false, align: 'left' },
            { display: 'Amount', name: 'Amount', width: 100, sortable: false, align: 'left' },
        ],
        showTableToggleBtn: true,
        sortname: "NoteNo",
        sortorder: "asc",
        usepager: false,
        title: false,
        useRp: true,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: "200",
        width: "600",
        striped: true,
        params: [
            { name: 'GrowerDetailID', value: '0' },
            { name: 'ExportCSV', value: '' }
        ],
    });



    $("#GrowerDetailNotesDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Notes",
        modal: true,
        closeOnEscape: false,
        width: "680px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('#GrowerDetailNotesDialog').on('dialogclose', function (event) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateGrowerDetailAdjustAmount',
            data: "{'DetailID':'" + $("#DivDetailID1").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    $("#GrowerDetailAdjust_" + $("#DivDetailID1").html() + "").html(parseFloat(output.d).toFixed(2));
                    $("#row" + $("#DivDetailID1").html()).attr("style", "background:none;")
                    $("#row" + $("#DivDetailID1").html()).addClass("trSelected");
                    $("#DivGrowerFarmDetail .sDiv2 > input[type='button']")[1].click();//trigger clear button to refresh totals
                }
            }
        });
    });

    //For EditGrowerFarmDetail click
    $("[id^=editGrowerDetailNotes_]").die("click").live("click", function () {
        $("#NoteID").val("0");
        $("#btnAddGrowerNotes span").html("Add Note");
        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        var ID = $(this)[0].id.replace("editGrowerDetailNotes_", "");
        $("#DivDetailID1").html(ID);

        $("#fgrdGrowerFarmDetail [id^=row]").removeClass("trSelectedHeader");
        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).addClass("trSelectedHeader");
        $("#fgrdGrowerFarmDetail td.unsorted").addClass("sorted");
        $("#fgrdGrowerFarmDetail td.sorted").removeClass("unsorted");
        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html()).removeClass("trSelected");
        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.sorted").addClass("unsorted");
        $("#fgrdGrowerFarmDetail #row" + $("#DivDetailID1").html() + " td.unsorted").removeClass("sorted");

        $("#GrowerDetailNotesDialog").dialog("open");
        $("#fgrdGrowerDetailNotes").flexOptions({ params: [{ name: 'GrowerDetailID', value: ID }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
    });

    $("#btnAddGrowerNotes").die("click").live("click", function () {

        var DetailID = $("#DivDetailID1").html();
        //var NoteNo = $("#txtGrowerNoteNo").val();
        var Notes = $("#txtGrowerNotes").val();
        var Amount = $("#txtGrowerNotesAmount").val();
        if (Notes.trim() == "") {
            $("#txtGrowerNotes").focus();
            return false;
        }

        if (Amount.trim() == "") {
            $("#txtGrowerNotesAmount").focus();
            return false;
        }

        var NoteID = $("#NoteID").val();
        if (NoteID != "" && NoteID != "0") {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateGrowerNotesByNoteID',
                data: "{'NoteID':'" + NoteID + "','NoteNo':'','Notes':'" + escape(Notes) + "','Amount':'" + Amount + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "success") {
                        //   $("#txtGrowerNoteNo").val("");
                        $("#txtGrowerNotes").val("");
                        $("#txtGrowerNotesAmount").val("");
                        $("#btnAddGrowerNotes span").html("Add Note");
                        $("#NoteID").val("0");
                        $("#fgrdGrowerDetailNotes").flexOptions({ params: [{ name: 'GrowerDetailID', value: DetailID }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
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
                url: 'BloomService.asmx/SaveGrowerNotesByDetailID',
                data: "{'GrowerDetailID':'" + DetailID + "','NoteNo':'','Notes':'" + escape(Notes) + "','Amount':'" + Amount + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "success") {
                        //  $("#txtGrowerNoteNo").val("");
                        $("#txtGrowerNotes").val("");
                        $("#txtGrowerNotesAmount").val("");
                        $("#btnAddGrowerNotes span").html("Add Note");
                        $("#NoteID").val("0");
                        $("#editGrowerDetailNotes_" + DetailID + " img").attr("src", "images/notes.png");
                        $("#fgrdGrowerDetailNotes").flexOptions({ params: [{ name: 'GrowerDetailID', value: DetailID }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
    });

    $("[id^=deleteGrowerDetailNotes_]").die("click").live("click", function () {
        var NoteID = $(this)[0].id.replace("deleteGrowerDetailNotes_", "");
        var DetailID = $("#DivDetailID1").html();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteGrowerNotesByID',
            data: "{'ID':'" + NoteID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {
                    $("#txtGrowerNotes").val("");
                    $("#txtGrowerNotesAmount").val("");
                    $("#btnAddGrowerNotes span").html("Add Note");
                    $("#NoteID").val("0");
                    if ($("#fgrdGrowerDetailNotes tr").length == "1") {
                        $("#editGrowerDetailNotes_" + DetailID + " img").attr("src", "images/no-notes.png")
                    }
                    $("#fgrdGrowerDetailNotes").flexOptions({ params: [{ name: 'GrowerDetailID', value: DetailID }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    });

    $("[id^=editNotes_]").die("click").live("click", function () {
        var NoteID = $(this)[0].id.replace("editNotes_", "");
        var DetailID = $("#DivDetailID1").html();
        $("#NoteID").val(NoteID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetGrowerNotesByNoteID',
            data: "{'NoteID':'" + NoteID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    $("#btnAddGrowerNotes span").html("Update Note");
                    $("#txtGrowerNotes").val(output.d.Notes);
                    $("#txtGrowerNotesAmount").val(output.d.Amount.toFixed(2));
                    $("#txtGrowerNotes").focus();

                }
                else {
                    $("#txtGrowerNotes").val("");
                    $("#txtGrowerNotesAmount").val("");
                }
            }
        });
    });

    $("#btnImportGrowCg").die("click").live("click", function () {
        $("#msg").html("Please wait,importing from DBF...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportGrowerCgfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (output.d == "Inserted") {
                    $("#msgbox-select").dialog("close");
                    $("#msg").html("Imported Successfully...");
                    $("#msgbox-select").dialog("open");
                }
            }
        });

    });

    $("#btnGrowCg").die("click").live("click", function () {
        $("#GrowCgDialog").dialog("open");
    });

    $("#GrowCgDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Growcg",
        modal: true,
        width: "650px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#fgrdGrowerCg").flexigrid({
        url: 'BloomService.asmx/GetGrowerCgForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 40, sortable: true, align: 'left' },
            { display: 'Period', name: 'Period', width: 60, sortable: true, align: 'left' },
            { display: 'Reason', name: 'Reason', width: 200, sortable: false, align: 'left' },
            { display: 'Amount', name: 'Amount', width: 80, sortable: true, align: 'right' },
        ],
        searchitems: [
                   { display: 'Farm', name: 'Farm' }
        ],
        buttons: [
            { name: 'Import Growcg', bclass: 'import', onpress: ImportGrowCg },
            { name: 'Add Growcg', bclass: 'add', onpress: AddGrowcg },
        ],
        showTableToggleBtn: true,
        sortname: "Farm",
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
        height: "350",
        width: "620",
        striped: true,
        params: [
            { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {


        }
    });
    $("#DivFgrdGrowerCg .pcontrol input").css("width", "40px")
    $("#DivFgrdGrowerCg .btnseparator:eq(0)").hide();
    $("#DivFgrdGrowerCg .pSearch").hide();
    $("#DivFgrdGrowerCg .sDiv2").css("width", "620px");
    $("#DivFgrdGrowerCg .pDiv2").css("width", "620px").css("margin-top", "3px");
    $('#DivFgrdGrowerCg .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivFgrdGrowerCg .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivFgrdGrowerCg .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    function ImportGrowCg() {
        $("#msg").html("Please wait,importing from DBF...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportGrowerCgfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (output.d == "Inserted") {
                    $("#fgrdGrowerCg").flexReload({ url: '/url/for/refresh' });
                }
            }
        });
    }


    function OpenExpenseSaveDialog() {
        clearExpenseForm();
        //$("#txtDATE").datepicker("setDate", "-0d");
        $("#DivExpensesSaveDialog").dialog('option', 'title', "Add Expense");
        $("#DivExpensesSaveDialog").dialog("open");
    }

    function AddGrowcg() {
        $("#txtGrowCgFarm").val("");
        $("#txtGrowCgAmount").val("")
        $("#txtGrowCgReason").val("");
        $("#txtGrowCgDate").val(Date.today().toString("MM/dd/yyyy"));
        $("#DivGrowcgID").html("0");
        $("#GrowerCgSaveDialog").dialog('option', 'title', "Add Growcg");
        $("#txtGrowCgDate").attr("disabled", true);
        $("#GrowerCgSaveDialog").next('div').find('.msgui').remove();
        $("#GrowerCgSaveDialog").next('div').append("<div class='msgui'  style='margin-left: 10px;height: 17px;background:none;'></div>").css('height', '35px');
        $("#GrowerCgSaveDialog").next('div').find('.msgui').hide();
        $("#GrowerCgSaveDialog").dialog("open");
    }

   
    $("#DivExpensesSaveDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Add Expense",
        modal: true,
        width: "280px",
        buttons: {
            Save: function () {
                debugger;
                var ID = $("#txtExpenseID").val() == "" ? 0 : $("#txtExpenseID").val();
                var AWB = $("#txtAWB").val();
                var FARM = $("#txtFARM").val();
                var INVOICE = $("#txtINVOICE").val();
                var ENTRYNUM = $("#txtENTRYNUM").val();
                var DATE = $("#txtDATE").val();
                var FREIGHT = $("#txtFREIGHT").val();
                var BOXES = $("#txtBOXES").val();
                var FUMIGATION = $("#txtFUMIGATION").val();
                var HANDLING = $("#txtHandling").val();
                var OTHERCHARGES = $("#txtOtherCharges").val();
                if (AWB!= "" && BOXES!= "") {
                    $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveOrUpdateExpense',
                    data: '{"ID":"' + ID + '","AWB":"' + AWB + '","FARM":"' + FARM + '","INVOICE":"' + INVOICE + '","ENTRYNUM":"' + ENTRYNUM + '","DATEexp":"' + DATE + '","FREIGHT":"' + FREIGHT + '","BOXES":"' + BOXES + '","FUMIGATION":"' + FUMIGATION + '","HANDLING":"' + HANDLING +'","OTHERCHARGES":"' + OTHERCHARGES + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        clearExpenseForm();

                        $("#DivExpensesSaveDialog").dialog("close");
                        $("#fgrdExpenses").flexReload({ url: '/url/for/refresh' });
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        alert(err.Message);
                    }
                });
                }
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function clearExpenseForm() {
        $("#txtExpenseID").val("");
        $("#txtAWB").val("");
        $("#txtINVOICE").val("");
        $("#txtENTRYNUM").val("");
        $("#txtDATE").val("");
        $("#txtFREIGHT").val("");
        $("#txtHandling").val("");
        $("#txtBOXES").val("");
        $("#txtFUMIGATION").val("");
        $("#txtOtherCharges").val("");
    }

    $("[id^=editExpense_]").die("click").live("click", function () {
        var ID = $(this).attr('id').replace("editExpense_", "");
        $("#txtExpenseID").val(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetExpenseByID',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                var expense = output.d;
                $("#txtExpenseID").val(expense.ID);
                $("#txtAWB").val(expense.AWB);
                $("#txtFARM").val(expense.Farm);
                $("#txtINVOICE").val(expense.INVOICE);
                $("#txtENTRYNUM").val(expense.ENTRYNUM);
                $("#txtDATE").val(expense.DATEExp);
                $("#txtFREIGHT").val(expense.FREIGHT.toFixed(2));
                $("#txtBOXES").val(expense.BOXES.toFixed(3));
                $("#txtFUMIGATION").val(expense.FUMIGATION.toFixed(2));
                $("#txtOtherCharges").val(expense.OTHERCHARGES.toFixed(2));
                $("#txtHandling").val(expense.HANDLING.toFixed(2));
                $("#DivExpensesSaveDialog").dialog('option', 'title', "Edit Expense");
                $("#DivExpensesSaveDialog").dialog("open");
            }
        });
    });
    $("[id^=deleteExpense_]").die("click").live("click", function () {
        debugger;
        var ID = $(this).attr('id').replace("deleteExpense_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetExpenseByID',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                    $("#hdnExpenseID").val(ID)
                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + output.d.AWB  + "</b> ?</p>");
                    $("#Deleteconfirm").dialog("open");
            }
        });
        
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
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteExpense',
                        data: "{'ID':'" + $("#hdnExpenseID").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                              adialog.dialog("close");
                              $("#fgrdExpenses").flexReload({ url: '/url/for/refresh' });                         
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
        $("#GrowerCgSaveDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Growcg",
        modal: true,
        width: "450px",
        buttons: {
            Save: function () {
                var Farm = $("#txtGrowCgFarm").val().trim();
                if (Farm == "") {
                    $(".msgui").css("display", "block")
                    $(".msgui").html("Please enter FarmCode!!!");
                    $("#txtGrowCgFarm").focus();
                    return false;
                }
                $(".msgui").css("display", "none");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetFarmDetailsByCode',
                    data: "{'Farm': '" + Farm.trim() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        if (data.d.Farm == null || data.d.Farm == "") {
                            $(".msgui").css("display", "block")
                            $(".msgui").html("Please enter valid FarmCode!!!");
                            $("#txtGrowCgFarm").focus();
                            return false;
                        }
                        else {
                            $(".msgui").css("display", "none");
                            if ($("#txtGrowCgAmount").val().trim() == "") {
                                var Amount = 0
                            }
                            else {
                                var Amount = $("#txtGrowCgAmount").val()
                            }

                            var Reason = $("#txtGrowCgReason").val();
                            var Date = $("#txtGrowCgDate").val();
                            var ID = $("#DivGrowcgID").html();

                            if (ID == "0" || ID == "") {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/SaveGrowerCg',
                                    data: '{"GrDate":"' + Date + '","Farm":"' + Farm + '","Reason":"' + Reason + '","Amount":"' + Amount + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        $("#GrowerCgSaveDialog").dialog("close");
                                        $("#fgrdGrowerCg").flexReload({ url: '/url/for/refresh' });
                                    }
                                });
                            }
                            else {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/UpdateGrowerCg',
                                    data: '{"ID":"' + ID + '","Farm":"' + Farm + '","GrDate":"' + Date + '","Reason":"' + Reason + '","Amount":"' + Amount + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        $("#GrowerCgSaveDialog").dialog("close");
                                        $("#fgrdGrowerCg").flexReload({ url: '/url/for/refresh' });
                                    }
                                });
                            }
                        }
                    }
                });


            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            $("#txtGrowCgDate").attr("disabled", false);
        }
    });

    $("[id^=editGrowCg_]").die("click").live("click", function () {
        var ID = $(this).attr('id').replace("editGrowCg_", "");
        $("#txtGrowCgDate").attr("disabled", true);
        $("#DivGrowcgID").html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetGrowerCgDetailsyID',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var GrowCg = output.d;
                $("#txtGrowCgDate").val(GrowCg.Period);
                $("#txtGrowCgReason").val(GrowCg.Reason);
                $("#txtGrowCgAmount").val(GrowCg.Amount.toFixed(2));
                $("#txtGrowCgFarm").val(GrowCg.Farm);
                $("#GrowerCgSaveDialog").dialog('option', 'title', "Edit Growcg::" + GrowCg.Farm + "");
                $("#GrowerCgSaveDialog").dialog("open");
            }
        });
    });

    $("[id^=deleteGrowCg_]").die("click").live("click", function () {
        var ID = $(this).attr('id').replace("deleteGrowCg_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteGrowerCg',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#fgrdGrowerCg").flexReload({ url: '/url/for/refresh' });
            }
        });
    });


    $("#txtGrowCgDate").datepicker({
        dateFormat: 'mm/dd/yy',
    });

    $("#chkByAWBFarm").change(function () {
        var chkByAWBFarm = $("#chkByAWBFarm").is(":checked") ? "0" : "1";
        $("#DivFarmOrAWB").html(chkByAWBFarm);
        if (chkByAWBFarm == "0") {
            $("#DivGrowerAWBHeader").show();
            $("#DivGrowerFarmHeader").hide();

            var id = $("#DivHeaderID").html();
            $("#DivDetailID").html("");
            //$("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
            $("#DivGrowerFarmDetail").hide();

            $("#fgrdGrowerAWBHeader [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
            $("#fgrdGrowerAWBHeader td.unsorted").addClass("sorted");
            $("#fgrdGrowerAWBHeader td.sorted").removeClass("unsorted");
            $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
            $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
            $("#fgrdGrowerAWBHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");
            $("#DivFarmID").html("0");
        }
        else if (chkByAWBFarm == "1") {
            $("#DivGrowerAWBHeader").hide();
            $("#DivGrowerFarmHeader").show();
            var id = $("#DivHeaderID").html();
            $("#DivDetailID").html("");
            // $("#fgrdGrowerFarmHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
            $("#DivGrowerFarmDetail").hide();

            $("#fgrdGrowerFarmHeader [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).addClass("trSelectedHeader");
            $("#fgrdGrowerFarmHeader td.unsorted").addClass("sorted");
            $("#fgrdGrowerFarmHeader td.sorted").removeClass("unsorted");
            $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html()).removeClass("trSelected");
            $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.sorted").addClass("unsorted");
            $("#fgrdGrowerFarmHeader #row" + $("#DivDetailID").html() + " td.unsorted").removeClass("sorted");
            $("#DivFarmID").html("0");
        }

    });

    $("#fgrdGrowerInv").flexigrid({
        url: 'BloomService.asmx/GetGrowerInvoiceDetailsByFarm',
        dataType: 'xml',
        colModel: [
            { display: 'Farm', name: 'Farm', width: 26, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 80, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 50, sortable: true, align: 'left' },
            { display: 'Date', name: 'ReceivingDate', width: 55, sortable: true, align: 'left' },
            { display: '$ Amount', name: 'Amount', width: 75, sortable: true, align: 'right' },
            { display: '', name: '', width: 20, sortable: false, align: 'right' },
            { display: '', name: '', width: 15, sortable: false, align: 'left' },
        ],
        searchitems: [
                   //{ display: 'Farm', name: 'Farm' },
                   { display: 'AWB', name: 'AWB' },
                   { display: 'Invoice', name: 'Invoice' },
                   { display: 'Date', name: 'ReceivingDate' }
        ],

        showTableToggleBtn: true,
        sortname: "ReceivingDate asc",
        sortorder: "",
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
        height: "350",
        width: "430",//540,620,495
        striped: true,
        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'Filter', value: '' }
        ],
        onSuccess: function () {

            //For to show the error
            if ($("#fgrdGrowerInv tr#row-2").length > 0) {
                $("#fgrdGrowerInv tr#row-2").hide();
                $.MessageBox($("#fgrdGrowerInv tr#row-2")[0].innerText);
                return false;
            }

            $("#DivFgrdGrowerInv #ExportCSV").show();

            //For TotalRows

            /*Total*/   $('#fgrdGrowerInv #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            /*Amount*/   $('#fgrdGrowerInv #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdGrowerInv #row0').addClass("TotalRows");
        }
    });
    $("#DivFgrdGrowerInv .sDiv").find(".sDiv2").find(".qsbox").css("width", "120px");
    $("#DivFgrdGrowerInv .btnseparator:eq(0)").hide();
    $("#DivFgrdGrowerInv .pSearch").hide();
    $("#DivFgrdGrowerInv .sDiv2").css("width", "430px");
    $("#DivFgrdGrowerInv .pDiv2").css("width", "430px").css("margin-top", "3px");
    $('#DivFgrdGrowerInv .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivFgrdGrowerInv .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivFgrdGrowerInv .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    $("#DivGrowerInv").dialog({
        autoOpen: false,
        resizable: false,
        title: "Growcg",
        modal: true,
        width: "450",//560,635,525
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("[id^=editGrowerFarmHeader_").die('click').live('click', function () {

        $(".HeaderYellowWarning").hide();
        $(".HeaderWarning").hide();
        //var ID = $(this)[0].id.replace("editGrowerFarmHeader_", "");
        //$("#DivHeaderID").html(ID);

        var splitstr = $(this).attr('id').split("_");
        var HeaderID = splitstr[1];
        var Farm = splitstr[2];

        //var Farm = $(this)[0].id.replace("editGrowerFarmHeader_", ""); //$(this).attr('id').substring(6);
        //var HeaderID = $("#DivHeaderID").html();

        var Filter = "HeaderID=" + HeaderID + " and Farm='" + Farm + "'";
        $("#fgrdGrowerInv").empty();
        $("#fgrdGrowerInv").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
        $("#DivGrowerInv").dialog('option', 'title', "Invoice Details for Farm :: " + Farm);
        $("#DivGrowerInv").dialog('open');
    });

    $("[id^=GrowerInvoiceSelect_]").die("click").live("click", function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("GrowerInvoiceSelect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleGrowerInvoiceSelected',
            data: "{'Selected':'" + Selected + "','ID':'" + headers + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    sourceCtl.closest('tr').addClass("trChecked");
                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id ^= GrowerInvoiceSelectall]").attr("src", "images/check-off.png");
                    sourceCtl.closest('tr').removeClass("trChecked");
                }
            }
        });

    });

    function LoadZoomContainer(Path) {

        $('#HeaderImagezoom_container').smoothZoom('destroy').css('background-image', 'url(zoom_assets/preloader.gif)').smoothZoom({
            image_url: Path,
            initial_POSITION: '0 0',
            width: $("#DivShowInvoiceImage").width(),
            height: $("#DivShowInvoiceImage").height(),
            initial_POSITION: '0 0',
            initial_ZOOM: 0,
            responsive: false,
            responsive_maintain_ratio: true,
            max_WIDTH: '',
            max_HEIGHT: ''
        });
    }

    //Invoice file upload button :: change function
    $("#GrowerInvoiceFile").change(function () {

        var val = $(this).val();
        switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
            case 'png':
            case 'jpg':
            case 'jpeg':
                $(".YellowWarning").hide();
                var val = $("#GrowerInvoiceFile").val();
                var filename = val.substring(val.lastIndexOf('\\') + 1);
                if (filename != "") {
                    var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
                    $("body").append(iframe);
                    var form = $('#invoicefileuploader');
                    form.attr("target", "postiframe");
                    form.attr("file", $('#GrowerInvoiceFile').val());
                    form.submit();
                }
                break;
            default:
                //$(this).val('');
                //$(".HeaderYellowWarning").hide();
                //$(".HeaderYellowWarning").html("Please select image!");
                //$(".HeaderYellowWarning").fadeIn(1000);
                $(".YellowWarning").html("Please choose jpg or png files only");
                $(".YellowWarning").show();
                break;
        }
    });

    function startInvoiceFileUpload() {

        $('#upload_File_process').show();
        $('#upload_File_form').hide();
        return true;
    }

    function stopUploadInvoiceFiles(path, fileType) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SaveInvoiceUploadFiles',
            data: "{'DetailID':'" + $("#hdndetailid").val() + "','InvFileName':'" + path + "','fileType':'" + fileType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var res = output.d;

                if (output.d == "success") {
                    var Filepath = ("<%=ConfigurationManager.AppSettings("UserUploadPath")%>").toString() + "/" + ("<%=ConfigurationManager.AppSettings("GrowerReportInvoicePath")%>").toString().replace("{0}", $("#hdndetailid").val()) + "/" + path;
                        if (fileType.toLowerCase() == ".jpeg" || fileType.toLowerCase() == ".jpg" || fileType.toLowerCase() == ".png") {
                            LoadZoomContainer(Filepath);
                            $("#ShowFileName").html(path);
                        }
                    //else if (fileType.toLowerCase() == ".pdf") {
                    //    $.ajax({
                    //        url: Filepath,
                    //        type: 'HEAD',
                    //        error: function () {
                    //            $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
                    //        },
                    //        success: function () {
                    //            $("#IfrmPDFFile").attr("src", Filepath);
                    //        }
                    //    });
                    //}

                        $("#lnkGrowerInvoiceFile_" + $("#hdndetailid").val() + "_" + $("#hdninvoice").val() + "_" + $("#hdnawb").val()).attr('title', (path == "") ? '' : path);
                        $("#lnkGrowerInvoiceFile_" + $("#hdndetailid").val() + "_" + $("#hdninvoice").val() + "_" + $("#hdnawb").val()).attr('data-filename', (path == "") ? '' : path);
                        $("#lnkGrowerInvoiceFile_" + $("#hdndetailid").val() + "_" + $("#hdninvoice").val() + "_" + $("#hdnawb").val()).html("<img src='images/editfile.png' height='16' width='16'/>");

                    //    $("#fgrdGrowerInv").flexReload({ url: '/url/for/refresh' });          //comment on 05-10-2016
                    //$("#fgrdGrowerInv").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                        $("#DivExecutionResult").html("Files upload Successfully");
                        $('#upload_File_process').hide();
                        $('#upload_File_form').show();
                    }
                    else
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
        }


        $("[id^=lnkGrowerInvoiceFile_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var splitstr = sourceCtl.attr('id').split("_");
            var DetailID = splitstr[1];
            var Invoice = splitstr[2];
            var AWB = splitstr[3];
            $("#hdndetailid").val(DetailID);
            $("#hdninvoice").val(Invoice);
            $("#hdnawb").val(AWB);

            //var FileName = sourceCtl[0].innerHTML;
            var FileName = $("#lnkGrowerInvoiceFile_" + $("#hdndetailid").val() + "_" + Invoice + "_" + AWB).attr("data-filename");
            var Filepath = ("<%=ConfigurationManager.AppSettings("UserUploadPath")%>").toString() + "/" + ("<%=ConfigurationManager.AppSettings("GrowerReportInvoicePath")%>").toString().replace("{0}", DetailID) + "/" + FileName;
            LoadZoomContainer(Filepath);
            $("#DivShowInvoiceImage").show();
            $("#ShowFileName").html(FileName);
            $("#GrowerInvoiceFile").prop("accept", ".jpg,.jpeg,.png");
            $("#DivInvoiceImageDialog").dialog('option', 'title', "Image :: " + Invoice + " - " + AWB);
            $("#DivInvoiceImageDialog").dialog("open");
            $("#GrowerInvoiceFile").val('');
            $('#upload_File_process').hide();
            $('#upload_File_form').show();
        });

        $("#DivInvoiceImageDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            width: 700,
            height: 615,//550,585,575
            modal: true,
            open: function () {
                $("#trUploadInvoiceFiles").show();
                $(".YellowWarning").hide();
            }
        });

        //Farm Header:: File Upload

        function LoadFarmZoomContainer(Path) {

            $('#HeaderFarmImagezoom_container').smoothZoom('destroy').css('background-image', 'url(zoom_assets/preloader.gif)').smoothZoom({
                image_url: Path,
                initial_POSITION: '0 0',
                width: $("#DivShowFarmImage").width(),
                height: $("#DivShowFarmImage").height(),
                initial_POSITION: '0 0',
                initial_ZOOM: 0,
                responsive: false,
                responsive_maintain_ratio: true,
                max_WIDTH: '',
                max_HEIGHT: ''
            });
        }

        //Farm file upload button :: change function
        $("#GrowerFarmFile").change(function () {

            var val = $(this).val();
            switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
                case 'png':
                case 'pdf':
                case 'jpg':
                case 'jpeg':
                    $(".YellowWarning").hide();
                    var val = $("#GrowerFarmFile").val();
                    var filename = val.substring(val.lastIndexOf('\\') + 1);
                    if (filename != "") {
                        var filetype = filename.substring(filename.lastIndexOf('.'));
                        var FarmFileName = filename.replace(filetype, "") + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val() + filetype

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveFarmUploadFiles',
                            data: "{'HeaderID':'" + $("#hdnfarmheaderid").val() + "','Farm':'" + $("#hdnfarmcode").val() + "','FarmFileName':'" + FarmFileName + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                var res = output.d;
                                if (res != 0) {
                                    $("#lnkGrowerFarmFile_" + $("#hdnfarmdetailid").val() + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).html(FarmFileName);
                                    $("#lnkGrowerFarmFile_" + $("#hdnfarmdetailid").val() + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).attr('id', "lnkGrowerFarmFile_" + res + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val());
                                    $("#lnkGrowerFarmFile_" + res + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).attr('title', (FarmFileName == "") ? '' : FarmFileName);
                                    $("#lnkGrowerFarmFile_" + res + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).attr('data-filename', (FarmFileName == "") ? '' : FarmFileName);
                                    $("#lnkGrowerFarmFile_" + res + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).html("<img src='images/editfile.png' height='16' width='16'/>");
                                    $("#hdnfarmdetailid").val(res);

                                    var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
                                    $("body").append(iframe);
                                    var form = $('#farmfileuploader');
                                    form.attr("target", "postiframe");
                                    form.attr("file", $('#GrowerFarmFile').val());
                                    form.submit();
                                }
                            }
                        });
                    }
                    break;
                default:
                    $(".YellowWarning").html("Please choose jpg or pdf files only");
                    $(".YellowWarning").show();
                    break;
            }
        });

        function startFarmFileUpload() {

            $('#upload_FarmFile_process').show();
            $('#upload_FarmFile_form').hide();
            return true;
        }

        function stopUploadFarmFiles(path, fileType) {

            var Filepath = ("<%=ConfigurationManager.AppSettings("UserUploadPath")%>").toString() + "/" + ("<%=ConfigurationManager.AppSettings("GrowerReportFarmPath")%>").toString().replace("{0}", $("#hdnfarmdetailid").val()) + "/" + path;
            if (fileType.toLowerCase() == ".jpeg" || fileType.toLowerCase() == ".jpg" || fileType.toLowerCase() == ".png") {
                $("#HeaderFarmImagezoom_container").show();
                $("#HeaderFarmPdfzoom_container").hide();
                LoadFarmZoomContainer(Filepath);
                $("#ShowFarmFileName").html(path);
            }

            else if (fileType.toLowerCase() == ".pdf") {
                $.ajax({
                    url: Filepath,
                    type: 'GET',
                    success: function () {

                        $("#HeaderFarmImagezoom_container").hide();
                        $("#HeaderFarmPdfzoom_container").show();
                        $("#IfrmPDFFile").attr("src", Filepath);
                        $("#ShowFarmFileName").html(path);
                    },
                    error: function () {

                        $("#HeaderFarmImagezoom_container").hide();
                        $("#HeaderFarmPdfzoom_container").show();
                        $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
                    }
                });
            }

            //$("#lnkGrowerFarmFile_" + $("#hdnfarmdetailid").val() + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).html(path);

            $("#DivExecutionResult").html("Files upload Successfully");
            $('#upload_FarmFile_process').hide();
            $('#upload_FarmFile_form').show();

        }

        $("[id^=lnkGrowerFarmFile_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            //var DetailID = sourceCtl.attr('id').replace("lnkGrowerFarmFile_", "");
            var splitstr = sourceCtl.attr('id').split("_");
            var FarmDetailID = splitstr[1];
            var HeaderID = splitstr[2];
            var Farm = splitstr[3];
            $("#hdnfarmdetailid").val(FarmDetailID);
            $("#hdnfarmheaderid").val(HeaderID);
            $("#hdnfarmcode").val(Farm);
            //var FileName = sourceCtl[0].innerHTML;
            var FileName = $("#lnkGrowerFarmFile_" + $("#hdnfarmdetailid").val() + "_" + $("#hdnfarmheaderid").val() + "_" + $("#hdnfarmcode").val()).attr("data-filename");
            var Filepath = ("<%=ConfigurationManager.AppSettings("UserUploadPath")%>").toString() + "/" + ("<%=ConfigurationManager.AppSettings("GrowerReportFarmPath")%>").toString().replace("{0}", FarmDetailID) + "/" + FileName;
            //var FileType = sourceCtl[0].innerHTML.substring(sourceCtl[0].innerHTML.lastIndexOf('.') + 1).toLowerCase()
            var FileType = FileName.substring(FileName.lastIndexOf('.') + 1).toLowerCase()
            if (FileType == 'pdf') {
                //$("#HeaderFarmImagezoom_container").hide();
                //$("#HeaderFarmPdfzoom_container").show();
                //$("#IfrmPDFFile").attr("src", Filepath);
                $.ajax({
                    url: Filepath,
                    type: 'GET',
                    success: function () {

                        //$("#HeaderFarmImagezoom_container").hide();
                        //$("#HeaderFarmPdfzoom_container").show();
                        //$("#IfrmPDFFile").attr("src", Filepath);
                        //$("#ShowFarmFileName").html(path);
                        $("#HeaderFarmImagezoom_container").hide();
                        $("#HeaderFarmPdfzoom_container").show();
                        $("#IfrmPDFFile").attr("src", Filepath);
                    },
                    error: function () {

                        $("#HeaderFarmImagezoom_container").hide();
                        $("#HeaderFarmPdfzoom_container").show();
                        $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
                    }
                });
            }
            else {
                $("#HeaderFarmImagezoom_container").show();
                $("#HeaderFarmPdfzoom_container").hide();
                LoadFarmZoomContainer(Filepath);
            }

            $("#DivShowFarmImage").show();
            $("#ShowFarmFileName").html(FileName);
            $("#GrowerFarmFile").prop("accept", ".jpg,.jpeg,.png,.pdf");
            $("#DivFarmImageDialog").dialog('option', 'title', "Image :: " + Farm);
            $("#DivFarmImageDialog").dialog("open");
            $("#GrowerFarmFile").val('');
            $('#upload_FarmFile_process').hide();
            $('#upload_FarmFile_form').show();
        });

        $("#DivFarmImageDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            width: 700,
            height: 615,//550,585,575
            modal: true,
            open: function () {
                $("#trUploadFarmFiles").show();
                $(".YellowWarning").hide();
            }
        });

        $("#txtGrowerDetailDaterec").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

        //$("#txtGrowerDetailGross").change(function (event) {
        //    var GrossVal = $("#txtGrowerDetailGross").val() == "" ? $("#txtGrowerDetailGross").attr("Placeholder") : $("#txtGrowerDetailGross").val();
        //    var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        //    if (GrossVal != "" && TotalUnitsVal != "") {
        //        if (TotalUnitsVal != "0") {
        //            $("#txtGrowerDetailCost").val((GrossVal / TotalUnitsVal).toFixed(4));
        //        }
        //        else {
        //            $("#txtGrowerDetailCost").val("0.0000");
        //            $("#txtGrowerDetailGross").val("0.00");
        //        }
        //    }
        //});

        //$("#txtGrowerDetailPrice").change(function (event) {
        //    
        //    var PriceVal = $("#txtGrowerDetailPrice").val() == "" ? $("#txtGrowerDetailPrice").attr("Placeholder") : $("#txtGrowerDetailPrice").val();
        //    var TotalUnitsVal = $("#txtGrowerDetailTotalUnits").val() == "" ? $("#txtGrowerDetailTotalUnits").attr("Placeholder") : $("#txtGrowerDetailTotalUnits").val();
        //    if (PriceVal != "" && TotalUnitsVal != "") {
        //        $("#txtGrowerDetailGross").val((PriceVal * TotalUnitsVal).toFixed(2));
        //    }
        //    else {
        //        $("#txtGrowerDetailGross").val("0.00");
        //        $("#txtGrowerDetailPrice").val("0.0000");
        //    }
        //});

        //Farm as link-> for edit invoice details for farm.
        //$("[id^=aFarm_").die('click').live('click', function () {

        //   
        //    var Farm = $(this).attr('id').substring(6);
        //    var HeaderID = $("#DivHeaderID").html();
        //    var Filter = "HeaderID=" + HeaderID + " and Farm='" + Farm + "'";
        //    $("#fgrdGrowerInv").empty();
        //    $("#fgrdGrowerInv").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
        //    $("#DivGrowerInv").dialog('option', 'title', "Invoice Details for Farm :: " + Farm);
        //    $("#DivGrowerInv").dialog('open');
        //});

        //0-AWB,1-Farm

        //$("#btnByAWB").die("click").live("click", function () {
        //    
        //    $("#DivFarmOrAWB").html("0");
        //    $("#DivGrowerAWBHeader").show();
        //    //$("#fgrdGrowerAWBHeader").empty();
        //    var id = $("#DivHeaderID").html();
        //    $("#DivDetailID").html("");
        //    $("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

        //    //$("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
        //    //$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
        //    $("#DivGrowerFarmDetail").hide();
        //     $("#DivGrowerFarmHeader").hide();
        //});

        //$("#btnByFarm").die("click").live("click", function () {
        //    
        //    $("#DivFarmOrAWB").html("1");
        //    $("#DivGrowerAWBHeader").hide();
        //    $("#DivGrowerFarmHeader").show();
        //    //$("#fgrdGrowerFarmHeader").empty();
        //    var id = $("#DivHeaderID").html();
        //    $("#DivDetailID").html("");
        //    $("#fgrdGrowerFarmHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

        //    //$("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
        //    //$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
        //    $("#DivGrowerFarmDetail").hide();
        //});

        //$('#DivGrowerAWBFarmType').on("click", "button[name=btnByAWB]", function () {
        //    var btnByAWB = $(this).attr("value");
        //    $("#DivFarmOrAWB").html(btnByAWB);
        //    $("#DivGrowerAWBFarmType").find('button').removeClass('is-checked');
        //    $("#DivGrowerAWBFarmType").find('button[value=' + btnByAWB + ']').addClass('is-checked');
        //$("#DivGrowerAWBHeader").show();
        ////$("#fgrdGrowerAWBHeader").empty();
        //var id = $("#DivHeaderID").html();
        //$("#DivDetailID").html("");
        //$("#fgrdGrowerAWBHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

        ////$("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
        ////$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
        //$("#DivGrowerFarmDetail").hide();
        //$("#DivGrowerFarmHeader").hide();
        //});

        //$('#DivGrowerAWBFarmType').on("click", "button[name=btnByFarm]", function () {
        //    var btnByFarm = $(this).attr("value");
        //    $("#DivFarmOrAWB").html(btnByFarm);
        //    $("#DivGrowerAWBFarmType").find('button').removeClass('is-checked');
        //    $("#DivGrowerAWBFarmType").find('button[value=' + btnByFarm + ']').addClass('is-checked');
        //$("#DivGrowerAWBHeader").hide();
        //$("#DivGrowerFarmHeader").show();
        ////$("#fgrdGrowerFarmHeader").empty();
        //var id = $("#DivHeaderID").html();
        //$("#DivDetailID").html("");
        //$("#fgrdGrowerFarmHeader").flexOptions({ params: [{ name: 'Filter', value: "HeaderID=" + id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

        ////$("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
        ////$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
        //$("#DivGrowerFarmDetail").hide();
        //});

        $("[id^=deleteGrowerFarm_]").die("click").live("click", function () {

            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var HeaderID = ID.split("_")[1]
            var Farm = ID.split("_")[2]

            //CheckGrowerReportIsAlreadyLocked(HeaderID, function (Alreadylocked) {
            //    if (Alreadylocked.indexOf("is locked") != "-1") {
            //        $.MessageBox(Alreadylocked);
            //    }

            var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();
            if (IsLocked.trim() != "") {
                $.MessageBox(IsLocked);
            }
            else {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteGrowerFarmByHeaderID',
                    data: '{"HeaderID":"' + HeaderID + '","Farm":"' + Farm + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != null && output.d == "valid") {
                            $("#MsgWarning").dialog("close");
                            $("#deleteGrowerFarm_" + HeaderID + "_" + Farm).closest('tr').remove();
                            $("#DivGrowerFarmDetail").hide();
                        }
                    }
                });
            }
            // });
        });

        $("[id^=deleteGrowerAWB_]").die("click").live("click", function () {
            debugger;
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var HeaderID = ID.split("_")[1]
            var AWB = ID.split("_")[2]

            //CheckGrowerReportIsAlreadyLocked(HeaderID, function (Alreadylocked) {
            //    if (Alreadylocked.indexOf("is locked") != "-1") {
            //        $.MessageBox(Alreadylocked);
            //    }

            var IsLocked = $('#fgrdGrowerHeader #row' + HeaderID + ' td:nth-child(9) div').text();
            if (IsLocked.trim() != "") {
                $.MessageBox(IsLocked);
            }
            else {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteGrowerAWBByHeaderID',
                    data: '{"HeaderID":"' + HeaderID + '","AWB":"' + AWB + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null && output.d == "valid") {
                            $("#MsgWarning").dialog("close");
                            $("#deleteGrowerAWB_" + HeaderID + "_" + AWB).closest('tr').remove();
                            $("#DivGrowerFarmDetail").hide();
                        }
                    }
                });
            }
            // });
        });

        $("#btnInsert").die("click").live("click", function () {
            if ($("#fgrdGrowerHeader .trSelectedHeader").length > 0) {

                var ReportName = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(5) div").html();
                var FromDate = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(3) div").html();
                var ToDate = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(4) div").html();
                var frmdate = new Date(FromDate);
                var todate = new Date(ToDate);
                if (frmdate.getFullYear() < 1970) {
                    frmdate.setFullYear(frmdate.getFullYear() + 100);
                }
                if (todate.getFullYear() < 1970) {
                    todate.setFullYear(todate.getFullYear() + 100);
                }
                $("#txtGrowerHeaderFromdate_Reinsert").val(frmdate.toString("MM/dd/yyyy"));
                $("#txtGrowerHeaderTodate_Reinsert").val(todate.toString("MM/dd/yyyy"));
                $("#txtReportName_Reinsert").val(ReportName);
                $("#txtGrowerHeaderFromdate_Reinsert").attr("disabled", true);
                $("#txtGrowerHeaderTodate_Reinsert").attr("disabled", true);
                $("#txtReportName_Reinsert").attr("disabled", true);
                $("#DivReinsertFarmDialog").dialog('option', 'title', "Insert Farm :: " + ReportName + "");
                $("#DivReinsertFarmDialog").dialog("open");
            }
            else {
                $.MessageBox("Please choose header!!!");
            }
        });


        $("#DivReinsertFarmDialog").dialog({
            autoOpen: false,
            width: 450,
            modal: true,
            resizable: false,
            buttons: {
                Insert: function () {

                    if ($("#txtGrowerHeaderFromdate_Reinsert").val().trim() == "") {
                        $(".HeaderYellowWarning_Reinsert").html("Please choose date");
                        $(".HeaderYellowWarning_Reinsert").show();
                        $("#txtGrowerHeaderFromdate_Reinsert").focus();
                        return false;
                    }

                    if ($("#txtGrowerHeaderTodate_Reinsert").val().trim() == "") {
                        $(".HeaderYellowWarning_Reinsert").html("Please choose date");
                        $(".HeaderYellowWarning_Reinsert").show();
                        $("#txtGrowerHeaderTodate_Reinsert").focus();
                        return false;
                    }

                    if ($("#txtReportName_Reinsert").val().trim() == "") {
                        $(".HeaderYellowWarning_Reinsert").html("Please enter ReportName!!!");
                        $(".HeaderYellowWarning_Reinsert").show();
                        $("#txtReportName_Reinsert").focus();
                        return false;
                    }

                    if ($("#txtFarmForReinsert").val().trim() == "") {
                        $(".HeaderYellowWarning_Reinsert").html("Please enter Farm!!!");
                        $(".HeaderYellowWarning_Reinsert").show();
                        $("#txtFarmForReinsert").focus();
                        return false;
                    }


                    var HeaderID = $("#fgrdGrowerHeader .trSelectedHeader").attr('id').replace('row', '');
                    var ReportNumber = $("#fgrdGrowerHeader .trSelectedHeader td:nth-child(6) div").html();
                    var farm = $("#txtFarmForReinsert").val();

                    if (farm.trim() == "") {
                        $("#txtFarmForReinsert").focus();
                        return false;
                    }
                    $(".dialogProgress").show();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/SaveGrowerHeader',
                        data: '{"HeaderID":"' + HeaderID + '","HeaderFromDate":"' + $("#txtGrowerHeaderFromdate_Reinsert").val() + '","HeaderToDate":"' + $("#txtGrowerHeaderTodate_Reinsert").val() + '",ReportName:"' + $("#txtReportName_Reinsert").val() + '","ReportNumber":"' + ReportNumber + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/ReInsertFarmForHeader',
                                    data: '{"HeaderID":"' + HeaderID + '","Farm":"' + farm + '","ReportNumber":"' + ReportNumber + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        $(".dialogProgress").hide();
                                        if (output.d == "No data") {
                                            $("#txtFarmForReinsert").focus();
                                            $.MessageBox("could not find any records for the given farm <b>" + farm + "</b>");
                                        }
                                        else if (output.d == 'LogOut') {
                                            window.location.href = "Login.aspx";
                                        }
                                        else if (output.d == 'success') {
                                            $("#DivReinsertFarmDialog").dialog("close");
                                            $("#fgrdGrowerFarmHeader").flexReload({ url: '/url/for/refresh' });
                                            $("#fgrdGrowerHeader").flexReload({ url: '/url/for/refresh' });
                                        }
                                        else if (output.d == 'error') {
                                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                        }
                                        else {
                                            $.MessageBox(output.d);
                                        }
                                    }
                                });
                            }
                            else if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else {
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }

                        }
                    });
                },
                Cancel: function () {
                    $("#DivReinsertFarmDialog").dialog("close");
                }
            },
            open: function () {
                $("#txtGrowerHeaderFromdate_Reinsert").attr("disabled", false);
                $("#txtGrowerHeaderTodate_Reinsert").attr("disabled", false);
                $("#txtReportName_Reinsert").attr("disabled", false);
                $(".HeaderYellowWarning_Reinsert").hide();
                $(".HeaderWarning_Reinsert").hide()
                $("#txtFarmForReinsert").val("");
                $(".ui-dialog-buttonpane div.dialogProgress").remove();
                $(".ui-dialog-buttonpane").append("<div class='dialogProgress' style='float:left;margin:10px;display:none;'><b>Inserting...</b><img src='images/ajax-loader.gif' /></div>")
                $(".ui-dialog-buttonpane button:contains('Insert')").addClass('dialogbuttonstyle icon-save')
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }
        });


        $("#chkHeaderISActive").change(function () {
            var chkHeaderISActive = $("#chkHeaderISActive").is(":checked") ? "1" : "0";

            if (chkHeaderISActive == "0") {
                $("#fgrdGrowerHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() }, { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() }, { name: 'IsActive', value: 0 }], query: "", newp: 1 }).flexReload();
            }
            else {
                $("#fgrdGrowerHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtGrowerHeaderfrmdate").val() }, { name: 'ToDate', value: $("#txtGrowerHeadertodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
            }

            $("#DivHeaderID").html("0");
            $("#DivDetailID").html("");
            $("#DivFarmID").html("0");
            $("#DivGrowerAWBHeader").hide();
            $("#DivGrowerFarmHeader").hide();
            $("#DivGrowerFarmDetail").hide();

        });


        function ChangelockStatus(lockedstatus, HeaderID) {




        }

        $("[id^=imglock_]").die("click").live("click", function () {
            var CurrentIDs = $(this)[0].id;
            var IsLocked = CurrentIDs.split("_")[1];
            var HeaderID = CurrentIDs.split("_")[2];
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CheckAndChangeGrowerLockStatusForUser',
                data: '{"IsLocked":"' + IsLocked + '","HeaderID":"' + HeaderID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx";
                    }
                    else if (output.d == "Not Authorised") {
                        $.MessageBox("You are not authorized to change the lock status of grower reports!!!");
                    }
                    else if (output.d == "StatusChanged") {
                        if (IsLocked == "1") {
                            $("#" + CurrentIDs).attr("src", "images/unlocked.png")
                            $("#" + CurrentIDs).attr("id", "imglock_0_" + HeaderID)
                        }
                        else {
                            $("#" + CurrentIDs).attr("src", "images/locked.png")
                            $("#" + CurrentIDs).attr("id", "imglock_1_" + HeaderID)
                        }
                    }
                    else if (output.d.indexOf("is locked") != "-1") {
                        $.MessageBox(output.d);
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        });

        function CheckGrowerReportIsAlreadyLocked(HeaderID, callBack) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CheckGrowerReportIsAlreadyLocked',
                data: '{"HeaderID":"' + HeaderID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx";
                    }
                    else if (output.d == null) {
                        return callBack("0");
                    }
                    else if (output.d.indexOf("is locked") != "-1") {
                        return callBack(output.d);
                    }
                    else {
                        return callBack("0");
                    }
                }
            });
        }


        $("#btnFarmEmail").die("click").live("click", function () {
            $("#DivFarmEmailDialog").dialog("open");
        });

        $("#DivFarmEmailDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "Email",
            modal: true,
            width: "900px",
            buttons: {
                Close: function () {
                    $(this).dialog("close");
                }
            },
            open: function () {

                try {

                    var Query = $('#DivGrowerFarmHeader [name="q"]').val();
                    var Qtype = $('#DivGrowerFarmHeader [name="qtype"]').val();
                    if (Query != "") {
                        if (Qtype != "Boxes") {
                            $('#DivFgrdFarmEmail [name="qtype"]').val(Qtype);
                            $('#DivFgrdFarmEmail [name="q"]').val(Query);
                            $('#DivFgrdFarmEmail [value="Search"]').click();
                        }
                    }
                    else {
                        $("#fgrdFarmEmail").flexOptions({ params: [{ name: 'ExportCSV', value: "" }, { name: 'HeaderID', value: $("#DivHeaderID").html() }], query: "", newp: 1 }).flexReload();
                    }

                }
                catch (ex) {

                    $("#fgrdFarmEmail").flexOptions({ params: [{ name: 'ExportCSV', value: "" }, { name: 'HeaderID', value: $("#DivHeaderID").html() }], query: "", newp: 1 }).flexReload();
                }
                $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')

            }
        });



        function ImportFarmEmail() {
            $("#msg").html("Please wait,importing from DBF...  <img src='images/ajax-loader.gif' />");
            $("#msgbox-select").dialog("open");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ImportFarmEmailfromDBF',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $("#msgbox-select").dialog("close");
                    if (output.d == "Inserted") {
                        $("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                    }
                }
            });
        }

        function AddFarmEmail() {
            $("#txtGrowerFarm").val("");
            $("#txtGrowerEmail").val("");
            $("#txtGrowerFarm").attr("readonly", false);
            $("#DivFarmEmailID").html("0");
            $("#DivFarmEmailSaveDialog").dialog('option', 'title', "Add Farm Email");
            $("#DivFarmEmailSaveDialog").next('div').find('.msgui').remove();
            $("#DivFarmEmailSaveDialog").next('div').append("<div class='msgui'  style='margin-left: 10px;height: 17px;background:none;'></div>").css('height', '35px');
            $("#DivFarmEmailSaveDialog").next('div').find('.msgui').hide();
            $("#DivFarmEmailSaveDialog").dialog("open");
        }


        $("#DivFarmEmailSaveDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "Farm Email",
            modal: true,
            width: "450px",
            buttons: {
                Save: function () {
                    var Farm = $("#txtGrowerFarm").val().trim();
                    if (Farm == "") {
                        $(".msgui").css("display", "block")
                        $(".msgui").html("Please enter FarmCode!!!");
                        $("#txtGrowerFarm").focus();
                        return false;
                    }
                    $(".msgui").css("display", "none");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetFarmDetailsByCode',
                        data: "{'Farm': '" + Farm.trim() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                            if (data.d.Farm == null || data.d.Farm == "") {
                                $(".msgui").css("display", "block")
                                $(".msgui").html("Please enter valid FarmCode!!!");
                                $("#txtGrowerFarm").focus();
                                return false;
                            }
                            else {
                                var Email = $("#txtGrowerEmail").val().trim();
                                if (Email == "") {
                                    $(".msgui").css("display", "block")
                                    $(".msgui").html("Please enter Email!!!");
                                    $("#txtGrowerEmail").focus();
                                    return false;
                                }
                                //else {
                                //    var emailexp = "[A-Za-z0-9\._%-]+@[A-Za-z0-9\.-]+\.[A-Za-z]{2,4}";
                                //    var re = new RegExp('^' + email + '(;\\n*' + email + ')*;?$');
                                //    if (re.test(Email) == false) {
                                //        $(".msgui").css("display", "block")
                                //        $(".msgui").html("Please enter valid Email!!!");
                                //        $("#txtGrowerEmail").focus();
                                //        return false;
                                //    }
                                //}
                                var ID = $("#DivFarmEmailID").html();

                                if (ID == "0" || ID == "") {
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/SaveGrowerFarmEmail',
                                        data: '{"Farm":"' + Farm + '","Email":"' + Email + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output) {
                                            if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                                $(".msgui").css("display", "block")
                                                $(".msgui").html("Farm already exists!");
                                                $("#txtGrowerFarm").focus();
                                            }
                                            else {
                                                $("#DivFarmEmailSaveDialog").dialog("close");
                                                $("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                                            }
                                        }
                                    });
                                }
                                else {
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/UpdateGrowerFarmEmail',
                                        data: '{"ID":"' + ID + '","Farm":"' + Farm + '","Email":"' + Email + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output) {
                                            $("#DivFarmEmailSaveDialog").dialog("close");
                                            $("#GrowerFarmEmails_" + ID).html(Email);
                                            //$("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                                        }
                                    });
                                }
                            }
                        }
                    });


                },
                Cancel: function () {
                    $(this).dialog("close");
                },
            },

            open: function () {
                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }
        });

        $("[id^=editGrowFarmEmail_]").die("click").live("click", function () {
            $(".msgui").css("display", "none")
            var ID = $(this).attr('id').replace("editGrowFarmEmail_", "");
            $("#DivFarmEmailID").html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetGrowerFarmEmailDetailsByID',
                data: "{'ID':'" + ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d;
                    $("#txtGrowerFarm").attr("readonly", true);
                    $("#txtGrowerEmail").val(result.Email);
                    $("#txtGrowerFarm").val(result.Farm);

                    $("#DivFarmEmailSaveDialog").dialog('option', 'title', "Edit Farm Email::" + result.Farm + "");
                    $("#DivFarmEmailSaveDialog").dialog("open");
                    $("#txtGrowerEmail").focus();
                }
            });
        });

        $("[id^=deleteGrowFarmEmail_]").die("click").live("click", function () {
            $(".msgui").css("display", "none")
            var ID = $(this).attr('id').replace("deleteGrowFarmEmail_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteGrowerFarmEmail',
                data: "{'ID':'" + ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $("#deleteGrowFarmEmail_" + ID).closest('tr').remove();
                }
            });
        });



        ////Dialog box for report delete

        //$("#DialogChangeLockStatus").dialog({
        //    autoOpen: false,
        //    resizable: false,
        //    title: "Alert",
        //    modal: true,
        //    buttons: {
        //        Yes: function () {
        //            var adialog = $(this);                
        //            $.ajax({
        //                type: "POST",
        //                url: 'BloomService.asmx/ChangeLockStatus',
        //                data: '{"ID":"' + ReportID + '"}',
        //                contentType: "application/json; charset=utf-8",
        //                dataType: "json",
        //                success: function (output) {
        //                    if (output.d != null && output.d == "valid") {
        //                        $("#DialogChangeLockStatus  ").dialog("close");
        //                        $("#fgrdGrowerHeader").flexReload({ url: '/url/for/refresh' });
        //                        //$("#fgrdGrowerAWBHeader").flexReload({ url: '/url/for/refresh' });
        //                        //$("#fgrdGrowerFarmDetail").flexReload({ url: '/url/for/refresh' });
        //                        $("#DivGrowerAWBHeader").hide();
        //                        $("#DivGrowerFarmHeader").hide();
        //                        $("#DivGrowerFarmDetail").hide();
        //                    }
        //                }
        //            });
        //        },
        //        No: function () {
        //            $(this).dialog("close");
        //        }
        //    },
        //    open: function () {
        //        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
        //        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        //    }
        //});

    $("#txtDATE").datepicker({
        dateFormat: 'mm/dd/yy',
        defaultDate: new Date()
    });

    $("#btnExpenses").die("click").live("click", function () {
        $("#fgrdExpenses").flexigrid({
            url: 'BloomService.asmx/GetExpenses',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: false, align: 'left' },
                { display: '', name: '', width: 20, sortable: false, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 85, sortable: true, align: 'left' },
                { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
                { display: 'Date', name: 'DATEExp', width: 60, sortable: true, align: 'center' },
                { display: 'INVOICE', name: 'INVOICE', width: 65, sortable: false, align: 'left' },
                { display: 'FBE', name: 'BOXES', width: 40, sortable: false, align: 'right' },
                { display: 'FREIGHT', name: 'FREIGHT', width: 70, sortable: false, align: 'right' },
                { display: '/FBE', name: 'FREIGHTFBE', width: 50, sortable: false, align: 'right' },
                { display: 'HANDLING', name: 'HANDLING', width: 70, sortable: false, align: 'right' },
                { display: '/FBE', name: 'HANDLINGFBE', width: 50, sortable: false, align: 'right' },
                { display: 'FUMIGATION', name: 'FUMIGATION', width: 60, sortable: false, align: 'right' },
                { display: 'OTHER', name: 'OTHERCHARGES', width: 60, sortable: false, align: 'right' },
                { display: '$Amount', name: 'Amount', width: 70, sortable: true, align: 'right' },
            ],
            searchitems: [
                { display: 'AWB', name: 'AWB' },
                { display: 'Farm', name: 'Farm' }              
            ],
            buttons: [
                { name: 'Add Expense', bclass: 'add', onpress: OpenExpenseSaveDialog },
                //{ name: 'Expense Report', bclass: 'print', onpress: OpenExpenseSaveDialog },

            ],
            showTableToggleBtn: true,
            sortname: "Farm",
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
            height: "350",
            width: "970",
            striped: true,
            params: [
            ],
            onSuccess: function () {


            }
        });
        $("#DivExpensesDialog").dialog("open");
    });

    $("#DivExpensesDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Expense List",
        modal: true,
        width: "970px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#txtFARM").die("change").live("change", function () {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFbeByAWB',
            data: '{"AWB": "' + $("#txtAWB").val() + '", "Farm": "' + $("#txtFARM").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var fbe = parseFloat(output.d).toFixed(3);
                $('#txtBOXES').val(fbe);
            }
        });
    });


    function LoadFarmByAWB() {
        $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFarmByAWB',
                data: '{"AWB": "' + $("#txtAWB").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#txtFARM').empty();
                    var FarmByAWB = output.d;
                    $('#txtFARM').append('<option value="0">Select</option>');
                    for (var i in FarmByAWB) {
                        var Farm = FarmByAWB[i];
                        $('#txtFARM').append('<option value="' + Farm.Farm + '">' + Farm.Farm + ' [' + Farm.FarmName + ']</option>');
                    }                    
                }
            });
    }
    
    $("#ImgAvailableAWBs").click(function () {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAWBListForExpenses',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var htmlStr = "";
                $.each(output.d, function (i, item) {
                    htmlStr += "<tr><td class='AWBListtd' style='text-align: center; vertical-align:middle;background-color: #dedede;'><a style='text-decoration: none; color:blue;cursor:pointer; padding:0px;' onclick='selectAWBForExpense(\"" + item.AWB + "\",\"" + item.CSRECFBE.toFixed(3) + "\",\"" + item.DATEREC + "\");'>" + item.AWB + "</a></td>" +
                        "<td class='AWBListtd' style='text-align: center; vertical-align:middle;background-color: #dedede;'>" + item.DATEREC + "</td>"+
                        "<td class='AWBListtd' style='text-align: center; vertical-align:middle;background-color: #dedede;'>" + item.CSREC + "</td>"+
                        "<td class='AWBListtd' style='text-align: center; vertical-align:middle;background-color: #dedede;'>" + item.CSRECFBE.toFixed(3) + "</td></tr>";
                });
                $("#awbList tbody").html(htmlStr);
                $("#DivExpensesAWBListDialog").dialog("open");
            }
        });
    });

    $("#btnImportCharges").die("click").live("click", function () {
        $("#DivImportChargesDialog").dialog("open");
    });
    $("#DivExpensesAWBListDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "AWB List",
            modal: true,
            width: "600px",
            buttons: {
                Close: function () {
                    $(this).dialog("close");
                }
            },
            open: function () {

                $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')

            }
        });

    function selectAWBForExpense(awb, fbe,daterec) {
        $("#txtAWB").val(awb);
        $("#txtBOXES").val(fbe);
        $("#txtDATE").val(daterec);
        $("#txtHandling").val(fbe*4.75)
         LoadFarmByAWB();
        $("#DivExpensesAWBListDialog").dialog("close");
        $("#txtINVOICE").focus();
    }

    $("#DivImportChargesDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Freight&Broker Charges",
        modal: true,
        width: "900px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {

            try {

                var Query = $('#DivGrowerFarmHeader [name="q"]').val();
                var Qtype = $('#DivGrowerFarmHeader [name="qtype"]').val();
                if (Query != "") {
                    if (Qtype != "Boxes") {
                        $('#DivFgrdFarmEmail [name="qtype"]').val(Qtype);
                        $('#DivFgrdFarmEmail [name="q"]').val(Query);
                        $('#DivFgrdFarmEmail [value="Search"]').click();
                    }
                }
                else {
                    $("#fgrdFarmEmail").flexOptions({ params: [{ name: 'ExportCSV', value: "" }, { name: 'HeaderID', value: $("#DivHeaderID").html() }], query: "", newp: 1 }).flexReload();
                }

            }
            catch (ex) {

                $("#fgrdFarmEmail").flexOptions({ params: [{ name: 'ExportCSV', value: "" }, { name: 'HeaderID', value: $("#DivHeaderID").html() }], query: "", newp: 1 }).flexReload();
            }
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')

        }
    });



    function ImportFarmEmail() {
        $("#msg").html("Please wait,importing from DBF...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportFarmEmailfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $("#msgbox-select").dialog("close");
                if (output.d == "Inserted") {
                    $("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                }
            }
        });
    }

    function AddFarmEmail() {
        $("#txtGrowerFarm").val("");
        $("#txtGrowerEmail").val("");
        $("#txtGrowerFarm").attr("readonly", false);
        $("#DivFarmEmailID").html("0");
        $("#DivFarmEmailSaveDialog").dialog('option', 'title', "Add Farm Email");
        $("#DivFarmEmailSaveDialog").next('div').find('.msgui').remove();
        $("#DivFarmEmailSaveDialog").next('div').append("<div class='msgui'  style='margin-left: 10px;height: 17px;background:none;'></div>").css('height', '35px');
        $("#DivFarmEmailSaveDialog").next('div').find('.msgui').hide();
        $("#DivFarmEmailSaveDialog").dialog("open");
    }


    $("#DivFarmEmailSaveDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Farm Email",
        modal: true,
        width: "450px",
        buttons: {
            Save: function () {
                var Farm = $("#txtGrowerFarm").val().trim();
                if (Farm == "") {
                    $(".msgui").css("display", "block")
                    $(".msgui").html("Please enter FarmCode!!!");
                    $("#txtGrowerFarm").focus();
                    return false;
                }
                $(".msgui").css("display", "none");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetFarmDetailsByCode',
                    data: "{'Farm': '" + Farm.trim() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        if (data.d.Farm == null || data.d.Farm == "") {
                            $(".msgui").css("display", "block")
                            $(".msgui").html("Please enter valid FarmCode!!!");
                            $("#txtGrowerFarm").focus();
                            return false;
                        }
                        else {
                            var Email = $("#txtGrowerEmail").val().trim();
                            if (Email == "") {
                                $(".msgui").css("display", "block")
                                $(".msgui").html("Please enter Email!!!");
                                $("#txtGrowerEmail").focus();
                                return false;
                            }
                            //else {
                            //    var emailexp = "[A-Za-z0-9\._%-]+@[A-Za-z0-9\.-]+\.[A-Za-z]{2,4}";
                            //    var re = new RegExp('^' + email + '(;\\n*' + email + ')*;?$');
                            //    if (re.test(Email) == false) {
                            //        $(".msgui").css("display", "block")
                            //        $(".msgui").html("Please enter valid Email!!!");
                            //        $("#txtGrowerEmail").focus();
                            //        return false;
                            //    }
                            //}
                            var ID = $("#DivFarmEmailID").html();

                            if (ID == "0" || ID == "") {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/SaveGrowerFarmEmail',
                                    data: '{"Farm":"' + Farm + '","Email":"' + Email + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                            $(".msgui").css("display", "block")
                                            $(".msgui").html("Farm already exists!");
                                            $("#txtGrowerFarm").focus();
                                        }
                                        else {
                                            $("#DivFarmEmailSaveDialog").dialog("close");
                                            $("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                                        }
                                    }
                                });
                            }
                            else {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/UpdateGrowerFarmEmail',
                                    data: '{"ID":"' + ID + '","Farm":"' + Farm + '","Email":"' + Email + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        $("#DivFarmEmailSaveDialog").dialog("close");
                                        $("#GrowerFarmEmails_" + ID).html(Email);
                                        //$("#fgrdFarmEmail").flexReload({ url: '/url/for/refresh' });
                                    }
                                });
                            }
                        }
                    }
                });


            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("[id^=editGrowFarmEmail_]").die("click").live("click", function () {
        $(".msgui").css("display", "none")
        var ID = $(this).attr('id').replace("editGrowFarmEmail_", "");
        $("#DivFarmEmailID").html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetGrowerFarmEmailDetailsByID',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var result = output.d;
                $("#txtGrowerFarm").attr("readonly", true);
                $("#txtGrowerEmail").val(result.Email);
                $("#txtGrowerFarm").val(result.Farm);

                $("#DivFarmEmailSaveDialog").dialog('option', 'title', "Edit Farm Email::" + result.Farm + "");
                $("#DivFarmEmailSaveDialog").dialog("open");
                $("#txtGrowerEmail").focus();
            }
        });
    });

    $("[id^=deleteGrowFarmEmail_]").die("click").live("click", function () {
        $(".msgui").css("display", "none")
        var ID = $(this).attr('id').replace("deleteGrowFarmEmail_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteGrowerFarmEmail',
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#deleteGrowFarmEmail_" + ID).closest('tr').remove();
            }
        });
    });


        $("[id^=imgExportAllGrowerData_]").die("click").live("click", function () {
            $("#Pleasewait-msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
            $("#Pleasewait-Dialog").dialog("open");
            var HeaderID = $(this)[0].id.replace("imgExportAllGrowerData_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ExportGrowerDetailsToExcelByWhereCondition',
                data: '{"HeaderID":"' + HeaderID + '","WhereCondition":"","SortExp":"Farm asc,ReceivingDate asc,AWB asc,Boxnum asc","start":"1","ExportCSV":"1|Grower|1"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    $("#Pleasewait-Dialog").dialog("close");
                    if (output.d == null) {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                    else
                        window.location.href = "<%=ConfigurationManager.AppSettings("XmlPath")%>/ReportExports/" + output.d;

                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        });

    $("[id^=ClearInvoiceNumberForFarm_").die('click').live('click', function () {
        $("#Pleasewait-msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
        $("#Pleasewait-Dialog").dialog("open");
        var splitstr = $(this).attr('id').split("_");
        var HeaderID = splitstr[1];
        var Farm = splitstr[2];

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ClearInvoiceNumberFortheFarmInGrowerReport',
            data: '{"HeaderID":"' + HeaderID + '","Farm":"' + Farm + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#Pleasewait-Dialog").dialog("close");
                if (output.d != "error" && output.d == "success") {
                    $("[id^=GrowerDetailInvoice_]").html("0");
                }
            },
            error: function () {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    });




</script>




