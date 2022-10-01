<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageManualPO.ascx.vb" Inherits="pages_PageManualPO" %>
<style type="text/css">
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

    .trSelectedHeader {
        background-color: red;
        color: white;
    }

    #DivManualPODetails table td {
        padding: 6px;
    }

    /*.ManualPoButtonEnable {
        background: #91BD39;
        background-image: -webkit-linear-gradient(top, #91BD39, #73AB31);
        background-image: -moz-linear-gradient(top, #91BD39, #73AB31);
        background-image: -ms-linear-gradient(top, #91BD39, #73AB31);
        background-image: -o-linear-gradient(top, #91BD39, #73AB31);
        background-image: linear-gradient(to bottom, #91BD39, #73AB31);
        border-radius: 3px;       
        border: 1px solid #6CB0F6;
        display: inline-block;
        cursor: pointer;
        color: white;
        font-family: arial;
        font-size: 12px;
        padding: 4px 7px;
        text-decoration: none;
        font-weight: bold;
    }

    .ManualPoButtonDisable {
        background-color: #dddddd;
        border-radius: 3px;
        color: white;
        border: 1px solid #84bbf3;
        display: inline-block;
        font-family: arial;
        font-size: 12px;
        padding: 4px 7px;
        text-decoration: none;
        font-weight: bold;
    }*/

    /*#DivEmailDialog input {
        width: 100%;
    }*/

    #txtmanualPodate {
        width: 75px;
        margin-right: 5px;
        margin-left: 5px;
    }

    #txtmanualpomawb {
        width: 90px;
        margin-right: 5px;
        margin-left: 5px;
    }

    #txtmanualpohawb {
        width: 110px;
        margin-right: 5px;
        margin-left: 5px;
    }

    #txtmanualpoinvoice {
        width: 65px;
        margin-right: 5px;
        margin-left: 5px;
    }

    .trSelectedHeader a {
        color: white;
    }


    /*============================================ Flexigrid ============================================*/

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





            #row0 td:nth-child(7) div {
                color: red;
                background-color: #72C97D;
                /*height: 28px;*/
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /*border-top: 1px solid #ffffff;*/
                /*line-height: 30px;*/
                padding-bottom: 3px;
                font-size: 14px;
            }


            #row0 td:nth-child(11) div {
                color: red;
                background-color: #72C97D;
                /*height: 28px;*/
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /*border-top: 1px solid #ffffff;*/
                /*line-height: 30px;*/
                padding-bottom: 3px;
                font-size: 14px;
            }

            #row0 td:nth-child(13) div {
                color: red;
                background-color: #72C97D;
                /*height: 28px;*/
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /*border-top: 1px solid #ffffff;*/
                /*line-height: 30px;*/
                padding-bottom: 3px;
                font-size: 14px;
            }

            #row0 td:nth-child(25) div {
                color: red;
                background-color: #72C97D;
                /*height: 28px;*/
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /*border-top: 1px solid #ffffff;*/
                /*line-height: 30px;*/
                padding-bottom: 3px;
                font-size: 14px;
            }


            #row0 td:nth-child(17) div {
                display: none;
            }

            #row0 td:nth-child(20) div {
                display: none;
            }

            #row0 td:nth-child(21) div {
                display: none;
            }

            #row0 td:nth-child(26) div {
                display: none;
            }

            #row0 td:nth-child(28) div {
                display: none;
            }


    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }
    /*END*/

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

    #DivManualPOHeader .flexigrid div.tDiv {
        padding-bottom: 3px;
    }

    .PoGridtextBox {
        width: 20px;
        margin-top: -3px;
        height: 15px;
    }

    #fgrdManualPODetail input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    #fgrdManualPODetail a {
        color: black;
    }

    #fgrdManualPODetail tr:hover a {
        color: white;
    }

    .boldfont {
        font-weight: bold;
    }

    #DivManualPODetails input[type=text] {
        background-color: rgb(214, 214, 255);
    }

    #DivManualPODetails select {
        background-color: rgb(214, 214, 255);
    }

    #DivManualPODetails input[type="text"]:focus {
        background-color: cornsilk;
    }

    #DivManualPODetails select:focus {
        background-color: cornsilk;
    }


    .shipselectedfieldtitle {
        float: left;
        /*background-color: #91BD39;*/
        height: 18px;
        width: 45px;
        line-height: 19px;
        /*padding-left: 11px;*/
        color: black;
    }

    .shipselectedfieldvalue {
        float: left;
        background-color: white;
        height: 18px;
        color: black;
        line-height: 19px;
        padding: 0px 2px;
        font-weight: bold;
        /*width: 100px;*/
    }

    .selectize-input {
        width: 307px;
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

    .DuplicateColumns {
        font-weight: bold;
        color: blue;
    }

        .DuplicateColumns:hover {
            cursor: pointer;
            text-decoration: underline;
            color: black;
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
        padding-top: 10px;
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
</style>
<script type="text/javascript">
    document.title = "Users";
</script>
<table cellspacing="0">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivManualPOHeader" style="float: left">

                <div class="HeaderTitleDiv" style="font-size: 11px; display: block; margin-left: -9px;">
                    <div class="HeaderTitleDiv2">
                        <div class="HeaderTitlelink">
                            <a class="HeaderTitlelinks" style="margin-top: 5px;"><span class="add" onclick="addheaderclicked();" title="Add a new user detail">Add new user</span></a>
                            <%--<a class="HeaderTitlelinks" style="margin-top: 5px;"><span class="import" onclick="importFarmsclicked();" title="Import Farms">Import Farms</span></a>
                            <input id="btnprintselectedHeadermanualpos" class="BloomButtonDisabled" type="button" style="margin-left: 5px;" value="Print Label" />--%>
                        </div>
                    </div>
                </div>

                <table id="fgrdManualPOHeader" style="display: block;"></table>

            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">


            <div style="float: left" id="DivManualPODetail">
                <div class="DetailsTitleDiv" style="font-size: 11px; display: none">
                    <div class="DetailsTitleDiv2">

                        <div class="DetailsTitlelink">
                            <a class="DetailsTitlelinks"><span class="add" onclick="adddetailclicked();" title="Add a new user detail">Add new</span></a>
                            <a class="DetailsTitlelinks"><span class="update" onclick="updatedetailclicked()" title="Update selected user details">Update</span></a>
                            <a class="DetailsTitlelinks"><span class="clear" onclick="DeleteZeroValueManualPODetails()" title="Clear 0 boxes">Clear</span></a>
                        </div>

                        <div class="DetailsTitlelink" style="float: left;">
                            <a class="DetailsTitlelinks">
                                <span>
                                    <div style="position: absolute; margin-left: 220px; font-size: 11px; float: left;">
                                        <div style="float: left; margin-top: -11px">
                                            <table style="float: left; background-color: white">
                                                <tr style="height: 15px; display:none;">
                                                    <td style="border-bottom: 1px solid black;">
                                                        <div style="float: left; display: none;" class="shipselectedfieldtitle">
                                                            <label style="color: white;">Date </label>
                                                        </div>
                                                        <div style="float: left; width: 87px; padding-left: 30px; padding-right: 2px; line-height: 14px; height: 14px;" class="shipselectedfieldvalue">
                                                            <label style="font-size: 12px" id="lblManualPoShippedDate"></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="float: left; display: none;" class="shipselectedfieldtitle">
                                                            <label style="color: black;">MAWB </label>
                                                        </div>
                                                        <div style="float: left; padding-left: 2px; padding-right: 2px; line-height: 18px;" class="shipselectedfieldvalue">
                                                            <label style="font-size: 17px" id="lblManualPoMawb"></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="float: left;">
                                                <tr>
                                                    <td>
                                                        <div style="float: left;" class="shipselectedfieldtitle">
                                                            <label style="color: black;">HAWB </label>
                                                        </div>
                                                        <div style="float: left;" class="shipselectedfieldvalue">
                                                            <label id="lblManualPoHawb"></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="float: left; margin-top: -5px;" class="shipselectedfieldtitle">
                                                            <label style="color: black;">Invoice </label>
                                                        </div>
                                                        <div style="float: left; margin-top: -5px;" class="shipselectedfieldvalue">
                                                            <label id="lblManualPoInvoice"></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <input id="btnshipselectedmanualpos" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Ship Selected" />
                                        <input id="btnemailselectedmanualpos" class="BloomButtonDisabled" type="button" style="margin-left: 5px;" value="Email" />
                                        <input id="btnprintselectedmanualpos" class="BloomButtonDisabled" type="button" style="margin-left: 5px;" value="Print Label" />
                                        <input id="btnprintincomingproductdetails" class="BloomButtonDisabled" type="button" style="margin-left: 5px;" value="Report" />
                                        <input id="btnuploadmanualpofiles" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Upload" />
                                    </div>
                                </span>

                            </a>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <table id="fgrdManualPODetail" style="display: block;"></table>

            </div>
        </td>
    </tr>
</table>

<div style="display: none" id="DivHeaderId"></div>
<div style="display: none" id="DivDetailId"></div>

<div id="PODetailID" style="display: none;">0</div>
<div id="POHeaderID" style="display: none;"></div>
<div id="POHeaderName" style="display: none"></div>

<%--<div id="divSelectedVendorID" style="display: none"></div>--%>
<div id="DivPOHeader" style="display: none;" align="center">
    <table style="text-align: left; width: 100%">
        <tr>
            <td>
                <table style="margin-left: 16px">
                    <tr>
                        <td align="left">Cargo Date</td>
                        <td>
                            <input type="text" id="txtdate" style="width: 250px; height: 16px; float: left" class="AllUpperCaseTextBox" />
                        </td>
                    </tr>

                    <tr>
                        <td align="left">Farm Code</td>
                        <td colspan="3">
                            <input type="text" id="txtFarmCode" style="width: 250px; height: 16px; float: left" value="" class="AllUpperCaseTextBox" />

                            <input type="hidden" id="hfFarm" />
                        </td>
                        <td>
                            <img id="imgFarmAutocompleteLoader" style="display: none" src='images/ajax-loader.gif' />
                            <img id="imgFarmAutocompleteWarning" style="display: none; margin-bottom: -3px" src='images/Alert.png' />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">Comments</td>
                        <td>
                            <input id="txtheadercomments" type="text" style="width: 252px; border: 1px solid #A9A9A9; border-radius: 2px; height: 20px; padding-left: 2px;" /></td>
                    </tr>
                    <tr>
                        <td align="left">Agency Code</td>
                        <td>
                            <input type="text" id="txtagency" style="width: 250px; height: 16px; float: left" value="" maxlength="2" class="AllUpperCaseTextBox" />
                        </td>
                    </tr>
                </table>
            </td>

        </tr>

    </table>
</div>


<div id="ShipSelectedDialog" style="display: none; margin-top: 13px;">
    <table>
        <tr>
            <td style="display:none;">Date:</td>
            <td style="display:none;">
                <input id="txtmanualPodate" type="text" readonly />
            </td>
            <td>AWB:</td>
            <td>
                <input id="txtmanualpomawb" maxlength="13" class="NumbersOnly" type="text" autofocus />
            </td>
            <td>HAWB:</td>
            <td>
                <input id="txtmanualpohawb" maxlength="15" class="restrictspecialcharacters AllUpperCaseTextBox" type="text" />
            </td>
            <td>Invoice#:</td>
            <td>
                <input id="txtmanualpoinvoice" maxlength="7" type="text" class="NumbersOnly" />
            </td>
        </tr>
    </table>
</div>

<div id="DeletePOHeaderconfirm" style="display: none;" title="Alert"></div>
<div id="DeleteManualPODetailconfirm" style="display: none;" title="Alert"></div>

<div id="DivManualPODetails" style="display: none;" align="center">
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
        <%--<input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />--%>
        <tr style="height: 50px;">
            <td style="padding-left: 10px;" class="boldfont">Flower</td>
            <td colspan="3">

                <%--<select id="lstFlower" style="width: 173px;"></select>--%>
                <%--<input type="text" id="txtFlower" style="width: 167px; float: left;" value="" class="AllUpperCaseTextBox" />--%>
                <%-- <select placeholder='Choose Flower...' id="lstFlower" style="width: auto;" value="" />--%>

                <input type="text" id="txtFlower" style="width: 395px;" value="" class="AllUpperCaseTextBox" />
                <input type="hidden" id="hfFlower" />
            </td>
            <td style="text-align: right; padding-right: 34px; display: none;" class="boldfont">Desc</td>
            <td colspan="3">
                <input type="text" style="width: 249px; display: none;" maxlength="15" id="txtFlowerDesc" disabled /></td>
        </tr>

        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px" class="boldfont">Quantity</td>
                        <td>
                            <input type="text" id="txtQuantity" style="width: 52px; margin-left: 15px" class="NumbersOnly" maxlength="5" />&nbsp;&nbsp;&nbsp;
                            <select id="lstUOM" style="width: 55px; height: 23px"></select>
                            <input type="hidden" id="hfUOM" />

                        </td>
                        <td class="boldfont">Units/Bunch</td>
                        <td>
                            <input type="text" id="txtUnitsPerBunch" style="width: 52px;" class="NumbersOnly" /></td>
                        <td class="boldfont">Units</td>
                        <td>
                            <input type="text" id="txtUnitsPerBox" style="width: 52px; margin-right: 19px;" class="NumbersOnly" maxlength="4" /></td>
                        <td style="width: 86px;" class="boldfont">Total Units</td>
                        <td>
                            <input type="text" id="txtUnits" style="width: 52px; padding-left: 4px" class="NumbersOnly" disabled /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 8px;" class="boldfont">Cost/Units</td>
            <td>
                <input type="text" id="txtCostPerUnit" style="width: 52px;" class="DecimalsOnly" /></td>
            <td style="padding-left: 0px;" class="boldfont" colspan="4">Type
                <input style="width: 15px; padding-left: 7px" maxlength="1" type="text" id="txtType" class="AllUpperCaseTextBox SpecifiedCharOnly" />
                <label style="font-weight: normal">(M-Market,P-PreBook,S-Standing Order,A-Arriving)</label>
            </td>
        </tr>


        <tr>
            <td style="padding-left: 8px;" class="boldfont">BoxCode</td>
            <td>
                <input type="text" id="txtBoxCode" maxlength="15" style="width: 110px;" /></td>
            <td style="text-align: right; padding-right: 34px" class="boldfont">BoxNum</td>
            <td>
                <input type="text" id="txtBoxNumber" style="width: 52px;" maxlength="5" /></td>
            <td style="width: 96px" class="boldfont">Order Number</td>
            <td>
                <input type="text" id="txtOrderNo" style="width: 52px; margin-left: 22px;" maxlength="6" /></td>
        </tr>

        <tr>
            <td style="padding-left: 8px;" class="boldfont">PO #</td>
            <td>
                <input type="text" id="txtPO" class="restrictspecialcharacters" style="width: 110px;" maxlength="12" /></td>
            <td style="text-align: right; padding-right: 34px" class="boldfont">Invoice #</td>
            <td>
                <input type="text" id="txtInvoice" style="width: 52px;" maxlength="7" /></td>
            <td style="text-align: right; padding-right: 8px" class="boldfont">Cust#</td>
            <td>
                <input type="text" id="txtCustNo" style="width: 52px; margin-left: 22px;" class="NumbersOnly" maxlength="5" /></td>
        </tr>

        <tr>
            <td style="padding-left: 8px;" class="boldfont">Comments</td>
            <td>
                <input type="text" id="txtComments" maxlength="10" style="width: 110px;" /></td>

            <td style="text-align: right; padding-right: 34px" class="boldfont">Fob/Consignment</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox SpecifiedCharOnly" style="width: 15px; padding-left: 7px" maxlength="1" id="txtfob" />(F/C/D)</td>

        </tr>

        <tr>
            <td style="padding-left: 8px;" class="boldfont">BreakDown</td>
            <td colspan="3">
                <input style="width: 369px" type="text" maxlength="50" id="txtBreakdown" /></td>
        </tr>


    </table>

</div>

<div id="LoggedUserId" runat="server" class="notranslate" style="display: none"></div>
<div id="DivAgencyCode" runat="server" class="notranslate" style="display: none"></div>

<div id="DivShipmentStatus" runat="server" class="notranslate" style="display: none"></div>
<%--<div id="DivisCorgoAgent" runat="server" style="display: none"></div>--%>
<div id="DivManufacID" style="display: none"></div>
<div id="DivFlowerCategory" style="display: none"></div>
<div id="DivFarmName" style="display: none"></div>
<div id="DivFarm" style="display: none"></div>
<%--<div id="DivSelectedManualpoAWB" style="display: none"></div>
<div id="DivSelectedManualpoDate" style="display: none"></div>--%>

<%--<div id="IsShippedConfirm" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgIsShippedConfirm" class="DeleteDialogMsg"></p>
    </div>
</div>--%>

<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>

<div id="DivEmailDialog">
    <table style="width: 100%">
        <tr>
            <td>
                <input type="text" style="width: 590px" id="txtmanualpoToemails" />
            </td>
        </tr>
        <tr>
            <td style="width: 200px">
                <input type="text" style="width: 590px" id="txtmanualpoSubjects" />
            </td>
        </tr>
        <tr>
            <td>
                <textarea rows="4" style="width: 590px; height: 190px;" cols="85" style="height: 100px" id="txtmanualpoBody"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <a id="lnkXMLFileName" href="#" target="_blank"></a>
            </td>
        </tr>
    </table>
</div>

<%-- STA::31-OCT-2015::Upload Header Files --%>
<div id="DivUploadManualPOHeaderFiles" style="display: none">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="YellowWarning" align="center">
                </div>
            </td>
        </tr>
        <tr>
            <td>Image File :
            </td>
            <td>
                <div id="divHeaderImageFile"></div>
            </td>
        </tr>
        <tr>
            <td>PDF File :
            </td>
            <td>
                <div id="divHeaderPDFFile"></div>
            </td>
        </tr>
        <tr style="width: 50%">
            <td>&nbsp;</td>
            <td>
                <form action="UploadManualPoHeaderFiles.aspx" method="post" enctype="multipart/form-data" id="manualpofileuploader" target="upload_target" onsubmit="startManualPOHeaderFileUpload();">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <input type="text" name="hdnheaderid" id="hdnheaderid" style="display: none;" />
                                <p id="upload_process">
                                    <br />
                                    Uploading...<br />
                                    <br />
                                    <img src="images/uploading.gif" /><br />
                                </p>
                                <p id="import_process">
                                    <br />
                                    Importing...<br />
                                    <br />
                                    <img src="images/uploading.gif" /><br />
                                </p>
                                <p id="upload_form" align="left">
                                    <input name="myManualPOHeaderfile" id="myManualPOHeaderfile" accept=".pdf,.png" type="file" size="30" />
                            </td>
                        </tr>

                    </table>

                </form>
            </td>
        </tr>


    </table>

</div>


<div id="divDefaultType" style="display: none"></div>

<%-- END --%>

<script type="text/javascript">
    var LoginUserId = "";
    var DefPODetailsByHeader = "";
    // var ReloadFromUpdate = true;
    //var byVendorFilter = "";
    var byAgencyCode = "";
    var IsDetailsGridInitialize = false;
    var ShipDetailsEntered = false;
    //var IsCalledFromShipSelected = false;
    var ClearPOSessionAfterUpdation = true;
    var FlowerAutocompleteArray = "";


    $(document).ready(new function () {

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
                    $(this).closest('tr').find('input')[i].type != "hidden" && $(this).attr('id') != "txtQuantity" && $(this).attr('id') != "txtheadercomments" && $(this).attr('id') != "txtFarmCode") {
                        $(this).closest('tr').find('input')[i].value = "";
                        $(this).closest('tr').find('input')[i].focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtQuantity") {
                        $("#lstUOM").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtmanualpomawb") {
                        $("#txtmanualpohawb").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtmanualpohawb") {
                        $("#txtmanualpoinvoice").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtheadercomments") {
                        $("#txtagency").focus()
                        return false;
                    }
                        //else if ($(this).attr('id') == "txtFarmCode" && $("#hfFarm").val() != "0" && $("#txtFarmCode").val() != "" && $(".imgFarmAutocompleteWarning").display != "block") {
                        //    $("#txtheadercomments").focus()
                        //    return false;
                        //}
                    else if ($(this).attr('id') == "txtFarmCode" && $("#txtFarmCode").val() != "") {
                        $("#txtheadercomments").focus()
                        return false;
                    }
                    else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != "txtFarmCode") {
                        if ($(this).closest('tr').next('tr').find('input').length > 0) {
                            $(this).closest('tr').next('tr').find('input')[0].value = "";
                            $(this).closest('tr').next('tr').find('input')[0].focus();
                        }
                        else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0) {
                            $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].value = "";
                            $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                        }
                        else if ($(this).attr('id') == "txtBreakdown" || $(this).attr('id') == "txtmanualpoinvoice" || $(this).attr('id') == "txtagency")
                            $(this).closest('div').next('div').find('button')[0].focus()
                        return false;
                    }
                }
            }
        });

        $(function () {

            if ($("#ctl00_DivAgencyCode").html() != "" && $("#ctl00_DivAgencyCode").html() != null)
                byAgencyCode = "AgencyCode='" + $("#ctl00_DivAgencyCode").html() + "'";

            //$("#txtmanualPodate").datepicker({
            //    changeMonth: true,
            //    changeYear: true,
            //    dateFormat: 'mm/dd/yy',
            //    showOtherMonths: true,
            //    selectOtherMonths: true
            //}).datepicker("setDate", new Date());

            $("#txtdate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true
            }).datepicker("setDate", new Date());

            //cmted by mani:start 29-08
            //$("#txtHeaderDate").datepicker({
            //    changeMonth: true,
            //    changeYear: true,
            //    dateFormat: 'mm-dd-yy',
            //    showOtherMonths: true,
            //    selectOtherMonths: true,
            //    onSelect: function (date) {
            //        $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
            //    }
            //}).datepicker("setDate", new Date());

            //$("#txtHeaderToDate").datepicker({
            //    changeMonth: true,
            //    changeYear: true,
            //    dateFormat: 'mm-dd-yy',
            //    showOtherMonths: true,
            //    selectOtherMonths: true,
            //    onSelect: function (date) {
            //        $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
            //    }
            //}).datepicker();
            //cmted by mani:end 29-08

        });

        $("#POHeaderID").html("0");

        var ManualPOHeaderSearchItems = "";
        LoginUserId = $("#ctl00_LoggedUserId").html();
        ClearManualPOSelecton(false);
        //byVendorFilter = "Createduserid=" + $("#ctl00_LoggedUserId").html();

        ManualPOHeaderSearchItems = [{ display: 'Farm', name: 'Farm' }, { display: 'Date', name: 'ShippedDate' },
                                           { display: 'AG', name: 'AgencyCode' }, { display: 'AWB', name: 'AWB' }];
        $("#fgrdManualPOHeader").flexigrid({
            url: 'BloomService.asmx/GetManualPOHeaderForFgrd',
            dataType: 'xml',
            colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
            { display: '<img style="Cursor:pointer;" id="ManualHeaderPOselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: 'Date', name: 'ShippedDate', width: 45, sortable: true, align: 'center', process: POHeaderRowClick },
            { display: 'AWB', name: 'AWB', width: 25, sortable: true, align: 'left', process: POHeaderRowClick },
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left', process: POHeaderRowClick },
            { display: 'Boxes', name: 'Pieces', width: 35, sortable: true, align: 'right', process: POHeaderRowClick },
            { display: 'AG', name: 'Agency', width: 15, sortable: true, align: 'left', process: POHeaderRowClick, title: 'Agency' },
            { display: 'FOB', name: 'FOB', width: 150, sortable: true, align: 'left', hide: true, process: POHeaderRowClick },
            { display: 'Name', name: 'Header', width: 70, sortable: true, align: 'left', process: POHeaderRowClick, hide: true },
            ],
            searchitems: ManualPOHeaderSearchItems,
            //buttons: [
            //    //{ name: 'Add new user', bclass: 'add', onpress: addheaderclicked, title: 'Add new user' },
            //    //{ name: 'Import Farms', bclass: 'import', onpress: importFarmsclicked, title: 'Import Farms' },
            //    //{ name: '', bclass: '', onpress: Printclicked, title: '<input id="btnprintselectedmanualpos" class="BloomButtonDisabled" type="button" style="margin-left: 5px;" value="Print Label" />' },

            //],
            showTableToggleBtn: true,
            sortname: "ShippedDate desc,farm asc",
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
            autoload: true,
            showTableToggleBtn: false,
            rp: 30000,
            params: [
             { name: 'AgencyCode', value: byAgencyCode },
             { name: 'ExportCSV', value: '' },
            //{ name: 'ShippedDateFilter', value: '' },
            //{ name: 'ShippedToDateFilter', value: '' }
            ],
            height: $(window).height() - 280,
            width: 290,
            striped: true,
            onSuccess: function () {

                //For to show the error
                if ($("#fgrdManualPOHeader tr#row-2").length > 0) {
                    $("#fgrdManualPOHeader tr#row-2").hide();
                    $.MessageBox($("#fgrdManualPOHeader tr#row-2")[0].innerText);
                    return false;
                }

                $("#DivManualPOHeader .pcontrol input").css("width", "40px")
                $("#DivManualPOHeader .btnseparator:eq(0)").hide();
                $("#DivManualPOHeader .pSearch").hide();

                if (ClearPOSessionAfterUpdation == true) {
                    ClearManualPOSelecton(false);
                }
                ClearPOSessionAfterUpdation = true;
                if ($("#POHeaderID").html() != "0" && $("#fgrdManualPOHeader #row" + $("#POHeaderID").html()).css('display') == "table-row") {

                    var headerdate = Date.parse($("#row" + $("#POHeaderID").html()).find('td').eq(3)[0].textContent);
                    headerdate.setDate(headerdate.getDate() + 2);
                    $("#txtmanualPodate").val($.datepicker.formatDate('mm/dd/yy', new Date(headerdate)));

                    var PODetailsByHeader = "HeaderId='" + $("#POHeaderID").html() + "'"
                    DefPODetailsByHeader = PODetailsByHeader;
                    if (IsDetailsGridInitialize == false) {
                        InitializePODetailGrid();
                        CheckTotalBoxesBeforeship(1);
                        IsDetailsGridInitialize = true;
                    }
                    else {
                        $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    }

                    // $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: PODetailsByHeader }, { name: 'IsEdit', value: false }] }).flexReload();
                    $("[id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdManualPOHeader td.unsorted").addClass("sorted");
                    $("#fgrdManualPOHeader td.sorted").removeClass("unsorted");
                    $("#fgrdManualPOHeader #row" + $("#POHeaderID").html()).addClass("trSelectedHeader");
                    $("#fgrdManualPOHeader #row" + $("#POHeaderID").html()).removeClass("trSelected");
                    $("#fgrdManualPOHeader #row" + $("#POHeaderID").html() + " td.sorted").addClass("unsorted");
                    $("#fgrdManualPOHeader #row" + $("#POHeaderID").html() + " td.unsorted").removeClass("sorted");

                    $("#DivFarm").html($("#poheaderfarm_" + $("#POHeaderID").html()).html());
                    $("#POHeaderName").html($("#fgrdManualPOHeader #row" + $("#POHeaderID").html() + " td:nth-child(3) Div").html());
                    $("#txtfob").val($("#row" + $("#POHeaderID").html()).find('td').eq(7)[0].textContent);
                }
                else if ($("#POHeaderID").html() != "0" && $("#fgrdManualPOHeader #row" + $("#POHeaderID").html()).css('display') != "table-row") {
                    DefPODetailsByHeader = "HeaderId='0'"
                    if (IsDetailsGridInitialize == false) {
                        InitializePODetailGrid();
                        CheckTotalBoxesBeforeship(2);
                        IsDetailsGridInitialize = true;
                    }
                    else {
                        $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    }
                }

                if ($("[id^=editBoxestext_]").is(':visible')) {
                    $("[id^=editBoxestext_]")[0].focus();

                }

                $("#DivManualPOHeader #ExportCSV").show();
            }
        });


        $("#DivManualPOHeader .pcontrol input").css("width", "40px")
        $("#DivManualPOHeader .btnseparator:eq(0)").hide();
        $("#DivManualPOHeader .pSearch").hide();

        //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
        //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivManualPOHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivManualPOHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivManualPOHeader .pDiv").find(".pDiv2").find(".pGroup span:last").show();
        //$("#DivManualPOHeader .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: 0px');
        $("#DivManualPOHeader .pDiv").find(".pDiv2").find(".pReload").show();
        $("#DivManualPOHeader .sDiv").css("display", "flex");
        $("#txtQuantity").keypress(function (event) {
            debugger
            CalculateTotalUnits();
        });

        $("#txtUnitsPerBox").keypress(function (event) {
            CalculateTotalUnits();

        });
        $("#txtUnitsPerBox").focusout(function () {
            CalculateTotalUnits();
        })

        $('#txtCostPerUnit').keypress(function (event) {

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
    });
    function CalculateTotalUnits() {
        var QuantityVal = $("#txtQuantity").val() == "" ? $("#txtQuantity").attr("Placeholder") : $("#txtQuantity").val();
        var CostVal = $("#txtUnitsPerBox").val() == "" ? $("#txtUnitsPerBox").attr("Placeholder") : $("#txtUnitsPerBox").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtUnits").val(QuantityVal * CostVal);
    }

    function addheaderclicked() {
        $("#DivHeaderId").html("");
        $("#hfFarm").val("0");
        $("#txtFarmCode").val("");
        // LoadFarm();
        $("#txtheadercomments").val("");
        $("#txtagency").val($("#ctl00_DivAgencyCode").html());

        $("#txtdate").datepicker("setDate", new Date());
        $("#txtdate").attr("disabled", true);

        $("#DivPOHeader").dialog('option', 'title', "New Shipment User");
        $("#DivPOHeader").next('div').find('.msgui').remove();
        $("#DivPOHeader").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
        $("#DivPOHeader").next('div').find(".msgui").css("width", $("#ShipSelectedDialog").width() - $('#ShipSelectedDialog').next('div').find(".ui-dialog-buttonset").width());
        $("#DivPOHeader").next('div').find('.msgui').hide();
        $("#DivPOHeader").dialog("open");
    }


    function importFarmsclicked() {
        $("#msg").html("Please wait,Farms importing from DBF...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FarmsfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#msgbox-select").dialog("close");
                    $("#msg").html(output.d + " Records Imported Successfully...");
                    $("#msgbox-select").dialog("open");
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }

            }
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

    //$.ajax({
    //    type: "POST",
    //    url: 'BloomService.asmx/LoadFlowers',
    //    data: '{}',
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (output, status) {
    //         FlowerAutocompleteArray = output.d;
    //        $("#txtFlower").autocomplete({
    //            source: function (request, response) {
    //                var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
    //                var matching = $.grep(FlowerAutocompleteArray, function (value) {
    //                    
    //                    var FlowerCode = value.Flower;
    //                    var Name = value.FlowerName;

    //                    return matcher.test(FlowerCode);
    //                });
    //                response($.map(matching, function (item) {
    //                    return {
    //                        label: item.Flower + " [" + item.Name + "]",
    //                        flower: item,
    //                    }
    //                }))
    //                //response(matching);
    //            },
    //            select: function (e, i) {
    //                $("#txtFlowerDesc").val(i.item.flower.Name);
    //                $("#txtUnitsPerBunch").val(i.item.flower.UnitsPerBunch)
    //                $("#DivFlowerCategory").html(i.item.flower.CAT);
    //                $("#txtFlower").val(i.item.flower.Flower);
    //                return false;

    //            },
    //            change: function (e, i) {
    //                if (i.item == null || i.item == undefined) {
    //                    $("#txtFlower").val("");
    //                    $("#txtFlower").focus();

    //                }
    //            },
    //            minLength: 1,
    //            autoFocus: true
    //        });
    //    }
    //});






    //$("#txtFarmCode").autocomplete({
    //    source: function (request, response) {
    //        $("#imgFarmAutocompleteLoader").css("display", "block");
    //        $("#imgFarmAutocompleteWarning").css("display", "none");

    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetUserFarmCodeByUserID',
    //            data: "{'Searchtext': '" + request.term + "','UserID': '" + $("#ctl00_LoggedUserId").html() + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (data) {
    //                if (data.d.length == 0) {
    //                    $("#imgFarmAutocompleteWarning").css("display", "block");
    //                    $("#imgFarmAutocompleteLoader").css("display", "none");
    //                    $("#txtFarmCode").focus();
    //                    response($.map(data.d, function (item) {
    //                        return {
    //                        }
    //                    }));
    //                }
    //                else {

    //                    response($.map(data.d, function (item) {
    //                        return {
    //                            label: "[" + item.Farm + "] " + item.Name + "   -" + item.City + "-",
    //                            Code: item.Farm,
    //                            farm: item
    //                        }

    //                    }));
    //                    $("#imgFarmAutocompleteWarning").css("display", "none");
    //                }

    //            },
    //            error: function (response) {
    //                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
    //            },
    //            failure: function (response) {
    //                alert(response.responseText);
    //            }
    //        });
    //    },
    //    select: function (e, i) {

    //        $("#txtFarmCode").val("[" + i.item.farm.Farm + "] " + i.item.farm.Name + "");
    //        $("#hfFarm").val(i.item.Code);

    //        return false;

    //    },
    //    focus: function (e, i) {
    //        $("#imgFarmAutocompleteLoader").css("display", "none");
    //    },
    //    change: function (e, i) {

    //        if (i.item == null || i.item == undefined) {

    //            $("#imgFarmAutocompleteWarning").css("display", "block");
    //            $("#txtFarmCode").val("");
    //            $("#txtFarmCode").focus();
    //            $("#hfFarm").val("0");
    //        }
    //        else {
    //            $("#imgFarmAutocompleteWarning").css("display", "none");
    //        }
    //        if ($("#txtFarmCode").val() == "") {
    //            $("#hfFarm").val("0");
    //            $("#imgFarmAutocompleteWarning").css("display", "block");
    //        }
    //    },
    //    minLength: 1,
    //    autoFocus: true
    //});



    function LoadUOM() {
        var length = $('#lstUOM > option').length;
        var farmcode = $("#DivFarm").html();
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForManualPOByFarm',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM').empty();
                    var UOMdata = output.d;
                    $('#lstUOM').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM +' ['+ UOM.SIZE +']</option>');
                    }

                    if ($("#hfUOM").val() != "" && $("#hfUOM").val() != 0)
                        $('#lstUOM').val($("#hfUOM").val());
                    else
                        $("#lstUOM").val("QB");

                }
            });
        }
        else {
            $('#lstUOM').val($("#hfUOM").val());
        }
    }





    function LoadFlowers() {
        var farmcode = $("#DivFarm").html();
        var length = $('#lstFlower > option').length;
        if (length <= 0) {
            //$("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading Flowers Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadFlowers',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $('#lstFlower').empty();
                    var data = output.d;

                    //$('#lstFlower').append('<option value="0">Choose Flower...</option>');
                    for (var i in data) {
                        var flower = data[i];
                        if (flower.Flower.trim() != "") {
                            $('#lstFlower').append('<option value="' + flower.Flower.trim() + '~' + flower.Name.trim() + '~' + flower.CAT.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                        }
                    }

                    J1_10($("#lstFlower")).selectize({

                        onChange: function () {

                            var flowerssplit = $("#lstFlower")[0].value.split('~');
                            if (flowerssplit[0] != "0" && flowerssplit[0] != "") {
                                $("#txtFlowerDesc").val(flowerssplit[1]);
                                $("#DivFlowerCategory").html(flowerssplit[2]);
                                //  $("#txtUnitsPerBunch").val(flowerssplit[3]);
                                $("#txtQuantity").focus();
                            }
                            else {
                                $("#txtFlowerDesc").val("");
                                $("#DivFlowerCategory").html("");
                                $("#txtUnitsPerBunch").val(0);
                            }

                        }
                    });
                    J1_10($("#lstFlower")).selectize()[0].selectize.setValue($("#hfFlower").val());
                    // $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    //J1_10($("#lstFlower")).selectize()[0].selectize.disable();
                },
            });
        }
        else {
            J1_10($("#lstFlower")).selectize()[0].selectize.setValue($("#hfFlower").val());
        }

    }

    $("#txtFlower").autocomplete({
        source: function (request, response) {
            var farmcode = $("#DivFarm").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteFarmWise',
                data: "{'Searchtext': '" + request.term + "','FarmCode':'" + farmcode.toUpperCase() + "'}",
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
                            Units: flr.UNITS
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
            $("#txtFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);

            $("#txtFlowerDesc").val(i.item.Name);
            $("#hfFlower").val(i.item.Flower.trim());
            $("#txtUnitsPerBunch").val(i.item.Bunch)
            $("#DivFlowerCategory").html(i.item.CAT.trim());
            $("#txtUnitsPerBox").val(i.item.Units)
            $("#txtUnitsPerBox").attr("Placeholder", i.item.Units);
            $("#txtQuantity").focus();
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtFlower").val("");
                $("#hfFlower").val("0");
                $("#txtFlower").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    //function LoadFarm() {
    //    var length = $('#lstfarm > option').length;
    //    if (length <= 0) {
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetFarmsByUserId',
    //            data: "{'UserId':'" + $("#ctl00_LoggedUserId").html() + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (output, status) {

    //                var data = output.d;
    //                $("#lstfarm").empty();
    //                $("#lstfarm").append('<option value="0">Select</option>');
    //                for (var i in data) {
    //                    var DefFarm = data[i];
    //                    $('#lstfarm').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
    //                }
    //                $('#lstfarm').val($("#hfFarm").val());
    //            }
    //        });
    //    }
    //    else {
    //        $('#lstfarm').val($("#hfFarm").val());
    //    }
    //}

    $("#DivPOHeader").dialog({

        autoOpen: false,
        width: 450,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {
                //if ($("#txtheadercomments").val() == "") {
                //    $.MessageBox("Please enter user!!!");
                //    $("#txtheadercomments").focus();
                //    return false;
                //}
                //$(".ui-dialog-buttonpane div.dialogProgress").show();
                //if ($("#txtFarmCode").val() == "") {
                //    $.MessageBox("Please enter FarmCode!!!");
                //    $("#txtFarmCode").focus();
                //    return false;
                //}
                //if ($("#hfFarm").val() == "" || $("#hfFarm").val() == "0") {
                //    $.MessageBox("Please enter FarmCode!!!");
                //    $("#txtFarmCode").focus();
                //    return false;
                //}

                //debugger;
                $("#DivPOHeader").next('div').find(".msgui").css("width", $("#DivPOHeader").width() - $('#DivPOHeader').next('div').find(".ui-dialog-buttonset").width());
                if ($("#txtFarmCode").val().trim() == "") {
                    $("#DivPOHeader").next('div').find(".msgui").html("Please enter FarmCode!!!");
                    $("#DivPOHeader").next('div').find('.msgui').show();
                    $("#txtFarmCode").focus();
                    return false;
                }
                var farmcode = $("#txtFarmCode").val().indexOf("[") >= 0 ? $("#txtFarmCode").val().split("[")[0] : $("#txtFarmCode").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetUserFarmCodeByUserIDForManualPO',
                    data: "{'FarmCode': '" + farmcode + "','UserID': '" + $("#ctl00_LoggedUserId").html() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        debugger;
                        $(".ui-dialog-buttonpane div.dialogProgress").hide();
                        if (data.d == null || data.d == undefined) {
                            $("#imgFarmAutocompleteWarning").css("display", "block");
                            $("#imgFarmAutocompleteLoader").css("display", "none");
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#DivPOHeader").next('div').find(".msgui").html("Please enter valid FarmCode!!!");
                            $("#DivPOHeader").next('div').find('.msgui').show();
                            $("#txtFarmCode").focus();
                            return false;
                        }
                        else {
                            $("#hfFarm").val(data.d.Farm);
                            $("#DivPOHeader").next('div').find('.msgui').hide();
                            $("#imgFarmAutocompleteWarning").css("display", "none");
                            $(".ui-dialog-buttonpane div.dialogProgress").show();

                            //if ($("#txtagency").val() == "") {
                            //    $.MessageBox("Please enter agency!!!");
                            //    $("#txtagency").focus();
                            //    return false;
                            //}

                            if ($("#txtdate").val() == "") {
                                //$.MessageBox("Please choose date!!!");
                                $("#DivPOHeader").next('div').find(".msgui").html("Please choose date!!!");
                                $("#DivPOHeader").next('div').find('.msgui').show();
                                $("#txtdate").focus();
                                return false;
                            }

                            var ID = $("#DivHeaderId").html() == "" ? "0" : $("#DivHeaderId").html();                            
                            debugger;
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/SavePOHeader',
                                data: '{"ID":"' + ID + '",Header:"' + $("#txtheadercomments").val() + '","Farm":"' + $("#hfFarm").val() + '","Agency":"' + $("#txtagency").val()
                                       + '","HeaderDate":"' + $("#txtdate").val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output) {

                                    $("#DivPOHeader").next('div').find('.msgui').hide();
                                    if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                                        //ReloadFromUpdate = false;
                                        $("#DivHeaderId").html("");

                                        $("#POHeaderID").html(output.d);
                                        //$("#fgrdManualPOHeader").flexOptions({ query: "", newp: 1 }).flexReload();
                                        $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                                        //$("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                                        // $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
                                        $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                        $("#DivPOHeader").dialog("close");
                                        var id = output.d;
                                        var TotalBoxes = 0; 
                                        TotalBoxes = $("#aTotalBoxes_" + id).html();                                        
                                        if (TotalBoxes != "" && TotalBoxes != null) {
                                            $("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");
                                            $("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");
                                            $("#btnshipselectedmanualpos").removeAttr("disabled");
                                        }
                                        else {
                                            $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                                            $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                                            $("#btnshipselectedmanualpos").attr("disabled", "disabled");
                                        }
                                    }
                                    else if (output.d == 'LogOut') {
                                        // $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                        $("#DivPOHeader").next('div').find(".msgui").html("OOPS! Something went wrong, please try again, we will research the issue.");
                                        $("#DivPOHeader").next('div').find('.msgui').show();
                                    }
                                }
                            });
                        }
                    }
                });
            },
            Cancel: function () {
                $("#DivPOHeader").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane div.dialogProgress").remove();
            $(".ui-dialog-buttonpane").append("<div class='dialogProgress' style='float:left;margin:10px;display:none;'><b>Loading...</b><img src='images/ajax-loader.gif' /></div>")
            $("#imgFarmAutocompleteWarning").css("display", "none");
            $("#imgFarmAutocompleteLoader").css("display", "none");
            $("#txtdate").attr("disabled", false);
            if ($("#txtagency").val() != "")
                $("#txtFarmCode").focus();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    //STA::31-JUL-2015::to edit the PO Headers
    $("[id^=editPOHeader_]").die("click").live("click", function () {
        var Id = $(this)[0].id.replace("editPOHeader_", "");
        $("#DivHeaderId").html(Id);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPOHeaderByID',
            data: '{"ID":"' + Id + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                $("#txtheadercomments").val(output.d.Header);
                $("#txtFarmCode").val(output.d.FarmCode + " [" + output.d.FarmName + "]");
                $("#txtagency").val(output.d.Agency);

                var ShipDate = output.d.ShippedDate;
                var substringedDate = ShipDate.substring(6); //substringedDate= 1291548407008)/
                var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                var sdate = new Date(parsedIntDate);

                if (ShipDate != "")
                    $("#txtdate").val(sdate.toString("MM/dd/yyyy"));
                else
                    $("#txtdate").datepicker("setDate", new Date());


                $("#txtdate").attr("disabled", true);
                $("#DivPOHeader").next('div').find('.msgui').remove();
                $("#DivPOHeader").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                $("#DivPOHeader").next('div').find(".msgui").css("width", $("#ShipSelectedDialog").width() - $('#ShipSelectedDialog').next('div').find(".ui-dialog-buttonset").width());
                $("#DivPOHeader").next('div').find('.msgui').hide();
                $("#DivPOHeader").dialog("open");
                $("#DivPOHeader").dialog('option', 'title', "Update Shipment User");
                $("#hfFarm").val(output.d.FarmCode);
            }
        });
    });


    //STA::31-JUL-2015::to delete the PO Headers
    $("[id^=DeletePOHeader_]").die("click").live("click", function () {
        var Id = $(this)[0].id.replace("DeletePOHeader_", "");
        $("#DivHeaderId").html(Id);
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetPOHeaderByID',
        //    data: '{"ID":"' + Id + '"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output) {
        //ReloadFromUpdate = false;

        var ID = $("#DivHeaderId").html() == "" ? "0" : $("#DivHeaderId").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeletePOHeader',
            data: '{"ID":"' + ID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "success") {
                    $("#DivHeaderId").html("");
                    $("#POHeaderID").html("0");
                    $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: 'HeaderId=0' }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                }
                else if (output.d == "AccessDenied") {
                    $.MessageBox("Not Authorized!!!");
                }
            }
        });

        //$("#DeletePOHeaderconfirm").html("<p>Are you sure to delete <b> " + output.d.Header + " </b> ?</p>");
        //$("#DeletePOHeaderconfirm").dialog("open");
        //    }
        //});
    });

    //$("#DeletePOHeaderconfirm").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    title: "Alert",
    //    width: 400,
    //    height: 150,
    //    modal: true,
    //    buttons: {
    //        Yes: function () {
    //            var ID = $("#DivHeaderId").html() == "" ? "0" : $("#DivHeaderId").html();
    //            $.ajax({
    //                type: "POST",
    //                url: 'BloomService.asmx/DeletePOHeader',
    //                data: '{"ID":"' + ID + '"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (output) {
    //                    $("#DivHeaderId").html("");
    //                    $("#POHeaderID").html("0");
    //                    $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
    //                    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: 'HeaderId=0' }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();
    //                    $("#DeletePOHeaderconfirm").dialog("close");
    //                }
    //            });

    //        },
    //        No: function () {
    //            $("#DivHeaderId").html("");
    //            $("#DeletePOHeaderconfirm").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
    //        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
    //    }
    //});

    //$("#DeleteManualPODetailconfirm").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    title: "Alert",
    //    width: 400,
    //    height: 150,
    //    modal: true,
    //    buttons: {
    //        Yes: function () {
    //            var ID = $("#DivDetailId").html() == "" ? "0" : $("#DivDetailId").html();
    //            $.ajax({
    //                type: "POST",
    //                url: 'BloomService.asmx/DeleteManualPODetails',
    //                data: '{"ID":"' + ID + '"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (output) {
    //                    $("#DivDetailId").html("");
    //                    $("#fgrdManualPODetail").flexReload({ url: '/url/for/refresh' });
    //                    $("#DeleteManualPODetailconfirm").dialog("close");
    //                }
    //            });

    //        },
    //        No: function () {
    //            $("#DivDetailId").html("");
    //            $("#DeleteManualPODetailconfirm").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
    //        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
    //    }
    //});

    function InitializePODetailGrid() {
        var ShipmentHiddenStatus = $("#ctl00_DivShipmentStatus").html();
        $(".DetailsTitleDiv").show();
        $("#fgrdManualPODetail").flexigrid({
            url: 'BloomService.asmx/GetManualPODetailForFgrd',
            dataType: 'xml',
            colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'left' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'left' },
            { display: '<img style="Cursor:pointer;" id="ManualPOselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', process: POdetailsRowClick },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Description', name: 'FlowerName', width: 180, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'UOM', name: 'UOM', width: 18, sortable: true, align: 'left', process: POdetailsRowClick },
            //{ display: 'Units/bunch', name: 'Units', width: 30, sortable: true, align: 'right' },
            { display: 'Units/Bunch', name: 'UnitsPerBunch', width: 30, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'Total Units', name: 'Units', width: 50, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'Total Cost', name: 'TotalCost', width: 70, sortable: true, align: 'right', process: POdetailsRowClick },
            { display: 'Type', name: 'Type', width: 15, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Cust#', name: 'CustNumber', width: 25, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Comments', name: 'Comments', width: 60, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left' },
            { display: 'BoxNum', name: 'BoxNumber', width: 35, sortable: true, align: 'left' },
            { display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left', process: POdetailsRowClick },
            { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left', hide: false, process: POdetailsRowClick },
            { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: false, process: POdetailsRowClick },
            { display: 'ShipDate', name: 'ShipDate', width: 40, sortable: true, align: 'left', hide: true, process: POdetailsRowClick },
            { display: 'Missing', name: 'Missing', width: 50, sortable: true, align: 'right', hide: ShipmentHiddenStatus },
            { display: 'Duplicate', name: 'Duplicate', width: 45, sortable: false, align: 'left' },
            ],
            searchitems: [
            { display: 'Farm', name: 'Farm' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'FlowerName' },
            { display: 'Boxes', name: 'Quantity' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Units/Bunch', name: 'UnitsPerBunch' },
            { display: 'AWB', name: 'AWB' },
            { display: 'HAWB', name: 'HAWB' },
            { display: 'Invoice', name: 'Invoice' },
            { display: 'PO#', name: 'PONumber' },
            { display: 'BoxCode', name: 'BoxCode' },
            { display: 'BoxNum', name: 'BoxNumber' },
            { display: 'Cust#', name: 'CustNumber' },
            { display: 'Type', name: 'Type' }
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "asc",
            usepager: true,
            rp: 30000,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 290) / 25),
            qtype: "Farm",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            params: [
            { name: 'Filter', value: DefPODetailsByHeader },
            { name: 'IsEdit', value: false },
            { name: 'ExportCSV', value: '' }
            ],
            height: $(window).height() - 224,
            width: $(window).width() - 310,
            striped: true,
            onSuccess: function () {


                //$("#editBoxestext_")[0].focus();
                $("#DivManualPODetail .ExportCSV").show();
                //For to show the error
                if ($("#fgrdManualPODetail tr#row-2").length > 0) {
                    $("#fgrdManualPODetail tr#row-2").hide();
                    $.MessageBox($("#fgrdManualPODetail tr#row-2")[0].innerText);
                    return false;
                }
                $("[id^=btnmanualpoBoxNo_]").css("text-decoration", "none");
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
                            $(this).closest('tr').find('input')[i].type != "hidden" && $(this).attr('id') != "txtQuantity" && $(this).attr('id') != "txtheadercomments" && $(this).attr('id') != "txtFarmCode") {
                                $(this).closest('tr').find('input')[i].value = "";
                                $(this).closest('tr').find('input')[i].focus();
                                return false;
                            }
                            else if ($(this).attr('id') == "txtQuantity") {
                                CalculateTotalUnits();
                                $("#lstUOM").focus()
                                return false;
                            }
                            else if ($(this).attr('id') == "txtmanualpomawb") {
                                $("#txtmanualpohawb").focus()
                                return false;
                            }
                            else if ($(this).attr('id') == "txtmanualpohawb") {
                                $("#txtmanualpoinvoice").focus()
                                return false;
                            }
                            else if ($(this).attr('id') == "txtheadercomments") {
                                $("#txtagency").focus()
                                return false;
                            }
                                //else if ($(this).attr('id') == "txtFarmCode" && $("#hfFarm").val() != "0" && $("#txtFarmCode").val() != "" && $(".imgFarmAutocompleteWarning").display != "block") {
                                //    $("#txtheadercomments").focus()
                                //    return false;
                                //}
                            else if ($(this).attr('id') == "txtFarmCode" && $("#txtFarmCode").val() != "") {
                                $("#txtheadercomments").focus()
                                return false;
                            }

                            else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != "txtFarmCode") {
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
                                else if ($(this).attr('id') == "txtBreakdown" || $(this).attr('id') == "txtmanualpoinvoice" || $(this).attr('id') == "txtagency")
                                    $(this).closest('div').next('div').find('button')[0].focus()
                                return false;
                            }


                        }
                    }
                });

                $(".DetailsTitleDiv").next('div').css("min-width", "1056px");
                //$('#fgrdManualPODetail td:nth-child(6) div').css({ "background-color": 'rgb(153, 153, 255)', "color": 'white', 'padding-bottom': '3px', "white-space": 'nowrap', "overflow": 'hidden', "text-overflow": 'ellipsis' });


                //$('#fgrdManualPODetail td:nth-child(6) div a').css({ "color": 'white' });


                if ($("#btnmanualpoawb_0").html() != "") {
                    $("#lblManualPoShippedDate").html($("#btnmanualposhipdate_0").html());
                }
                else {
                    $("#lblManualPoShippedDate").html("");
                }
                $("#lblManualPoMawb").html(formatMAWBNumber($("#btnmanualpoawb_0").html()));
                $("#lblManualPoHawb").html($("#btnmanualpohawb_0").html());
                $("#lblManualPoInvoice").html($("#btnmanualpoinvoice_0").html());

                if (ShipDetailsEntered == true) {
                    //if ($("#btnmanualpoawb_0").html() != "")
                    //    $("#txtmanualpomawb").val($("#btnmanualpoawb_0").html());
                    //if ($("#btnmanualpohawb_0").html() != "")
                    //    $("#txtmanualpohawb").val($("#btnmanualpohawb_0").html());
                    //if ($("#btnmanualpoinvoice_0").html() != "")
                    //    $("#txtmanualpoinvoice").val($("#btnmanualpoinvoice_0").html());
                    ShipDetailsEntered = false;
                }
                else {
                    //.attr("Placeholder", "");
                    $("#txtmanualpomawb").val("");
                    $("#txtmanualpohawb").val("");
                    $("#txtmanualpoinvoice").val("");
                    $("#txtmanualpomawb").attr("Placeholder", $("#btnmanualpoawb_0").html());
                    $("#txtmanualpohawb").attr("Placeholder", $("#btnmanualpohawb_0").html());
                    $("#txtmanualpoinvoice").attr("Placeholder", $("#btnmanualpoinvoice_0").html());


                    //$("#txtmanualpomawb").val($("#btnmanualpoawb_0").html()); -cmted by mani 26-08
                    //$("#txtmanualpohawb").val($("#btnmanualpohawb_0").html()); -cmted by mani 26-08
                    //$("#txtmanualpoinvoice").val($("#btnmanualpoinvoice_0").html()); -cmted by mani 26-08
                }



                //if ($("#btnmanualposhipdate_0").html() != "")
                //    $("#txtmanualPodate").val($("#btnmanualposhipdate_0").html());
                //else
                //    $("#txtmanualPodate").datepicker("setDate", new Date());


                $('#fgrdManualPODetail #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                //$('#fgrdManualPODetail #row0').removeClass("erow")

                $('#fgrdManualPODetail #row0').addClass("TotalRows")


                //Abinaya
                var len = $("#fgrdManualPODetail tr").length;
                if (len == 1) {
                    $('#fgrdManualPODetail tbody tr#row0').hide();
                }
                else {
                    $("[id^=editBoxestext_]")[0].focus();

                    $("[id^=editPOtext_]").focusout(function () {
                        $("#editBoxestext_" + $(this).closest('tr').next()[0].id.replace("row", "")).focus();
                    });
                    $("[id^=editUnitstext_]").focusout(function () {
                        var boxes = $("#editBoxestext_" + $(this).closest('tr')[0].id.replace("row", "")).val();
                        if (boxes == "")
                            boxes = $("#editBoxestext_" + $(this).closest('tr')[0].id.replace("row", "")).attr("placeholder");
                        var units = $(this)[0].value;
                        if (units == "")
                            units = $(this).attr("placeholder");
                        $(this).closest("td").next()[0].lastChild.innerHTML = parseInt(boxes) * parseInt(units);
                    });

                    $("[id^=editCosttext_]").focusout(function () {

                        var Totalboxes = $("#editUnitstext_" + $(this).closest('tr')[0].id.replace("row", "")).closest("td").next()[0].lastChild.innerHTML;
                        if (Totalboxes == "")
                            Totalboxes = 0
                        var Cost = $(this)[0].value;
                        if (Cost == "")
                            Cost = $(this).attr("placeholder");
                        $(this).closest("td").next()[0].lastChild.innerHTML = parseInt(Totalboxes) * parseFloat(Cost);
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

                $(".SpecifiedCharOnly").keypress(function (event) {
                    return isSpecified(event, this)
                });
                function isSpecified(evt, element) {
                    //if ($(element)[0].id == "txtType" || $(element)[0].id.indexOf("editTypetext_") >= 0) {
                    //    //M-77, m-109 ,P-80, p-112 ,S-83, s-115 ,B-66, b-98 
                    //    var charCode = (evt.which) ? evt.which : event.keyCode
                    //    //if ((charCode == 77 || charCode == 109 || charCode == 80 || charCode == 112 || charCode == 83 ||
                    //    //charCode == 115 || charCode == 66 || charCode == 98 || charCode == 8)) {
                    //    $(element).val("");
                    //    return true;
                    //    //}
                    //    //return false;
                    //}
                    //else 
                    if ($(element)[0].id == "txtfob") {
                        //F-70, f-102 ,D-68, d-100 ,B-66, b-98 
                        var charCode = (evt.which) ? evt.which : event.keyCode
                        if ((charCode == 70 || charCode == 102 || charCode == 68 || charCode == 100 || charCode == 66 || charCode == 98 || charCode == 8)) {
                            $(element).val("");
                            return true;
                        }
                        return false;
                    }
                }

                $('[id^=editCosttext_]').keypress(function (event) {

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
            }
        });

        $("#DivManualPODetail .sDiv").css('float', 'left').css('width', '545px');
        $('#DivManualPODetail .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivManualPODetail .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivManualPODetail .pDiv").find(".pDiv2").find(".btnseparator").hide();
        // $("#DivManualPODetail .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivManualPODetail .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }



    $("#lstUOM").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtUnitsPerBunch").focus();
            return false;
        }
    });

    function POHeaderRowClick(celDiv, id) {

        $(celDiv).click(function () {
            ShipDetailsEntered = false;
            var PODetailsByHeader = "HeaderId='" + id + "'"
            DefPODetailsByHeader = PODetailsByHeader;
            if (IsDetailsGridInitialize == false) {

                InitializePODetailGrid();
                IsDetailsGridInitialize = true;
            }
            else {

                $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }

            // $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: PODetailsByHeader }, { name: 'IsEdit', value: false }] }).flexReload();
            $("[id^=row]").removeClass("trSelectedHeader");
            $("#fgrdManualPOHeader td.unsorted").addClass("sorted");
            $("#fgrdManualPOHeader td.sorted").removeClass("unsorted");
            $("#fgrdManualPOHeader #row" + id).addClass("trSelectedHeader");
            $("#fgrdManualPOHeader #row" + id).removeClass("trSelected");
            $("#fgrdManualPOHeader #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdManualPOHeader #row" + id + " td.unsorted").removeClass("sorted");
            $("#POHeaderID").html(id);
            $("#DivFarm").html($("#poheaderfarm_" + id).html());
            //  $("#DivSelectedManualpoAWB").html($("#headerawb_" + id).attr("title"));
            //$("#DivSelectedManualpoDate").html($("#fgrdManualPOHeader #row" + id + " td:nth-child(3) Div").html().replace('/', '').replace('/', '').replace('/', ''));

            $("#POHeaderName").html($("#fgrdManualPOHeader #row" + id + " td:nth-child(4) Div").html());
            var headerdate = Date.parse($("#row" + id).find('td').eq(3)[0].textContent);
            headerdate.setDate(headerdate.getDate() + 2);
            $("#txtmanualPodate").val($.datepicker.formatDate('mm/dd/yy', new Date(headerdate)));

            $("#txtfob").val($("#row" + id).find('td').eq(7)[0].textContent);

            var TotalBoxes = $("#fgrdManualPOHeader #row" + id).find('td').eq(6)[0].textContent
            if (TotalBoxes != "")
            {
                $("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");
                $("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");
                 $("#btnshipselectedmanualpos").removeAttr("disabled");
            }
            else {                
                $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                $("#btnshipselectedmanualpos").attr("disabled", "disabled");
            }
            

            ClearManualPOSelecton(false);
            // GetAWBByHeaderId(id);
        });
    }

    function POdetailsRowClick(celDiv, id) {

        $(celDiv).click(function () {
            $("#txtmanualpomawb").val("");
            $("#txtmanualpohawb").val("");
            $("#txtmanualpoinvoice").val("");

            $("#txtmanualpomawb").attr("Placeholder", $("#btnmanualpoawb_" + id).html());
            $("#txtmanualpohawb").attr("Placeholder", $("#btnmanualpohawb_" + id).html());
            $("#txtmanualpoinvoice").attr("Placeholder", $("#btnmanualpoinvoice_" + id).html());

            if ($("#btnmanualpoawb_" + id).html() != "") {
                $("#lblManualPoShippedDate").html($("#btnmanualposhipdate_" + id).html());
            }
            else {
                $("#lblManualPoShippedDate").html("");
            }
            $("#lblManualPoMawb").html(formatMAWBNumber($("#btnmanualpoawb_" + id).html()));
            $("#lblManualPoHawb").html($("#btnmanualpohawb_" + id).html());
            $("#lblManualPoInvoice").html($("#btnmanualpoinvoice_" + id).html());

            //$("#txtmanualpomawb").val($("#btnmanualpoawb_" + id).html()); cmted by mani26-08
            //$("#txtmanualpohawb").val($("#btnmanualpohawb_" + id).html()); cmted by mani26-08
            //$("#txtmanualpoinvoice").val($("#btnmanualpoinvoice_" + id).html()); cmted by mani26-08

            if ($("#btnmanualposhipdate_" + id).html() == "1/1/1900" || $("#btnmanualposhipdate_" + id).html() == "")
                $("#txtmanualPodate").datepicker("setDate", new Date())
            else
                $("#txtmanualPodate").val($("#btnmanualposhipdate_" + id).html());
        });
    }

    function ClearManualPOSelecton(IsFlexReload) {

        $.ajax({ //Clear the session 
            url: 'BloomService.asmx/ClearManualPOSelectedSession',
            type: 'POST',
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("[id^=ManualPOselectall]").prop("src", "images/check-off.png");
                $("[id^=ManualPOselect_]").prop("src", "images/check-off.png");
                $("#btnemailselectedmanualpos").addClass("BloomButtonDisabled");
                $("#btnemailselectedmanualpos").removeClass("BloomButtonEnabled");
                $("#btnprintselectedmanualpos").addClass("BloomButtonDisabled");
                $("#btnprintselectedmanualpos").removeClass("BloomButtonEnabled");

                $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                $("#btnshipselectedmanualpos").attr("disabled", "disabled");

                if (IsFlexReload == true) {
                    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                }
            }
        });
    }

    function formatMAWBNumber(MAWBNumber) {

        var mawb = ""
        if (MAWBNumber.trim() != "") {
            if (MAWBNumber.length == "11") {
                mawb = MAWBNumber.substring(0, 3) + "-" + MAWBNumber.substring(3, 7) + "-" + MAWBNumber.substring(7, 11)
            }
            else if (MAWBNumber.length == "12") {
                mawb = MAWBNumber.substring(0, 4) + "-" + MAWBNumber.substring(4, 8) + "-" + MAWBNumber.substring(8, 12)
            }
            else {
                //mawb = MAWBNumber
                mawb = ""
            }
        }
        else {
            mawb = ""
        }
        return mawb;

    }
    $("#DivManualPODetails").dialog({
        autoOpen: false,
        width: 800,
        height: 420,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {
                var DetailID = $("#PODetailID").html();
                var HeaderID = $("#POHeaderID").html();
                var Mode = 0;
                if (DetailID == "0")
                    Mode = 1;
                else
                    Mode = 2;

                //var Flower = $("#txtFlower").val();
                //if (Flower == "")
                //    Flower = $("#txtFlower").attr("Placeholder")
                //if (Flower == "") {
                //    $(".YellowWarning").html("Please choose flower..");
                //    $(".YellowWarning").show();
                //    ctrlFocus($("#txtFlower"));
                //    return false;
                //}
                var Flower = $("#hfFlower").val();
                //var flowerssplit = $("#lstFlower")[0].value.split('~');
                //var Flower = flowerssplit[0];
                if (Flower == "0" || Flower == "") {
                    $('.YellowWarning').html("Please choose flower..");
                    $('.YellowWarning').show();
                    $("#txtFlower").focus();
                    return false;
                }


                var FlowerName = $("#txtFlowerDesc").val();
                //if (FlowerName == "") {
                //    $(".YellowWarning").html("Please enter flower desc..");
                //    $(".YellowWarning").show();
                //    $("#txtFlowerDesc").focus();
                //    return false;
                //}

                var Invoice = $("#txtInvoice").val();
                if (Invoice == "")
                    Invoice = $("#txtInvoice").attr("Placeholder")

                var PONumber = $("#txtPO").val();
                //if (PONumber == "")
                //    PONumber = $("#txtPO").attr("Placeholder")

                var Quantity = $("#txtQuantity").val();
                if (Quantity == "")
                    Quantity = $("#txtQuantity").attr("Placeholder")
                if (Quantity == "") {
                    $(".YellowWarning").html("Please enter Quantity..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtQuantity"));
                    return false;
                }
                var UOM = $("#lstUOM").val();
                if (UOM == 0) {
                    $(".YellowWarning").html("Please Choose UOM..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#lstUOM"));
                    return false;
                }
                var Units = $("#txtUnits").val();
                if (Units == "")
                    Units = $("#txtUnits").attr("Placeholder")
                if (Units == "") {
                    $(".YellowWarning").html("Please enter Units..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtUnitsPerBox"));
                    return false;
                }

                var UnitsPerBunch = $("#txtUnitsPerBunch").val() == "" ? "0" : $("#txtUnitsPerBunch").val();
                if ($("#txtUnitsPerBunch").val() == "")
                    UnitsPerBunch = $("#txtUnitsPerBunch").attr("Placeholder");


                var UnitsPerBox = $("#txtUnitsPerBox").val();
                if (UnitsPerBox == "")
                    UnitsPerBox = $("#txtUnitsPerBox").attr("Placeholder")
                if (UnitsPerBox == "") {
                    $(".YellowWarning").html("Please enter Units Per Box..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtUnitsPerBox"));
                    return false;
                }

                var CostPerUnits = $("#txtCostPerUnit").val();
                if (CostPerUnits == "")
                    CostPerUnits = $("#txtCostPerUnit").attr("Placeholder")
                if (CostPerUnits == "") {
                    $(".YellowWarning").html("Please enter Cost Per Units..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtCostPerUnit"));
                    return false;
                }
                var Type = $("#txtType").val();
                if (Type == "")
                    Type = $("#txtType").attr("Placeholder")
                if (Type == 0) {
                    $(".YellowWarning").html("Please enter type..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtType"));
                    return false;
                }
                var Comments = $("#txtComments").val();
                var CustNumber = $("#txtCustNo").val();

                var OrderNumber = $("#txtOrderNo").val();

                //if (OrderNumber == "")
                //    OrderNumber = $("#txtOrderNo").attr("Placeholder")

                //if (OrderNumber == "") {
                //    $(".YellowWarning").html("Please enter Order Number..");
                //    $(".YellowWarning").show();
                //    ctrlFocus($("#txtOrderNo"));
                //    return false;
                //}
                var FobConsig = $("#txtfob").val();
                if (FobConsig == "")
                    FobConsig = $("#txtfob").attr("Placeholder")
                if (FobConsig == "") {
                    $(".YellowWarning").html("Please enter <fob>/<consig>..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtfob"));
                    return false;
                }

                //var boxcode = $("#txtBoxCode").val() == "" ? $("#txtBoxCode").attr("Placeholder") : $("#txtBoxCode").val();
                var boxcode = $("#txtBoxCode").val();


                var boxnumber = $("#txtBoxNumber").val() == "" ? $("#txtBoxNumber").attr("Placeholder") : $("#txtBoxNumber").val();


                var CreatedUserId = $("#ctl00_LoggedUserId").html();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveManualPODetails',
                    data: '{"DetailID":"' + DetailID + '","HeaderId":"' + HeaderID + '","Farm":"' + $("#DivFarm").html() +
                    '","Flower":"' + Flower + '","AWB":"","HAWB":"","Invoice":"' + Invoice + '","PONumber":"' + PONumber +
                    '","Quantity":"' + Quantity + '","UOM":"' + UOM + '","Units":"' + Units + '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox +
                    '","CostPerUnits":"' + CostPerUnits + '","Type":"' + Type + '","Comments":"' + Comments + '","CustNumber":"' + CustNumber +
                    '","OrderNumber":"' + OrderNumber + '","FobConsig":"' + FobConsig + '","CreatedUserId":"' + CreatedUserId +
                    '","FlowerName":"' + FlowerName + '","Mode":"' + Mode + '","FlowerCategory":"' + $("#DivFlowerCategory").html()
                    + '","BoxCode":"' + boxcode + '","BoxNumber":"' + boxnumber
                    + '","PurchaseType":"","BreakDown":"' + $("#txtBreakdown").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d.indexOf("Wait") != "-1") {
                            $.MessageBox(output.d);
                        }
                        else if (output.d == "valid") {
                            ClearPOSessionAfterUpdation = false;
                            $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                            $("#DivManualPODetails").dialog("close");
                            $("#DivManufacID").html("");
                            $("#DivFlowerCategory").html("");
                            $("#DivFarmName").html("");
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



    function adddetailclicked() {
        //if ($("#POHeaderID").html() != "" && $("#POHeaderName").html() != "") {

        if ($("#POHeaderID").html() != "" && $("#POHeaderID").html() != "0") {
            $("#PODetailID").html("0");
            $("#hfUOM").val("0");
            LoadUOM();
            $("#txtBoxNumber").attr("disabled", true);
            //$("#txtFlower").val("");
            $("#txtFlower").attr("Placeholder", "");
            $("#txtFlowerDesc").val("");
            $("#txtFlowerDesc").attr("Placeholder", "");
            $("#txtInvoice").val("");
            $("#txtInvoice").attr("Placeholder", "");
            $("#txtPO").val("");
            $("#txtPO").attr("Placeholder", "");
            $("#txtQuantity").val("1");
            $("#txtQuantity").attr("Placeholder", "1");
            $("#lstUOM").val("QB");
            $("#txtUnits").val("");
            $("#txtUnits").attr("Placeholder", "");
            $("#txtUnitsPerBunch").val("");
            $("#txtUnitsPerBunch").attr("Placeholder", "");
            $("#txtUnitsPerBox").val("");
            $("#txtUnitsPerBox").attr("Placeholder", "");
            $("#txtCostPerUnit").val("");
            $("#txtCostPerUnit").attr("Placeholder", "");
            $("#txtType").val($("#divDefaultType").html());
            $("#txtType").attr("Placeholder", $("#divDefaultType").html());
            //$("#lstType").val(0);
            $("#txtComments").val("");
            $("#txtComments").attr("Placeholder", "");
            $("#txtCustNo").val("");
            $("#txtCustNo").attr("Placeholder", "");
            $("#txtOrderNo").val("");
            $("#txtOrderNo").attr("Placeholder", "");
            //$("#txtfob").val("");
            $("#txtBoxCode").val("");
            $("#txtBoxCode").attr("Placeholder", "");
            $("#txtBoxNumber").val("");
            $("#txtBoxNumber").attr("Placeholder", "");
            $("#txtBreakdown").val("");
            $("#txtBreakdown").attr("Placeholder", "");
            $("#txtFlower").val("");
            $("#txtfob").val($("#manualpoheaderfob_" + $("#POHeaderID").html()).html());
            $("#txtfob").attr("Placeholder", $("#manualpoheaderfob_" + $("#POHeaderID").html()).html());
            $("#DivManualPODetails").dialog("open");
            $("#DivManualPODetails").dialog('option', 'title', "Add Detail :: " + $("#POHeaderName").html());
            $("#hfFlower").val("0");
            //LoadFlowers();


        }
        else
            $.MessageBox("Please Choose PO Header..");
    }


    function GetBoxNumber() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetBoxNumberFromConstant',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#txtBoxNumber").val(output.d);
                $("#txtBoxNumber").attr("Placeholder", output.d);
            }
        });
    }

    //STA::01-AUG-2015::To delete the MANUALPODetails
    $("[id^=deleteManualPOdetail_]").die("click").live("click", function () {
        var Id = $(this)[0].id.replace("deleteManualPOdetail_", "");
        $("#DivDetailId").html(Id);


        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetManualPODetailsByID',
        //    data: '{"ID":"' + Id + '"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output) {

        var ID = $("#DivDetailId").html() == "" ? "0" : $("#DivDetailId").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteManualPODetails',
            data: '{"ID":"' + ID + '","HeaderId":"' + $("#POHeaderID").html() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "success") {
                    $("#DivDetailId").html("");
                    $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                    // $("#DeleteManualPODetailconfirm").dialog("close");
                }
                else if (output.d == "AccessDenied") {
                    $.MessageBox("Not Authorised!!!");
                }
            }
        });

        //$("#DeleteManualPODetailconfirm").html("<p>Are you sure to delete <b> " + output.d.PO + " </b> ?</p>");
        //$("#DeleteManualPODetailconfirm").dialog("open");
        //}
        //});
    });


    //VEN::01-AUG-2015::To Edit the MANUALPODetails
    $("[id^=editManualPOdetail_]").die("click").live("click", function () {

        var Id = $(this)[0].id.replace("editManualPOdetail_", "");
        $("#PODetailId").html(Id);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetManualPODetailsByID',
            data: '{"ID":"' + Id + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                var PODetailData = output.d;
                $("#PODetailID").html(PODetailData.DetailID);
                $("#txtFlower").val("");
                $("#txtFlower").attr("Placeholder", "[" + PODetailData.Flower.trim() + "] " + PODetailData.Description);
                $("#txtFlowerDesc").val(PODetailData.Description);
                $("#txtInvoice").val(PODetailData.Invoice);
                $("#txtInvoice").attr("Placeholder", PODetailData.Invoice);
                $("#txtPO").val(PODetailData.PO);
                $("#txtPO").attr("Placeholder", PODetailData.PO);
                $("#txtQuantity").val(PODetailData.Boxes);
                $("#txtQuantity").attr("Placeholder", PODetailData.Boxes);
                $("#hfUOM").val(PODetailData.UOM);
                LoadUOM();
                //' + flower.Flower + '~' + flower.Name + '~'+ flower.CAT +'

                $("#txtUnits").val(PODetailData.TotalUnits);
                $("#txtUnits").attr("Placeholder", PODetailData.TotalUnits);
                $("#txtUnitsPerBunch").val(PODetailData.UnitsPerBunch);
                $("#txtUnitsPerBunch").attr("Placeholder", PODetailData.UnitsPerBunch);
                $("#txtUnitsPerBox").val(PODetailData.UnitsPerBox);
                $("#txtUnitsPerBox").attr("Placeholder", PODetailData.UnitsPerBox);
                $("#txtCostPerUnit").val("");
                $("#txtCostPerUnit").attr("Placeholder", PODetailData.Cost);
                $("#txtType").val(PODetailData.Type);
                $("#txtType").attr("Placeholder", PODetailData.Type);
                //$("#lstPurchaseType").val(PODetailData.PurchaseType);
                $("#txtComments").val(PODetailData.Comments);
                $("#txtCustNo").val(PODetailData.CustNumber);
                $("#txtCustNo").attr("Placeholder", PODetailData.CustNumber);
                $("#txtOrderNo").val(PODetailData.OrderNumber);
                $("#txtOrderNo").attr("Placeholder", PODetailData.OrderNumber);
                $("#txtfob").val(PODetailData.FobConsig);
                $("#txtfob").attr("Placeholder", PODetailData.FobConsig);
                $("#POHeaderName").html(PODetailData.Header);
                $("#POHeaderID").html(PODetailData.HeaderID);
                $("#txtBoxCode").val(PODetailData.BoxCode);
                $("#txtBoxCode").attr("Placeholder", PODetailData.BoxCode);
                $("#txtBoxNumber").attr("disabled", true);
                $("#txtBoxNumber").val(PODetailData.BoxNumber);
                $("#txtBoxNumber").attr("Placeholder", PODetailData.BoxNumber);
                $("#txtBreakdown").val(PODetailData.BreakDown);
                $("#DivFlowerCategory").html(PODetailData.FlowerCategory);
                $("#txtUnitsPerBunch").trigger('change');
                $("#hfFlower").val(PODetailData.Flower.trim());

                // $("#txtFlower").val("[" + PODetailData.Flower.trim() + "] " + PODetailData.Description);

                $("#DivManualPODetails").dialog("open");
                $("#DivManualPODetails").dialog('option', 'title', "Edit Detail :: " + PODetailData.Header);

                //LoadFlowers();


            }
        });
    });

    $("[id^=ManualPOselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("ManualPOselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleManualPOSelected',
            data: "{'Selected':'" + Selected + "','ID':'" + headers + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    sourceCtl.closest('tr').addClass("trChecked");

                    //Boxes                    
                    $("#editBoxestext_" + headers).show();
                    $("#editBoxeslink_" + headers).hide();
                    //Units/box                    
                    $("#editUnitstext_" + headers).show();
                    $("#editUnitslink_" + headers).hide();
                    //Units/Bunch
                    $("#editUnitsBunchtext_" + headers).show();
                    $("#editUnitsBunchlink_" + headers).hide();
                    //Cost                    
                    $("#editCosttext_" + headers).show();
                    $("#editCostlink_" + headers).hide();
                    //Comments                    
                    $("#editCommentstext_" + headers).show();
                    $("#editCommentslink_" + headers).hide();
                    //BreakDown                    
                    $("#editBreakDowntext_" + headers).show();
                    $("#editBreakDownlink_" + headers).hide();
                    //PO#                    
                    $("#editPOtext_" + headers).show();
                    $("#editPOlink_" + headers).hide();

                    //BoxCode
                    $("#editBoxCodetext_" + headers).show();
                    $("#editBoxCodelink_" + headers).hide();
                    //CustomerNumber
                    $("#editCustNumbertext_" + headers).show();
                    $("#editCustNumberlink_" + headers).hide();
                    //Type
                    $("#editTypetext_" + headers).show();
                    $("#editTypelink_" + headers).hide();
                    $("#editBoxestext_" + headers).focus();

                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
                    sourceCtl.closest('tr').removeClass("trChecked");

                    //Boxes                    
                    $("#editBoxestext_" + headers).hide();
                    $("#editBoxeslink_" + headers).show();
                    //Units/box                    
                    $("#editUnitstext_" + headers).hide();
                    $("#editUnitslink_" + headers).show();
                    //Units/bunch                  
                    $("#editUnitsBunchtext_" + headers).hide();
                    $("#editUnitsBunchlink_" + headers).show();
                    //Cost                    
                    $("#editCosttext_" + headers).hide();
                    $("#editCostlink_" + headers).show();
                    //Comments                    
                    $("#editCommentstext_" + headers).hide();
                    $("#editCommentslink_" + headers).show();
                    //Comments                   
                    $("#editBreakDowntext_" + headers).hide();
                    $("#editBreakDownlink_" + headers).show();
                    //PO#                    
                    $("#editPOtext_" + headers).hide();
                    $("#editPOlink_" + headers).show();

                    //BoxCode
                    $("#editBoxCodetext_" + headers).hide();
                    $("#editBoxCodelink_" + headers).show();
                    //CustomerNumber
                    $("#editCustNumbertext_" + headers).hide();
                    $("#editCustNumberlink_" + headers).show();
                    //Type
                    $("#editTypetext_" + headers).hide();
                    $("#editTypelink_" + headers).show();

                }

                var count = 0;

                $("[id^=ManualPOselect_]").each(function () {
                    if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                        ID = $(this)[0].id;
                        count = count + 1;

                    }
                });
                debugger;
                $("#btnemailselectedmanualpos").removeClass("BloomButtonDisabled");
                $("#btnemailselectedmanualpos").addClass("BloomButtonEnabled");
                $("#btnemailselectedmanualpos").removeAttr("disabled");

                $("#btnprintselectedmanualpos").removeClass("BloomButtonDisabled");
                $("#btnprintselectedmanualpos").addClass("BloomButtonEnabled");
                $("#btnprintselectedmanualpos").removeAttr("disabled");

                $("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");
                $("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");
                $("#btnshipselectedmanualpos").removeAttr("disabled");


                if ($("#editPOlink_" + headers).html() != "Add") {
                    $("#btnprintselectedmanualpos").removeClass("BloomButtonDisabled");
                    $("#btnprintselectedmanualpos").addClass("BloomButtonEnabled");

                }

                if (count == 0) {
                    $("#btnemailselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnemailselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnemailselectedmanualpos").attr("disabled", "disabled");

                    $("#btnprintselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnprintselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnprintselectedmanualpos").attr("disabled", "disabled");

                    $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnshipselectedmanualpos").attr("disabled", "disabled");
                }
            }
        });
    });


    $("#ManualPOselectall").die('click').live("click", function (e) {
        
        var SelectAllManualPODetails = "HeaderId=" + $("#POHeaderID").html();
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleManualPOSelectedAll',
            data: "{'SelectedManualPO':'" + Selected + "','HeaderID':'" + $("#POHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $("#msgbox-select").dialog("close");
                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    // $("[id^=ManualPOselect_]").click()

                    $("[id^=ManualPOselect_]").prop("src", "images/check-on.png");
                    $("[id^=ManualPOselect_]").closest('tr').addClass("trChecked");

                    //Boxes                    
                    $("[id^=editBoxestext_]").show();
                    $("[id^=editBoxeslink_]").hide();
                    //Units/box                    
                    $("[id^=editUnitstext_]").show();
                    $("[id^=editUnitslink_]").hide();
                    //Units/Bunch
                    $("[id^=editUnitsBunchtext_]").show();
                    $("[id^=editUnitsBunchlink_]").hide();
                    //Cost                    
                    $("[id^=editCosttext_]").show();
                    $("[id^=editCostlink_]").hide();
                    //Comments                    
                    $("[id^=editCommentstext_]").show();
                    $("[id^=editCommentslink_]").hide();
                    //BreakDown                    
                    $("[id^=editBreakDowntext_]").show();
                    $("[id^=editBreakDownlink_]").hide();
                    //PO#                    
                    $("[id^=editPOtext_]").show();
                    $("[id^=editPOlink_]").hide();

                    //BoxCode
                    $("[id^=editBoxCodetext_]").show();
                    $("[id^=editBoxCodelink_]").hide();
                    //CustomerNumber
                    $("[id^=editCustNumbertext_]").show();
                    $("[id^=editCustNumberlink_]").hide();
                    //Type
                    $("[id^=editTypetext_]").show();
                    $("[id^=editTypelink_]").hide();
                    $("[id^=editBoxestext_]")[0].focus();

                    // $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: SelectAllManualPODetails }, { name: 'IsEdit', value: true }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    $('#fgrdManualPODetail tr').addClass("trChecked");

                    $("#btnemailselectedmanualpos").removeClass("BloomButtonDisabled");
                    $("#btnemailselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnemailselectedmanualpos").removeAttr("disabled");

                    $("#btnprintselectedmanualpos").removeClass("BloomButtonDisabled");
                    $("#btnprintselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnprintselectedmanualpos").removeAttr("disabled");
                                        
                    $("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");
                    $("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnshipselectedmanualpos").removeAttr("disabled");

                    CheckTotalBoxesBeforeship(4);

                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");


                    $("[id^=ManualPOselect_]").prop("src", "images/check-off.png");
                    $("[id^=ManualPOselect_]").closest('tr').addClass("trChecked");

                    //Boxes                    
                    $("[id^=editBoxestext_]").hide();
                    $("[id^=editBoxeslink_]").show();
                    //Units/box                    
                    $("[id^=editUnitstext_]").hide();
                    $("[id^=editUnitslink_]").show();
                    //Units/bunch                  
                    $("[id^=editUnitsBunchtext_]").hide();
                    $("[id^=editUnitsBunchlink_]").show();
                    //Cost                    
                    $("[id^=editCosttext_]").hide();
                    $("[id^=editCostlink_]").show();
                    //Comments                    
                    $("[id^=editCommentstext_]").hide();
                    $("[id^=editCommentslink_]").show();
                    //Comments                   
                    $("[id^=editBreakDowntext_]").hide();
                    $("[id^=editBreakDownlink_]").show();
                    //PO#                    
                    $("[id^=editPOtext_]").hide();
                    $("[id^=editPOlink_]").show();

                    //BoxCode
                    $("[id^=editBoxCodetext_]").hide();
                    $("[id^=editBoxCodelink_]").show();

                    //CustomerNumber
                    $("[id^=editCustNumbertext_]").hide();
                    $("[id^=editCustNumberlink_]").show();

                    //Type
                    $("[id^=editTypetext_]").hide();
                    $("[id^=editTypelink_]").show();

                    //$("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: SelectAllManualPODetails }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    $('#fgrdManualPODetail tr').removeClass("trChecked");
                    $("#btnemailselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnemailselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnemailselectedmanualpos").attr("disabled", "disabled");

                    $("#btnprintselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnprintselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnprintselectedmanualpos").attr("disabled", "disabled");

                    $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                    $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnshipselectedmanualpos").attr("disabled", "disabled");

                    //CheckTotalBoxesBeforeship(5);
                }
            }
        });

    });

    $("[id^=ManualHeaderPOselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("ManualHeaderPOselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleManualHeaderPOSelected',
            data: "{'Selected':'" + Selected + "','ID':'" + headers + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    sourceCtl.closest('tr').addClass("trChecked");
                    $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonDisabled");
                    $("#btnprintselectedHeadermanualpos").addClass("BloomButtonEnabled");


                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id ^= ManualHeaderPOselectall]").attr("src", "images/check-off.png");
                    sourceCtl.closest('tr').removeClass("trChecked");
                }

                var count = 0;
                $("[id^=ManualHeaderPOselect_]").each(function () {
                    if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                        ID = $(this)[0].id;
                        count = count + 1;

                    }
                });
                if (count == 0) {
                    $("#btnprintselectedHeadermanualpos").addClass("BloomButtonDisabled");
                    $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonEnabled");
                }
            }
        });

    });


    $("#ManualHeaderPOselectall").die('click').live("click", function (e) {

        var SelectAllManualPODetails = "HeaderId=" + $("#POHeaderID").html();
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        var Query = $("#fgrdManualPOHeader").flexOptions()[0].p.query;
        var QueryType = $("#fgrdManualPOHeader").flexOptions()[0].p.qtype;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleManualHeaderPOSelectedAll',
            data: "{'SelectedManualPO':'" + Selected + "','Query':'" + Query + "','QueryType':'" + QueryType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (Selected == "1") {
                    //$("#fgrdManualPOHeader").flexOptions().flexReload();
                    sourceCtl.prop("src", "images/check-on.png");
                    $("[id^=ManualHeaderPOselect_]:visible").prop("src", "images/check-on.png");
                    $('#fgrdManualPOHeader tr:visible').addClass("trChecked");

                    $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonDisabled");
                    $("#btnprintselectedHeadermanualpos").addClass("BloomButtonEnabled");

                    //$("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");
                    //$("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");

                }
                else {
                    //$("#fgrdManualPOHeader").flexOptions().flexReload();
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id^=ManualHeaderPOselect_]").prop("src", "images/check-off.png");
                    $('#fgrdManualPOHeader tr').removeClass("trChecked");

                    $("#btnprintselectedHeadermanualpos").addClass("BloomButtonDisabled");
                    $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonEnabled");

                    //$("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");
                    //$("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                }
            }
        });

    });

    function getNumbersFromString(txt) {
        if (!txt) { txt = ""; return txt; }
        var numb = txt.match(/\d/g);
        if (numb === null) { return ""; }
        return numb.join("");
    }

    $("#ShipSelectedDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        height: 135,
        title: 'Ship Selected',
        buttons: {
            Save: function () {

                var mawb = "";
                var hawb = "";
                var invoice = "";

                $("#ShipSelectedDialog").next('div').find(".msgui").css("width", $("#ShipSelectedDialog").width() - $('#ShipSelectedDialog').next('div').find(".ui-dialog-buttonset").width());

                if ($("#txtmanualpomawb").val().trim() != "") {
                    mawb = $("#txtmanualpomawb").val();
                }
                else {
                    mawb = $("#txtmanualpomawb").attr("Placeholder");
                }
                mawb = getNumbersFromString(mawb);

                if (mawb == "0" || mawb == "") {
                    $("#ShipSelectedDialog").next('div').find(".msgui").html("AWB# must have digits and not empty!!!");
                    $("#ShipSelectedDialog").next('div').find('.msgui').show();
                    $("#txtmanualpomawb").focus()
                    return false;
                }
                if (mawb.length > 12) {
                    //$.MessageBox("AWB# must be less than 13 digits!!!");
                    $("#ShipSelectedDialog").next('div').find(".msgui").html("AWB# must have less than 13 digits!!!");
                    $("#ShipSelectedDialog").next('div').find('.msgui').show();
                    $("#txtmanualpomawb").focus()

                    return false;
                }

                if ($("#txtmanualpohawb").val() == "") {
                    if ($("#txtmanualpohawb").attr("Placeholder") == "") {
                        //$.MessageBox("Please enter HAWB#!!!");
                        $("#ShipSelectedDialog").next('div').find(".msgui").html("Please enter HAWB#!!!");
                        $("#ShipSelectedDialog").next('div').find('.msgui').show();
                        $("#txtmanualpohawb").focus()
                        return false;
                    }
                }

                if ($("#txtmanualpohawb").val().trim() != "") {
                    hawb = $("#txtmanualpohawb").val()
                }
                else {
                    hawb = $("#txtmanualpohawb").attr("Placeholder")
                }

                if ($("#txtmanualpoinvoice").val().trim() != "") {
                    //invoice = $("#txtmanualpoinvoice").val()
                    invoice = $("#txtmanualpoinvoice").val();
                    invoice = getNumbersFromString(invoice);
                    if (invoice === "") {
                        invoice = "0";
                    }

                }
                else {
                    //2021/08/28
                    //invoice = $("#txtmanualpoinvoice").attr("Placeholder")
                    if ($("#txtmanualpoinvoice").attr("Placeholder") !== "") {
                        invoice = $("#txtmanualpoinvoice").attr("Placeholder");
                    }
                    else {
                        invoice = "0";
                    }
                }


                if (validatemanualMawb($("#txtmanualpomawb").val())) {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ShipManualPOs',
                        data: "{'awb':'" + mawb.trim().replace('-', '').replace('-', '') + "','hawb':'" + hawb.trim()
                        + "','ShipDate':'" + $("#txtmanualPodate").val() + "','invoice':'" + invoice.trim() + "', 'HeaderID': '" + $("#POHeaderID").html() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else if (output.d.indexOf("Wait") != "-1") {
                                $.MessageBox(output.d);
                            }
                            if (output.d == "success") {

                                ClearPOSessionAfterUpdation = false;
                                $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                                //$("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();
                                $("#ShipSelectedDialog").dialog("close");
                                
                                $("#btnemailselectedmanualpos").addClass("BloomButtonEnabled");
                                $("#btnemailselectedmanualpos").removeClass("BloomButtonDisabled");

                                $("#btnprintselectedmanualpos").addClass("BloomButtonEnabled");
                                $("#btnprintselectedmanualpos").removeClass("BloomButtonDisabled");



                                //$("#btnprintselectedmanualpos").attr("disabled", false);
                                //$("#headerawb_" + $("#POHeaderID").html()).html(mawb.slice(-4));

                            }
                            else if (output.d == "please select")
                                $.MessageBox("Please select a line!!");
                        }

                    });
                }
                else {
                    //$.MessageBox("Please enter valid mawb#!!!!");
                    $("#ShipSelectedDialog").next('div').find(".msgui").html("Please enter valid mawb#!!!!");
                    $("#ShipSelectedDialog").next('div').find('.msgui').show();
                }
            },

            Cancel: function () {
                $(this).dialog("close");

            },
        },
        open: function () {
            GetCurrentShipData();
            $("#txtmanualPodate").attr("disabled", false);
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {
            $("#btnshipselectedmanualpos").removeClass("BloomButtonProcessing");
        }
    });

    function GetCurrentShipData() {        
        $("#txtmanualpohawb").attr("Placeholder", "");
        $("#txtmanualpomawb").attr("Placeholder", "");
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetCurrentDateShippingDetails',
            data: "{'HeaderID':'" + $("#POHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    var data = output.d;
                    $("#txtmanualpohawb").val(data.HAWB);
                    $("#txtmanualpomawb").val(data.AWB);                    
                    $("#txtmanualPodate").val(data.ShipDateString);
                }
            }
        });        
    }
    
    $("#btnshipselectedmanualpos").die("click").live("click", function () {
       
        $("#btnshipselectedmanualpos").addClass("BloomButtonProcessing");
        $("#txtmanualPodate").attr("disabled", true);


        //$("#ShipSelectedDialog").dialog("open");
        $("#ShipSelectedDialog").next('div').find('.msgui').remove();
        $("#ShipSelectedDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
        $("#ShipSelectedDialog").next('div').find(".msgui").css("width", $("#ShipSelectedDialog").width() - $('#ShipSelectedDialog').next('div').find(".ui-dialog-buttonset").width());
        $("#ShipSelectedDialog").next('div').find('.msgui').hide();
        $("#ShipSelectedDialog").dialog("open");

    });


    $("#DivEmailDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 650,
        height: 380,
        modal: true,
        buttons: {
            Send: function () {
                if ($("#txtmanualpoToemails").val() == "") {
                    $.MessageBox("Please enter to emails!!!!");
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendManualPOEmails',
                    data: '{"XMLFile":"' + $("#lnkXMLFileName").html() + '","ToEmails":"' + $("#txtmanualpoToemails").val() + '","Subject":"' + $("#txtmanualpoSubjects").val() + '","BodyContent":"' + $("#txtmanualpoBody").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "Success") {

                            $("#DivEmailDialog").dialog("close");
                        }
                        else if (output.d == 'error')
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        else if (output.d == 'LogOut')
                            window.location.href = "Login.aspx";

                    }
                });
            },
            Cancel: function () {

                $("#DivEmailDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-email')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {
            $("#btnemailselectedmanualpos").removeClass("BloomButtonProcessing");
        }
    });

    //VEN::03-08-2015::To Email the PO Details
    $("#btnemailselectedmanualpos").die("click").live("click", function () {
        $("#btnemailselectedmanualpos").addClass("BloomButtonProcessing");

        if (count == 0 && MAWB != "") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetEmailIDsToSendXml',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == 'LogOut') {
                        window.location.href = "Login.aspx";
                    }
                    else {
                        $("#txtmanualpoToemails").val("");
                        $("#txtmanualpoToemails").val(output.d);
                        EmailSelectedPOs(MAWB);
                    }
                }
            });
        }
    });

    function EmailSelectedPOs(awb) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CreateXMLForSelectedPOs',
            data: '{"Farm":"' + $("#DivFarm").html() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "please select") {
                    $("#lnkXMLFileName").html(output.d);
                    // $("#ctl00_txtmanualpoToemails").val("");

                    $("#txtmanualpoSubjects").val("");
                    $("#txtmanualpoSubjects").val("AWB # " + formatMAWBNumber(awb) + " FARM-" + $("#DivFarm").html());
                    $("#lnkXMLFileName").attr("href", "temp/" + output.d);
                    $("#lnkXMLFileName").attr("download", output.d);
                    $("#DivEmailDialog").dialog('option', 'title', "Email");
                    $("#DivEmailDialog").dialog("open");
                }
                else if (output.d == 'LogOut') {
                    window.location.href = "Login.aspx";
                }
            }
        });
    }

    //VEN::03-08-2015::To Print Label of PO Details
    $("#btnprintselectedmanualpos").die("click").live("click", function () {
        $("#btnprintselectedmanualpos").addClass("BloomButtonProcessing");
        var hasshippeddata = "0";
        var awb = "";
        hasshippeddata = "0"
        $('#fgrdManualPODetail tr').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    hasshippeddata = hasshippeddata + 1;
                }
            }
        });

        if (hasshippeddata != "0")
            PrintManualPOLabel();
        else
            $.MessageBox("Please select at least one line");

    });


    function CheckTotalBoxesBeforeship(CallFunction)
    {        
        $('#fgrdManualPODetail tr').each(function () {
            if ($(this).attr("id") == "row0")
            {                
                var TotalBoxes = $(this).find("td div").eq(6)[0].textContent;                
                if (TotalBoxes != "" && TotalBoxes != "0")
                {
                    //Enable By Prashant on 2019-11-04
                    $("#btnshipselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnshipselectedmanualpos").removeClass("BloomButtonDisabled");                    

                    $("#btnemailselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnemailselectedmanualpos").removeClass("BloomButtonDisabled");

                    $("#btnprintselectedmanualpos").addClass("BloomButtonEnabled");
                    $("#btnprintselectedmanualpos").removeClass("BloomButtonDisabled");
                }
                else
                {                    
                    $("#btnshipselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnshipselectedmanualpos").addClass("BloomButtonDisabled");

                    $("#btnemailselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnemailselectedmanualpos").addClass("BloomButtonDisabled");

                    $("#btnprintselectedmanualpos").removeClass("BloomButtonEnabled");
                    $("#btnprintselectedmanualpos").addClass("BloomButtonDisabled");
                }
            }
        });        
    }

    function PrintManualPOLabel() {

        var count = 0;
        $('#fgrdManualPODetail tr').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    if ($(this).find("td div a").eq(3)[0].textContent == 0) {
                        $("#btnprintselectedmanualpos").removeClass("BloomButtonProcessing");
                        $.MessageBox("Please select valid boxes");
                        count = -1;
                        return false;
                    }
                }
            }
        });

        if (count != -1) {
            var w = window.open('GeneratingPDF.html');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/PrintManualPOLabel',
                //data: "{'Pokey':'" + PoKey + "','Ord':'" + Ord + "','BoxesCount':'" + "0" + "'}",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d != "Please select po" && output.d != "LogOut") {

                        var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                        $("#btnprintselectedmanualpos").removeClass("BloomButtonProcessing");
                        // path = output.d;
                        //var ss = $.fileDownload(path);
                        //$("#msg").html("Your file is ready for download... <br/><br/><a style='padding-left:30px;' download='"+ path +"' id='btnopenpdf' target='_blank' href='" + path + "'>Click Here</a> to download.");                                      
                        //$("#btnopenpdf").get(0).click();
                        w.location = ExportedPath;
                    }
                    else if (output.d == "LogOut") {
                        w.close();
                        window.location.href = "Login.aspx"
                    }
                    else {
                        $.MessageBox("Please Select a PO");
                    }
                }
            });
        }

    }


    $("#btnprintselectedHeadermanualpos").die("click").live("click", function () {

        $("#btnprintselectedHeadermanualpos").addClass("BloomButtonProcessing");
        var hasshippeddata = "0";
        var awb = "";
        hasshippeddata = "0"
        $('#fgrdManualPOHeader tr').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    hasshippeddata = hasshippeddata + 1;
                }
            }
        });

        if (hasshippeddata != "0")
            HeaderPrintManualPOLabel();
        else {
            $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonProcessing");
            $.MessageBox("Please select at least one line");
        }
    });

    function HeaderPrintManualPOLabel() {

        var count = 0;
        $('#fgrdManualPOHeader tr').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    if ($(this).find("td div").eq(6)[0].textContent == 0) {
                        $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonProcessing");
                        $.MessageBox("Please select valid boxes");
                        count = -1;
                        return false;
                    }
                }
            }
        });

        if (count != -1) {
            var w = window.open('GeneratingPDF.html');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/PrintManualPOLabelByHeader',
                //data: "{'Pokey':'" + PoKey + "','Ord':'" + Ord + "','BoxesCount':'" + "0" + "'}",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d != "Please select po" && output.d != "LogOut") {

                        var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                        $("#btnprintselectedHeadermanualpos").removeClass("BloomButtonProcessing");
                        // path = output.d;
                        //var ss = $.fileDownload(path);
                        //$("#msg").html("Your file is ready for download... <br/><br/><a style='padding-left:30px;' download='"+ path +"' id='btnopenpdf' target='_blank' href='" + path + "'>Click Here</a> to download.");                                      
                        //$("#btnopenpdf").get(0).click();
                        w.location = ExportedPath;
                    }
                    else if (output.d == "LogOut") {
                        w.close();
                        window.location.href = "Login.aspx"
                    }
                    else {
                        $.MessageBox("Please select a User");
                    }
                }
            });
        }

    }


    function updatedetailclicked()
    {
        var PODetails = "";
        PODetails = "<PODetails>"
        $('#fgrdManualPODetail tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(2)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var ID = $(this).attr("id").replace("row", "");

                    if ($("#editBoxestext_" + ID).val() == "")
                        $("#editBoxestext_" + ID).val($("#editBoxestext_" + ID).attr("placeholder"));
                    if ($("#editUnitstext_" + ID).val() == "")
                        $("#editUnitstext_" + ID).val($("#editUnitstext_" + ID).attr("placeholder"));
                    if ($("#editUnitsBunchtext_" + ID).val() == "")
                        $("#editUnitsBunchtext_" + ID).val($("#editUnitsBunchtext_" + ID).attr("placeholder"));
                    if ($("#editCosttext_" + ID).val() == "")
                        $("#editCosttext_" + ID).val($("#editCosttext_" + ID).attr("placeholder"));
                    if ($("#editCommentstext_" + ID).val() == "")
                        $("#editCommentstext_" + ID).val($("#editCommentstext_" + ID).attr("placeholder"));
                    if ($("#editBreakDowntext_" + ID).val() == "")
                        $("#editBreakDowntext_" + ID).val($("#editBreakDowntext_" + ID).attr("placeholder"));
                    if ($("#editBoxCodetext_" + ID).val() == "")
                        $("#editBoxCodetext_" + ID).val($("#editBoxCodetext_" + ID).attr("placeholder"));
                    if ($("#editCustNumbertext_" + ID).val() == "")
                        $("#editCustNumbertext_" + ID).val($("#editCustNumbertext_" + ID).attr("placeholder"));
                    if ($("#editTypetext_" + ID).val() == "")
                        $("#editTypetext_" + ID).val($("#editTypetext_" + ID).attr("placeholder"));
                    if ($("#editPOtext_" + ID).val() == "")
                        $("#editPOtext_" + ID).val($("#editPOtext_" + ID).attr("placeholder"));

                    PODetails += "<PODetail>" +
                    "<DetailsID>" + ID + "</DetailsID>" +
                    "<boxes>" + $("#editBoxestext_" + ID).val() + "</boxes>" +
                    "<unitperbox>" + $("#editUnitstext_" + ID).val() + "</unitperbox>" +
                    "<unitperbunch>" + $("#editUnitsBunchtext_" + ID).val() + "</unitperbunch>" +
                    "<costperunit>" + $("#editCosttext_" + ID).val() + "</costperunit>" +
                    "<comments>" + $("#editCommentstext_" + ID).val() + "</comments>" +
                    "<breakdown>" + $("#editBreakDowntext_" + ID).val() + "</breakdown>" +
                    "<boxcode>" + $("#editBoxCodetext_" + ID).val() + "</boxcode>" +
                    "<custnumber>" + $("#editCustNumbertext_" + ID).val() + "</custnumber>" +
                    "<type>" + $("#editTypetext_" + ID).val().toUpperCase() + "</type>" +
                    "<po>" + $("#editPOtext_" + ID).val() + "</po>" +
                    "</PODetail>";
                }
            }
        });

        PODetails += "</PODetails>"
        if (PODetails != "<PODetails></PODetails>") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateManualPODetails',
                data: "{'PODetails':'" + PODetails + "','HeaderID':'" + $("#POHeaderID").html() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "success") {
                        //DefPODetailsByHeader += ";
                        ClearManualPOSelecton(false);
                        $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                        //$("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();

                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
        else {
            $.MessageBox("Please choose details to update!!!");
        }

    }
    function DeleteZeroValueManualPODetails() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteZeroValueManualPODetails',
            data: "{'HeaderID':'" + $("#POHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {
                    ClearPOSessionAfterUpdation = false;
                    //$("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();
                    $("#fgrdManualPOHeader").flexReload({ url: '/url/for/refresh' });
                }
                else if (output.d == 'LogOut') {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    }

    $("#btnprintincomingproductdetails").die("click").live("click", function () {
        $("#btnprintincomingproductdetails").addClass("BloomButtonProcessing");
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintIncomingProductDetails',
            data: "{'Farm':'" + $("#DivFarm").html() + "','HeaderId':'" + $("#POHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    $("#btnprintincomingproductdetails").removeClass("BloomButtonProcessing");
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            }
        });
    });

    $('#txtmanualpomawb').focusout(function () {
        ShipDetailsEntered = true;
    });
    $('#txtmanualpohawb').focusout(function () {
        ShipDetailsEntered = true;
    });
    $('#txtmanualpoinvoice').focusout(function () {
        ShipDetailsEntered = true;
    });

    //cmted by mani :start:29-08
    //$('#btnresetheaderdatefilter').click(function (e) {
    //    $("#txtHeaderDate").datepicker({ dateFormat: "mm/dd/yy" }).datepicker("setDate", new Date());
    //    $("#txtHeaderToDate").val("");
    //    $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: '' }, { name: 'ShippedToDateFilter', value: '' }], query: "", newp: 1 }).flexReload();
    //});

    //$('#imgprevheaderdatefilter').click(function (e) {


    //    prev = $("#txtHeaderDate").datepicker('getDate');
    //    $("#txtHeaderDate").datepicker('setDate', new Date(prev.getFullYear(), prev.getMonth(), prev.getDate() - 1));
    //    $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
    //});



    //$('#imgnextheaderdatefilter').click(function (e) {

    //    var chk = new Date();
    //    var chknext = (chk.getDate() + '-' + (chk.getMonth() + 1) + '-' + chk.getFullYear());
    //    var input = $("#txtHeaderDate").val().split("-");
    //    var monthfield = input[0]
    //    var dayfield = input[1]
    //    var yearfield = input[2]
    //    var td = new Date(dayfield + "-" + monthfield + "-" + yearfield);
    //    var today = (td.getDate() + '-' + (td.getMonth() + 1) + '-' + td.getFullYear());
    //    next = $("#txtHeaderDate").datepicker('getDate');
    //    $("#txtHeaderDate").datepicker('setDate', new Date(next.getFullYear(), next.getMonth(), next.getDate() + 1));
    //    $("#fgrdManualPOHeader").flexOptions({ params: [{ name: 'AgencyCode', value: byAgencyCode }, { name: 'ShippedDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
    //});
    //cmted by mani :end:29-08


    $("[id^=btnmanualpoduplicate_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(21);
        var BoxNumber = $("#btnmanualpoBoxNo_" + ID).html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DuplicateManualPODetailsbyID',
            data: "{'DetailID':'" + ID + "','BoxNumber':'" + BoxNumber + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else if (output.d.indexOf("Wait") != "-1") {
                    $.MessageBox(output.d);
                }
                else if (output.d == "success")
                    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                else
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    });

    function validatemanualMawb(str) {
        var matchedPosition = str.search(/[a-zA-Z]/i);

        if (/^[a-zA-Z0-9- ]*$/.test(str) == false || matchedPosition != -1) {
            return false;
        }
        return true;
    }

    function UpdateScannedMissingBarCode(awb, headerid, totalboxes) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetScannedBarCodesbyAWB',
            data: "{'AWB':'" + awb + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //
                //var scanned = parseInt(output.d);
                //var missing = parseInt(totalboxes) - scanned;
                //$("#divScanned_" + headerid).html(scanned);
                //$("#divMissing_" + headerid).html(missing);
                if (output.d == "success") {
                    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                }
                else
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    }

    //STA::31-OCT-2015::For to upload header files
    $("#DivUploadManualPOHeaderFiles").dialog({
        autoOpen: false,
        resizable: false,
        width: 550,
        height: 250,
        modal: true,
        title: 'Upload Files',
        close: function () {
            $("#btnuploadmanualpofiles").removeClass("BloomButtonProcessing");
        }
    });

    $("#myManualPOHeaderfile").change(function () {

        $("#hdnheaderid").val($("#POHeaderID").html());


        var val = $(this).val();
        switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
            case 'pdf':
            case 'jpg':
            case 'png':
                var val = $("#myManualPOHeaderfile").val();
                var filename = val.substring(val.lastIndexOf('\\') + 1);
                if (filename != "") {
                    var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
                    $("body").append(iframe);
                    var form = $('#manualpofileuploader');
                    form.attr("target", "postiframe");
                    form.attr("file", $('#myManualPOHeaderfile').val());
                    form.submit();
                }
                break;
            default:
                $(this).val('');
                $(".YellowWarning").hide();
                $(".YellowWarning").html("Please select image or pdf file!");
                $(".YellowWarning").fadeIn(1000);
                break;
        }
    });

    function startManualPOHeaderFileUpload() {
        $('#upload_process').show();
        $('#upload_form').hide();
        return true;
    }

    $("#btnuploadmanualpofiles").live("click", function () {
        $("#btnuploadmanualpofiles").addClass("BloomButtonProcessing");
        $(".YellowWarning").hide();
        $('#upload_process').hide();
        $('#import_process').hide();
        $('#upload_form').show();
        $("#myManualPOHeaderfile").val("");
        //alert($("#POHeaderID").html());

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetHeaderFiles',
            data: "{'HeaderId':'" + $("#POHeaderID").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    var data = output.d;
                    var ImageFilepath = ("<%=ConfigurationManager.AppSettings("ManualPoHeaderFilesPath")%>").toString().replace("{0}", $("#POHeaderID").html()) + "/" + data.ImageFileName.replace(".", "_" + $("#POHeaderID").html() + ".");
                    var PDFFilepath = ("<%=ConfigurationManager.AppSettings("ManualPoHeaderFilesPath")%>").toString().replace("{0}", $("#POHeaderID").html()) + "/" + data.PDFFileName.replace(".pdf", "_" + $("#POHeaderID").html() + ".pdf");

                    $("#divHeaderImageFile").html("<a href='" + ImageFilepath + "' target='_blank'>" + data.ImageFileName + "</a>");
                    $("#divHeaderPDFFile").html("<a href='" + PDFFilepath + "' target='_blank'>" + data.PDFFileName + "</a>");
                    $("#DivUploadManualPOHeaderFiles").dialog('option', 'title', 'Chooce Files');
                    $("#DivUploadManualPOHeaderFiles").dialog("open");
                }
            }
        });

    });

    function stopUploadHeaderFiles(path, fileType) {
        //STA::31-OCT-2015::to update/add the header files
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SaveHeaderFiles',
            data: "{'HeaderId':'" + $("#POHeaderID").html() + "','HeaderFileName':'" + path + "','fileType':'" + fileType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {
                    $("#DivExecutionResult").html("Files upload Successfully");
                    $("#DivUploadManualPOHeaderFiles").dialog("close");
                }
                else
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    }
    //END

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
</script>

<%-------------------------------%>
<%--23-OCT-2015:::Page Modified By Stalin:for to Header grid order by as Shipdate desc and Farm asc--%>
<%--31-OCT-2015:::Page Modified By Stalin:File upload for Header Files--%>
<%--23-DEC-2015:::Page Modified By VEN:Change shipdate fill --%>
<%--05-FEB-2016:::Page Modified By VEN:Changes for mulitple select and Print Option in Header Grid --%>
<%-------------------------------%>