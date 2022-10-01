<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageConfirmedPOs.ascx.vb" Inherits="pages_PageConfirmedPOs" %>
<link rel="stylesheet" href="css/Filters.css">
<script type="text/javascript" src="js/jquery.fileDownload.js"></script>

<style type="text/css">


       .TotalRows {
        background-color: #72C97D !important;
        color: black !important;        
        font-size:12px;
        font-weight:800;
    }

    .filter {
        /*background: url(images/EmptyFilter.png) no-repeat 10px 0px;*/
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
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





    /*.ShippedButtonEnable {
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
    }*/

    /*.ShippedButtonDisable {
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


    .tdclass {
        padding: 5px;
        background-color: #D9E4ED;
    }

    /*.PrintLabel {
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
    }*/

    /*.PrintLabel:hover {
            background-color: #378de5;
        }*/

    /*.PrintLabelDisabled {
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

    #fgrdConfirmedPOs input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    .update {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        height: 16px;
        color: #2D7929;
        font-weight: bold;
        text-decoration: none;
        float: left;
        cursor: pointer;
        margin-right: 5px;
    }
</style>
<script type="text/javascript">
    document.title = "Confirmed POs";
</script>

<div class="slidediv" style="overflow: visible; display: block; height: 50px;">
    <table>
        <tr>
            <td style="vertical-align: top; width: 100px;">
                <div class="filterbutton" id="divHeaderFarm">
                    <table style="width: 100%; height: 100%;" id="tblFarm">
                        <tr>
                            <td style="font-size: 11px">
                                <img id="imgFarm" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                FARM
                            </td>

                        </tr>
                        <tr id="tr1" style="height: 18px; text-align: center;">
                            <td>
                                <label class="DivFilterLabelStyle" id="lblFarmFilter"></label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top">
                <div class="filterbutton" id="divHeaderdate">
                    <table style="width: 100%; height: 100%;" id="tbldate">
                        <tr>
                            <td style="font-size: 11px">
                                <img id="imgdate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                DATE PERIOD
                            </td>

                        </tr>
                        <tr id="tr2" style="height: 18px; text-align: center;">
                            <td>
                                <label class="DivFilterLabelStyle" id="lblchosendate"></label>
                                <label class="DivFilterLabelStyle" style="display: none" id="lblchosendate1"></label>
                                <label class="DivFilterLabelStyle" style="display: none" id="lblchosendate2"></label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 100px; display: none">
                <div class="filterbutton" id="divHeaderMAWB">
                    <table style="width: 100%; height: 100%;" id="tblMAWB">
                        <tr>
                            <td style="font-size: 11px">
                                <img id="imgMAWB" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                MAWB
                            </td>


                        </tr>
                        <tr id="tr3" style="height: 18px; text-align: center;">
                            <td>
                                <label class="DivFilterLabelStyle" id="lblMAWBFilter"></label>
                            </td>
                        </tr>

                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 100px; display: none">
                <div class="filterbutton" id="divHeaderHAWB">
                    <table style="width: 100%; height: 100%;" id="tblHAWB">
                        <tr>
                            <td style="font-size: 11px">
                                <img id="imgHAWB" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                HAWB
                            </td>

                        </tr>
                        <tr id="tr4" style="height: 18px; text-align: center;">
                            <td>
                                <label class="DivFilterLabelStyle" id="lblHAWBFilter"></label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>


            <td style="vertical-align: middle; width: 100px;">


                <div class="AWBS" style="display: block;">
                    <table>
                        <tr>

                            <td>MAWB:</td>
                            <td>
                                <input style="width: 95px" maxlength="12" type="text" id="txtMAWB" />
                            </td>
                            <td>HAWB:</td>
                            <td>
                                <input style="width: 95px" maxlength="12" type="text" id="txtHAWB" class="restrictspecialcharacters AllUpperCaseTextBox" />
                            </td>
                            <td>INVOICE:</td>
                            <td>
                                <input style="width: 70px" maxlength="7" type="text" id="txtinvoicenumber" class="NumbersOnly" />
                            </td>
                            <td>
                                <input type="button" class="BloomButtonDisabled" id="btnSaveMAWBAndHAWB" value="ShipSelected" disabled />
                            </td>

                            <td>
                                <input type="button" class="BloomButtonEnabled" id="btnPrintLabel" value="Print Label" />
                            </td>
                            <td>
                                <span id="btnupdateconfirmedpodetails" class="update" title="Update selected confirmedpo details">Update</span>
                            </td>
                            <td>
                                <input type="button" class="BloomButtonEnabled" id="btnRemoveMAWBAndHAWB" value="Remove AWB" />
                            </td>
                            <td>
                                <input type="button" id="btnconsolidateconfirmedpodetails" class="BloomButtonEnabled" value="Consolidate" />
                            </td>
                            <td>
                                <img style="display: none; height: 25px; width: 25px; margin-left: 13px;" id="ImgProcessing" src='images/ajax-loader.gif' />
                            </td>
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
            </td>
            <tr class="rowcss" id="trFarmtitle">

                <td style="vertical-align: top" colspan="5">

                    <div id="divFarmFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 170px;">
                            <select id="lstFarmFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                        </div>
                    </div>
                </td>

            </tr>

        <tr class="rowcss" id="trdatetitle">
            <td style="vertical-align: top">
            <td style="vertical-align: top" colspan="5">
                <div id="divdateFilter" class="filterdiv" style="display: none; width: 450px; height: 240px; vertical-align: middle">
                    <div class="tooltip-content" style="width: 450px; height: 240px;">
                        <table>
                            <tr>
                                <td>From
                                </td>
                                <td>
                                    <input type="text" id="txtfrmdate" style="width: 80px;" />

                                </td>
                                <td>To
                                </td>
                                <td>
                                    <input type="text" id="txttodate" style="width: 80px" />

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

        <tr class="rowcss" id="trMAWBtitle">
            <td style="vertical-align: top">
            <td style="vertical-align: top">
            <td style="vertical-align: top;" colspan="4">

                <div id="divMAWBFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                    <div class="tooltip-content" style="width: 170px;">
                        <select id="lstMAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                    </div>
                </div>
            </td>

        </tr>

        <tr class="rowcss" id="trHAWBtitle">
            <td style="vertical-align: top">
            <td style="vertical-align: top">
            <td style="vertical-align: top">
            <td style="vertical-align: top" colspan="3">

                <div id="divHAWBFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                    <div class="tooltip-content" style="width: 170px;">
                        <select id="lstHAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                    </div>
                </div>
            </td>

        </tr>

    </table>


</div>

<div id="DivConfirmedPOs" style="font-weight: bold; ">
    <table id="fgrdConfirmedPOs" style="display: none;"></table>
</div>

<div id="UPCDialog" style="display: none">
    <table style="margin-top: 32px;">
        <tr>
            <td style="width: 100px; font-weight: bold">UPC</td>
            <td style="width: 50px; font-weight: bold">QTY</td>
            <td style="width: 100px; font-weight: bold">Description</td>
            <td style="width: 100px; font-weight: bold">Price</td>
            <td style="width: 100px; font-weight: bold">Date/Code</td>
            <td style="font-weight: bold">Print Company name?</td>
            <%--<td style="width: 100px; font-weight: bold; text-align: center;">Vendor</td>--%>
        </tr>
        <tr>
            <td class="tdclass">
                <label style="width: 100px;" id="UPC_lblUPC" />
            </td>

            <td class="tdclass">
                <input style="width: 50px" type="text" id="UPC_txtQty" class="NumbersOnly" />
            </td>

            <td style="background-color: #D9E4ED;">
                <input style="width: 90px" disabled="disabled" type="text" id="UPC_lblDescription" maxlength="30" />
            </td>

            <td class="tdclass">
                <input style="width: 70px" type="text" disabled="disabled" id="UPC_lblPrice" maxlength="15" />
            </td>

            <td class="tdclass">
                <input style="width: 70px" type="text" disabled="disabled" id="UPC_lblDate" maxlength="25" />
            </td>

            <%--<td class="tdclass">
                <input style="width: 70px" type="text" disabled="disabled" id="UPC_lblCode" maxlength="15" />
            </td>--%>

            <td class="tdclass" style="text-align: center;">

                <input class="Reports" type="checkbox" id="chkPrintCompanyName">
                <label for="chkPrintCompanyName"><span style="padding: 1px;"></span></label>
                <%--<div id="UPC_lblVendor" style="width: 185px; text-align: center;"></div>--%>
            </td>
        </tr>

    </table>
</div>

<div id="divUpdateComments" style="display: none">
    <table style="margin-top: 32px;">
        <tr>
            <td style="width: 400px; font-weight: bold">Product</td>
            <td style="width: 50px; font-weight: bold">Boxes</td>
            <td style="width: 100px; font-weight: bold">Pack</td>
            <td style="width: 100px; font-weight: bold">UOM</td>
            <td style="width: 300px; font-weight: bold">Comments</td>
        </tr>
        <tr>
            <td class="tdclass">
                <label id="UC_lblProduct"></label>
            </td>
            <td class="tdclass">
                <label id="UC_lblBoxes"></label>
                <input style="width: 40px; text-align: right;" type="text" id="UC_txtBoxes" />
            </td>
            <td class="tdclass">
                <label id="UC_lblPack"></label>
            </td>
            <td class="tdclass">
                <label id="UC_lblUOM"></label>
            </td>

            <td class="tdclass">
                <input style="width: 300px" type="text" id="UC_txtComments" /></td>
            <td>
        </tr>
    </table>
</div>

<div id="divSplitBoxes" style="display: none">
    <table>
        <tr style="height: 32px">
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
            <td style="width: 400px; font-weight: bold">Product</td>
            <td style="width: 50px; font-weight: bold">Farm</td>
            <td style="width: 50px; font-weight: bold">Boxes</td>
            <td style="width: 100px; font-weight: bold">Pack</td>
            <td style="width: 100px; font-weight: bold">UOM</td>
            <td style="width: 100px; font-weight: bold;text-align:center;" ">Ship Date</td>
            <td style="width: 300px; font-weight: bold">Comments</td>
        </tr>
        <tr>
            <td class="tdclass">
                <label style="display: none" id="Split_lblProduct"></label>
                <select id="Split_lstProduct" style="width: 152px;"></select>

            </td>
            <td class="tdclass">
                <select id="Split_lstFarm" />
            </td>
            <td class="tdclass">
                <label id="Split_lblBoxes"></label>
                <input style="width: 40px; text-align: right;" type="text" id="Split_txtBoxes" class="NumbersOnly" />
            </td>
            <td class="tdclass">
                <label id="Split_lblPack"></label>
                <input style="width: 40px; text-align: right;" type="text" id="Split_txtPack" class="NumbersOnly" />
            </td>
            <td class="tdclass">
                <label id="Split_lblUOM"></label>
            </td>
            <td class="tdclass">
                <input type="text" id="txtFarmShip_Date" style="width: 80px;">
            </td>

            <td class="tdclass">
                <input style="width: 300px" type="text" id="Split_txtComments" /></td>
        </tr>
    </table>
</div>

<div id="divUpdateFarm" style="display: none">
    <table style="margin-top: 32px;">
        <tr>
            <td style="width: 400px; font-weight: bold">Product</td>
            <td style="width: 50px; font-weight: bold">Farm</td>
            <td style="width: 50px; font-weight: bold">Boxes</td>
            <td style="width: 100px; font-weight: bold">Pack</td>
            <td style="width: 100px; font-weight: bold">UOM</td>
            <td style="width: 300px; font-weight: bold">Comments</td>
        </tr>
        <tr>
            <td class="tdclass">
                <label id="updateFarm_lblProduct"></label>
            </td>
            <td class="tdclass">
                <select id="updateFarm_lstFarm" />
            </td>
            <td class="tdclass">
                <label id="updateFarm_lblBoxes"></label>
            </td>
            <td class="tdclass">
                <label id="updateFarm_lblPack"></label>
            </td>
            <td class="tdclass">
                <label id="updateFarm_lblUOM"></label>
            </td>
            <td class="tdclass">
                <input style="width: 300px" type="text" id="updateFarm_txtComments" />
                <%--<label id="updateFarm_lblComments"></label>--%>
            </td>
        </tr>
    </table>
</div>

<div id="divPrintPoDialog" style="display: none">
    <div id="divlabelPath" style="display: none"></div>
    <iframe id="iframelbl" style="border: 1px solid #666CCC" src="" frameborder="1" scrolling="auto" height="410" width="373"></iframe>
</div>


<div id="divConfirmedPOsFilter" style="display: none;"></div>
<div style="display: none" id="HeaderID"></div>
<div style="display: none" id="DivORD"></div>

<div style="display: none" id="Price"></div>
<div style="display: none" id="Date"></div>
<div style="display: none" id="Code"></div>

<div id="msgbox-select" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msg" class="DeleteDialogMsg"></p>
    </div>
</div>

<div id="IsShippedConfirm" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgIsShippedConfirm" class="DeleteDialogMsg"></p>
    </div>
</div>

<div id="divUserPageDetails"></div>
<div id="ResetID" style="display: none"></div>
<div id="FilterDiv" style="display: none"></div>
<div id="LoggedUserId" runat="server" style="display: none"></div>
<div id="LoggedUserType" runat="server" style="display: none"></div>
<div id="DivConfirmed" runat="server" style="display: none"></div>
<div id="DivPending" runat="server" style="display: none"></div>
<div id="DivUsers" runat="server" style="display: none"></div>
<div id="DivAvailability" runat="server" style="display: none"></div>
<div id="DivCredits" runat="server" style="display: none"></div>
<iframe width="1" height="1" id="printFrame" />
<div id="DivUPC" style="display: none;"></div>
<div id="DivUPCDescription" style="display: none;"></div>
<div id="DivUPCPrice" style="display: none;"></div>
<div id="DivUPCDate" style="display: none;"></div>
<div id="DivUPCFarm" style="display: none;"></div>
<div id="DivQuantity" style="display: none;"></div>
<div id="POConfirmedStatusCodes" style="display:none"><%= ConfigurationManager.AppSettings("POConfirmedStatusCodes") %></div>
<div id="DivConsolidatePODetails">
    <table id="fgrdConsolidatePODetails" style="display: none;"></table>
</div>

<script type="text/javascript">

    var LoginUserId = $("#ctl00_LoggedUserId").html();
    var DefaultUserFarms = "";
    var DefaultWC = "";
    var IsFarmFilterFromLst = false;
    var IsConsolidateGridLoad = false;

    $(document).ready(new function () {
        //to filter po list by to date//
        var today = Date.today().toString("MM/dd/yyyy");
        $("#txtfrmdate").val(today);
        $("#txttodate").val(today);
        var fdate = "Today: " + today;
        $("#lblchosendate").html(fdate);
        $("#lblchosendate1").html(today);
        $("#lblchosendate2").html(today);
        $("#divFromDate").datepicker("setDate", Date.parse(today));
        $("#divToDate").datepicker("setDate", Date.parse(today));

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + '' + "','ToDate':'" + today + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        });
        ///////

        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";
        $("#txtMAWB").bind("input propertychange", function (e) {
            var selectedIds = '';
            $("[id^=teselect_]:visible").each(function () {
                var Chk = $(this);
                var imgSRC = Chk[0].src;
                if (imgSRC.indexOf("images/check-on.png") >= 0) {
                    if ($("#txtMAWB").val().length != 0) {
                        $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonDisabled");
                        $("#btnSaveMAWBAndHAWB").addClass("BloomButtonEnabled");
                        $("#btnSaveMAWBAndHAWB").attr("disabled", false);
                    }
                    else {
                        $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonEnabled");
                        $("#btnSaveMAWBAndHAWB").addClass("BloomButtonDisabled");
                        $("#btnSaveMAWBAndHAWB").attr("disabled", true);
                    }
                }
            });
        });


        $("#txtMAWB").live('input paste', function () {
            $("#txtMAWB").attr("maxlength", 15);
            var value = $("#txtMAWB").val().replace(/ /g, '');
            if (value != "" && value != null) {
                $("#txtMAWB").val(value);
                $("#txtMAWB").attr("maxlength", 12);
            }
        });

        $(function () {
            $("#divFromDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtfrmdate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#divToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txttodate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#txtfrmdate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txttodate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });

        ResetFields()
        
        $("#btnPrintLabel").addClass("BloomButtonDisabled");
        $("#btnPrintLabel").removeClass("BloomButtonEnabled");

        if (DefaultUserFarms != "" && DefaultUserFarms != null && LoginUserId != "" && LoginUserId != null)
            DefaultWC = "POQ.Farm in (" + DefaultUserFarms.substring(0, DefaultUserFarms.lastIndexOf(",")) + ") and PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ")";
        else if ($("#lstFarmFilter").val() != 'ALL' && $("#lstFarmFilter").val() != null)
            DefaultWC = "POQ.Farm in ('"+$("#lstFarmFilter").val()+"') and PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ")";
        else
            DefaultWC = "PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ")";
        
        $("#fgrdConfirmedPOs").flexigrid({
            url: 'BloomService.asmx/GetConfirmedPOList',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="selectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
                { display: 'PO#', name: 'PONUM', width: 70, sortable: true, align: 'left' },
                { display: '', name: 'market', width: 5, sortable: true, align: 'left' },
                { display: 'Line', name: 'ORD', width: 25, sortable: true, align: 'left' },
                { display: 'ShipDate', name: 'ShipDate', width: 60, sortable: true, align: 'left' },
                { display: 'Origin', name: 'City', width: 30, sortable: true, align: 'left' },
                { display: 'Product', name: 'Prodnamq', width: 250, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'QtyBox', width: 34, sortable: true, align: 'right' },
                { display: 'UOM', name: 'Uom', width: 30, sortable: true, align: 'left' },
                { display: 'Pack', name: 'QtyXbox', width: 30, sortable: true, align: 'right' },
                { display: 'Cost', name: 'UnitCosq', width: 65, sortable: true, align: 'right' },
                { display: 'Conf', name: 'QtyBConf', width: 30, sortable: true, align: 'right' },
                { display: 'Cust', name: 'Customer', width: 40, sortable: true, align: 'left' },
                { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'left' },
                { display: 'Buyer', name: 'passname', width: 40, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 70, sortable: true, align: 'left' },
                { display: 'HAWB', name: 'HAWB', width: 50, sortable: true, align: 'left' },
                { display: 'Invoice', name: 'Invoice', width: 50, sortable: true, align: 'left' },
                { display: 'Breakdown', name: 'B.Down', width: 150, sortable: false, align: 'left' },
                { display: 'BoxCode', name: 'boxcode', width: 50, sortable: true, align: 'left' },
                { display: 'UPC', name: 'Upc', width: 75, sortable: true, align: 'left' },
                { display: 'CustomerPO', name: 'CustomerPO', width: 75, sortable: true, align: 'left' },
                { display: 'Split', name: 'Split', width: 30, sortable: false, align: 'left' },
                { display: 'L', name: 'Length', width: 25, sortable: false, align: 'left' },
                { display: 'W', name: 'Width', width: 25, sortable: false, align: 'left' },
                { display: 'H', name: 'Height', width: 25, sortable: false, align: 'left' },
                { display: 'Totalrb', name: 'Totalrb', width: 30, sortable: false, align: 'left' },
            ],
            searchitems: [
                { display: 'PO#', name: 'PONUM' },
                { display: 'Farm', name: 'Farm ' },
                { display: 'Product', name: 'Prodnamq' },
                { display: 'Origin', name: 'City' },
                { display: 'Boxes', name: 'QtyBox' },
                { display: 'Pack', name: 'QtyXbox' },
                { display: 'Cost', name: 'UnitCosq' },
                { display: 'UOM', name: 'Uom' },
                { display: 'Conf', name: 'QtyBConf' },
                { display: 'BoxNum', name: 'BoxNum' },
                { display: 'Buyer', name: 'passname' },
                { display: 'AWB', name: 'AWB' },
                { display: 'HAWB', name: 'HAWB' },
                { display: 'Invoice', name: 'Invoice' },
                { display: 'Breakdown', name: 'Commentq' },
                { display: 'Boxcode', name: 'boxcode' },
                { display: 'CustomerPO', name: 'CustomerPO' },

            ],
            showTableToggleBtn: true,
            sortname: "Farm,qtyxbox",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            rp: 30000,
            //rp: parseInt(($(window).height() - 290) / 25),
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 230,
            striped: true,
            onSuccess: gridFormat,
            params: [
              { name: 'Filter', value: DefaultWC },
              { name: 'ExportCSV', value: '' }
            ],
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivConfirmedPOs .sDiv").css('float', 'left').css('width', '545px');
        $('#DivConfirmedPOs .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivConfirmedPOs .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivConfirmedPOs .pDiv").find(".pDiv2").find(".btnseparator").hide();
        // $("#DivConfirmedPOs .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivConfirmedPOs .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        //$("#DivConfirmedPOs .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px');
        //$("#DivConfirmedPOs .pDiv").find(".pReload.pButton").attr('style', 'margin-left: -49px');

        function gridFormat() {
            //For to show the error
            if ($("#fgrdConfirmedPOs tr#row-2").length > 0) {
                $("#fgrdConfirmedPOs tr#row-2").hide();
                $.MessageBox($("#fgrdConfirmedPOs tr#row-2")[0].innerText);
                return false;
            }

            //$('#fgrdConfirmedPOs td:nth-child(7) div').each(function () {
            //    $(this).css({ "background-color": '#0000FF', "color": 'white', 'padding-bottom': '3px' });
            //});

            //$('#fgrdConfirmedPOs #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdConfirmedPOs #row0 td:nth-child(11) div a').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdConfirmedPOs #row0 td:nth-child(10) div a').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdManualPODetail #row0').removeClass("erow")
            $('#fgrdConfirmedPOs #row0').addClass("TotalRows")

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
                        else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != 'btndateok') {
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
                            return false;
                        }

                    }
                }
            });

            $("[id^=editconf_]").change(function (event) {

                var Conf = $(this).val();
                var ctrlId = $(this)[0].id.replace("editconf_", "");
                var Boxes = $("#fgrdConfirmedPOs tr#row" + ctrlId + " td:eq(8)")[0].textContent;
                if (Conf > Boxes) {
                    $.MessageBox("Invalid Conf!!");
                    $("#editconf_" + ctrlId).focus();
                }
            });

            $("#ExportCSV").show();

            if (IsFarmFilterFromLst == false) {
                LoadFarmFromGrid();
            }
        }

        function LoadFarmFromGrid() {
            $('#lstFarmFilter').empty();
            $('#lstFarmFilter').append('<option value="All">All</option>');
            var items = [], options = [], uniqitems;
            $('#fgrdConfirmedPOs tbody tr td:nth-child(2)').each(function () {
                items.push($(this).text());
            });
            uniqitems = $.unique(items);
            $.each(uniqitems, function (i, item) {
                if (item == ' ' || item == '&nbsp;' || item == '\u00a0') { }
                else {
                    $('#lstFarmFilter').append('<option value="' + item + '">' + item + '</option>');
                }
            });
        }
        (function ($) {
            var _old = $.unique;
            $.unique = function (arr) {
                // do the default behavior only if we got an array of elements
                if (!!arr[0].nodeType) {
                    return _old.apply(this, arguments);
                } else {
                    // reduce the array to contain no dupes via grep/inArray
                    return $.grep(arr, function (v, k) {
                        return $.inArray(v, arr) === k;
                    });
                }
            };
        })(jQuery);

        $("#btnPrintLabel").addClass("BloomButtonDisabled");
        $("#btnPrintLabel").removeClass("BloomButtonEnabled");

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserFarmCodeByUserID',
            data: "{'Searchtext':'','UserID':'" + LoginUserId + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetDateSession',
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (dateoutput, status) {

                        var date = dateoutput.d;
                        if (date && date[0] === "") {
                            var today = Date.today().toString("MM/dd/yyyy");
                            date[0] = today;
                        }
                        if (date == null || date == "" || date[0] === "" && date[1] === "") {
                            var fdate = "Today: " + $("#txttodate").val();
                            $("#lblchosendate").html(fdate);
                            $("#lblchosendate1").html($("#txtfrmdate").val());
                            $("#lblchosendate2").html($("#txttodate").val());
                            $("#divFromDate").datepicker("setDate", new Date());
                            $("#divToDate").datepicker("setDate", new Date());
                            $("#imgdate").attr("src", "images/Filter.png");
                            $("#tr2").addClass('FilterDivStyle');
                        }
                        else {
                            var fdate = date[0] + " to " + date[1];
                            $("#txtfrmdate").val(date[0]);
                            $("#txttodate").val(date[1]);
                            $("#lblchosendate").html(fdate);
                            $("#lblchosendate1").html(date[0]);
                            $("#lblchosendate2").html(date[1]);
                            $("#divFromDate").datepicker("setDate", Date.parse(date[0]));
                            $("#divToDate").datepicker("setDate", Date.parse(date[1]));
                            $("#imgdate").attr("src", "images/Filter.png");
                            $("#tr2").addClass('FilterDivStyle');
                        }


                        //$('#lstFarmFilter').empty();
                        //$('#lstFarmFilter').append('<option value="All">All</option>');

                        var data = output.d;
                        if (data == null) {
                            LoadFarm();
                        }

                        for (var i in data) {
                            var DefFarm = data[i];
                            if ($("#ctl00_LoggedUserType").html().toLowerCase() != "inventory")
                                DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                            //$('#lstFarmFilter').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
                            $('#updateFarm_lstFarm').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
                            $('#Split_lstFarm').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
                        }
                        //===========================================================================================================
                        //Commented by VEN::16-12-2015::For avoid Statement too long error (i.e.) more then 100 farms assigned in user
                        //============================================================================================================
                        //if (DefaultUserFarms != "" && DefaultUserFarms != null && LoginUserId != "" && LoginUserId != null)                            
                        //    DefaultWC = "Farm in (" + DefaultUserFarms.substring(0, DefaultUserFarms.lastIndexOf(",")) + ") and PROSTATUS in ('CONFIRMED','STANDING') ";                            
                        //else                            
                        //    DefaultWC = "PROSTATUS in ('CONFIRMED','STANDING')";
                        DefaultWC = "PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ")";

                        //LoadHAWB(DefaultWC);
                        //LoadMAWB(DefaultWC);
                    }
                });
            }
        });
        ApplyUserFilters();

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
    });

    function ApplyUserFilters() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmsByUserId',
            data: "{'UserId':'" + LoginUserId + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPODateSession',
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (dateoutput, status) {
                        var date = dateoutput.d;                        
                        if (date == null || date == "") {
                            var fdate = "Today: " + $("#txttodate").val();
                            $("#lblchosendate").html(fdate);
                            $("#lblchosendate1").html($("#txtfrmdate").val());
                            $("#lblchosendate2").html($("#txttodate").val());
                            $("#imgdate").attr("src", "images/Filter.png");
                            $("#tr2").addClass('FilterDivStyle');
                        }
                        else {
                            var fdate = date[0] + " to " + date[1];
                            $("#txtfrmdate").val(date[0]);
                            $("#txttodate").val(date[1]);
                            $("#lblchosendate").html(fdate);
                            $("#lblchosendate1").html(date[0]);
                            $("#lblchosendate2").html(date[1]);
                            $("#imgdate").attr("src", "images/Filter.png");
                            $("#tr2").addClass('FilterDivStyle');
                        }


                        $('#lstFarmFilter').empty();
                        $('#lstFarmFilter').append('<option value="All">All</option>');
                        var data = output.d;
                        if (data == null) {
                            LoadFarm();
                        }
                        //debugger;
                        for (var i in data) {
                            var DefFarm = data[i];
                            DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                            $('#lstFarmFilter').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
                        }
                        if (DefaultUserFarms != "" && DefaultUserFarms != null && LoginUserId != "" && LoginUserId != null)
                            DefaultWC = "Farm in (" + DefaultUserFarms.substring(0, DefaultUserFarms.lastIndexOf(",")) + ") and PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ") AND SHIPDATE >= ctod('" + $("#lblchosendate1").html() + "') " + " And " + " SHIPDATE <= ctod('" + $("#lblchosendate2").html() + "')";
                        else if (LoginUserId == null || LoginUserId == "")
                            DefaultWC = "PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ") AND SHIPDATE >= ctod('" + $("#lblchosendate1").html() + "') " + " And " + " SHIPDATE <= ctod('" + $("#lblchosendate2").html() + "')";
                        else
                            DefaultWC = "Farm in ('0') and PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ") AND SHIPDATE >= ctod('" + $("#lblchosendate1").html() + "') " + " And " + " SHIPDATE <= ctod('" + $("#lblchosendate2").html() + "')";

                        LoadHAWB(DefaultWC);
                        LoadMAWB(DefaultWC);
                    }
                });
            }
        });
    }

    function ResetFields() {
        $("img#selectall").prop("src", "images/check-off.png");
        $("[id ^= teselect_]").attr("src", "images/check-off.png");

        $("#txtMAWB").val("");
        $("#txtHAWB").val("");
        $("#txtinvoicenumber").val("");

        $("#btnSaveMAWBAndHAWB").addClass("BloomButtonDisabled");
        $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonEnabled");
        $("#btnSaveMAWBAndHAWB").attr("disabled", true);
        $("#btnPrintLabel").addClass("BloomButtonDisabled");
        $("#btnPrintLabel").removeClass("BloomButtonEnabled");
    }

    $("#cssmenu ul li").click(function (e) {

        if ($(this)[0].id == "UDboard_MenuConfirmedPOs") {
            $("#cssmenu ul li").removeClass('active');
            $(this).addClass('active');
            $("#btnapply").click();
        }
    });

    $("#btnSaveMAWBAndHAWB").click(function () {
        $("#btnSaveMAWBAndHAWB").addClass("BloomButtonProcessing");
        //if ($("#txtMAWB").val().trim().replace('-', '').replace('-', '').length < 11) {
        //    $.MessageBox("AWB# must be 11 or 12 digits!!!");
        //    $("#txtMAWB").focus()
        //    return false;
        //}

        if ($("#txtHAWB").val() == "") {
            $.MessageBox("Please enter HAWB#!!!");
            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
            $("#txtHAWB").focus()
            return false;
        }
        if ($("#txtHAWB").val() != "" && $("#txtHAWB").val() != "" && $("#txtinvoicenumber").val()=="") {
            $.MessageBox("Please enter Invoice#!!!");
            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
            $("#txtinvoicenumber").focus()
            return false;
        }
        if (validateMawb($("#txtMAWB").val())) {
            var selectedIds = '';
            $("[id^=teselect_]:visible").each(function () {
                var Chk = $(this);
                var imgSRC = Chk[0].src;
                var hasshippeddata = "0";
                var id = Chk[0].id;
                var Ord = Chk[0].id;

                if (imgSRC.indexOf("images/check-on.png") >= 0) {
                    $("#fgrdConfirmedPOs td:nth-child(17) div").html();

                    if (selectedIds == '') {
                        selectedIds += (selectedIds == '' ? '' : ',') + id;
                    }
                    else if (selectedIds.indexOf(id) < 0) {
                        selectedIds += (selectedIds == '' ? '' : ',') + id;
                    }
                }
            });

            if (selectedIds == "") {

                $.MessageBox("Please Select at least one ConfirmedPO");
                $("[id ^=selectall]").attr("src", "images/check-off.png");
                $("[id ^= teselect_]").attr("src", "images/check-off.png");
                return false;
            }

            $('#fgrdConfirmedPOs tr').each(function () {
                hasshippeddata = "0"
                if ($(this).attr("id") != "row0") {
                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                        var mawb = $(this).find("td:nth-child(17) div a").html()
                        var hawb = $(this).find("td:nth-child(18) div a").html()
                        if (mawb.toString().trim() != "" || hawb.toString().trim() != "") {
                            hasshippeddata = "1"
                            $("#msgIsShippedConfirm").html("Already shipped this purchase order,Do you want continue?");
                            $("#IsShippedConfirm").dialog("open");
                            return false;
                        }
                    }
                }

            });

            if (hasshippeddata == "0") {

                var buttons = $("#IsShippedConfirm").dialog("option", "buttons");
                // Calls the event
                buttons["Continue"]();
            }
        }
        else {
            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
            $.MessageBox("Please enter valid mawb#!!!!");
        }


    });

    $("#btnRemoveMAWBAndHAWB").click(function () {
        var SelectedPOs = ''
        $("[id^=teselect_]:visible").each(function () {
            if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                if (SelectedPOs == '') {
                    SelectedPOs = $(this)[0].id.replace("teselect_", "");
                }
                else {
                    SelectedPOs += "," + $(this)[0].id.replace("teselect_", "");
                }
            }
        });

        if (SelectedPOs == "") {
            $.MessageBox("Please select a PO");
            $("[id ^=selectall]").attr("src", "images/check-off.png");
            $("[id ^= teselect_]").attr("src", "images/check-off.png");
            return false;
        }
        $("#ImgProcessing").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/RemoveMAWBAndHAWB',
            data: "{'SelectedPOs':'" + SelectedPOs + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#ImgProcessing").hide();
                if (output.d == "success") {
                    $("[id^=teselect_]:visible").each(function () {
                        if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                            ID = $(this)[0].id.replace("teselect_", "");
                            $("#divawb_" + ID).html("");
                            $("#divhawb_" + ID).html("");
                            $("#divinvoice_" + ID).html("");
                            $("#editInvoice_" + ID).attr("placeholder", "");
                        }
                    });
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    });

    function validateNumber(sNumber) {
        var intRegex = /^\d+$/;
        var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
        if (intRegex.test(sNumber) || floatRegex.test(sNumber)) {
            return true;
        }
        else {
            return false;
        }
    }

    $("#IsShippedConfirm").dialog({
        autoOpen: false,
        resizable: false,
        width: 450,
        modal: true,
        buttons: {
            Continue: function () {
                var MAWB = $("#txtMAWB").val().trim().replace(/-/g, '');
                var HAWB = $("#txtHAWB").val().trim().replace(/-/g, '');
                var Invoicenum = $("#txtinvoicenumber").val().trim().replace(/-/g, '') == "" ? "0" : $("#txtinvoicenumber").val().trim().replace(/-/g, '');

                if (!validateNumber(Invoicenum)) {
                    $.MessageBox("Please enter valid input");
                    return false;
                }

                var SelectedPOs = ''
                $("[id^=teselect_]:visible").each(function () {
                    if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                        if (SelectedPOs == '') {
                            SelectedPOs = $(this)[0].id.replace("teselect_", "");
                        }
                        else {
                            SelectedPOs += "," + $(this)[0].id.replace("teselect_", "");
                        }
                    }
                });
                //debugger;
                $("#ImgProcessing").show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateMAWBAndHAWB',
                    data: "{'MAWB':'" + MAWB + "','HAWB':'" + HAWB + "','InvoiceNumber':'" + Invoicenum + "','SelectedPOs':'" + SelectedPOs + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#ImgProcessing").hide();
                        if (output.d != "MoreFarms" && output.d != "error") {
                            //$.MessageBox("Selected purchase order updated");
                            $("#btnSaveMAWBAndHAWB").addClass("BloomButtonDisabled");
                            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonEnabled");
                            $("#btnPrintLabel").addClass("BloomButtonEnabled");
                            $("#btnPrintLabel").removeClass("BloomButtonDisabled");
                            $("#btnSaveMAWBAndHAWB").attr("disabled", true);
                            $("#txtMAWB").val("");
                            $("#txtHAWB").val("");
                            $("#txtinvoicenumber").val("");
                            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
                            $("[id^=teselect_]:visible").each(function () {
                                if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                                    ID = $(this)[0].id.replace("teselect_", "");
                                    $("#divawb_" + ID).html(MAWB);
                                    $("#divhawb_" + ID).html(HAWB);
                                    $("#divinvoice_" + ID).html(Invoicenum);
                                    $("#editInvoice_" + ID).attr("placeholder", Invoicenum);
                                }
                            });

                        }
                        else if (output.d == "MoreFarms") {
                            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
                            $.MessageBox("More than one farms selected so cannot export data to users!!!!");
                        }
                        else if (output.d == "error") {
                            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonProcessing");
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }


                        //$.ajax({
                        //    url: 'BloomService.asmx/ClearSelectedPOsSession',
                        //    async: false,
                        //    type: 'POST',
                        //    data: {},
                        //    contentType: "application/json; charset=utf-8",
                        //    dataType: "json"
                        //});
                        //ClearPoSelection(true);
                        //$("#btnapply").click();
                        //var str = FramingFilters();
                        //str = str.replace('&amp;', '&');
                        //LoadHAWB(str);
                        //LoadMAWB(str);
                        //$("#fgrdConfirmedPOs").flexReload({ url: '/url/for/refresh' });

                        //$("img#selectall").prop("src", "images/check-off.png");
                        //$("[id ^= teselect_]").attr("src", "images/check-off.png");
                    }


                });
                $(this).dialog("close");
            },

            Cancel: function () {
                $(this).dialog("close")
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Continue')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

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

    $("#UPCDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 700,
        height: 200,
        title: 'Print UPC',
        buttons: {
            Print: function () {
                $(this).dialog("close")
            },

            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-print-1')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    $("#divUpdateComments").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 700,
        height: 200,
        title: 'Update Comments',
        buttons: {


            Save: function () {
                var HeaderID = $("#HeaderID").html();
                var ORD = $("#DivORD").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateComments',
                    data: "{'Comments':'" + $("#UC_txtComments").val().toUpperCase() + "','POKEY':'" + HeaderID + "','ORD':'" + ORD + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#btnapply").click();
                        $("#divUpdateComments").dialog("close");
                        //$.MessageBox("Comments updated successfully..");
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


    $("#divPrintPoDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: 485,
        title: 'Print Label',
        buttons: {
            Print: function () {
                var pdfpath = $("#divlabelPath").html();
                printUrl(pdfpath);
            },
            Download: function () {
                window.open($("#divlabelPath").html());
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Download')").addClass('dialogbuttonstyle icon-save')
        }
    });

    function PrintPOLabel() {
        var count = 0;
        $('#fgrdConfirmedPOs tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    if ($(this).find("td div").eq(8)[0].textContent == 0) {
                        $.MessageBox("Please select valid boxes");
                        count = -1;
                        return false;
                    }
                }
            }
        });
        
        if (count != -1) {
            var w = window.open('GeneratingPDF.html');
            
            var SelectedPOs = ''
            $("[id^=teselect_]:visible").each(function () {
                if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                    if (SelectedPOs == '') {
                        SelectedPOs = $(this)[0].id.replace("teselect_", "");
                    }
                    else {
                        SelectedPOs += "," + $(this)[0].id.replace("teselect_", "");
                    }
                }
            });

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ExportLabels',
                //data: "{'Pokey':'" + PoKey + "','Ord':'" + Ord + "','BoxesCount':'" + "0" + "'}",
                data: "{'SelectedPOs':'" + SelectedPOs + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //printUrl(output.d);
                    $("#btnPrintLabel").removeClass("BloomButtonProcessing");
                    if (output.d != "Please select po" && output.d != "LogOut" && output.d != "error") {

                        path = output.d;
                        var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                        //var ss = $.fileDownload(path);
                        //$("#msg").html("Your file is ready for download... <br/><br/><a style='padding-left:30px;' download='"+ path +"' id='btnopenpdf' target='_blank' href='" + path + "'>Click Here</a> to download.");                                      
                        //$("#btnopenpdf").get(0).click();
                        w.location = ExportedPath;
                    }
                    else if (output.d == "LogOut") {
                        w.close();
                        window.location.href = "Login.aspx"
                    }
                    else if (output.d == "error") {
                        $("#btnPrintLabel").removeClass("BloomButtonProcessing");
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                    else {
                        $.MessageBox("Please Select at least one ConfirmedPO");
                    }
                }
            });
        }

    }

    $("#divSplitBoxes").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 700,
        height: 200,
        title: 'Split Boxes',
        buttons: {
            Save: function () {
                $(".Warning").hide();
                $(".YellowWarning").hide();
                //var HeaderID = $("#HeaderID").html();
                //var ORD = $("#DivORD").html();
                var vPOQId = window.currentSplitPOQID;
                window.currentSplitPOQID = 0;

                if (!vPOQId || vPOQId === 0) {
                    $.MessageBox("Please check that you selected a PO to split.");
                    return false;
                }

                var splitingBoxValue = $("#Split_txtBoxes").val() == "" ? "0" : $("#Split_txtBoxes").val();
                var OrginalBoxValues = $("#Split_lblBoxes").html() == "" ? "0" : $("#Split_lblBoxes").html();
                //debugger;
                var Pack = $("#Split_txtPack").val() == "" ? "0" : $("#Split_txtPack").val();
                var ProductCode = $('#Split_lstProduct').find(':selected').data('code');
                var ProductName = $('#Split_lstProduct').find(':selected').data('name');

                var Farm = $("#Split_lstFarm").val();

                if (!validateNumber(splitingBoxValue)) {
                    $.MessageBox("Please enter valid input");
                    return false;
                }

                if (parseInt(splitingBoxValue) == 0) {
                    $(".YellowWarning").show();
                    $(".YellowWarning").html("Invalid box quantity!! Box quantity must be greater then zero!!");
                    return false;
                }

                //2021/09/12
                var today = $.datepicker.formatDate('mm/dd/yy', new Date());
                if (new Date($("#txtFarmShip_Date").val() + ' 00:00') < new Date(today + ' 00:00')) {
                    $(".YellowWarning").show();
                    $(".YellowWarning").html("Invalid Ship Date!! Ship Date must be greator then or equal to todays date!!");
                    return false;
                }

                if (parseInt(OrginalBoxValues) < parseInt(splitingBoxValue)) {
                    $(".YellowWarning").show();
                    $(".YellowWarning").html("Invalid box quantity!! Box quantity must be less then or equal to original quantity!!");
                    return false;
                }
                else {
                    //2021/09/12, pass ship data to ajax data
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/SplitPOBoxes',
                        data: "{'POQId':'" + vPOQId + "','TotBoxes':'" + OrginalBoxValues
                            + "','SplittingBox':'" + splitingBoxValue + "','QTYXBOX':'" + Pack +
                            "','ProductCode':'" + ProductCode + "','ProductName':'" + ProductName + "','BreakDownText':'" + $("#Split_txtComments").val().toUpperCase() + "','Farm':'" + Farm + "','ShipDate':'" + $("#txtFarmShip_Date").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            //debugger;
                            if (output.d == "LogOut") {
                                window.location.href = "Login.aspx"
                            }
                            else if (output.d.indexOf("Wait") != "-1") {
                                $.MessageBox(output.d);
                            }
                            else if (output.d == "success") {
                                $("#btnapply").click();
                                $("#divSplitBoxes").dialog("close");
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
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            $(".Warning").hide();
            $(".YellowWarning").hide();
        }
    });

    $("#divUpdateFarm").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 700,
        height: 200,
        title: 'Split Boxes',
        buttons: {
            Save: function () {
                var HeaderID = $("#HeaderID").html();
                var ORD = $("#DivORD").html();
                var Farm = $("#updateFarm_lstFarm").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdatePurchaseOrderFarm',
                    data: "{'POKEY':'" + HeaderID + "','ORD':'" + ORD + "','Farm':'" + Farm + "','BreakDownText':'" + $("#updateFarm_txtComments").val().toUpperCase() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "valid") {
                            $("#btnapply").click();
                            $("#divUpdateFarm").dialog("close");
                            // $.MessageBox("Box splitted successfully..");
                        }
                        else
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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


    //$("[id^=UpdatePOBreakDown_]").die('click').live("click", function (e) {

    //    $("#UC_lblProduct").html("");
    //    $("#UC_lblBoxes").html("");
    //    $("#UC_lblPack").html("");
    //    $("#UC_lblUOM").html("");
    //    $("#UC_txtBoxes").val("");
    //    $("#UC_txtComments").val("");
    //    $("#UC_lblBoxes").show();
    //    $("#UC_txtBoxes").hide();
    //    var sourceCtl = $(this);
    //    var ID = sourceCtl.attr('id');
    //    var headers = ID.split('_');

    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetConfirmedPOsDetailsByID',
    //        data: "{'ID':'" + headers[1] + "','ORD':'" + headers[2] + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {

    //            var UPC = output.d;
    //            $("#UC_lblProduct").html(UPC.Product);
    //            $("#UC_lblBoxes").html(UPC.QtyBox);
    //            $("#UC_lblPack").html(UPC.QtyXbox);
    //            $("#UC_lblUOM").html(UPC.Uom);
    //            $("#UC_txtBoxes").val(UPC.QtyBox);
    //            $("#UC_txtComments").val($.trim(UPC.Breakdown.toUpperCase()));
    //            $("#HeaderID").html(UPC.POKEY)
    //            $("#DivORD").html(UPC.ORD);
    //            $("#divUpdateComments").dialog("open");
    //        }
    //    });
    //});

    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return dt;// (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
    }

    Date.prototype.isSameDateAs = function (pDate) {
        return (
            this.getFullYear() === pDate.getFullYear() &&
            this.getMonth() === pDate.getMonth() &&
            this.getDate() === pDate.getDate()
        );
    }


    $("[id^=SplitBoxes_]").die('click').live("click", function (e) {

        $("#Split_lblProduct").html("");

        $("#Split_lblBoxes").html("");
        $("#Split_lblPack").html("");
        $("#Split_lblPack").hide("");
        $("#Split_txtPack").val("");
        $("#Split_txtPack").show();
        $("#Split_lblUOM").html("");
        $("#Split_txtBoxes").val("");
        $("#Split_txtComments").val("");
        $("#Split_lblBoxes").hide();
        $("#Split_txtBoxes").show();

        //2021/09/12
        $("#txtFarmShip_Date").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtFarmShip_Date").val(Date);
            }
        });

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var headers = ID.split('_');

        window.currentSplitPOQID = headers[1];

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetConfirmedPOsDetailsByID',
            data: "{'POQId':'" + headers[1] + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var Det = output.d;
                if (Det.POKEY != 0) {
                    $("#HeaderID").html(Det.POKEY);
                    $("#DivORD").html(Det.ORD);
                    if (Det.QtyBConf == 0) {
                        $("#updateFarm_lblProduct").html("");
                        $("#updateFarm_lblBoxes").html("");
                        $("#updateFarm_lblPack").html("");
                        $("#updateFarm_lblUOM").html("");
                        $("#updateFarm_lstFarm").val("");
                        $("#updateFarm_txtComments").val("");
                        $("#updateFarm_lblProduct").html(Det.Product);
                        //$("#updateFarm_lblBoxes").html(UPC.QtyBox);
                        $("#updateFarm_lblBoxes").html(Det.QtyBConf);//used confirmed boxes instead of qtyboxes                            
                        $("#updateFarm_lblPack").html(Det.QtyXbox);
                        $("#updateFarm_lblUOM").html(Det.Uom);
                        $("#updateFarm_lstFarm").val(Det.Farm);
                        $("#updateFarm_txtComments").val($.trim(Det.Breakdown.toUpperCase()));
                        $("#divUpdateFarm").dialog("open");
                    }
                    else {
                        $("#Split_lblProduct").html(Det.Product);
                        //$("#Split_lblBoxes").html(UPC.QtyBox);
                        $("#Split_lblBoxes").html(Det.QtyBConf);//used confirmed boxes instead of qtyboxes                            
                        $("#Split_lblPack").html(Det.QtyXbox);
                        $("#Split_txtPack").val(Det.QtyXbox);
                        $("#Split_lblUOM").html(Det.Uom);
                        //$("#Split_txtBoxes").val(Det.QtyBox);
                        $("#Split_txtBoxes").val(Det.QtyBConf);
                        $("#Split_lstFarm").val(Det.Farm);
                        $("#Split_txtComments").val($.trim(Det.Breakdown.toUpperCase()));

                        //2021/09/12
                        var currDateTime = new Date();
                        var currDate = new Date(currDateTime.setHours(0, 0, 0, 0));
                        var shipDate = new Date(ToJavaScriptDate(Det.ShipDate));
                        var minDate = new Date(ToJavaScriptDate(Det.ShipDate));
                        if (!currDate.isSameDateAs(shipDate)) {
                            debugger;
                            if (currDate.isSameDateAs((new Date(ToJavaScriptDate(Det.ShipDate))).addDays(-1))) {
                                minDate = (new Date(ToJavaScriptDate(Det.ShipDate))).addDays(-1);
                            }

                            if (currDate <= (new Date(ToJavaScriptDate(Det.ShipDate))).addDays(-2)) {
                                minDate = (new Date(ToJavaScriptDate(Det.ShipDate))).addDays(-2);
                            }
                        }

                        var maxDate = (new Date(ToJavaScriptDate(Det.ShipDate))).addDays(1);

                        var minDateFilter = $.datepicker.formatDate('mm/dd/yy', minDate);
                        var maxDateFilter = $.datepicker.formatDate('mm/dd/yy', maxDate);

                        $("#txtFarmShip_Date").datepicker("option", "minDate", minDateFilter);
                        $("#txtFarmShip_Date").datepicker("option", "maxDate", maxDateFilter);
                        $("#txtFarmShip_Date").val($.datepicker.formatDate('mm/dd/yy', ToJavaScriptDate(Det.ShipDate)));


                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetFlowersWithSameVarietyAndCategoryByFlowerCode',
                            data: "{'FlowerCode':'" + Det.ProductCode + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output1, status) {
                                //debugger;

                                var flowerlist = output1.d;
                                $('#Split_lstProduct').empty();
                                // $('#Split_lstProduct').append('<option value="All">All</option>');
                                for (var i in flowerlist) {
                                    var flower = flowerlist[i];
                                    $('#Split_lstProduct').append('<option data-name="' + flower.Name.trim() + '" data-code="' + flower.Flower.trim() + '" value="' + flower.Flower.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                                }
                                $('#Split_lstProduct').val(Det.ProductCode);
                                $("#divSplitBoxes").dialog("open");
                            }
                        });

                    }
                }
                else {
                    $.MessageBox("No informations found!!!!");
                }

            }
        });
    });

    $("[id^=UPCClicked_]").die('click').live("click", function (e) {

        $("#UPC_txtQty").focus();
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var headers = ID.split('_');
        //debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetConfirmedPOsDetailsByID',
            data: "{'POQId':'" + headers[1] + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var UPC = output.d;

                $("#UPC_lblUPC").html(UPC.Upc);
                $("#DivUPC").html(UPC.Upc);

                if (UPC.UPCDesc.trim() == "") {
                    $("#DivUPCDescription").html(UPC.Product);
                    $("#UPC_lblDescription").val(UPC.Product);
                }
                else {
                    $("#DivUPCDescription").html(UPC.UPCDesc);
                    $("#UPC_lblDescription").val(UPC.UPCDesc);
                }
                //$("#DivUPCPrice").html(parseInt(upcPrice));
                $("#DivUPCDate").html(UPC.DateCode);
                $("#DivUPCFarm").html(UPC.Farm);

                $("#UPC_txtQty").val("");
                $("#UPC_txtQty").attr("PlaceHolder", parseInt(UPC.QtyXbox) * parseInt(UPC.QtyBox));
                $("#DivQuantity").html($("#UPC_txtQty")[0].placeholder);
                //$("#UPC_lblDescription").val(UPC.UPCDesc);
                var upcPrice = UPC.UPCPrice == "" ? "0" : UPC.UPCPrice;
                $("#UPC_lblPrice").val(upcPrice);
                $("#DivUPCPrice").html(upcPrice);
                //$("#UPC_lblPrice").val(parseInt(upcPrice));
                //$("#UPC_lblDate").val(UPC.DateCode + "/" + UPC.BoxCode);
                $("#UPC_lblDate").val(UPC.DateCode);  // BoxCode remove on request of Jose :: 12 Sept 2020
                //$("#UPC_lblCode").val(UPC.BoxCode);
                $("#UPC_lblVendor").html(UPC.VendorName);
                $("#UPCDialog").dialog("open");
            }
        });
    });

    $("[id^=teselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        $("#txtMAWB").val("");
        $("#txtHAWB").val("");
        $("#txtinvoicenumber").val("");


        $("#btnSaveMAWBAndHAWB").addClass("BloomButtonDisabled");
        $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonEnabled");



        //if ($("#divawb_" + ID.replace("teselect_", "")).html() != "" && $("#divawb_" + ID.replace("teselect_", "")).html() != null && 
        //$("#divhawb_" + ID.replace("teselect_", "")).html() != "" && $("#divhawb_" + ID.replace("teselect_", "")).html() != null) {
        var headers = ID.split('_');
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/ToggleSelected',
        //    data: "{'Selected':'" + Selected + "','ID':'" + headers[1] + "','ORD':'" + headers[2] + "','Farm':'" + $("#fgrdConfirmedPOs #row" + headers[1] + " td:nth-child(2) Div").html() + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            $('#fgrdConfirmedPOs tr#row0').removeClass("trChecked");
            $("#btnconfirmconf_" + headers[1] + "_" + headers[2]).hide();
            $("#editconf_" + headers[1] + "_" + headers[2]).show();
            $("#btnconfirmbreakdown_" + headers[1] + "_" + headers[2]).hide();
            $("#editconfirmbreakdown_" + headers[1] + "_" + headers[2]).show();
            $("#btnconfirmLength_" + headers[1] + "_" + headers[2]).hide();
            $("#btnconfirmHeight_" + headers[1] + "_" + headers[2]).hide();
            $("#btnconfirmWidth_" + headers[1] + "_" + headers[2]).hide();
            $("#editLength_" + headers[1] + "_" + headers[2]).show();
            $("#editHeight_" + headers[1] + "_" + headers[2]).show();
            $("#editWidth_" + headers[1] + "_" + headers[2]).show();
            $("#divinvoice_" + headers[1] + "_" + headers[2]).hide();
            $("#editInvoice_" + headers[1] + "_" + headers[2]).show();
            $("#editconf_" + headers[1] + "_" + headers[2]).focus();
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= selectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            $("#btnconfirmconf_" + headers[1] + "_" + headers[2]).show();
            $("#editconf_" + headers[1] + "_" + headers[2]).hide();
            $("#btnconfirmbreakdown_" + headers[1] + "_" + headers[2]).show();
            $("#editconfirmbreakdown_" + headers[1] + "_" + headers[2]).hide();
            $("#btnconfirmLength_" + headers[1] + "_" + headers[2]).show();
            $("#btnconfirmHeight_" + headers[1] + "_" + headers[2]).show();
            $("#btnconfirmWidth_" + headers[1] + "_" + headers[2]).show();
            $("#editLength_" + headers[1] + "_" + headers[2]).hide();
            $("#editHeight_" + headers[1] + "_" + headers[2]).hide();
            $("#editWidth_" + headers[1] + "_" + headers[2]).hide();
            $("#divinvoice_" + headers[1] + "_" + headers[2]).show();
            $("#editInvoice_" + headers[1] + "_" + headers[2]).hide();
        }

        var count = 0;
        var PoKey = "";
        //var Ord = "";
        var ID = "";
        $("[id^=teselect_]:visible").each(function () {
            if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                ID = $(this)[0].id;
                count = count + 1;
                PoKey = $(this)[0].id;
                //Ord = $(this)[0].id;
            }
        });

        // input selected po values
        if (ID) {
            var _selectedId = ID.replace("teselect_", '');
            $('#txtMAWB').val($("#divawb_" + _selectedId).html());
            $('#txtHAWB').val($("#divhawb_" + _selectedId).html());
            $('#txtinvoicenumber').val($("#divinvoice_" + _selectedId).html());
        }

        if (count == "0") {

            $("#btnPrintLabel").addClass("BloomButtonDisabled");
            $("#btnPrintLabel").removeClass("BloomButtonEnabled");

            //$("#btnRemoveMAWBAndHAWB").addClass("BloomButtonDisabled");
            //$("#btnRemoveMAWBAndHAWB").removeClass("BloomButtonEnabled");


        }
        else if ($("#divawb_" + ID.replace("teselect_", "")).html() != "" && $("#divawb_" + ID.replace("teselect_", "")).html() != null &&
        $("#divhawb_" + ID.replace("teselect_", "")).html() != "" && $("#divhawb_" + ID.replace("teselect_", "")).html() != null) {

            $("#btnPrintLabel").removeClass("BloomButtonDisabled");
            $("#btnPrintLabel").addClass("BloomButtonEnabled");

            //$("#btnRemoveMAWBAndHAWB").removeClass("BloomButtonDisabled");
            //$("#btnRemoveMAWBAndHAWB").addClass("BloomButtonEnabled");
        }

        //enable save AWB button if the field is not empty and disable if empty
        console.log("AWB: " + $("#txtMAWB").val().length);
        if ($("#txtMAWB").val().length != 0) {
            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonDisabled");
            $("#btnSaveMAWBAndHAWB").addClass("BloomButtonEnabled");
            $("#btnSaveMAWBAndHAWB").attr("disabled", false);
        }
        else {
            $("#btnSaveMAWBAndHAWB").removeClass("BloomButtonEnabled");
            $("#btnSaveMAWBAndHAWB").addClass("BloomButtonDisabled");
            $("#btnSaveMAWBAndHAWB").attr("disabled", true);
        }
        ////

        //}
        //});
    });

    $("#selectall").die('click').live("click", function (e) {

        $("#txtMAWB").val("");
        $("#txtHAWB").val("");
        $("#txtinvoicenumber").val("");

        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        //var FirstMawbId = $('#fgrdConfirmedPOs td div img[id="teselect_"]');
        //var Filter = FramingFilters()
        $("#ResetID").html("0");
        // var str = FramingFilters();
        //$("#FilterDiv").html(str)

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/ToggleSelectedAll',
        //    data: "{'Selected':'" + Selected + "','Filter':'" + escape($("#FilterDiv").html()) + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        $("#txtMAWB").val("");
        $("#txtHAWB").val("");
        $("#txtinvoicenumber").val("");
        $("#msgbox-select").dialog("close");
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            //$("#btnapply").click();
            $('#fgrdConfirmedPOs tr:visible').addClass("trChecked");
            $('#fgrdConfirmedPOs tr#row0').removeClass("trChecked");
            $("[id^=teselect_]:visible").prop("src", "images/check-on.png");
            $("[id^=btnconfirmconf_]").hide();
            $("[id^=btnconfirmconf_0_]").show();

            $("[id^=editconf_]").show();
            $("[id^=btnconfirmbreakdown_]").hide();
            $("[id^=editconfirmbreakdown_]").show();
            $("[id^=editconf_0_]").hide();

            $("[id^=btnconfirmLength_]").hide();
            $("[id^=btnconfirmHeight_]").hide();
            $("[id^=btnconfirmWidth_]").hide();
            $("[id^=editLength_]").show();
            $("[id^=editHeight_]").show();
            $("[id^=editWidth_]").show();
            $("[id^=divinvoice_]").hide();
            $("[id^=editInvoice_]").show();
            $("[id^=editconf_]")[0].focus();
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            //$("#btnapply").click();
            $('#fgrdConfirmedPOs tr').removeClass("trChecked");

            $("[id^=teselect_]").prop("src", "images/check-off.png");
            $("[id^=btnconfirmconf_]").show();
            $("[id^=editconf_]").hide();
            $("[id^=btnconfirmbreakdown_]").show();
            $("[id^=editconfirmbreakdown_]").hide();
            $("[id^=editconf_0_]").hide();

            $("[id^=btnconfirmLength_]").show();
            $("[id^=btnconfirmHeight_]").show();
            $("[id^=btnconfirmWidth_]").show();
            $("[id^=editLength_]").hide();
            $("[id^=editHeight_]").hide();
            $("[id^=editWidth_]").hide();
            $("[id^=divinvoice_]").show();
            $("[id^=editInvoice_]").hide();
        }
        //$("#btnSaveMAWBAndHAWB").removeClass("BloomButtonDisabled");
        //$("#btnSaveMAWBAndHAWB").addClass("BloomButtonEnabled");
        $("#btnPrintLabel").removeClass("BloomButtonDisabled");
        $("#btnPrintLabel").addClass("BloomButtonEnabled");
        //}
        //});

    });

    $("#txtfrmdate").mask("99/99/9999");
    $("#txttodate").mask("99/99/9999");

    //LoadMAWB();
    //LoadHAWB();
    //LoadFarm();
    //function LoadMAWB(Filter) {

    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetMAWB',
    //        data: "{'Filter':'" + escape(Filter) + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {

    //            var data = output.d;
    //            $('#lstMAWBFilter').empty();
    //            $('#lstMAWBFilter').append('<option selected="selected" value="All">All</option>');

    //            for (var i in data) {
    //                var MAWB = data[i];
    //                $('#lstMAWBFilter').append('<option value="' + MAWB.AWB + '">' + MAWB.AWB + '</option>');

    //            }


    //        }
    //    });
    //}

    //function LoadHAWB(Filter) {

    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetHAWB',
    //        data: "{'Filter':'" + escape(Filter) + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {

    //            var data = output.d;
    //            $('#lstHAWBFilter').empty();
    //            $('#lstHAWBFilter').append('<option value="All">All</option>');
    //            for (var i in data) {
    //                var HAWB = data[i];
    //                $('#lstHAWBFilter').append('<option value="' + HAWB.Hawb + '">' + HAWB.Hawb + '</option>');
    //            }
    //        }
    //    });
    //}

    //function LoadFarm() {
    //    var Prostatus = $("#cssmenu li.active")[0].textContent.split(' ')[0];
    //    //var FromDate = $("#txtfrmdate").val();
    //    //var ToDate = $("#txttodate").val();

    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetFarm',
    //        data: "{'ProStatus':'" + Prostatus + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {

    //            var data = output.d;
    //            $('#lstFarmFilter').empty();
    //            $('#lstFarmFilter').append('<option value="All">All</option>');
    //            for (var i in data) {
    //                var Farm = data[i];
    //                $('#lstFarmFilter').append('<option value="' + Farm.Farm + '">' + Farm.Farm + '</option>');
    //            }
    //        }
    //    });
    //}


    $('#divHeaderFarm').click(function (event) {

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

    $('#divHeaderMAWB').click(function (event) {

        $(".rowcss").hide();
        $("#trMAWBtitle").show();
        if ($('#divMAWBFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divMAWBFilter").slideToggle();
        }
        else {
            $("#divMAWBFilter").slideToggle();
        }

    });

    $('#divHeaderHAWB').click(function (event) {

        $(".rowcss").hide();
        $("#trHAWBtitle").show();
        if ($('#divHAWBFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divHAWBFilter").slideToggle();
        }
        else {
            $("#divHAWBFilter").slideToggle();
        }

    });


    $('#divHeaderSpecific').click(function (event) {

        $(".rowcss").hide();
        $("#trSpecifictitle").show();
        if ($('#divSpecificFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divSpecificFilter").slideToggle();
        }
        else {
            $("#divSpecificFilter").slideToggle();
        }

    });

    $('#divHeaderdate').click(function (event) {
        //$("#lblchosendate1").html("");
        //$("#lblchosendate1").html("");
        //$("#lblchosendate2").html("");
        //$("#txtfrmdate").val("");
        //$("#txttodate").val("");
        //$("#tr5").removeClass('FilterDivStyle');
        //$("#imgdate").attr("src", "images/EmptyFilter.png");
        $(".rowcss").hide();
        $("#trdatetitle").show();
        if ($('#divdateFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divdateFilter").slideToggle();
        }
        else {
            $("#divdateFilter").slideToggle();
        }

    });

    $('#lstFarmFilter').change(function () {
        IsFarmFilterFromLst = true;
        $("#fgrdConfirmedPOs").flexOptions()[0].p.query = "";
        $("#lblFarmFilter").html($('#lstFarmFilter').val());
        //$("#lstFarmFilter").text($("#lblFarmFilter").text());
        //$("#btnapply").click();            
        $("#btnapply").click();
        ResetFields();
        $("#tr1").addClass('FilterDivStyle');
        $("#imgFarm").attr("src", "images/Filter.png");
        $("#divFarmFilter").slideToggle();
    });

    $("[id^=btndateok]").live("click", function () {
        IsFarmFilterFromLst = false;
        IsConsolidateGridLoad = false;       

        $("#fgrdConfirmedPOs").flexOptions()[0].p.query = "";

        if ($("#txtfrmdate").val() != "" && $("#txttodate").val() == "") {
            $("#msg").html("Please choose ToDate!");
            $("#msgbox-select").dialog("open");

            return false;
        }
        else if ($("#txtfrmdate").val() == "" && $("#txttodate").val() != "") {
            $("#msg").html("Please choose From Date!");
            $("#msgbox-select").dialog("open");
            return false;
        }
        else if ($("#txtfrmdate").val() == "" && $("#txttodate").val() == "") {
            $("#msg").html("Please choose From Date and ToDate!");
            $("#msgbox-select").dialog("open");
            return false;
        }

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + $("#txtfrmdate").val() + "','ToDate':'" + $("#txttodate").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#btnapply").click();
            }
        });

        var fdate = $("#txtfrmdate").val() + " to " + $("#txttodate").val();

        $("#lblchosendate").html(fdate);

        $("#tr2").addClass('FilterDivStyle');
        $("#lblchosendate1").html($("#txtfrmdate").val());
        $("#lblchosendate2").html($("#txttodate").val());

        $("#divFromDate").datepicker("setDate", Date.parse($("#txtfrmdate").val()));
        $("#divToDate").datepicker("setDate", Date.parse($("#txttodate").val()));

        $("#imgdate").attr("src", "images/Filter.png");
        $("#divdateFilter").slideToggle();
        //  $("#btnapply").click();
        ResetFields()

    });


    //$('#lstMAWBFilter').change(function () {

    //    $("#lblMAWBFilter").html($('#lstMAWBFilter').val());
    //    //$("#btnapply").click();
    //    ClearPoSelection(true);
    //    $("#tr3").addClass('FilterDivStyle');
    //    $("#imgMAWB").attr("src", "images/Filter.png");
    //    $("#divMAWBFilter").slideToggle();
    //});


    //$('#lstHAWBFilter').change(function () {

    //    $("#lblHAWBFilter").html($('#lstHAWBFilter').val());
    //    //$("#btnapply").click();
    //    ClearPoSelection(true);
    //    $("#tr4").addClass('FilterDivStyle');
    //    $("#imgHAWB").attr("src", "images/Filter.png");
    //    $("#divHAWBFilter").slideToggle();
    //});


    //$('#lstSpecificFilter').change(function () {

    //    $("#lblSpecificFilter").html($('#lstSpecificFilter').val());
    //    $("#btnapply").click();
    //    $("#tr5").addClass('FilterDivStyle');
    //    $("#imgSpecific").attr("src", "images/Filter.png");
    //    $("#divSpecificFilter").slideToggle();
    //});


    //$("[id^=btndateclear]").live("click", function () {

    //    $("#txtfrmdate").val("");
    //    $("#txttodate").val("");
    //    $("#imgdate").attr("src", "images/EmptyFilter.png");
    //    $("#lblchosendate").html("");
    //    $("#lblchosendate1").html("");
    //    $("#lblchosendate2").html("");
    //    $('#tbldatefilter tr').removeClass("FilterDivStyle");
    //    $('#tr2').removeClass("FilterDivStyle");
    //    $("#divdateFilter").slideToggle();
    //    $("#btnapply").click();

    //});


    $("[id^=imgFarm]").live("click", function (e) {
        $("#lstFarmFilter").val("All");

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgFarm").attr("src", "images/EmptyFilter.png");
            ResetFields()
            $("#txtFarmFilter").val("");
            $("#lblFarmFilter").html("");
            $("#btnapply").click();
            $("#tr1").removeClass();
            $("#fgrdConfirmedPOs").flexOptions()[0].p.query = "";
            // $("#btnapply").click();
            $("#divFarmFilter").hide();
            e.stopPropagation();
        }
    });


    $("[id^=imgdate]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            IsFarmFilterFromLst = false;
            IsConsolidateGridLoad = false;



            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtfrmdate").val(today);
            $("#txttodate").val(today);
            var fdate = "Today: " + today;
            $("#lblchosendate").html(fdate);
            $("#lblchosendate1").html(today);
            $("#lblchosendate2").html(today);

            $("#divFromDate").datepicker("setDate", Date.parse(today));
            $("#divToDate").datepicker("setDate", Date.parse(today));

            $("#imgdate").attr("src", "images/Filter.png");
            $("#tr2").addClass('FilterDivStyle');
            $("#divdateFilter").hide();

            $.ajax({ //save date to the session 
                url: 'BloomService.asmx/SaveDateSession',
                type: 'POST',
                data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $("#btnapply").click();
                },
            });
            ResetFields()
            e.stopPropagation();
        }
    });


    //$("[id^=imgMAWB]").live("click", function (e) {

    //    $("#lstMAWBFilter").val("All");

    //    var bg = $(this).attr('src');
    //    if (bg == "images/Filter.png") {
    //        $("#imgMAWB").attr("src", "images/EmptyFilter.png");
    //        //$.ajax({ //Clear the session 
    //        //    url: 'BloomService.asmx/ClearSelectedPOsSession',
    //        //    async: false,
    //        //    type: 'POST',
    //        //    data: {},
    //        //    contentType: "application/json; charset=utf-8",
    //        //    dataType: "json"
    //        //});
    //        //$("img#selectall").prop("src", "images/check-off.png");
    //        //$("[id ^= teselect_]").attr("src", "images/check-off.png");
    //        ClearPoSelection(true);
    //        $("#txtMAWBFilter").val("");
    //        $("#lblMAWBFilter").html("");
    //        $("#tr3").removeClass();
    //        // $("#btnapply").click();
    //        $("#divMAWBFilter").hide();
    //        e.stopPropagation();
    //    }
    //});



    //$("[id^=imgHAWB]").live("click", function (e) {

    //    $("#lstHAWBFilter").val("All");

    //    var bg = $(this).attr('src');
    //    if (bg == "images/Filter.png") {
    //        $("#imgHAWB").attr("src", "images/EmptyFilter.png");
    //        //$.ajax({ //Clear the session 
    //        //    url: 'BloomService.asmx/ClearSelectedPOsSession',
    //        //    async: false,
    //        //    type: 'POST',
    //        //    data: {},
    //        //    contentType: "application/json; charset=utf-8",
    //        //    dataType: "json"
    //        //});
    //        //$("img#selectall").prop("src", "images/check-off.png");
    //        //$("[id ^= teselect_]").attr("src", "images/check-off.png");
    //        ClearPoSelection(true);
    //        $("#txtHAWBFilter").val("");
    //        $("#lblHAWBFilter").html("");
    //        $("#tr4").removeClass();
    //        //$("#btnapply").click();
    //        $("#divHAWBFilter").hide();
    //        e.stopPropagation();
    //    }
    //});

    //$("[id^=imgSpecific]").live("click", function (e) {

    //    $("#lstSpecificFilter").val("All");
    //    var bg = $(this).attr('src');
    //    if (bg == "images/Filter.png") {
    //        $("#imgSpecific").attr("src", "images/EmptyFilter.png");
    //        $("#txtSpecificFilter").val("");
    //        $("#lblSpecificFilter").html("");
    //        $("#tr5").removeClass();
    //        $("#btnapply").click();
    //        $("#divSpecificFilter").hide();
    //        e.stopPropagation();
    //    }
    //});



    //For Filter Framing the Filter Conditions
    $("#btnapply").click(function () {
        $("#msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        var str = FramingFilters();
        str = str.replace('&amp;', '&');
        $('input[name=q]').val("");        
        $("#fgrdConfirmedPOs").flexOptions({ params: [{ name: 'Filter', value: str }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
        $("#msgbox-select").dialog("close");
    });

    $("#btnClearAll").click(function () {

        $("#lstFarmFilter").val("All");
        $("#lstMAWBFilter").val("All");
        $("#lstHAWBFilter").val("All");
        //$("#lstSpecificFilter").val("All");
        $("#lblFarmFilter").html("");
        $("#lblMAWBFilter").html("");
        $("#lblHAWBFilter").html("");
        $("#lblSpecificFilter").html("");
        $("#lblchosendate1").html("");
        $("#lblchosendate2").html("");
        $("#lblchosendate").html("");
        $("#txtfrmdate").val("");
        $("#txttodate").val("");
        $('#tr1').removeClass("FilterDivStyle");
        $('#tr2').removeClass("FilterDivStyle");
        $('#tr3').removeClass("FilterDivStyle");
        $('#tr4').removeClass("FilterDivStyle");
        $('#tr5').removeClass("FilterDivStyle");
        $("#imgFarm").attr("src", "images/EmptyFilter.png");
        $("#imgMAWB").attr("src", "images/EmptyFilter.png");
        $("#imgHAWB").attr("src", "images/EmptyFilter.png");
        $("#imgdate").attr("src", "images/EmptyFilter.png");
        //$("#imgSpecific").attr("src", "images/EmptyFilter.png");
        $("#txtMAWB").val("");
        $("#txtHAWB").val("");
        $("#txtinvoicenumber").val("");

        $("#btnapply").click();
    });



    function FramingFilters() {
        var condn = "";

        if ($("#lblFarmFilter").html() != "" && $("#lblFarmFilter").html() != "All")
        {
            condn = condn + "POQ.Farm=" + "'" + $("#lblFarmFilter").html() + "'" + " And ";
        }

        condn = condn + " PROSTATUS IN (" + $("#POConfirmedStatusCodes").text() + ") AND";
        
        //if ($("#lblchosendate").html().indexOf("Today:") >= 0)
        //    condn = condn + "SHIPDATE >= ctod('" + $("#lblchosendate1").html() + "') And ";
        //else if ($("#lblchosendate1").html() != "" && $("#lblchosendate2").html() != "")
        //    condn = condn + "SHIPDATE >= ctod('" + $("#lblchosendate1").html() + "') " + " And " + " SHIPDATE <= ctod('" + $("#lblchosendate2").html() + "')" + " And ";



        //if ($("#lblMAWBFilter").html() != "" && $("#lblMAWBFilter").html() != "All") {
        //    condn = condn + "AWB=" + "'" + $("#lblMAWBFilter").html() + "'" + " And ";
        //}

        //if ($("#lblHAWBFilter").html() != "" && $("#lblHAWBFilter").html() != "All") {
        //    condn = condn + "HAWB=" + "'" + $("#lblHAWBFilter").html() + "'" + " And ";
        //}

        //if ($("#lblSpecificFilter").html() != "" && $("#lblSpecficFilter").html() != "All") {
        //    if ($("#lblSpecificFilter").html() == "With MAWB")
        //        condn = condn + "AWB <> ''" + " And ";
        //    else
        //        condn = condn + "AWB = ''" + " And ";
        //}

        

        //var Query = $("#fgrdConfirmedPOs").flexOptions()[0].p.query;
        //var QueryType = $("#fgrdConfirmedPOs").flexOptions()[0].p.qtype;

        //=============================================================================================================
        //Commented by VEN::16-12-2015::For avoid Statement too long error (i.e.) more then 100 farms assigned in user
        //==============================================================================================================

        //if (DefaultUserFarms != "" && DefaultUserFarms != null && Query != "")
        //    condn = condn + "Farm in (" + DefaultUserFarms.substring(0, DefaultUserFarms.lastIndexOf(",")) + ")" + " And " + QueryType + " = " + "'" + Query + "'" + " And";
        //else if (Query != "")
        //    condn = condn + QueryType + " = " + "'" + Query + "'" + " And";
        //else if (DefaultUserFarms != null && DefaultUserFarms != "")
        //    condn = condn + "Farm in (" + DefaultUserFarms.substring(0, DefaultUserFarms.lastIndexOf(",")) + ")" + " And";
        //else
        //    condn = condn;

        //if (Query != "")
        //    condn = condn + QueryType + " = " + "'" + Query + "'" + " And";
        //else
        //    condn = condn;



        var lastIndex = condn.length;
        var str = condn.substring(0, lastIndex-3);        
        return str;
    }

    $("#UC_txtComments").click(function () {
        $("#UC_txtComments").val("");
    })

    $("#UPC_txtQty").click(function () {
        $("#UPC_txtQty").val("");
    })

    $("#Split_txtComments").click(function () {
        $("#Split_txtComments").val("");
    })

    $("#Split_txtBoxes").click(function () {
        $("#Split_txtBoxes").val("");
    })

    $('input').keypress(function (e) {

        var key = e.which;
        if (key == 13) // the enter key code
        {
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {

                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
            }

        }
    });

    function printUrl(url) {
        $('#printFrame').attr('src', url);
        $('#printFrame').load(function () {
            var frame = document.getElementById('printFrame');
            if (!frame) {
                alert("Error: Can't find printing frame.");
                return;
            }
            frame = frame.contentWindow;
            frame.focus();
            frame.print();
        });
    }


    $("#btnPrintLabel").die("click").live("click", function () {

        $("#btnPrintLabel").toggleClass("BloomButtonProcessing");
        var hasshippeddata = "";
        $('#fgrdConfirmedPOs tr').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    hasshippeddata = "0";
                    var mawb = $(this).find("td:nth-child(17) div a").html()
                    var hawb = $(this).find("td:nth-child(18) div a").html()
                    if (mawb.toString().trim() == "") {
                        hasshippeddata = "1"
                        $("#btnPrintLabel").removeClass("BloomButtonProcessing");
                        $.MessageBox("Please ship the orders before print label!!!!");
                        return false;
                    }
                }
            }

        });
        if (hasshippeddata == "0")
            PrintPOLabel();
    });

    function validateMawb(str) {
        var matchedPosition = str.search(/[a-zA-Z]/i);
        //if (matchedPosition != -1) {
        //    return false;
        //}        
        if (/^[a-zA-Z0-9- ]*$/.test(str) == false || matchedPosition != -1) {
            return false;
        }
        return true;
    }

    //STA::31-OCT-2015::to update the confirmed podetails(CONF and Breakdown)
    $("#btnupdateconfirmedpodetails").live("click", function () {
        var ConfirmedPODetails = "";
        var UpdateBreak = false;
        ConfirmedPODetails = "<PODetails>"
        $('#fgrdConfirmedPOs tr').each(function () {


            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    var ID = $(this).attr("id").replace("row", "");
                    var BoxVal = $("#fgrdConfirmedPOs tr#row" + ID + " td:eq(8)")[0].textContent;

                    if ($("#editconf_" + ID).val() == "")
                        $("#editconf_" + ID).val($("#editconf_" + ID).attr("placeholder"));
                    if ($("#editconfirmbreakdown_" + ID).val() == "")
                        $("#editconfirmbreakdown_" + ID).val($("#editconfirmbreakdown_" + ID).val());
                    if (parseInt($("#editconf_" + ID).val()) > BoxVal)
                        UpdateBreak = true;
                    if ($("#editInvoice_" + ID).val() == "")
                        $("#editInvoice_" + ID).val($("#editInvoice_" + ID).attr("placeholder"));
                    if ($("#editHeight_" + ID).val() == "")
                        $("#editHeight_" + ID).val($("#editHeight_" + ID).attr("placeholder"));
                    if ($("#editLength_" + ID).val() == "")
                        $("#editLength_" + ID).val($("#editLength_" + ID).attr("placeholder"));
                    if ($("#editWidth_" + ID).val() == "")
                        $("#editWidth_" + ID).val($("#editWidth_" + ID).attr("placeholder"));

                    ConfirmedPODetails += "<PODetail>" +
                        "<ConfirmID>" + ID + "</ConfirmID>" +
                        "<conf>" + $("#editconf_" + ID).val() + "</conf>" +
                        "<breakdown>" + $("#editconfirmbreakdown_" + ID).val().replace(/'/g, '').toUpperCase() + "</breakdown>" +
                        "<Length>" + $("#editLength_" + ID).val() + "</Length>" +
                        "<Height>" + $("#editHeight_" + ID).val() + "</Height>" +
                        "<Width>" + $("#editWidth_" + ID).val() + "</Width>" +
                        "<Invoice>" + $("#editInvoice_" + ID).val() + "</Invoice>" +
                        "</PODetail>";
                }
            }
        });
        ConfirmedPODetails += "</PODetails>"

        if (ConfirmedPODetails != "<PODetails></PODetails>" && UpdateBreak == false) {
            $("#ImgProcessing").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateConfirmedPoDetails',
                data: "{'Details':'" + ConfirmedPODetails + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $("#ImgProcessing").hide();
                    if (output.d == "success") {
                        //debugger;
                        $('#fgrdConfirmedPOs tr').each(function () {

                            if ($(this).attr("id") != "row0") {
                                //debugger;
                                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                    var ID = $(this).attr("id").replace("row", "");
                                    $("#btnconfirmconf_" + ID).html($("#editconf_" + ID).val())
                                    $("#btnconfirmbreakdown_" + ID).html($("#editconfirmbreakdown_" + ID).val().replace(/'/g, '').toUpperCase());
                                    $("#divinvoice_" + ID).html($("#editInvoice_" + ID).val());
                                    $("#btnconfirmLength_" + ID).html($("#editLength_" + ID).val());
                                    $("#btnconfirmHeight_" + ID).html($("#editHeight_" + ID).val());
                                    $("#btnconfirmWidth_" + ID).html($("#editWidth_" + ID).val());

                                    $("#editconf_" + ID).attr("placeholder", $("#editconf_" + ID).val());
                                    $("#editInvoice_" + ID).attr("placeholder", $("#editInvoice_" + ID).val());
                                    $("#editLength_" + ID).attr("placeholder", $("#editLength_" + ID).val());
                                    $("#editHeight_" + ID).attr("placeholder", $("#editHeight_" + ID).val());
                                    $("#editWidth_" + ID).attr("placeholder", $("#editWidth_" + ID).val());

                                    $("#editconf_" + ID).val("");
                                    $("#editInvoice_" + ID).val("");
                                    $("#editLength_" + ID).val("");
                                    $("#editHeight_" + ID).val("");
                                    $("#editWidth_" + ID).val("");
                                    $('#DivConfirmedPOs [value="Clear"]').click();
                                }
                            }
                        });


                        $("img#selectall").prop("src", "images/check-off.png");
                        $("[id ^= teselect_]").attr("src", "images/check-off.png");
                        $('#fgrdConfirmedPOs tr').removeClass("trChecked");

                        $("[id^=teselect_]").prop("src", "images/check-off.png");
                        $("[id^=btnconfirmconf_]").show();
                        $("[id^=editconf_]").hide();
                        $("[id^=btnconfirmbreakdown_]").show();
                        $("[id^=editconfirmbreakdown_]").hide();
                        $("[id^=editconf_0_]").hide();

                        $("[id^=btnconfirmLength_]").show();
                        $("[id^=btnconfirmHeight_]").show();
                        $("[id^=btnconfirmWidth_]").show();
                        $("[id^=editLength_]").hide();
                        $("[id^=editHeight_]").hide();
                        $("[id^=editWidth_]").hide();
                        $("[id^=divinvoice_]").show();
                        $("[id^=editInvoice_]").hide();
                        ResetFields();
                    }
                    else
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        }
        else if (ConfirmedPODetails == "<PODetails></PODetails>" && UpdateBreak == false) {
            $.MessageBox("Please choose details to update!!!");
        }
        else if (ConfirmedPODetails != "<PODetails></PODetails>" && UpdateBreak == true) {
            $.MessageBox("Invalid Conf!!");
        }
    });

    //VEN::25-11-2015::For add new user for unassigned farm
    $("[id^=divunassignedFarm_]").die('click').live("click", function (e) {

        var sourceCtl = $(this);
        var Farm = sourceCtl.attr('id').replace("divunassignedFarm_", "");
        var str = FramingFilters();
        str = str.replace('&amp;', '&');
        $("#divConfirmedPOsFilter").html(str);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: "{'controlName':'pages/PageUsers.ascx','controlPara':''}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivUser").remove(); // clear divuser to avoid dublicating controls in getpage.
                $("#divUserPageDetails").html("");
                $("#divUserPageDetails").html(output.d);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetFarmDetailsByCode',
                    data: "{'Farm':'" + Farm + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d != null) {
                            var FarmDetails = output.d;
                            var FarmEmail = FarmDetails.Email.replace(/;/g, ',').split(",")[0];
                            addclicked("", "");
                            autocomplteSelect(FarmDetails.Farm, FarmDetails.Name, FarmDetails.City);
                            $("#lstUserType option:contains(Vendor)").attr('selected', 'selected');
                            $("#lstUserType").prop("disabled", true);
                            //$('#lstUserType').trigger('change');
                            AdminUserTypeChange();
                            $("#txtEmail").val(FarmEmail);

                        }
                    }
                });
            }
        });
    });

    function PrintUPCLabel(Description, UPCDate, Price, Farm, UPCode, Quantity) {

        var count = 0;


        if (count != -1) {
            var w = window.open('GeneratingPDF.html');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/AddUpcLabelDetails',
                data: "{'Description':'" + Description + "','UPCDate':'" + UPCDate + "','Price':'" + Price + "','Farm':'" + Farm + "','UPCode':'" + UPCode + "','Quantity':'" + Quantity + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    var PrintCompanyName = 0;

                    if ($('#chkPrintCompanyName').is(':checked')) {
                        PrintCompanyName = 1;
                    }

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ExportUPCLables',
                        data: "{'Description':'" + Description + "','UPCDate':'" + UPCDate + "','Price':'" + Price + "','Farm':'" + Farm + "','UPCode':'" + UPCode + "','Quantity':'" + Quantity + "','PrintCompanyName':'" + PrintCompanyName + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            //printUrl(output.d);
                            //$("#btnPrintLabel").removeClass("BloomButtonProcessing");
                            if (output.d != "Please select po" && output.d != "LogOut" && output.d != "error") {

                                path = output.d;
                                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                                w.location = ExportedPath;
                            }
                            else if (output.d == "LogOut") {
                                w.close();
                                window.location.href = "Login.aspx"
                            }
                            else if (output.d == "error") {
                                $("#btnPrintLabel").removeClass("BloomButtonProcessing");
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                            else {
                                $.MessageBox("Please Select at least one ConfirmedPO");
                            }
                        }
                    });
                }
            });
        }
    }

    $("#UPCDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 700,
        height: 200,
        title: 'Print UPC',
        buttons: {
            Print: function () {

                var Qty = 0
                if ($("#UPC_txtQty").val() != "") {
                    Qty = $("#UPC_txtQty").val()
                }
                else {
                    Qty = $("#UPC_txtQty").attr("placeholder")
                }

                if (Qty == 0) {
                    $("#UPCDialog").dialog("close");
                }
                else {
                    PrintUPCLabel($("#UPC_lblDescription").val(), $("#DivUPCDate").html(), $("#DivUPCPrice").html(), $("#DivUPCFarm").html(), $("#DivUPC").html(), Qty)
                }
            },

            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-print-1')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#DivConsolidatePODetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1300,
        height: 590,
        modal: true,
        close: function () {
        }
    });

    //var DateFilter = "ShipDate >= ctod('" + $("#txtfrmdate").val() + "')  And  ShipDate <= ctod('" + $("#txttodate").val() + "')";
    $("#btnconsolidateconfirmedpodetails").live("click", function () {
        var FromDate = $("#txtfrmdate").val();
        var ToDate = $("#txttodate").val();
        if (IsConsolidateGridLoad == false) {
            IsConsolidateGridLoad = true;
            $("#fgrdConsolidatePODetails").empty();
            $("#fgrdConsolidatePODetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: FromDate }, { name: 'ToDate', value: ToDate }], query: "", newp: 1 }).flexReload();
        }
        $("#DivConsolidatePODetails").dialog('option', 'title', 'From ' + FromDate + ' To ' + ToDate);
        $("#DivConsolidatePODetails").dialog("open");
    });

    // function LoadConsolidatePODetails(DateFilter) {
    $("#fgrdConsolidatePODetails").flexigrid({
        url: 'BloomService.asmx/GetConsolidatePODetailsFgrd',
        dataType: 'xml',
        colModel: [
            { display: 'Cat', name: 'CAT', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
            { display: 'Market', name: 'Market', width: 5, sortable: true, align: 'left' },
            { display: 'Origin', name: 'Airport', width: 30, sortable: true, align: 'left' },
            { display: 'Flower', name: 'PRODCODQ', width: 70, sortable: true, align: 'left' },
            { display: 'Description', name: 'prodnamq', width: 170, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'QtyBox', width: 35, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 20, sortable: true, align: 'left' },
            { display: 'Units', name: 'Qtyunit', width: 35, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 20, sortable: true, align: 'left' },
            { display: 'CUST#', name: 'customer', width: 60, sortable: true, align: 'left' },
            { display: 'Comments', name: 'commentq', width: 50, sortable: true, align: 'left' },
            // { display: '+3', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '+2', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '+1', name: '', width: 15, sortable: true, align: 'right' },
            { display: '0', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+1', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+2', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+3', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+4', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+5', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+6', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+7', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+8', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+9', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+10', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+11', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+12', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+13', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+14', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+15', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+16', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+17', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+18', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+19', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+20', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+21', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '22', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '23', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '24', name: '', width: 15, sortable: true, align: 'right' },
            //{ display: '25+', name: '', width: 15, sortable: true, align: 'right' },
        ],
        searchitems: [
            { display: 'Cat', name: 'CAT' },
            { display: 'Farm', name: 'Farm' },
            { display: 'Market', name: 'Market' },
            { display: 'PO#', name: 'PONUM' },
            { display: 'Origin', name: 'Airport' },
            { display: 'Flower', name: 'PRODCODQ' },
            { display: 'Description', name: 'prodnamq' },
            { display: 'Boxes', name: 'QtyBox' },
            { display: 'CUST#', name: 'Customer' },
            { display: 'UOM', name: 'Uom' },
            { display: 'WH', name: 'WH' },
            { display: 'Comments', name: 'commentq' },
        ],
        showTableToggleBtn: true,
        sortname: "Farm Asc",
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
        height: 450,
        width: 1265,
        striped: true,

        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'FromDate', value: $("#txtfrmdate").val() },
            { name: 'ToDate', value: $("#txttodate").val() },
        ],
        onSuccess: function () {
            ChangeHeadersDynamically()
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#DivConsolidatePODetails .sDiv").css('float', 'left').css('width', '545px');
    $('#DivConsolidatePODetails .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivConsolidatePODetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivConsolidatePODetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivConsolidatePODetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    function ChangeHeadersDynamically() {
        //debugger;


        j = 0;
        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

        for (i = 12; i <= 33; i++) {
            var fromdate = new Date($("#txtfrmdate").val());
            var nextdate;
            if (j == 0) {
                fromdate = fromdate
            }
            else {
                fromdate.setDate(fromdate.getDate() + j)
            }

            var dd = fromdate.getDate();
            var mm = fromdate.getMonth() + 1;
            var y = fromdate.getFullYear();

            var someFormattedDate = mm + '/' + dd + '/' + y;

            $("#DivConsolidatePODetails th")[i].innerHTML = "<div title='" + someFormattedDate + "' style='text-align: right; width: 15px;'>" + weekday[fromdate.getDay()].substring(0, 2).toUpperCase() + "</div>"
            j++;
        }
        //$("#DivConsolidatePODetails th")[12].innerHTML = "<div style='text-align: right; width: 15px;'>WE</div>"
        //$("#DivConsolidatePODetails th")[13].innerHTML = "<div style='text-align: right; width: 15px;'>TH</div>"
        //$("#DivConsolidatePODetails th")[14].innerHTML = "<div style='text-align: right; width: 15px;'>FR</div>"
        //$("#DivConsolidatePODetails th")[15].innerHTML = "<div style='text-align: right; width: 15px;'>SA</div>"
        //$("#DivConsolidatePODetails th")[16].innerHTML = "<div style='text-align: right; width: 15px;'>SU</div>"
        //$("#DivConsolidatePODetails th")[17].innerHTML = "<div style='text-align: right; width: 15px;'>MO</div>"
        //$("#DivConsolidatePODetails th")[18].innerHTML = "<div style='text-align: right; width: 15px;'>TU</div>"
        //$("#DivConsolidatePODetails th")[19].innerHTML = "<div style='text-align: right; width: 15px;'>WE</div>"
        //$("#DivConsolidatePODetails th")[20].innerHTML = "<div style='text-align: right; width: 15px;'>TH</div>"
        //$("#DivConsolidatePODetails th")[21].innerHTML = "<div style='text-align: right; width: 15px;'>FR</div>"
        //$("#DivConsolidatePODetails th")[22].innerHTML = "<div style='text-align: right; width: 15px;'>SA</div>"
        //$("#DivConsolidatePODetails th")[23].innerHTML = "<div style='text-align: right; width: 15px;'>SU</div>"
        //$("#DivConsolidatePODetails th")[24].innerHTML = "<div style='text-align: right; width: 15px;'>MO</div>"
        //$("#DivConsolidatePODetails th")[25].innerHTML = "<div style='text-align: right; width: 15px;'>TU</div>"
        //$("#DivConsolidatePODetails th")[26].innerHTML = "<div style='text-align: right; width: 15px;'>WE</div>"
        //$("#DivConsolidatePODetails th")[27].innerHTML = "<div style='text-align: right; width: 15px;'>TH</div>"
        //$("#DivConsolidatePODetails th")[28].innerHTML = "<div style='text-align: right; width: 15px;'>FR</div>"
        //$("#DivConsolidatePODetails th")[29].innerHTML = "<div style='text-align: right; width: 15px;'>SA</div>"
        //$("#DivConsolidatePODetails th")[30].innerHTML = "<div style='text-align: right; width: 15px;'>SU</div>"
        //$("#DivConsolidatePODetails th")[31].innerHTML = "<div style='text-align: right; width: 15px;'>MO</div>"
        //$("#DivConsolidatePODetails th")[32].innerHTML = "<div style='text-align: right; width: 15px;'>TU</div>"
        //$("#DivConsolidatePODetails th")[33].innerHTML = "<div style='text-align: right; width: 15px;'>WE</div>"           
    }

</script>
<%-------------------------------%>
<%--31-OCT-2015:::Page Modified By Stalin:for inline edit option conf and breakdown--%>
<%--25-Nov-2015:::Page Modified By VEN:for add new user in un assigned farm by inventory user--%>
<%-------------------------------%>