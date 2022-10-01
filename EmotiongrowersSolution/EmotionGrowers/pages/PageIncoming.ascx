<%@ Control Language="VB" AutoEventWireup="true" CodeFile="PageIncoming.ascx.vb" Inherits="pages_PageIncoming" %>
<link rel="stylesheet" href="css/Filters.css">
<script src="zoom_assets/jquery.smoothZoom.min.js"></script>

<link rel="stylesheet" href="css/progressbar.css">
<script type="text/javascript" src="js/progressbar.js"></script>
<%--<script type="text/javascript" src="js/jquery.fileDownload.js"></script>--%>


<style type="text/css">
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

    .IncomingPleaseWaitOverlay {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        z-index: 10;
        background-color: #E5E5E5;
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
        /*width: 100%;*/
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



    /*#fgrdManualPODetail input[type="text"] {
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
    }*/

    /*END*/

    /*STA::29-09-2015*/
    /*.PrintDVLabel {
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

    /*30-SEP-2015::VEN::For Total Rows*/

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


            #row0 td:nth-child(5) div {
                color: black;
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


            #row0 td:nth-child(6) div {
                color: black;
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


            #row0 td:nth-child(7) div {
                color: black;
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

            #row0 td:nth-child(8) div {
                color: black;
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
                color: black;
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

            #row0 td:nth-child(14) div {
                color: black;
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

            #row0 td:nth-child(15) div {
                color: black;
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

            #row0 td:nth-child(16) div {
                color: black;
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
                color: black;
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

            #row0 td:nth-child(18) div {
                color: black;
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

            #row0 td:nth-child(19) div {
                color: black;
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

            #row0 td:nth-child(20) div {
                color: black;
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

            #row0 td:nth-child(21) div {
                color: #000000;
                background-color: #72C97D;
                /*height: 28px;*/
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /*border-top: 1px solid #ffffff;*/
                /*line-height: 30px;*/
                padding-bottom: 3px;
                font-size: 12px;
            }

    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }
    /*END*/

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

    .measurements {
        font-weight: bold;
        color: #0c68b3;
        text-decoration: underline;
    }

    #fgrdUserHeaders input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -5px;
        margin-right: 3px;
        float: left;
    }

    #tblMeasurements {
        width: 100%;
    }

        #tblMeasurements tr:first-child {
            width: 100px;
        }

    .incomingupdate {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 16px;
        cursor: pointer;
    }

    #import_File_process {
        display: none;
    }

    #upload_File_process {
        float: right;
        display: none;
    }


    .AWBListtd {
        border-width: 1px;
        padding: 7px;
        border-style: solid;
        border-color: #666666;
    }

    .AWBListtable {
    }
</style>
<script type="text/javascript">
    document.title = "Incoming";
</script>
<div>

    <div class="slidediv" style="overflow: visible; display: block; height: 50px; min-width: 1350px;">
        <table>
            <tr>

                <td style="vertical-align: top;">
                    <div class="filterbutton" id="divHeaderAWB">
                        <table style="width: 100%; height: 100%;" id="tblAWB">
                            <tr>
                                <td style="font-size: 11px; width: 150px;">
                                    <img id="imgAWB" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                    AWB
                                </td>

                            </tr>
                            <tr id="trAWB" style="height: 18px; text-align: center;">
                                <td>
                                    <label class="DivFilterLabelStyle" id="lblAWBFilter"></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>


                <td style="vertical-align: top;">
                    <div class="filterbutton" id="divHeaderFarm">
                        <table style="width: 100%; height: 100%;" id="tblFarm">
                            <tr>
                                <td style="font-size: 11px; width: 150px;">
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

                <td style="vertical-align: top;">
                    <div class="filterbutton" id="divHeaderdate">
                        <table style="width: 100%; height: 100%;" id="tbldate">
                            <tr>
                                <td style="font-size: 11px; width: 150px;">
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


                <td style="vertical-align: middle;">
                    <div class="AWBS" style="display: block;">
                        <table>
                            <tr>
                                <td>
                                    <span id="btnincomingupdate" class="incomingupdate" title="Update selected user details">Update</span>
                                </td>
                                <td id="trVerifyUser" style="display: block;">
                                    <span id="btnVerifyUser" class="BloomButtonEnabled" style="margin-left: 10px; display: none;">Verify</span>
                                </td>
                                <td>
                                    <%--<a class="DetailsTitlelinks" id="btntransferincomingdetails">--%>
                                    <%--<span class="PrintDVLabel" style="margin-left: 10px;">Transfer</span>--%>
                                    <input id="btntransferincomingdetails" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Transfer" onfocus="this.value = this.value;" />
                                    <%--</a>--%>
                                </td>
                                <td>
                                    <a class="DetailsTitlelinks">
                                        <%--<span class="PrintDVLabel" style="margin-left: 10px;" onclick="DownloadUserXMLClicked()">Email</span>--%>
                                        <input class="BloomButtonEnabled" id="btnincommingemail" onclick="DownloadUserXMLClicked()" type="button" style="margin-left: 5px;" value="Email" />
                                    </a>
                                </td>
                                <td>
                                    <input id="btnprintdvlabel" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Print DV Label" />
                                </td>
                                <td>
                                    <input id="btnlookupboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Lookup Box#" />
                                </td>
                                <td>
                                    <input id="btnPayables" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Payables" />
                                </td>
                                <td>
                                    <input id="btnPost" class="BloomButtonEnabled" type="button" style="margin-left: 10px; display: none" value="Post" />
                                </td>
                                <td>
                                    <input id="btnConnect" class="BloomButtonEnabled" type="button" style="margin-left: 10px; display: none" value="Connect to QB" onclick="connectToQb()" />
                                </td>
                                <td id="tdShipmentupdate" style="display: none;">
                                    <span id="btnShipmentupdate" class="BloomButtonEnabled" style="margin-left: 10px;">Scanning Validation</span>
                                </td>
                                <td id="tdShipmentupdate1" style="display: none;">
                                    <span id="btnShipmentupdate1" class="BloomButtonEnabled" style="margin-left: 10px;">Scanning Validation</span>
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
            </tr>
            <tr class="rowcss" id="trAWBtitle">
                <td style="vertical-align: top" colspan="5">
                    <div id="divAWBFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 170px;">
                            <select id="lstAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="rowcss" id="trFarmtitle">
                <td style="vertical-align: top"></td>
                <td style="vertical-align: top" colspan="5">
                    <div id="divFarmFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 170px;">
                            <select id="lstFarmFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="rowcss" id="trdatetitle">
                <td style="vertical-align: top"></td>
                <td style="vertical-align: top"></td>
                <td style="vertical-align: top" colspan="5">
                    <div id="divdateFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 450px; height: 240px;">
                            <table>
                                <tr>
                                    <td>From
                                    </td>
                                    <td>
                                        <input type="text" id="txtHeaderDate" style="width: 80px;" />
                                    </td>
                                    <td>To
                                    </td>
                                    <td>
                                        <input type="text" id="txtHeaderToDate" style="width: 80px" />
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
    <div id="DivUserHeaders">
        <table id="fgrdUserHeaders" style="display: none;"></table>
    </div>
</div>


<%-- STA::29-09-2015::DV labels --%>
<div id="DivUploadDVLabel" style="display: none">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="YellowWarning" align="center">
                </div>
            </td>
        </tr>
        <tr style="width: 50%">
            <td>&nbsp;</td>
            <td>
                <form action="UploadDVLabel.aspx" method="post" enctype="multipart/form-data" id="fileuploader" target="upload_target" onsubmit="startUpload();">
                    <table style="width: 100%">
                        <tr>
                            <td>
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
                                    <input name="myDVfile" id="myDVfile" accept=".csv" type="file" size="30" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="btnimportcsvdata" type="button" style="display: none;" value="Submit" />
                            </td>
                        </tr>

                    </table>

                </form>

            </td>
        </tr>
        <tr>

            <td colspan="2"></td>
        </tr>

    </table>

</div>
<%-- END --%>
<%-- VEN::30-09-2015:: For Send Email with attachment of XML --%>
<div id="DivEmailDialog" style="display: none">
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
                <textarea rows="4" style="width: 590px; height: 190px;" cols="85" id="txtmanualpoBody"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <a id="lnkXMLFileName" href="#"></a>

            </td>
        </tr>
    </table>
</div>
<%-- END --%>

<%-- VEN::31-Oct-2015:: For View Header image file --%>
<div id="DivHeaderImageDialog" style="display: none">
    <table style="width: 100%">
        <tr id="trUploadHeaderFiles" style="display: none;">
            <td>
                <form action="UploadManualPoHeaderFiles.aspx" method="post" enctype="multipart/form-data" id="manualpofileuploader" target="upload_target" onsubmit="startManualPOHeaderFileUpload();">
                    <input type="text" name="hdnheaderid" id="hdnheaderid" style="display: none;" />
                    <p id="upload_File_process">
                        Uploading...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="import_File_process">
                        Importing...
                    <img src="images/uploading.gif" style="float: right;" />
                    </p>
                    <p id="upload_File_form" align="left">
                        <%--<input name="myManualPOHeaderfile" id="myManualPOHeaderfile" accept=".pdf,.png" type="file" size="30" />--%>
                        <input name="myManualPOHeaderfile" id="myManualPOHeaderfile" type="file" size="30" />
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivShowHeaderImage" style="width: 665px; height: 440px;">
                    <div id="HeaderImagezoom_container"></div>
                </div>
                <div id="DivShowPDFFile" style="width: 660px; height: 440px;">
                    <span id="pdfHeaderID" style="display: none"></span>
                    <div id="removePDFConfirm" style="display: none;" title="Alert"></div>
                    <input id="btnRemovePDFFile" type="button" style="margin: 0 0 10px 10px;" value="Remove PDF" />
                    <iframe id="IfrmPDFFile" width="665" height="440"></iframe>
                </div>
            </td>
        </tr>
    </table>
</div>
<%-- END --%>

<%-- VEN::02-Nov-2015:: For view Incoming Header details --%>
<div id="DivHeaderDetails" style="display: none">
    <input id="btncompare" class="BloomButtonEnabled" type="button" value="Compare" />
    <table style="width: 100%">
        <tr>
            <td>
                <table id="fgrdHeaderDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>
<%-- END --%>
<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
    <div id="progressBar" class="default" style="width: 255px; height: 15px; display: none">
        <div></div>
    </div>
</div>

<%-- VEN::19-Dec-2015:: For View Scanning XML file --%>
<div id="DivScanningXMLDialog" style="display: none">
    <table style="width: 100%">
        <tr>
            <td>
                <div class="PleaseWaitOverlay" style="display: none; width: 665px; height: 240px;">
                    <div style="font-size: 12px; font-weight: bold; margin-left: 280px; margin-top: 227px;">
                        Please wait... 
                    <img src="images/ajax-loader.gif" alt="" />
                    </div>
                </div>
                <textarea rows="25" cols="40" id="txtXMLFile" style="width: 665px; height: 480px; border: none;" disabled>
                    <%--<iframe id="IfrmXMLFile" width="665" height="440"></iframe>--%>
                </textarea>
            </td>
        </tr>
    </table>
</div>
<%-- END --%>

<%-- VEN::09-Feb-2016:: For view Box details --%>
<div id="DivBoxDetails" style="display: none">
    <table style="width: 100%">
        <tr style="height: 32px">
            <td>
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <label>Farm:</label>
                <input type="text" id="txtBoxDetails_Farm" class="AllUpperCaseTextBox" />
                <label>BoxNum:</label>
                <input type="text" id="txtBoxDetails_BoxNum" class="NumbersOnly" />
                <input id="btnGetboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Get Label Print Log" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="fgrdBoxDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>
<%-- END --%>


<%-- MANI::04-JUN-2016:: For Confirmation to transfer User File --%>
<div id="DivConfirmTransferToUserDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
           <td colspan="2">
                <div style="margin-top: 17px;margin-bottom: 15px;">Do you want to transfer to cooler?</div> <%--Other Charges added by Anand [08/09/2021]--%>
               <div style="display:none;">User #<input id="txtTransferFile" maxlength="2" class="restrictspecialcharacters AllUpperCaseTextBox" style="margin-left: 62px; width: 40px" placeholder="99" type="text" /><label style="display: none; color: Red" id="lblUserNoRequired">*required</label></div> <%--Other Charges added by Anand [08/09/2021]--%>
             </td>
        </tr>
        <tr>
            <td align="left">Warehouse</td>
            <td>
                <select id="lstWarehouse" style="width: 160px; float: left" />
            </td>
        </tr>
        <tr>
            <td align="left">Receiving Date</td>
            <td>
                <input type="text" id="txtReceivingDate" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td align="left">FBE</td>
            <td>
                <input type="text" id="txtFBE_Transfer" class="DecimalsOnly" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td align="left">Freight Amount</td>
            <td>
                <input type="text" id="txtFreightAmount_Transfer" class="DecimalsOnly" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td align="left">Handling/FBE</td>
            <td>
                <input type="text" id="txtHandling_Transfer" class="DecimalsOnly" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
                <div id="DivAirport" style="display:none;"></div>
                <div id="DivWarehouse" style="display:none;"></div>
            </td>
        </tr>
           <%--Start Other Charges added by Anand [08/09/2021]--%>
         <tr>
            <td align="left">Ohers Charges</td>
            <td>
                <input type="text" id="txtOtherCharges_Transfer" placeholder="0.000" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox DecimalsOnly" />  
            </td>
        </tr>
        <%--End Other Charges added by Anand [08/09/2021]--%>
    </table>
</div>
<%-- END --%>


<%-- MANi::07-14-2016:: For Scanning Validation For AWB Dialog --%>
<div id="DivScanningValidationForAWBDialog" style="display: none">
    <table style="margin-left: 40px;">
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="ScanningValidationYellowWarning" align="center">
                </div>
            </td>
        </tr>
        <tr>
            <td>AWB</td>
            <td>
                <input type="text" style="width: 150px" id="txtScanningValidationAWB" class="AllUpperCaseTextBox" />
            </td>
            <td>
                <img style="height: 26px;" src='images/search.png' id="ImgAvailableAWBs" style="display: none;" />
                <img src='images/ajax-loader.gif' id="LoaderAWB" style="display: none" />
            </td>
        </tr>
        <%--  <tr>
            <td>Farm</td>
            <td>
                <input type="text" style="width: 150px" id="txtScanningValidationFarm" class="AllUpperCaseTextBox" />
            </td>
        </tr>--%>
        <tr>
            <td align="left">Flight Date</td>
            <td>
                <input type="text" id="txtScanningValidationFlightDate" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td align="left">Cargo Date</td>
            <td>
                <input type="text" id="txtScanningValidationCargoDate" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td align="left">Receiving Date</td>
            <td>
                <input type="text" id="txtScanningValidationReceivingDate" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td align="left">User #</td>
            <td>
                <input type="text" id="txtScanningValidationTransferFile" maxlength="2" class="restrictspecialcharacters AllUpperCaseTextBox" style="width: 150px; height: 16px; float: left" placeholder="99" />
            </td>
        </tr>
    </table>
</div>
<%-- END --%>


<div id="AvailableAWBsDialog" style="display: none;"></div>

<div style="display: none" id="DivHeaderId"></div>
<div id="LoggedUserId" runat="server" class="notranslate" style="display: none"></div>
<div id="LoggedUserType" runat="server" class="notranslate" style="display: none"></div>
<div id="DivAgencyCode" runat="server" class="notranslate" style="display: none"></div>
<div id="DivShipmentStatus" runat="server" class="notranslate" style="display: none"></div>
<div id="DivSelectedAWB" style="display: none"></div>
<a href="#" target="_blank" download="#" id="lnkXMLDownload" style="display: none"></a>
<script type="text/javascript">
    var IsDetailsGridInitialize = false;
    var IsLabelPrintLogDetailsGridInitialize = false;
    var DefPODetailsByHeader = "";
    var DefaultWC = "";
    var DefLabelPrintDetails = "";
    var myshedule = "";
    var TransferResult = "";
    var TransferDataCount = "";
    var OldDataCount = 0;
    var SelectedRecords = 0;
    var Scanningvalidationcompleted = false;
    $(document).ready(new function () {
        var byAgencyCode = "";

        $("#DivUserHeaders").attr('grd-type', '');

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmForAutocomplete',
            data: "{'Searchtext':''}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFarmFilter').empty();
                $('#lstFarmFilter').append('<option value="All">All</option>');
                var data = output.d;
                if (data == null) {
                    LoadFarm();
                }
                for (var i in data) {
                    var DefFarm = data[i];
                    //DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                    $('#lstFarmFilter').append('<option value="' + DefFarm.FarmCode + '">' + DefFarm.FarmCode + '</option>');
                }


                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetAWBNumbersForInComing',
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        $('#lstAWBFilter').empty();
                        $('#lstAWBFilter').append('<option value="All">All</option>');
                        var data = output.d;
                        if (data == null) {
                            LoadFarm();
                        }
                        for (var i in data) {
                            var DefAWB = data[i];
                            //DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                            $('#lstAWBFilter').append('<option value="' + DefAWB.AWB + '">' + DefAWB.AWB + '</option>');
                        }
                        $("#imgUserLoader").hide();
                    }
                });

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
                    $("#txtHeaderDate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#divToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtHeaderToDate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#txtHeaderDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txtHeaderToDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });
        //$("#txtHeaderDate").datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    dateFormat: 'mm/dd/yy',
        //    showOtherMonths: true,
        //    selectOtherMonths: true,
        //    //onSelect: function (date) {
        //    //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
        //    //}
        //}).datepicker("setDate", new Date());

        //$("#txtHeaderToDate").datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    dateFormat: 'mm/dd/yy',
        //    showOtherMonths: true,
        //    selectOtherMonths: true,
        //    //onSelect: function (date) {
        //    //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
        //    //}
        //}).datepicker("setDate", new Date());

        if ($("#ctl00_DivAgencyCode").html() != "" && $("#ctl00_DivAgencyCode").html() != null)
            byAgencyCode = "AgencyCode='" + $("#ctl00_DivAgencyCode").html() + "'";
        var ShipmentHiddenStatus = $("#ctl00_DivShipmentStatus").html();
        if (ShipmentHiddenStatus) {
            $("#tdShipmentupdate").css("display", "block");
            //$("#tdShipmentupdate").css("display", "none");
            $("#btnShipmentupdate").removeClass("BloomButtonEnabled");
            $("#btnShipmentupdate").addClass("BloomButtonDisabled");
            $("#btnShipmentupdate1").removeClass("BloomButtonEnabled");
            $("#btnShipmentupdate1").addClass("BloomButtonDisabled");

        }
        else
            $("#tdShipmentupdate").css("display", "block");

        var IsLoggedInUserVendor = $("#ctl00_LoggedUserType").html() == "vendor" ? true : false;
        if (IsLoggedInUserVendor) {
            $("#divHeaderAWB").hide();
            $("#divHeaderFarm").hide();
            $("#btnVerifyUser").hide();
            $("#btntransferincomingdetails").hide();
            $("#btnincommingemail").hide();
            $("#btnlookupboxdetails").hide();
            $("#btnShipmentupdate").hide();
            $("#btnShipmentupdate").hide();
            $("#btnShipmentupdate1").hide();
            $("#btnPayables").hide();
            $("#btnprintdvlabel").hide();
        }

        $("#fgrdUserHeaders").flexigrid({
            url: 'BloomService.asmx/GetManualPOHeaderForIncomingFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="ManualPOHeaderselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'Date', name: 'ShippedDate', width: 45, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 80, sortable: true, align: 'left' },
                { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
                { display: 'Farm Name', name: 'FarmName', width: 130, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'Pieces', width: 40, sortable: true, align: 'right' },
                { display: 'FBE', name: 'FBE', width: 50, sortable: true, align: 'right' },
                { display: 'Amount', name: 'TotalCost', width: 70, sortable: true, align: 'right', hide: IsLoggedInUserVendor },
                { display: 'Farm Amount', name: 'FarmAmount', width: 70, sortable: true, align: 'right', hide: !IsLoggedInUserVendor },
                { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'right' },
                { display: 'PDF File', name: '', width: 70, sortable: false, align: 'left' },
                { display: 'Comments', name: 'Header', width: 100, sortable: true, align: 'left', hide: IsLoggedInUserVendor },
                { display: 'WH', name: 'WH', width: 20, sortable: true, align: 'left' },
                { display: 'Agency', name: 'Agency', width: 35, sortable: true, align: 'left' },
                { display: 'Airport', name: 'Airport', width: 30, sortable: true, align: 'left' },
                { display: 'Scanned', name: 'Scanned', width: 35, sortable: true, align: 'right' },
                { display: 'Missing', name: 'Missing', width: 35, sortable: true, align: 'right' },
                { display: 'Weight', name: 'Weight', width: 40, sortable: true, align: 'right' },
                { display: 'Dim.Weight', name: 'DimensionalWeight', width: 40, sortable: true, align: 'right' },
                { display: 'MPF', name: 'MPF', width: 40, sortable: true, align: 'right', hide: IsLoggedInUserVendor },
                { display: 'Duties', name: 'Duties', width: 40, sortable: true, align: 'right', hide: IsLoggedInUserVendor },
                { display: 'Image File', name: '', width: 55, sortable: false, align: 'left', hide: IsLoggedInUserVendor },
                { display: 'Details', name: '', width: 20, sortable: true, align: 'left' },
                { display: 'Status', name: 'IsXMLDownload', width: 25, sortable: true, align: 'left', hide: IsLoggedInUserVendor },
                { display: 'Origin', name: 'ScannedOrigin', width: 35, sortable: true, align: 'right' },
                { display: 'Missing', name: 'MissingAtOrigin', width: 35, sortable: true, align: 'right' }
            ],
            searchitems: [{ display: 'Farm', name: 'Farm' },
            //{ display: 'FBE', name: 'FBE' },
            { display: 'Agency', name: 'Agency' },
            { display: 'Airport', name: 'Airport' },
            { display: 'AWB', name: 'AWB' },
            { display: 'Comments', name: 'Header' }],
            //buttons: [
            //    { name: 'Download XML', bclass: 'Download', onpress: DownloadUserXMLClicked, title: 'Download XML' },
            //],
            showTableToggleBtn: true,
            sortname: "ShippedDate asc,farm asc",
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
            rp: 30000,
            showTableToggleBtn: false,
            height: $(window).height() - 230,
            striped: true,
            params: [
                { name: 'Filter', value: DefaultWC },
                { name: 'ExportCSV', value: '' },
            ],
            onSuccess: function () {                
                if (Scanningvalidationcompleted == true) {
                    selectalldetails()
                    Scanningvalidationcompleted = false;
                }

                $("#DivUserHeaders .flexigrid").css("min-width", "1364px");
                //For to show the error
                if ($("#fgrdUserHeaders tr#row-2").length > 0) {
                    $("#fgrdUserHeaders tr#row-2").hide();
                    $.MessageBox($("#fgrdUserHeaders tr#row-2")[0].innerText);
                    return false;
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
                //Update Farm Amount
                $("[id^=txtfarmamount_]").die("change").live("change", function () {

                    var sourceCtl = $(this);
                    var ID = sourceCtl.attr('id');

                    var headers = ID.replace("txtfarmamount_", "");
                    var FarmAmount = $("#txtfarmamount_" + headers).val() == "" ? $("#txtfarmamount_" + headers).attr("placeholder") : $("#txtfarmamount_" + headers).val();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/UpdateIncomingPoFarmAmount',
                        data: "{'HeaderId':'" + headers + "','FarmAmount':'" + FarmAmount + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var response = response.d;
                            if (response == "success") {
                                $("#txtDateApproved_" + headers).val('');
                                $("#txtDateApproved_" + headers).attr('placeholder', '');
                            }

                        }
                    });

                });
                //For to focus the next Textbox on enter key press
                $('input').keypress(function (e) {
                    var key = e.which;
                    if (key == 13) // the enter key code
                    {

                        if ($(this).attr('id') == "txtScanningValidationAWB") { //Scanning validation dialog
                            if ($("#txtScanningValidationAWB").val().trim() == "" || $("#txtScanningValidationAWB").val().trim() == "0") {
                                $(".ScanningValidationYellowWarning").html("Please enter AWB#");
                                $(".ScanningValidationYellowWarning").show();
                                $("#txtScanningValidationAWB").focus();
                                return false;
                            }
                        }
                        if ($(this).attr('id') == "txtScanningValidationTransferFile") { //Scanning validation dialog                        
                            $(this).closest('div').next('div').find('button')[0].focus()
                        }


                        for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                            var a;
                            if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                                a = i;
                            }
                            if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                                $(this).closest('tr').find('input')[i].focus();
                                return false;
                            }
                            else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != 'btndateok') {

                                if ($(this).closest('tr').next('tr').find('input').length > 0 && $(this).closest('tr').next('tr').find('input')[0].style.display != 'none') {
                                    //$(this).closest('tr').next('tr').find('input')[0].value = "";
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

                var PODetailsByHeader = "HeaderId='0'"
                DefPODetailsByHeader = PODetailsByHeader;
                //else {
                //    $("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();
                //}


                $('#fgrdUserHeaders #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                $('#fgrdUserHeaders #row0').addClass("TotalRows");
                $("#ExportCSV").show();
            }
        });
        // Fitri(20190522): function to remove pdf file
        $("[id^=btnRemovePDFFile]").live("click", function () {
            $("#removePDFConfirm").html("<p>Are you sure you want to remove this PDF file?</p>");
            $("#removePDFConfirm").dialog("open");
        });

        $("#removePDFConfirm").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            width: 400,
            modal: true,
            buttons: {
                Yes: function () {
                    var headerID = $("#pdfHeaderID").text();
                    var adialog = $(this);
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/RemovePDFFile',
                        data: "{'HeaderID':'" + headerID + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var response = response.d;
                            adialog.dialog("close");
                            if (response == "success") {
                                $.MessageBox("File has been removed successfully.");
                                $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                                setTimeout($("#DivHeaderImageDialog").dialog("close"), 3000);
                            } else {
                                $.MessageBox(response);
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

        //Suresh:12/04/2018

        $("[id^=btnPayables]").live("click", function () {

            $("#DivUserHeaders").attr('grd-type', 'payable');


            $("#btnVerifyUser").hide();
            $("#btntransferincomingdetails").hide();
            $("#btnincomingupdate").hide();
            $("#btnprintdvlabel").hide();

            $("#btnincommingemail").hide();
            $("#btnlookupboxdetails").hide();
            $("#btnShipmentupdate").hide();
            $("#btnShipmentupdate").hide();
            $("#btnShipmentupdate1").hide();

            $("#txtBoxDetails_Farm").val("");
            $("#txtBoxDetails_BoxNum").val("");
            $("#DivSelectedAWB").html("");
            $(".Warning").hide();
            $(".YellowWarning").hide();
            $("#btnPayables").hide();
            $("#btnPost").show();
            $("#btnConnect").show();

            $("#DivPayableDetails .flexigrid").css("min-width", "1364px");
            $("#DivPayableDetails .sDiv").css('float', 'left').css('width', '545px');
            $('#DivPayableDetails .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivPayableDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivPayableDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
            //$("#DivPayableDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
            $("#DivPayableDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

            $("#DivUserHeaders").html("")
            $("#DivUserHeaders").html("<table id='fgrdUserHeaders' style=[display: none;'></table>")

            var cond = FramingFilters();
            //alert(cond);
            // $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

            $("#fgrdUserHeaders").flexigrid({
                url: 'BloomService.asmx/GetManualPOHeaderForPayableFgrd',
                dataType: 'xml',
                colModel: [
                    { display: '<img style="Cursor:pointer;" id="ManualPOHeaderselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                    { display: 'Date', name: 'ShippedDate', width: 45, sortable: true, align: 'left' },
                    { display: 'AWB', name: 'AWB', width: 80, sortable: true, align: 'left' },
                    { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
                    { display: 'Farm Name', name: 'FarmName', width: 130, sortable: true, align: 'left' },
                    { display: 'Boxes', name: 'Pieces', width: 40, sortable: true, align: 'right' },
                    { display: 'FBE', name: 'FBE', width: 50, sortable: true, align: 'right' },
                    { display: 'Po Amount', name: 'TotalCost', width: 70, sortable: true, align: 'right', hide: IsLoggedInUserVendor },
                    { display: 'Invoice', name: 'Invoice', width: 35, sortable: true, align: 'right' },
                    { display: 'Farm Amount', name: 'FarmAmount', width: 70, sortable: true, align: 'right', hide: IsLoggedInUserVendor },
                    { display: 'Farm Invoice', name: 'FarmInvoice', width: 70, sortable: true, align: 'right', hide: !IsLoggedInUserVendor },
                    { display: 'PDF File', name: '', width: 70, sortable: false, align: 'left' },
                    { display: 'Credits', name: '', width: 70, sortable: false, align: 'right' },
                    { display: '$Amount to Pay', name: '', width: 77, sortable: false, align: 'right' },
                    { display: 'Buyer Approval', name: '', width: 77, sortable: false, align: 'center' },
                    { display: 'Date Approved', name: '', width: 70, sortable: false, align: 'center' },
                    { display: 'Paid', name: '', width: 17, sortable: false, align: 'left' },
                    { display: 'Date Paid', name: '', width: 70, sortable: false, align: 'center' },
                    { display: '$Pending Payment', name: '', width: 100, sortable: false, align: 'right' },
                    { display: 'QB', name: '', width: 15, sortable: false, align: 'center' },
                    { display: 'Date QB', name: '', width: 70, sortable: false, align: 'center', disabled: 'disabled' }
                ],
                searchitems: [{ display: 'Farm', name: 'Farm' },
                //{ display: 'FBE', name: 'FBE' },
                { display: 'Agency', name: 'Agency' },
                { display: 'Airport', name: 'Airport' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Comments', name: 'Header' }],
                //buttons: [
                //    { name: 'Download XML', bclass: 'Download', onpress: DownloadUserXMLClicked, title: 'Download XML' },
                //],
                showTableToggleBtn: true,
                sortname: "ShippedDate asc,farm asc",
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
                rp: 30000,
                showTableToggleBtn: false,
                height: $(window).height() - 230,
                striped: true,
                params: [
                    { name: 'Filter', value: cond },
                    { name: 'ExportCSV', value: '' },
                ],
                onSuccess: function () {
                    if (Scanningvalidationcompleted == true) {
                        selectalldetails()
                        Scanningvalidationcompleted = false;
                    }

                    $("#DivUserHeaders .flexigrid").css("min-width", "1364px");
                    //For to show the error
                    if ($("#fgrdUserHeaders tr#row-2").length > 0) {
                        $("#fgrdUserHeaders tr#row-2").hide();
                        $.MessageBox($("#fgrdUserHeaders tr#row-2")[0].innerText);
                        return false;
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

                    $("[id^=txtCredits_]").on("change", function () {
                        var sourceCtl = $(this);
                        var HeaderID = sourceCtl.attr('id').replace("txtCredits_", "");
                        var img = $("#Paidselect_" + HeaderID).attr("src").toLowerCase();

                        var IsPaid = "0";
                        if (img.indexOf("on") > 0) {
                            IsPaid = "1";
                        }

                        if (IsPaid == 1) {

                            $("#txtCredits_" + HeaderID).prop('readonly', 'readonly');

                        } else {
                            if (sourceCtl.val() != "") {
                                var POAmountToPay = parseFloat($("#POAmount_" + HeaderID).text()) - parseFloat(sourceCtl.val());
                                $("#txtAmountToPay_" + HeaderID).val(POAmountToPay.toFixed(2));
                                $("#txtPendingPayment_" + HeaderID).val(POAmountToPay.toFixed(2));

                                var CreditAmount = $("#txtCredits_" + HeaderID).val() == "" ? $("#txtCredits_" + HeaderID).attr("placeholder") : $("#txtCredits_" + HeaderID).val();
                                var AmountToPay = $("#txtAmountToPay_" + HeaderID).val() == "" ? $("#txtAmountToPay_" + HeaderID).attr("placeholder") : $("#txtAmountToPay_" + HeaderID).val();

                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/UpdateIncomingPoCreditAmount',
                                    data: "{'HeaderId':'" + HeaderID + "','CreditAmount':'" + CreditAmount + "','AmountToPay':'" + AmountToPay + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        var response = response.d;
                                        if (response == "success") {
                                            $("#txtCredits_" + HeaderID).prop('readonly', 'readonly');
                                            $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                                        }
                                    }
                                });
                            }
                        }
                    });


                    $("[id^=txtAmountToPay_]").on("change", function () {
                        var sourceCtl = $(this);
                        var HeaderID = sourceCtl.attr('id').replace("txtAmountToPay_", "");

                        if (sourceCtl.val() != "") {
                            var NewCredits = parseFloat($("#txtPendingPayment_" + HeaderID).attr("placeholder")) - parseFloat(sourceCtl.val());
                            var updatedCredit = parseFloat($("#txtCredits_" + HeaderID).attr("placeholder")) + parseFloat(NewCredits);
                            $("#txtCredits_" + HeaderID).val(updatedCredit.toFixed(2));
                            $("#txtPendingPayment_" + HeaderID).val(parseFloat(sourceCtl.val()).toFixed(2));

                            var CreditAmount = $("#txtCredits_" + HeaderID).val() == "" ? $("#txtCredits_" + HeaderID).attr("placeholder") : $("#txtCredits_" + HeaderID).val();
                            var AmountToPay = $("#txtAmountToPay_" + HeaderID).val() == "" ? $("#txtAmountToPay_" + HeaderID).attr("placeholder") : $("#txtAmountToPay_" + HeaderID).val();
                            console.log(sourceCtl.val());
                            console.log(CreditAmount);
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/UpdateIncomingPoCreditAmount',
                                data: "{'HeaderId':'" + HeaderID + "','CreditAmount':'" + CreditAmount + "','AmountToPay':'" + AmountToPay + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var response = response.d;
                                    if (response == "success") {
                                        $("#txtAmountToPay_" + HeaderID).prop('readonly', 'readonly');
                                        $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                                    }
                                }
                            });
                        }
                    });


                    //txtfarmamount_

                    $("[id^=txtfarmamount_]").die("change").live("change", function () {
                        //alert('change')

                        var sourceCtl = $(this);
                        var ID = sourceCtl.attr('id');

                        var headers = ID.replace("txtfarmamount_", "");
                        var FarmAmount = $("#txtfarmamount_" + headers).val() == "" ? $("#txtfarmamount_" + headers).attr("placeholder") : $("#txtfarmamount_" + headers).val();

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/UpdateIncomingPoFarmAmount',
                            data: "{'HeaderId':'" + headers + "','FarmAmount':'" + FarmAmount + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var response = response.d;
                                if (response == "success") {
                                    $("#txtDateApproved_" + headers).val('');
                                    $("#txtDateApproved_" + headers).attr('placeholder', '');
                                }

                            }
                        });

                    });

                    // BuyerApprovalselect
                    $("[id^=BuyerApprovalselect_]").die("click").live("click", function () {
                        var sourceCtl = $(this);
                        var ID = sourceCtl.attr('id');
                        var img = sourceCtl.attr("src").toLowerCase();

                        var headers = ID.replace("BuyerApprovalselect_", "");
                        var Selected = "0";
                        if (img.indexOf("off") > 0) {
                            Selected = "1";
                        }

                        if (Selected == "1") {
                            sourceCtl.prop("src", "images/check-on.png");
                            sourceCtl.closest('tr').addClass("trChecked");
                            $("#txtDateApproved_" + headers).datepicker({
                                changeMonth: true,
                                changeYear: true,
                                dateFormat: 'mm/dd/yy',
                                showOtherMonths: true,
                                selectOtherMonths: true,
                                onSelect: function (Date) {
                                    $("#txtDateApproved_" + headers).val(Date);
                                }
                            }).datepicker("setDate", new Date());
                        }
                        else {
                            sourceCtl.prop("src", "images/check-off.png");
                            $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
                            sourceCtl.closest('tr').removeClass("trChecked");
                            $("#txtDateApproved_" + headers).val('');
                        }
                        var BuyerApproval = Selected == 1 ? true : false;
                        var Credits = $("#txtCredits_" + headers).val() == "" ? $("#txtCredits_" + headers).attr("placeholder") : $("#txtCredits_" + headers).val();
                        var AmountToPay = $("#txtAmountToPay_" + headers).val() == "" ? $("#txtAmountToPay_" + headers).attr("placeholder") : $("#txtAmountToPay_" + headers).val();
                        var DateApproved = $("#txtDateApproved_" + headers).val() == "" ? $("#txtDateApproved_" + headers).attr("placeholder") : $("#txtDateApproved_" + headers).val();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/UpdateIncomingPoBuyerApprovalDetails',
                            data: "{'HeaderId':'" + headers + "','Credits':'" + Credits + "','AmountToPay':'" + AmountToPay + "','BuyerApproval':'" + BuyerApproval + "','DateApproved':'" + DateApproved + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var response = response.d;
                                if (response == "success") {
                                    if (Selected != "1") {
                                        $("#txtDateApproved_" + headers).val('');
                                        $("#txtDateApproved_" + headers).attr('placeholder', '');
                                    }
                                    // $("#fgrdUserHeaders").flexOptions().flexReload();
                                }

                            }
                        });

                    });


                    $("[id^=Paidselect_]").die("click").live("click", function () {
                        var sourceCtl = $(this);
                        var ID = sourceCtl.attr('id');
                        var img = sourceCtl.attr("src").toLowerCase();

                        var headers = ID.replace("Paidselect_", "");
                        var Selected = "0";
                        if (img.indexOf("off") > 0) {
                            Selected = "1";
                        }
                        if (Selected == "1") {

                            $("#txtPendingPayment_" + headers).val("0.00");
                            sourceCtl.prop("src", "images/check-on.png");
                            sourceCtl.closest('tr').addClass("trChecked");
                            $("#txtDatePayed_" + headers).datepicker({
                                changeMonth: true,
                                changeYear: true,
                                dateFormat: 'mm/dd/yy',
                                showOtherMonths: true,
                                selectOtherMonths: true,
                                onSelect: function (Date) {
                                    $("#txtDatePayed_" + ID).val(Date);
                                }
                            }).datepicker("setDate", new Date());
                        }
                        else {
                            sourceCtl.prop("src", "images/check-off.png");
                            sourceCtl.closest('tr').removeClass("trChecked");
                            $("#txtDatePayed_" + headers).val('');
                            $("#txtPendingPayment_" + headers).val($("#txtAmountToPay_" + headers).val());
                        }


                        var Paid = Selected == 1 ? true : false;
                        var PendingPayment = "0";
                        if (Selected == 1) {
                            PendingPayment = "0";// $("#txtPendingPayment_" + headers).val() == "" ? $("#txtPendingPayment_" + headers).attr("placeholder") : $("#txtPendingPayment_" + headers).val();
                        }
                        else {
                            PendingPayment = $("#txtAmountToPay_" + headers).val() == "" ? $("#txtAmountToPay_" + headers).attr("placeholder") : $("#txtAmountToPay_" + headers).val();
                        }

                        var DatePayed = $("#txtDatePayed_" + headers).val() == "" ? $("#txtDatePayed_" + headers).attr("placeholder") : $("#txtDatePayed_" + headers).val();

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/UpdateIncomingPoPayment_Details',
                            data: "{'HeaderId':'" + headers + "','Paid':'" + Paid + "','DatePayed':'" + DatePayed + "','PendingPayment':'" + PendingPayment + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var response = response.d;
                                if (response == "success") {
                                    if (Selected != "1") {
                                        $("#txtDatePayed_" + headers).val('');
                                        $("#txtDatePayed_" + headers).attr('placeholder', '');
                                    }
                                    $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                                }

                            }
                        });

                    });

                    //Fitri(20190523): QB changes
                    $("[id^=QBselect_]").die("click").live("click", function () {
                        var sourceCtl = $(this);
                        var ID = sourceCtl.attr('id');
                        var img = sourceCtl.attr("src").toLowerCase();

                        var headers = ID.replace("QBselect_", "");
                        var Selected = "0";

                        if (($("#txtDateQB_" + headers).attr("placeholder") != "") || ($("#txtDateQB_" + headers).val() != "")) {
                            $.MessageBox("Already posted!");
                            return false;
                        }

                        if (img.indexOf("off") > 0) {
                            Selected = "1";
                        }
                        if (Selected == "1") {
                            sourceCtl.prop("src", "images/check-on.png");
                            sourceCtl.closest('tr').addClass("trChecked");
                        } else {
                            sourceCtl.prop("src", "images/check-off.png");
                            sourceCtl.closest('tr').removeClass("trChecked");

                            $("#txtDateQB_" + headers).val('');
                        }

                        var QB = Selected == 1 ? true : false;
                        var PendingPayment = $("#txtPendingPayment_" + headers).val() == "" ? $("#txtPendingPayment_" + headers).attr("placeholder") : $("#txtPendingPayment_" + headers).val();
                        var DateQB = $("#txtDateQB_" + headers).val() == "" ? $("#txtDateQB_" + headers).attr("placeholder") : $("#txtDateQB_" + headers).val();
                    });

                    //For to show the error
                    $('#DivUserHeaders #row0').addClass("TotalRows");

                    $("#ExportCSV").show();

                }
            });
        });
        $("[id^=btnPost]").live("click", function () {
            var ids = [];

            // get header id checked but date is null
            $('#fgrdUserHeaders tr').each(function () {
                var id = this.id.replace("row", "");

                if (($(this).find("#QBselect_" + id).attr("src") == "images/check-on.png") && ($("#txtDateQB_" + id).attr("placeholder") == "")) {
                    ids.push(id);
                }
            });

            if (ids.length == 0) {
                $.MessageBox("Please select item(s) to post");
                return false;
            }

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateIncomingPoQBByHeaderIdList',
                data: JSON.stringify({ HeaderIds: ids }),
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var response = response.d;
                    if (response == "success") {
                        ids.forEach(function (v) {
                            $("#QBselect_" + v).prop("src", "images/check-on-disabled.png");
                            $("#txtDateQB_" + v).datepicker({
                                dateFormat: 'mm/dd/yy',
                            }).datepicker("setDate", new Date());
                        });

                        $.MessageBox("Success!");
                    }
                }
            });
        });
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateSession',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dateoutput, status) {
                var date = dateoutput.d;

                if (date == null || date == "" || date[0] === "" && date[1] === "") {
                    var fdate = "Today: " + $("#txtHeaderToDate").val();
                    $("#lblchosendate").html(fdate);
                    $("#lblchosendate1").html($("#txtHeaderDate").val());
                    $("#lblchosendate2").html($("#txtHeaderToDate").val());
                    $("#divFromDate").datepicker("setDate", new Date());
                    $("#divToDate").datepicker("setDate", new Date());
                    $("#imgdate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                else {
                    var fdate = date[0] + " to " + date[1];
                    $("#txtHeaderDate").val(date[0]);
                    $("#txtHeaderToDate").val(date[1]);
                    $("#lblchosendate").html(fdate);
                    $("#lblchosendate1").html(date[0]);
                    $("#lblchosendate2").html(date[1]);
                    $("#divFromDate").datepicker("setDate", Date.parse(date[0]));
                    $("#divToDate").datepicker("setDate", Date.parse(date[1]));
                    $("#imgdate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                //2021/08/24
                //if ($('#lstFarmFilter').val() === null || $('#lstFarmFilter').val() === 'null') {
                //    window.location.href = "Login.aspx";
                //}

                if ($('#lstFarmFilter').val() == "All")
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                else
                    DefaultWC = "h1.farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        });

        $("#DivUserHeaders .sDiv").css('float', 'left').css('width', '545px');
        $('#DivUserHeaders .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivUserHeaders .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivUserHeaders .pDiv").find(".pDiv2").find(".btnseparator").hide();
        //$("#DivUserHeaders .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivUserHeaders .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

        $("#DivPOHeader").dialog({
            autoOpen: false,
            width: 1100,
            modal: true,
            resizable: false,
            buttons: {
                Cancel: function () {
                    $("#DivPOHeader").dialog("close");
                }
            },
            open: function () {
                $("#imgFarmAutocompleteWarning").css("display", "none");
                $("#imgFarmAutocompleteLoader").css("display", "none");
                $("#txtdate").attr("disabled", true);
                $("#txtFarmCode").attr("disabled", true);
                $("#txtheadercomments").attr("disabled", true);
                $("#txtagency").attr("disabled", true);
                if ($("#txtagency").val() != "")
                    $("#txtFarmCode").focus();
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }
        });


        $("[id^=POHeaderselect_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var img = sourceCtl.attr("src").toLowerCase();

            var invoiceNum = $(this).closest("tr").find("td div").eq(9)[0].textContent;
            var Farm = $(this).closest("tr").find("td div").eq(3)[0].textContent;
            var AWB = $(this).closest("tr").find("td div").eq(2)[0].textContent.replace(/[-]/g, '');
           
            var headers = ID.replace("POHeaderselect_", "") + "_" + invoiceNum; //+ "_" + Farm + "_" + AWB;                        
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleManualPOHeaderSelected',
                data: "{'Selected':'" + Selected + "','ID':'" + headers + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                        sourceCtl.closest('tr').addClass("trChecked");

                        //for the incoming update details(Weight,DimWeight,MPF and Duties)
                        $("#lblincomweight_" + headers).hide();
                        $("#txtincomweight_" + headers).show();
                        $("#lblincomComment_" + headers).hide();
                        $("#txtincomComment_" + headers).show();

                        $("#lblincomdimweight_" + headers).hide();
                        $("#txtincomdimweight_" + headers).show();
                        $("#lblincommpf_" + headers).hide();
                        $("#txtincommpf_" + headers).show();
                        $("#lblincomduties_" + headers).hide();
                        $("#txtincomduties_" + headers).show();
                        $("#txtincomComment_" + headers).focus();
                        //Fitri(20190522): make invoice editable
                        $("#lblincomingInvoice_" + headers).hide();
                        $("#txtincomingInvoice_" + headers).show();
                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
                        sourceCtl.closest('tr').removeClass("trChecked");
                        //for the incoming update details(Weight,DimWeight,MPF and Duties)
                        $("#lblincomweight_" + headers).show();
                        $("#txtincomweight_" + headers).hide();
                        $("#lblincomComment_" + headers).show();
                        $("#txtincomComment_" + headers).hide();

                        $("#lblincomdimweight_" + headers).show();
                        $("#txtincomdimweight_" + headers).hide();
                        $("#lblincommpf_" + headers).show();
                        $("#txtincommpf_" + headers).hide();
                        $("#lblincomduties_" + headers).show();
                        $("#txtincomduties_" + headers).hide();
                        $("#lblincomingInvoice_" + headers).show();
                        $("#txtincomingInvoice_" + headers).hide();
                    }
                }
            });
        });


        function selectalldetails() {
            //debugger;
            var WhereCondtion = FramingFilters()
            var Query = $("#fgrdUserHeaders").flexOptions()[0].p.query;
            var QueryType = $("#fgrdUserHeaders").flexOptions()[0].p.qtype;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleManualPOHeaderSelectedAll',
                data: "{'SelectedManualPO':'1','HeaderID':'" + $("#POHeaderID").html() + "','WhereCondition':'" + escape(WhereCondtion) + "','Query':'" + Query + "','QueryType':'" + QueryType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#fgrdUserHeaders tr:visible').addClass("trChecked");
                    $('#fgrdUserHeaders tr#row0').removeClass("trChecked");
                    $("[id^=POHeaderselect_]:visible").prop("src", "images/check-on.png");

                    $("[id^=lblincomweight]").hide();
                    $("[id^=txtincomweight]").show();

                    $("[id^=lblincomComment]").hide();
                    $("[id^=txtincomComment]").show();

                    $("[id^=lblincomdimweight]").hide();
                    $("[id^=txtincomdimweight").show();
                    $("[id^=lblincommpf]").hide();
                    $("[id^=txtincommpf]").show();
                    $("[id^=lblincomduties]").hide();
                    $("[id^=txtincomduties]").show();
                    $("[id^=txtincomComment]")[0].focus();
                }
            });
        }
        //$("#").die('click').live("click", function (e) {
        //});
        $("#ManualPOHeaderselectall").die('click').live("click", function (e) {
            var SelectAllManualPOHeader = "HeaderId=" + $("#POHeaderID").html();
            var sourceCtl = $(this);
            var img = sourceCtl.attr("src").toLowerCase();
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }
            var WhereCondtion = FramingFilters()
            var Query = $("#fgrdUserHeaders").flexOptions()[0].p.query;
            var QueryType = $("#fgrdUserHeaders").flexOptions()[0].p.qtype;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleManualPOHeaderSelectedAll',
                data: "{'SelectedManualPO':'" + Selected + "','HeaderID':'" + $("#POHeaderID").html() + "','WhereCondition':'" + escape(WhereCondtion) + "','Query':'" + Query + "','QueryType':'" + QueryType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //$("#msgbox-select").dialog("close");

                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                        //$("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: SelectAllManualPODetails }, { name: 'IsEdit', value: true }], query: "", newp: 1 }).flexReload();
                        $('#fgrdUserHeaders tr:visible').addClass("trChecked");
                        $('#fgrdUserHeaders tr#row0').removeClass("trChecked");
                        $("[id^=POHeaderselect_]:visible").prop("src", "images/check-on.png");

                        $("[id^=lblincomweight]").hide();
                        $("[id^=txtincomweight]").show();

                        $("[id^=lblincomComment]").hide();
                        $("[id^=txtincomComment]").show();

                        $("[id^=lblincomdimweight]").hide();
                        $("[id^=txtincomdimweight").show();
                        $("[id^=lblincommpf]").hide();
                        $("[id^=txtincommpf]").show();
                        $("[id^=lblincomduties]").hide();
                        $("[id^=txtincomduties]").show();
                        $("[id^=txtincomComment]")[0].focus();
                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        //$("#fgrdManualPODetail").flexOptions({ params: [{ name: 'Filter', value: SelectAllManualPODetails }, { name: 'IsEdit', value: false }], query: "", newp: 1 }).flexReload();
                        $('#fgrdUserHeaders tr').removeClass("trChecked");
                        $("[id^=POHeaderselect_]").prop("src", "images/check-off.png");

                        $("[id^=lblincomweight]").show();
                        $("[id^=txtincomweight]").hide();

                        $("[id^=lblincomComment]").hide();
                        $("[id^=txtincomComment]").show();

                        $("[id^=lblincomdimweight]").show();
                        $("[id^=txtincomdimweight]").hide();
                        $("[id^=lblincommpf]").show();
                        $("[id^=txtincommpf]").hide();
                        $("[id^=lblincomduties]").show();
                        $("[id^=txtincomduties]").hide();
                        $("[id^=txtincomComment]").hide();
                    }
                }
            });
        });
        $("[id^=lnkHeaderImageFile_]").die("click").live("click", function () {

            var sourceCtl = $(this);
            var HeaderID = sourceCtl.attr('id').replace("lnkHeaderImageFile_", "");
            $("#hdnheaderid").val(HeaderID);
            var FileName = sourceCtl[0].innerHTML;
            var Filepath = ("<%=ConfigurationManager.AppSettings("ManualPoHeaderFilesPath")%>").toString().replace("{0}", HeaderID) + "/" + encodeURIComponent(FileName).replace(".", "_" + HeaderID + ".");
            LoadZoomContainer(Filepath);
            $("#DivShowPDFFile").hide();
            $("#DivShowHeaderImage").show();
            $("#myManualPOHeaderfile").prop("accept", ".png,.jpg,.jpeg");
            $("#DivHeaderImageDialog").dialog('option', 'title', "Image File : " + FileName);
            $("#DivHeaderImageDialog").dialog("open");

        });
        $("[id^=lnkHeaderPDFFile_]").die("click").live("click", function () {
            $("#myManualPOHeaderfile").val('');
            var sourceCtl = $(this);
            var HeaderID = sourceCtl.attr('id').replace("lnkHeaderPDFFile_", "");
            $("#hdnheaderid").val(HeaderID);
            var FileName = sourceCtl[0].innerHTML;
            var Filepath = ("<%=ConfigurationManager.AppSettings("ManualPoHeaderFilesPath")%>").toString().replace("{0}", HeaderID) + "/" + encodeURIComponent(FileName).replace(".pdf", "_" + HeaderID + ".pdf").replace(".PDF", "_" + HeaderID + ".pdf");

            $("#DivShowPDFFile").show();

            $("#DivShowHeaderImage").hide();
            //var Validpath = UrlExists(Filepath)            
            $.ajax({
                url: Filepath,
                type: 'HEAD',
                error: function () {
                    $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
                },
                success: function () {
                    $("#IfrmPDFFile").attr("src", Filepath);
                }
            });
            //if (Validpath == true)
            //    $("#IfrmPDFFile").attr("src", Filepath);
            //else
            //    $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
            $("#pdfHeaderID").text(HeaderID);
            $("#myManualPOHeaderfile").prop("accept", ".pdf");
            $("#DivHeaderImageDialog").dialog('option', 'title', "PDF File : " + FileName);
            $("#DivHeaderImageDialog").dialog("open");
            if (FileName != "No File") {
                $("#btnRemovePDFFile").removeAttr("disabled");
            } else {
                $("#btnRemovePDFFile").attr("disabled", true);
            }
        });

        function UrlExists(url) {
            url = ("<%=ConfigurationManager.AppSettings("SiteURL")%>").toString() + "/" + url;
            var http = new XMLHttpRequest();
            http.open('HEAD', url, false);
            http.send();
            return http.status != 404;
        }
        var headeridforcompare = "";

        $("[id^=lnkHeaderDetails_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var srcText = sourceCtl.attr('id').replace("lnkHeaderDetails_", "").split("_");
            var HeaderID = srcText[0];
            var Farm = srcText[1];
            var Awb = srcText[2];
            var Invoice = srcText[3];
            headeridforcompare = HeaderID;
            var PODetailsByHeader = "HeaderId='" + HeaderID + "'and Farm='" + Farm + "'and AWB='" + Awb + "'and Invoice='" + Invoice + "'";
            DefPODetailsByHeader = PODetailsByHeader;
            if (IsDetailsGridInitialize == false) {
                InitializePODetailGrid();
                IsDetailsGridInitialize = true;
            }
            else {
                $("#fgrdHeaderDetails").empty();
                $("#fgrdHeaderDetails").flexOptions({ params: [{ name: 'Filter', value: DefPODetailsByHeader }, { name: 'IsEdit', value: false }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }
            if ($('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(3) div').html() != "" && $('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(3) div').html() != "&nbsp;") {
                $("#DivHeaderDetails").dialog('option', 'title', $('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(3) div').html().replace(/-/g, '') + "-" + $('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(4) div').html());
                $("#DivSelectedAWB").html($('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(3) div').html().replace(/-/g, ''));
            }
            else {
                $("#DivHeaderDetails").dialog('option', 'title', $('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(4) div').html());
                $("#DivSelectedAWB").html("")
            }


            $("#DivHeaderDetails").dialog("open");
        });
        //     $("#btncompare").die("click").live("click", function () {
        //         debugger
        //         var HeaderID = headeridforcompare
        //         var invoice = $('#fgrdUserHeaders #row' + HeaderID + ' td:nth-child(10) div a').html()
        //if (invoice == "") {
        //             invoice = 0;
        //         }
        //         $.ajax({
        //             type: "POST",
        //             url: 'BloomService.asmx/CompareManualInomingBoxes',
        //             data: "{'AwbFarm':'" + $("#DivHeaderDetails").dialog('option', 'title') + "','Invoice':'" + invoice + "'}",
        //             contentType: "application/json; charset=utf-8",
        //             dataType: "json",
        //             success: function (output) {
        //                 debugger
        //                 var result = output.d;
        //                 window.open(result);
        //             }
        //         });
        //     });
        function InitializePODetailGrid() {
            var ShipmentHiddenStatus = $("#ctl00_DivShipmentStatus").html();
            $("#fgrdHeaderDetails").flexigrid({
                url: 'BloomService.asmx/GetManualPODetailForFgrd',
                dataType: 'xml',
                colModel: [
                    { display: '', name: 'Delete', width: 15, sortable: false, align: 'left', hide: true },
                    { display: '', name: 'Edit', width: 15, sortable: false, align: 'left', hide: true },
                    { display: '<img style="Cursor:pointer;" id="ManualPOselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', hide: true },
                    { display: 'Farm', name: 'Farm', width: 20, sortable: true, align: 'left' },
                    { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
                    { display: 'Description', name: 'FlowerName', width: 200, sortable: true, align: 'left' },
                    { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right' },
                    { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left' },
                    //{ display: 'Units/bunch', name: 'Units', width: 30, sortable: true, align: 'right' },
                    { display: 'Units/Bunch', name: 'UnitsPerBunch', width: 30, sortable: true, align: 'right' },
                    { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                    { display: 'Total Units', name: 'Units', width: 50, sortable: true, align: 'right', hide: true },
                    { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
                    { display: 'Total Cost', name: 'TotalCost', width: 60, sortable: true, align: 'right' },
                    { display: 'Type', name: 'Type', width: 25, sortable: true, align: 'left' },
                    { display: 'Cust#', name: 'CustNumber', width: 40, sortable: true, align: 'left' },
                    { display: 'Comments', name: 'Comments', width: 60, sortable: true, align: 'left', hide: true },
                    { display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left', hide: true },
                    { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left', hide: true },
                    { display: 'BoxNum', name: 'BoxNumber', width: 40, sortable: true, align: 'right' },
                    { display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left' },
                    { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
                    { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left', hide: true },
                    { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: true },
                    { display: 'ShipDate', name: 'ShipDate', width: 40, sortable: true, align: 'left', hide: true },
                    { display: 'Missing', name: 'Missing', width: 32, sortable: true, align: 'right' },
                    { display: 'Duplicate', name: 'Duplicate', width: 45, sortable: false, align: 'left', hide: true },
                    { display: '@Farm', name: 'MissingAtOrigin', width: 45, sortable: false, align: 'right' },
                    { display: 'ItemNotTransfered', name: 'ItemNotTransfered', width: 70, sortable: false, align: 'left' },
                ],
                searchitems: [
                    { display: 'Farm', name: 'Farm' },
                    { display: 'Flower', name: 'Flower' },
                    { display: 'Description', name: 'FlowerName' },
                    { display: 'Boxes', name: 'Quantity' },
                    { display: 'UOM', name: 'UOM' },
                    { display: 'Invoice', name: 'Invoice' },
                    { display: 'PO#', name: 'PONumber' },
                    { display: 'BoxNum', name: 'BoxNumber' },
                    { display: 'Cust#', name: 'CustNumber' },
                    { display: 'Type', name: 'Type' }
                ],
                showTableToggleBtn: true,
                sortname: "DifferentBoxes desc,Flower asc",
                sortorder: "",
                usepager: true,
                title: false,
                useRp: true,
                rp: 30000,
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
                height: 360,
                width: "auto",
                striped: true,
                onSuccess: function () {
                    //For to show the error
                    if ($("#fgrdHeaderDetails tr#row-2").length > 0) {
                        $("#fgrdHeaderDetails tr#row-2").hide();
                        $.MessageBox($("#fgrdHeaderDetails tr#row-2")[0].innerText);
                        return false;
                    }

                    $('#fgrdHeaderDetails #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(25) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(27) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(17) div').css({ "display": 'none' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(20) div').css({ "display": 'none' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(21) div').css({ "display": 'none' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(26) div').css({ "display": 'none' });
                    $('#fgrdHeaderDetails #row0 td:nth-child(28) div').css({ "display": 'none' });

                    $('#fgrdHeaderDetails #row0').addClass("TotalRows");
                    $("#DivHeaderDetails #ExportCSV").show();
                }
            });

            $("#DivHeaderDetails .sDiv").css('float', 'left').css('width', '545px');
            $('#DivHeaderDetails .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivHeaderDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
            $("#DivHeaderDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
            //$("#DivHeaderDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
            $("#DivHeaderDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        }

        $("[id^=btnlookupboxdetails]").live("click", function () {

            //$("[id^=btnlookupboxdetails]").addClass("BloomButtonProcessing");
            $("#txtBoxDetails_Farm").val("");
            $("#txtBoxDetails_BoxNum").val("");
            $("#DivSelectedAWB").html("");
            $(".Warning").hide();
            $(".YellowWarning").hide();

            //cmted by mani to restrict flex reload
            //var Farm = $("#txtBoxDetails_Farm").val();
            //var Boxnum = 0;
            //if ($("#txtBoxDetails_BoxNum").val() == "")
            //    Boxnum = 0;
            //else
            //    Boxnum = $("#txtBoxDetails_BoxNum").val();


            var Farm = '';
            var Boxnum = 0;

            var wharecondition = "Farm='" + Farm + "' and BoxNum=" + Boxnum;
            DefLabelPrintDetails = wharecondition;
            if (IsLabelPrintLogDetailsGridInitialize == false) {
                InitializeLabelPrintLogDetailGrid();
                IsLabelPrintLogDetailsGridInitialize = true;
            }
            else {
                $("#fgrdBoxDetails").flexOptions({ params: [{ name: 'Filter', value: DefLabelPrintDetails }], query: "", newp: 1 }).flexReload();
            }
            $("#DivBoxDetails").dialog('option', 'title', 'Get box Details');
            $("#DivBoxDetails").dialog("open");
        });

        //mani:25-feb-2016
        $("[id^=btnmanualpoBoxNo_]").die("click").live("click", function () {

            var Boxnum = $(this).attr("data-boxnum");;
            var Farm = $(this).attr("data-farm");;
            $("#txtBoxDetails_Farm").val(Farm);
            $("#txtBoxDetails_BoxNum").val(Boxnum);
            $(".Warning").hide();
            $(".YellowWarning").hide();
            $("#DivBoxDetails").dialog('option', 'title', 'Get box Details');
            $("#DivBoxDetails").dialog("open");
            LoadlabelPrintLogs();
        });


        $("[id^=btnGetboxdetails]").live("click", function () {
            $(".Warning").hide();
            $(".YellowWarning").hide();
            LoadlabelPrintLogs();
        });
        $("#txtBoxDetails_BoxNum").keypress(function (event) {
            if (event.keyCode == 13) {
                LoadlabelPrintLogs();
            }

        });
        function LoadlabelPrintLogs() {

            var Farm = $("#txtBoxDetails_Farm").val();
            var Boxnum = 0;
            if ($("#txtBoxDetails_BoxNum").val() == "")
                Boxnum = 0;
            else
                Boxnum = $("#txtBoxDetails_BoxNum").val();
            var wharecondition = "Farm='" + Farm + "' and BoxNum=" + Boxnum;
            DefLabelPrintDetails = wharecondition;
            if (IsLabelPrintLogDetailsGridInitialize == false) {
                InitializeLabelPrintLogDetailGrid();
                IsLabelPrintLogDetailsGridInitialize = true;
            }
            else {
                $("#fgrdBoxDetails").flexOptions({ params: [{ name: 'Filter', value: DefLabelPrintDetails }], query: "", newp: 1 }).flexReload();
            }
        }

        function InitializeLabelPrintLogDetailGrid() {
            $("#fgrdBoxDetails").flexigrid({
                url: 'BloomService.asmx/GetLabelPrintLogsForFgrd',
                dataType: 'xml',
                colModel: [
                    { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left', hide: true },
                    { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
                    { display: 'Description', name: 'FlowerName', width: 150, sortable: true, align: 'left' },
                    { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right' },
                    { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left' },
                    { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                    // { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
                    { display: 'Cust#', name: 'CustNumber', width: 40, sortable: true, align: 'left' },
                    { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left' },
                    { display: 'Application', name: 'ImportedFrom', width: 60, sortable: true, align: 'left' },
                    { display: 'Seq', name: 'Sequence', width: 40, sortable: true, align: 'left', hide: false },
                    { display: 'Rack', name: 'Rack', width: 40, sortable: true, align: 'left' },
                    { display: 'Date', name: 'PrintedDate', width: 100, sortable: true, align: 'left' },
                    { display: 'By', name: 'PrintedUser', width: 40, sortable: true, align: 'left' },
                    // { display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left' },
                    // { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left', },
                    // { display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left' },
                    { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
                    { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: true }
                ],
                searchitems: [
                    { display: 'Application', name: 'Application' },
                    { display: 'Flower', name: 'Flower' },
                    { display: 'Description', name: 'FlowerName' },
                    { display: 'Boxes', name: 'Quantity' },
                    { display: 'UOM', name: 'UOM' },
                    { display: 'Invoice', name: 'Invoice' },
                    { display: 'AWB', name: 'AWB' },
                    { display: 'Cust#', name: 'CustNumber' },
                ],
                showTableToggleBtn: true,
                sortname: "PrintedDate",
                sortorder: "boxnum",
                usepager: true,
                title: false,
                useRp: true,
                //rp: parseInt(($(window).height() - 290) / 25),
                rp:99999,
                qtype: "Farm",
                nomsg: 'No records found!',
                singleSelect: true,
                showToggleBtn: false,
                resizable: false,
                autoload: true,
                showTableToggleBtn: false,
                params: [
                    { name: 'Filter', value: DefLabelPrintDetails }
                ],
                height: 285,
                width: 875,
                striped: true,
                onSuccess: function () {
                    //For to show the error
                    if ($("#fgrdHeaderDetails tr#row-2").length > 0) {
                        $("#fgrdHeaderDetails tr#row-2").hide();
                        $.MessageBox($("#fgrdHeaderDetails tr#row-2")[0].innerText);
                        return false;
                    }
                    //debugger;
                    try {
                        if ($('#DivSelectedAWB').html() != "") {
                            $('#DivBoxDetails [name="qtype"]').val("AWB");
                            $('#DivBoxDetails [name="q"]').val($('#DivSelectedAWB').html().substring($('#DivSelectedAWB').html().length - 4));
                            $('#DivBoxDetails [value="Search"]').click();
                        }
                        else {
                            $('#DivBoxDetails [value="Clear"]').click();
                        }
                    }
                    catch (e) {

                    }
                }
            });
            $("#DivBoxDetails .sDiv").css('float', 'left').css('width', '545px');
            $('#DivBoxDetails .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivBoxDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivBoxDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivBoxDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
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

        //VEN::31-Oct-2015::For show Header Image File
        function LoadZoomContainer(Path) {

            $('#HeaderImagezoom_container').smoothZoom('destroy').css('background-image', 'url(zoom_assets/preloader.gif)').smoothZoom({
                image_url: Path,
                initial_POSITION: '0 0',
                width: $("#DivShowHeaderImage").width(),
                height: $("#DivShowHeaderImage").height(),
                initial_POSITION: '0 0',
                initial_ZOOM: 0,
                responsive: false,
                responsive_maintain_ratio: true,
                max_WIDTH: '',
                max_HEIGHT: ''
            });
        }
        //VEN::17-Dec-2015::For Upload Image and PDF Files
        $("#myManualPOHeaderfile").change(function () {
            if ($("#ctl00_LoggedUserType").html() == "vendor" || $("#ctl00_LoggedUserType").html() == "cargo agent") {

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
            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });

        function startManualPOHeaderFileUpload() {
            $('#upload_File_process').show();
            $('#upload_File_form').hide();
            return true;
        }

        function stopUploadHeaderFiles(path, fileType) {

            //STA::31-OCT-2015::to update/add the header files
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SaveHeaderFiles',
                data: "{'HeaderId':'" + $("#hdnheaderid").val() + "','HeaderFileName':'" + path + "','fileType':'" + fileType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    if (output.d == "success") {
                        var Filepath = ("<%=ConfigurationManager.AppSettings("ManualPoHeaderFilesPath")%>").toString().replace("{0}", $("#hdnheaderid").val()) + "/" + path;
                        if (fileType.toLowerCase() == ".png" || fileType.toLowerCase() == ".jpg") {
                            LoadZoomContainer(Filepath);
                        }
                        else if (fileType.toLowerCase() == ".pdf") {
                            $.ajax({
                                url: Filepath,
                                type: 'HEAD',
                                error: function () {
                                    $("#IfrmPDFFile").attr("src", "zoom_assets/fnf.pdf");
                                },
                                success: function () {
                                    $("#IfrmPDFFile").attr("src", Filepath);
                                }
                            });
                        }

                        $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                        $("#DivExecutionResult").html("Files upload Successfully");
                        $('#upload_File_process').hide();
                        $('#upload_File_form').show();
                    }
                    else
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
        }
        //$('#btnresetheaderdatefilter').click(function (e) {
        //    $("#txtHeaderDate").datepicker({ dateFormat: "mm/dd/yy" }).datepicker("setDate", new Date());
        //    $("#txtHeaderToDate").datepicker({ dateFormat: "mm/dd/yy" }).datepicker("setDate", new Date());
        //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: '' }, { name: 'ShippedToDateFilter', value: '' }], query: "", newp: 1 }).flexReload();
        //});

        //$('#imgprevheaderdatefilter').click(function (e) {
        //    prev = $("#txtHeaderDate").datepicker('getDate');
        //    $("#txtHeaderDate").datepicker('setDate', new Date(prev.getFullYear(), prev.getMonth(), prev.getDate() - 1));
        //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }], query: "", newp: 1 }).flexReload();
        //});



        $('#imgnextheaderdatefilter').click(function (e) {

            var chk = new Date();
            var chknext = (chk.getDate() + '-' + (chk.getMonth() + 1) + '-' + chk.getFullYear());
            var input = $("#txtHeaderDate").val().split("-");
            var monthfield = input[0]
            var dayfield = input[1]
            var yearfield = input[2]
            var td = new Date(dayfield + "-" + monthfield + "-" + yearfield);
            var today = (td.getDate() + '-' + (td.getMonth() + 1) + '-' + td.getFullYear());
            next = $("#txtHeaderDate").datepicker('getDate');
            $("#txtHeaderDate").datepicker('setDate', new Date(next.getFullYear(), next.getMonth(), next.getDate() + 1));
            $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtHeaderDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtHeaderToDate").val() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
        });

        function DownloadUserXMLClicked() {

            var count = 0;
            var MAWB = '';
            var Farm = '';
            $('#fgrdUserHeaders tr').each(function () {

                if ($(this).attr("id") != "row0") {
                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                        ////Check AWB number is empty                    
                        //if ($(this).find("td div").eq(2)[0].textContent.trim() != "" && $(this).find("td div").eq(2)[0].textContent.trim() != "0" && $(this).find("td div").eq(2)[0].textContent.trim() != " ") {
                        //    MAWB += $(this).find("td div").eq(2)[0].textContent + ", ";
                        //}
                        //else {
                        //    count = 1;
                        //    $.MessageBox("Please ship the orders before send the email!!!!");
                        //    return false;
                        //}

                        ////Check Farm is empty
                        //if ($(this).find("td div").eq(3)[0].textContent.trim() != "" && $(this).find("td div").eq(3)[0].textContent.trim() != "0" && $(this).find("td div").eq(3)[0].textContent.trim() != " ") {
                        //    Farm += $(this).find("td div").eq(3)[0].textContent + ", ";
                        //}
                        //else {
                        //    count = 1;
                        //    $.MessageBox("Please ship the orders before send the email!!!!");
                        //    return false;
                        //}

                        var AWB = $(this).find('img').attr('data-poawb');
                        //Check AWB number is empty                    
                        if ($(this).find("td div").eq(2)[0].textContent.trim() != "" && $(this).find("td div").eq(2)[0].textContent.trim() != "0" && $(this).find("td div").eq(2)[0].textContent.trim() != " ") {
                            MAWB += $(this).find("td div").eq(2)[0].textContent + ", ";
                        }
                        else {
                            count = 1;
                            $.MessageBox("Please ship the orders before send the email!!!!");
                            return false;
                        }

                        //Check Farm is empty
                        var pofarm = $(this).find('img').attr('data-pofarm');
                        if ($(this).find("td div").eq(3)[0].textContent.trim() != "" && $(this).find("td div").eq(3)[0].textContent.trim() != "0" && $(this).find("td div").eq(3)[0].textContent.trim() != " ") {
                            Farm += $(this).find("td div").eq(3)[0].textContent + ", ";
                        }
                        else {
                            count = 1;
                            $.MessageBox("Please ship the orders before send the email!!!!");
                            return false;
                        }
                    }
                }
            });

            if (count == 0 && MAWB != "") {
                $("#btnincommingemail").addClass("BloomButtonProcessing");
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
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/CreateXMLForSelectedPOHeaders',
                                data: '{}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output, status) {

                                    var XMLdata = output.d;
                                    if (output.d != "error") {
                                        if (XMLdata.XMLFileName == "please select") {
                                        }
                                        else if (XMLdata.XMLFileName == 'LogOut') {
                                            window.location.href = "Login.aspx";
                                        }
                                        else {
                                            <%--$('#lnkXMLDownload').attr("href", "<%=ConfigurationManager.AppSettings("XmlPath")%>" + "XML/" + XMLdata.XMLFileName);
                                    $("#lnkXMLDownload").attr("download", XMLdata.XMLFileName);
                                    $('#lnkXMLDownload').get(0).click();--%>

                                        $("#lnkXMLFileName").html(XMLdata);
                                        $("#txtmanualpoSubjects").val("");
                                        $("#txtmanualpoSubjects").val("AWB # " + MAWB.slice(0, MAWB.length - 2) + " FARM-" + Farm.slice(0, Farm.length - 2));
                                        $("#lnkXMLFileName").attr("href", "temp/" + XMLdata);
                                        $("#lnkXMLFileName").attr("download", XMLdata);

                                        $("#DivEmailDialog").dialog('option', 'title', "Email");
                                        $("#DivEmailDialog").dialog("open");
                                        $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
                                        var cond = FramingFilters()
                                        $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                                    }
                            }
                            else
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                            }
                        });
                }
                }
            });
    }
}

$("#testdownload").live("click", function () {
    //    
    //    //Path;
    //    $("#lnkXMLFileName").get(0).click();
    //$.fileDownload("../PO Screen.xls");
    // $.fileDownload("../PO.pdf");
    //   //// window.location.href = "http://localhost/dfattachments/XML/8888.XML";
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/DownloadIncommingXML',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
        }
    });

    //$("#btnopenpdf").get(0).click();

});

//STA::29-09-2015::For DV labels
$("#DivUploadDVLabel").dialog({
    autoOpen: false,
    resizable: false,
    width: 550,
    height: 250,
    modal: true,
    title: 'Upload CSV',
    close: function () {
        $("[id^=btnprintdvlabel]").removeClass("BloomButtonProcessing");
    }
});

$("#myDVfile").change(function () {

    var val = $(this).val();
    switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
        case 'csv':
            //$(".YellowWarning").fadeOut(1000);
            $("#btnimportcsvdata").click();
            break;
        default:
            $(this).val('');
            $(".YellowWarning").hide();
            $(".YellowWarning").html("Please select csv file!");
            $(".YellowWarning").fadeIn(1000);
            break;
    }
});

$("#btnimportcsvdata").die("click").live("click", function (e) {
    //w = window.open('GeneratingPDF.html');
    var val = $("#myDVfile").val();
    var filename = val.substring(val.lastIndexOf('\\') + 1);
    if (filename != "") {
        var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
        $("body").append(iframe);
        var form = $('#fileuploader');
        form.attr("target", "postiframe");
        form.attr("file", $('#myDVfile').val());
        form.submit();
    }
});

function startUpload() {
    $('#upload_process').show();
    $('#upload_form').hide();
    return true;
}

$("[id^=btnprintdvlabel]").live("click", function () {
    $("[id^=btnprintdvlabel]").addClass("BloomButtonProcessing");
    $("#txtmawbnumber").val("");
    $(".YellowWarning").hide();
    $('#upload_process').hide();
    $('#import_process').hide();
    $('#upload_form').show();
    $("#myDVfile").val("");
    $("#DivUploadDVLabel").dialog('option', 'title', 'Import CSV');
    $("#DivUploadDVLabel").dialog("open");
});


function stopUploadDV(path) {
    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/UploadDvFile',
        data: "{'path':'" + path + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            if (output.d == "success") {
                $("#DivUploadDVLabel").dialog("close");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintDVLabels',
                    data: "{}",
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
            }
        });
    }
    //END

    //VEN::30-09-2015::For send Email for XML
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
                        if (output.d == "Success")
                            $("#DivEmailDialog").dialog("close");
                        else if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
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
            $("#btnincommingemail").removeClass("BloomButtonProcessing");
        }
    });


    //VEN::09-10-2015::TO ADD DATE FILTER HEADER CLICK EVENTS
    $('#divHeaderdate').click(function (event) {
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

    //VEN::09-10-2015::TO ADD FARM FILTER HEADER CLICK EVENTS
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

    $('#divHeaderAWB').click(function (event) {

        $(".rowcss").show();


        if ($('#divAWBFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divAWBFilter").slideToggle();
        }
        else {
            $("#divAWBFilter").slideToggle();
        }

        $("#txtNameFilter").val("");
        $("#txtNameFilter").focus();

    });

    $("[id^=btndateok]").live("click", function () {

        if ($("#txtHeaderDate").val() != "" && $("#txtHeaderToDate").val() == "") {
            $("#msg").html("Please choose ToDate!");
            $("#msgbox-select").dialog("open");

            return false;
        }
        else if ($("#txtHeaderDate").val() == "" && $("#txtHeaderToDate").val() != "") {
            $("#msg").html("Please choose From Date!");
            $("#msgbox-select").dialog("open");
            return false;
        }
        else if ($("#txtHeaderDate").val() == "" && $("#txtHeaderToDate").val() == "") {
            $("#msg").html("Please choose From Date and ToDate!");
            $("#msgbox-select").dialog("open");
            return false;
        }

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + $("#txtHeaderDate").val() + "','ToDate':'" + $("#txtHeaderToDate").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var fdate = $("#txtHeaderDate").val() + " to " + $("#txtHeaderToDate").val();
                $("#lblchosendate").html(fdate);

                $("#tr2").addClass('FilterDivStyle');
                $("#lblchosendate1").html($("#txtHeaderDate").val());
                $("#lblchosendate2").html($("#txtHeaderToDate").val());

                $("#divFromDate").datepicker("setDate", Date.parse($("#txtHeaderDate").val()));
                $("#divToDate").datepicker("setDate", Date.parse($("#txtHeaderToDate").val()));

                $("#imgdate").attr("src", "images/Filter.png");
                if ($("#divdateFilter").is(":visible")) {
                    $("#divdateFilter").slideToggle();
                }

                //  $("#btnapply").click();

                var cond = FramingFilters();
                $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }
        });




    });


    $("[id^=imgAWB]").live("click", function (e) {
        $("#lstAWBFilter").val("All");

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgAWB").attr("src", "images/EmptyFilter.png");
            $("#txtAWBFilter").val("");
            $("#lblAWBFilter").html("");
            $("#trAWB").removeClass();
            // $("#btnapply").click();
            $("#divAWBFilter").hide();
            var cond = FramingFilters();
            $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            e.stopPropagation();
        }
    });
    $("[id^=imgFarm]").live("click", function (e) {
        $("#lstFarmFilter").val("All");

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgFarm").attr("src", "images/EmptyFilter.png");
            $("#txtFarmFilter").val("");
            $("#lblFarmFilter").html("");
            $("#tr1").removeClass();
            // $("#btnapply").click();
            $("#divFarmFilter").hide();
            var cond = FramingFilters()
            $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            e.stopPropagation();
        }
    });


    $("[id^=imgdate]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtHeaderDate").val(today);
            $("#txtHeaderToDate").val(today);
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
                    var cond = FramingFilters();
                    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

                }
            });

            e.stopPropagation();

        }
    });

    $('#lstFarmFilter').change(function () {
        $("#lblFarmFilter").html($('#lstFarmFilter').val());
        $("#tr1").addClass('FilterDivStyle');
        $("#imgFarm").attr("src", "images/Filter.png");
        $("#divFarmFilter").slideToggle();
        var cond = FramingFilters();
        $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });


    $('#lstAWBFilter').change(function () {
        $("#lblAWBFilter").html($('#lstAWBFilter').val());
        $("#trAWB").addClass('FilterDivStyle');
        $("#imgAWB").attr("src", "images/Filter.png");
        $("#divAWBFilter").slideToggle();
        var cond = FramingFilters();        
        $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });

    $("#btnShipmentupdate").live("click", function () {
        if ($("#btnShipmentupdate").hasClass("BloomButtonDisabled")) {
            return;
        }
        else {
            $(".PleaseWaitOverlay").show();
            $("#txtXMLFile").hide();
            $("#DivScanningXMLDialog").dialog('option', 'title', "Scanning Validation Result");
            $("#DivScanningXMLDialog").dialog("open");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetScannedBarCodesbyAWB',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d != "NoSelect" && output.d != "error" && output.d != "Not Valid URL" && output.d != "" && output.d != "Not Shipped") {
                        var cond = FramingFilters();
                        $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: cond }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                        $("#txtXMLFile").val(output.d);
                        $("#txtXMLFile").show();
                        $(".PleaseWaitOverlay").hide();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ClearManualPOHeaderSelectedSession',
                            data: "{}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
                            }
                        });
                    }
                    else if (output.d == "NoSelect") {
                        $("#DivScanningXMLDialog").dialog("close");
                        $.MessageBox("Please select a detail to update!!!!");
                    }
                    else if (output.d == "Not Valid URL") {
                        $("#DivScanningXMLDialog").dialog("close");
                        $.MessageBox("Shipment Validation URL not valid!!!!");
                    }
                    else if (output.d == "Not Shipped") {
                        $("#DivScanningXMLDialog").dialog("close");
                        $.MessageBox("Validate shipping records only!!!");
                    }
                    else {
                        $("#DivScanningXMLDialog").dialog("close");
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
    });

    //STA:: for to update the Weight,DIM,MPF,Duties values
    //START

    //$("#DivMeasurements").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    title: "Alert",
    //    width: 500,
    //    height: 200,
    //    modal: true,
    //    buttons: {
    //        Save: function () {
    //            if ($("#txtincomweights").val() != "" && $("#txtincomdimensionalweight").val() != "" && $("#txtincommpf").val() != "" && $("#txtincomduties").val() != "") {
    //                $.ajax({
    //                    type: "POST",
    //                    url: 'BloomService.asmx/UpdateMeasurementDetails',
    //                    data: "{'AWB':'" + $("#DivIncomAWB").html() + "','Farm':'" + $("#DivIncomFarm").html() + "','IncomDate':'" + $("#DivIncomDate").html()
    //                            + "','Headerid':'" + $("#DivIncomHdrId").html() + "','Weight':'" + $("#txtincomweights").val()
    //                            + "','DimensionalWeight':'" + $("#txtincomdimensionalweight").val() + "','MPF':'" + $("#txtincommpf").val()
    //                            + "','Duties':'" + $("#txtincomduties").val() + "'}",
    //                    contentType: "application/json; charset=utf-8",
    //                    dataType: "json",
    //                    success: function (output, status) {
    //                        $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
    //                        $("#DivMeasurements").dialog("close");
    //                    }

    //                });
    //            }
    //        },
    //        Cancel: function () {
    //            $("#DivMeasurements").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
    //        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
    //    }
    //});

    //$("[id^=btnincomMeasurements_]").die("click").live("click", function () {
    //    

    //    var IncWeightCtrlId = $(this)[0].id.replace("btnincomMeasurements_", "");
    //    var IncomCaption = $(this)[0].innerText;
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetPOHeaderByID',
    //        data: "{'ID':'" + IncWeightCtrlId + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {
    //            $("#DivIncomHdrId").html("");
    //            $("#DivIncomAWB").html("");
    //            $("#DivIncomFarm").html("");
    //            $("#DivIncomDate").html("");

    //            $("#DivIncomHdrId").html(IncWeightCtrlId);
    //            $("#DivIncomAWB").html(output.d.AWB);
    //            $("#DivIncomFarm").html(output.d.FarmCode);
    //            $("#DivIncomDate").html(output.d.ShippedDate);

    //            if (IncomCaption == "Add") {
    //                $("#txtincomweights").val("");
    //                $("#txtincomdimensionalweight").val("");
    //                $("#txtincommpf").val("");
    //                $("#txtincomduties").val("");
    //            }
    //            else {
    //                $("#txtincomweights").val(output.d.Weight);
    //                $("#txtincomdimensionalweight").val(output.d.DimensionalWeight);
    //                $("#txtincommpf").val(output.d.MPF);
    //                $("#txtincomduties").val(output.d.Duties);
    //            }
    //            var IncomUpdateDialogTitle = $("#fgrdUserHeaders tr#row"+ IncWeightCtrlId +" td:eq(2)")[0].textContent.replace(/-/g, '') + "-" + $("#fgrdUserHeaders tr#row"+ IncWeightCtrlId +" td:eq(3)")[0].textContent + " Incoming Update Details";
    //            $("#DivMeasurements").dialog('option', 'title', IncomUpdateDialogTitle);
    //            $("#DivMeasurements").dialog("open");
    //        }
    //    });

    //});

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
    //END

    //STA::19-OCT-2015::to update the Incoming details(Weight,DimWeight,MPF and Duties)
    $("#btnincomingupdate").die("click").live("click", function () {
        var INComDetails = "";
        INComDetails = "<ICDetails>"
        $('#fgrdUserHeaders tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var invoiceNum = $(this).find("td div").eq(9)[0].textContent;
                    var Farm = $(this).find("td div").eq(3)[0].textContent;
                    var AWB = $(this).find("td div").eq(2)[0].textContent.replace(/[-]/g, '');

                    var ID = $(this).attr("id").replace("row", "") + "_" + invoiceNum; //+ "_" + Farm + "_" + AWB;;
                    if ($("#txtincomweight_" + ID).val() == "")
                        $("#txtincomweight_" + ID).val($("#txtincomweight_" + ID).attr("placeholder"));
                    if ($("#txtincomComment_" + ID).val() == "")
                        $("#txtincomComment_" + ID).val($("#txtincomComment_" + ID).attr("placeholder"));
                    if ($("#txtincomdimweight_" + ID).val() == "")
                        $("#txtincomdimweight_" + ID).val($("#txtincomdimweight_" + ID).attr("placeholder"));
                    if ($("#txtincommpf_" + ID).val() == "")
                        $("#txtincommpf_" + ID).val($("#txtincommpf_" + ID).attr("placeholder"));
                    if ($("#txtincomduties_" + ID).val() == "")
                        $("#txtincomduties_" + ID).val($("#txtincomduties_" + ID).attr("placeholder"));
                    if ($("#txtincomingInvoice_" + ID).val() == "")
                        $("#txtincomingInvoice_" + ID).val($("#txtincomingInvoice_" + ID).attr("placeholder"));

                    INComDetails += "<ICDetail>" +
                        "<ID>" + $(this).attr("id").replace("row", "") + "</ID>" +
                        "<Invoice>" + $("#txtincomingInvoice_" + ID).val() + "</Invoice>" +
                        "<Comment>" + $("#txtincomComment_" + ID).val() + "</Comment>" +
                        "<Weight>" + $("#txtincomweight_" + ID).val() + "</Weight>" +
                        "<DIMWeight>" + $("#txtincomdimweight_" + ID).val() + "</DIMWeight>" +
                        "<MPF>" + $("#txtincommpf_" + ID).val() + "</MPF>" +
                        "<Duties>" + $("#txtincomduties_" + ID).val() + "</Duties>" +
                        "</ICDetail>";
                }
            }
        });
        INComDetails = INComDetails + "</ICDetails>";
        
        if (INComDetails != "<ICDetails></ICDetails>") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateIncomingDetails',
                data: "{'Details':'" + INComDetails + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "success") {
                        $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
                        $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                        //$("#DivMeasurements").dialog("close");
                    }
                    else
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }

            });
        }
        else
            $.MessageBox("Please select a detail to update!!!!");
    });


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

    $("#DivConfirmTransferToUserDialog").unbind('keydown').bind('keydown', function (e) {
        if (e.which == 13) {
            if ($("#txtHandling_Transfer").is(':focus') == true) {
                $("#DivConfirmTransferToUserDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
                return false
            }
        }
    });

    //MANI::04-JUN-2016::Confirmation Dialog Before Transfer User 
    $("#DivConfirmTransferToUserDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        title: 'Confirm Transfer',
        buttons: {
            Yes: function () {

                if ($("#txtTransferFile").val().trim() == "" && $("#txtTransferFile").attr("placeholder") == "") {
                    //$("#lblUserNoRequired").show();
                    $("#txtTransferFile").focus();
                    return false;
                }
                if ($("#txtTransferFile").val().trim() != "") {
                    var TransferFile = $("#txtTransferFile").val()
                }
                else {
                    var TransferFile = "99"
                }

                //$("#lblUserNoRequired").hide();
                $("#DivConfirmTransferToUserDialog").dialog("close");
                //$("#msg").html("Please wait, Data Transfering...  <img src='images/ajax-loader.gif' />");
                //$("#msgbox-select").dialog("open");
                var count = 0;
                var MAWB = '';
                var Farm = '';
                var SelectedHeaders = '';
                $('#fgrdUserHeaders tr').each(function () {
                    //debugger;
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                            ////Check AWB number is empty                    
                            //if ($(this).find("td div").eq(2)[0].textContent.trim() != "" && $(this).find("td div").eq(2)[0].textContent.trim() != "0" && $(this).find("td div").eq(2)[0].textContent.trim() != " ") {
                            //    MAWB += $(this).find("td div").eq(2)[0].textContent + ", ";
                            //    SelectedRecords = SelectedRecords + 1;
                            //    var currentRowID =$(this).attr("id").replace('row','')
                            //    SelectedHeaders += currentRowID + "&" + $(this).find("td div").eq(8)[0].textContent + ",";
                            //}
                            //else {
                            //    count = 1;
                            //    SelectedRecords = 0;
                            //    $.MessageBox("Please ship the orders before transfer!!!!");
                            //    return false;
                            //}

                            var AWB = $(this).find('img').attr('data-poawb');
                            //Check AWB number is empty                    
                            if ($(this).find("td div").eq(2)[0].textContent.trim() != "" && $(this).find("td div").eq(2)[0].textContent.trim() != "0" && $(this).find("td div").eq(2)[0].textContent.trim() != " ") {
                                MAWB += $(this).find("td div").eq(2)[0].textContent + ", ";
                                SelectedRecords = SelectedRecords + 1;
                                var currentRowID = $(this).attr("id").replace('row', '')
                                //SelectedHeaders += currentRowID + "&" + $(this).find("td div").eq(8)[0].textContent + ",";
                                //   invoicenum is actually boxnumber    Jose 03/31/2020
                                //var invoiceNum = $(this).find("td div").eq(9)[0].textContent;
                                //var AWB = $(this).find("td div").eq(2)[0].textContent.replace(/[-]/g, '');;
                                //var FARM = $(this).find("td div").eq(3)[0].textContent;
                                //SelectedHeaders += currentRowID + "&" + invoiceNum + "~" + AWB + "|" + FARM + ",";

                                var invoiceNum = $(this).find("td div").eq(9)[0].textContent;
                                //var AWB = $(this).find("td div").eq(2)[0].textContent.replace(/[-]/g, '');;
                                //var FARM = $(this).find("td div").eq(3)[0].textContent;
                                SelectedHeaders += currentRowID + "&" + invoiceNum + ",";
                                
                            }
                            else {
                                count = 1;
                                SelectedRecords = 0;
                                $.MessageBox("Please ship the orders before transfer!!!!");
                                return false;
                            }


                            var podetailsfarm = $(this).find('img').attr('data-pofarm');
                            //Check Farm is empty
                            if ($(this).find("td div").eq(3)[0].textContent.trim() != "" && $(this).find("td div").eq(3)[0].textContent.trim() != "0" && $(this).find("td div").eq(3)[0].textContent.trim() != " ") {
                                Farm += $(this).find("td div").eq(3)[0].textContent + ", ";
                            }
                            else {
                                count = 1;
                                $.MessageBox("Please ship the orders before transfer!!!!");
                                return false;
                            }


                            ////Check Farm is empty
                            //if ($(this).find("td div").eq(3)[0].textContent.trim() != "" && $(this).find("td div").eq(3)[0].textContent.trim() != "0" && $(this).find("td div").eq(3)[0].textContent.trim() != " ") {
                            //    Farm += $(this).find("td div").eq(3)[0].textContent + ", ";
                            //}
                            //else {
                            //    count = 1;
                            //    $.MessageBox("Please ship the orders before transfer!!!!");
                            //    return false;
                            //}
                        }
                    }
                });                
                if (count == 0 && MAWB != "" && SelectedRecords > 0) {
                    //$("#progressBar").show();
                    //progressBar(0, $('#progressBar'));
                    //$.ajax({
                    //    type: "POST",
                    //    url: 'BloomService.asmx/GetRecordsCountfromuser',
                    //    data: '{"User":"WINVNW' + TransferFile + '","ProcessStatus":"Start"}',
                    //    contentType: "application/json; charset=utf-8",
                    //    dataType: "json",
                    //    success: function (output, status) {

                    //        OldDataCount = output.d;
                    //        TransferDataCount = "0";
                    //        myshedule = setInterval(function () { GetTransferDataCount() }, 1000);
                    //debugger;
                    var ReceivingDate = $("#txtReceivingDate").val();
                    var FBE = $("#txtFBE_Transfer").val();
                    var Freight = $("#txtFreightAmount_Transfer").val() == "" ? "0" : $("#txtFreightAmount_Transfer").val();
                    var Handling = $("#txtHandling_Transfer").val() == "" ? "0" : $("#txtHandling_Transfer").val();
                    var OtherCostPerFBE = parseFloat(Freight) + parseFloat(Handling)
					var Warehouse = $("#lstWarehouse").val();
                    var OtherCharges = $("#txtOtherCharges_Transfer").val() == "" ? "0" : $("#txtOtherCharges_Transfer").val();  // Other Charges added by Anand [08/09/2021]
                    debugger;
                    Freight = parseFloat(Freight) + parseFloat(OtherCharges); // Other Charges added by Anand [08/09/2021]
                    if (isNaN(OtherCostPerFBE) || OtherCostPerFBE == 0) {
                        OtherCostPerFBE = 0.000
                    }
                    else {
                        OtherCostPerFBE = OtherCostPerFBE.toFixed(3);
                    }

                    //if (isNaN(FBE) || FBE == 0) {
                    //    FBE = 0.000
                    //}
                    //else {
                    //    FBE = FBE.toFixed(3);
                    //}
                    var TotalBoxes = 0;
                    $('#fgrdUserHeaders tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                count = count + 1;
                                //debugger;
                                var Qty = $(this).find("td div").eq(5)[0].textContent;
                                try {

                                    TotalBoxes += parseInt(Qty);
                                   
                                }
                                catch (err) {

                                }
                            }
                        }
                    });
                    $("#msg").html("Please wait, Data Transfering...  <img src='images/ajax-loader.gif' />");
                    $("#msgbox-select").dialog("open");
                   
                    $("#btntransferincomingdetails").addClass("BloomButtonProcessing");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/TransferIncomingDetails',
                        data: '{"SelectedHeaders":"' + SelectedHeaders + '","UserFile":"WINVNW' + TransferFile + '","ReceivingDate":"' + ReceivingDate + '","OtherCostPerFBE":"' + OtherCostPerFBE + '","Freight":"' + Freight + '","Handling":"' + Handling + '","Warehouse":"' + Warehouse + '","FBE":"' + FBE + '","TotalBoxes":"' + TotalBoxes + '","OtherCharges":"' + OtherCharges + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            console.log(output.d)
                            TransferResult = output.d.split('~');
                            if (TransferResult[0] == "NoSelect") {
                                $.MessageBox("Please select a detail to transfer!!!!");
                                $("#msgbox-select").dialog("close");
                            }
                            else if (TransferResult[0] == "Success") {
                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                                $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
                                $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                                $("#msgbox-select").dialog("close");
                            }
                            else if (TransferResult[0] == "Already Transfered") {
                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                                $.MessageBox("Box Number <b>" + TransferResult[1] + "</b> already transfered to Inventory, please check");
                                $("#msgbox-select").dialog("close");
                            }
                            else if (TransferResult[0] == "Boxnum Zero") {
                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                                $.MessageBox(TransferResult[1]);
                                $("#msgbox-select").dialog("close");
                            }
                            else if (TransferResult[0] == "Other Error") {
                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                                $.MessageBox(TransferResult[1]);
                                $("#msgbox-select").dialog("close");
                            }

                            else {
                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                                $("#msgbox-select").dialog("close");
                            }
                        }
                    });
                    $("#msgbox-select").dialog("close");
                    //    }
                    //});
                }
                else {
                    $.MessageBox("Please select a detail to transfer!!!!");
                    $("#msgbox-select").dialog("close");
                }
            },
            No: function () {
                $("#DivConfirmTransferToUserDialog").dialog("close");
            }
        },
        open: function () {            
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
            //$("#txtTransferFile").val("");
            $("#txtFreightAmount_Transfer").focus();
            $("#txtOtherCharges_Transfer").val("0.000"); //Other Charges added by Anand [08/09/2021]
            LoadWarehouse();
        },
    });
    function GetSalespersonByUser(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTransferFileByUser',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                if (output.d != "0" && output.d != null) {
                    if (parseInt(output.d) > 10) {
                        $("#txtTransferFile").val(output.d)
                    }
                    else {
                        $("#txtTransferFile").val("0" + output.d)
                    }
                }                
                callback(true)
            }
        });
    }
    //STA::20-OCT-2015::to transfer the selected Incoming details to DBF(winvnw99) table
    $("#btntransferincomingdetails").die("click").live("click", function () {
        var count = 0;
        var sumofFBE = 0;
        var Airport = "";
        var SelectedHeaders = "";
        var TotalBoxes = 0;
        $('#fgrdUserHeaders tr').each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    count = count + 1;
                    //debugger;
                    //Calculate sum of fbe for selected rows
                    var currentRowID = $(this).attr("id").replace('row', '')
                    var invoiceNum = $(this).find("td div").eq(9)[0].textContent;
                    var Farm = $(this).find("td div").eq(3)[0].textContent;
                    var Qty = $(this).find("td div").eq(5)[0].textContent;
                    var AWB = $(this).find("td div").eq(2)[0].textContent.replace(/[-]/g, '');
                    try {

                        SelectedHeaders += currentRowID + "&" + invoiceNum + ",";
                        var rowid = $(this).attr("id").replace("row", "") + "_" + invoiceNum; //+ "_" + Farm + "_" + AWB;  
                        //console.log(rowid);
                        //console.log("invoiceNum: " + invoiceNum);
                        FBEValueForThisRow = $("#lblincomingFBE_" + rowid + "").html();
                        Airport = $("#lblincomingAirport_" + rowid + "").html();
                        //2021/08/19
                        //TotalBoxes += Qty;
                        TotalBoxes += parseInt(Qty);
                        if (!isNaN(FBEValueForThisRow) && FBEValueForThisRow != 0) {
                            sumofFBE += parseFloat(FBEValueForThisRow);                            
                        }
                        if ($("#DivAirport").html() == "") {
                            $("#DivAirport").html(Airport);
                        }
                    }
                    catch (err) {

                    }
                }
            }
        });
        try {
            if (count >= 1) {
                var StatusMsg = "";                
                StatusMsg = ValidateIncomingTransferDetails(SelectedHeaders, TotalBoxes);
                if (StatusMsg == "Success") {                    
                    var ReceivingDate = new Date();
                    ReceivingDate.setDate(ReceivingDate.getDate() + 2);
                    $("#txtReceivingDate").val($.datepicker.formatDate('mm/dd/yy', new Date(ReceivingDate)));
                    $("#txtFBE_Transfer").val(sumofFBE.toFixed(3));
                    $("#DivConfirmTransferToUserDialog").dialog("open");

                    var Warehouse = $('#lstWarehouse').val();
                    GetSalespersonByUser(function (callback) {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetFreightByAirportAndHandlingByWarehouse',
                            data: '{"Airport":"' + $("#DivAirport").html() + '","Warehouse":"' + Warehouse + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                //debugger;
                                var result = output.d.split("~");
                                var FreightAmount = result[0];
                                var HandlingCharge = result[1];
                                $("#txtFreightAmount_Transfer").val((parseFloat(FreightAmount) * parseFloat(sumofFBE)).toFixed(3));
                                //                     $("#txtHandling_Transfer").val(parseFloat(HandlingCharge).toFixed(3) * parseFloat(sumofFBE).toFixed(3));
                                $("#txtHandling_Transfer").val(parseFloat(HandlingCharge).toFixed(3));
                                $("#DivAirport").html("");
                                $("#DivWarehouse").html("");
                            }
                        });
                    });
                }
            }
            else {
                $.MessageBox("Please select a detail to transfer!!!!");
                return false;
            }
        }
        catch (err) {

        }
    });
    function ValidateIncomingTransferDetails(SelectedHeaders, TotalBoxes) {
        var ValidateStatus="";   
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/ValidateIncomingDetails',
            data: '{"SelectedHeaders":"' + SelectedHeaders + '","TotalBoxes":"' + TotalBoxes + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var MessageStr = output.d.split('~');
                if (MessageStr[0] == "Boxnum Zero") {
                    $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                    $.MessageBox(MessageStr[1]);
                    ValidateStatus = MessageStr[0];
                }
                else if (MessageStr[0] == "Already Transfered") {
                    $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                    $.MessageBox("Box Number <b>" + MessageStr[1] + "</b> already transfered to Inventory, please check");
                    ValidateStatus = MessageStr[0];
                }
                else if (MessageStr[0] == "Other Error") {
                    $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                    $.MessageBox(MessageStr[1]);
                    ValidateStatus = MessageStr[0];
                }
                else if (MessageStr[0] == "Zero Unit Product") {
                    $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
                    $.MessageBox(MessageStr[1]);
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
    //function GetTransferDataCount() {

    //    if (TransferResult != "" && TransferResult != "NoSelect" && TransferDataCount != "100") {

    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetRecordsCountfromuser',
    //            data: '{"User":"WINVNW' + $("#txtTransferFile").val() + '","ProcessStatus":"Transfer"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (output, status) {

    //                TransferDataCount = output.d;
    //                if (isNaN(output.d)) {
    //                    clearInterval(myshedule);
    //                    $("#progressBar").hide();
    //                    $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
    //                    $('#fgrdUserHeaders tr').removeClass("trChecked");
    //                    $("[id^=POHeaderselect_]").prop("src", "images/check-off.png");
    //                    $("[id^=lblincomweight]").show();
    //                    $("[id^=txtincomweight]").hide();

    //                    $("[id^=lblincomComment]").show();
    //                    $("[id^=txtincomComment]").hide();

    //                    $("[id^=lblincomdimweight]").show();
    //                    $("[id^=txtincomdimweight]").hide();
    //                    $("[id^=lblincommpf]").show();
    //                    $("[id^=txtincommpf]").hide();
    //                    $("[id^=lblincomduties]").show();
    //                    $("[id^=txtincomduties]").hide();
    //                    $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
    //                    $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
    //                    $("#msgbox-select").dialog("open");
    //                }
    //                else {
    //                    $("#progressBar").show();
    //                    progressBar(output.d, $('#progressBar'));
    //                    if (TransferDataCount == "100") {
    //                        clearInterval(myshedule);
    //                        $.ajax({
    //                            type: "POST",
    //                            url: 'BloomService.asmx/ClearManualPOHeaderSelectedSession',
    //                            data: "{}",
    //                            contentType: "application/json; charset=utf-8",
    //                            dataType: "json",
    //                            success: function (output, status) {
    //                                $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
    //                                $('#fgrdUserHeaders tr').removeClass("trChecked");
    //                                $("[id^=POHeaderselect_]").prop("src", "images/check-off.png");
    //                                $("[id^=lblincomweight]").show();
    //                                $("[id^=txtincomweight]").hide();

    //                                $("[id^=lblincomComment]").show();
    //                                $("[id^=txtincomComment]").hide();

    //                                $("[id^=lblincomdimweight]").show();
    //                                $("[id^=txtincomdimweight]").hide();
    //                                $("[id^=lblincommpf]").show();
    //                                $("[id^=txtincommpf]").hide();
    //                                $("[id^=lblincomduties]").show();
    //                                $("[id^=txtincomduties]").hide();
    //                                $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
    //                                $("#DivExecutionResult").html("Data transfer successfully");
    //                                clearInterval(myshedule);
    //                                $("#progressBar").hide();
    //                                $("#msgbox-select").dialog("close");
    //                            }
    //                        });
    //                    }
    //                }
    //            },
    //            error: function (e) {
    //                $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
    //                $("#msgbox-select").dialog("open");
    //            }
    //        });
    //    }
    //    else {
    //        if (TransferDataCount == "100") {
    //            $("[id^=ManualPOHeaderselectall]").prop("src", "images/check-off.png");
    //            $('#fgrdUserHeaders tr').removeClass("trChecked");
    //            $("[id^=POHeaderselect_]").prop("src", "images/check-off.png");
    //            $("[id^=lblincomweight]").show();
    //            $("[id^=txtincomweight]").hide();

    //            $("[id^=lblincomComment]").show();
    //            $("[id^=txtincomComment]").hide();

    //            $("[id^=lblincomdimweight]").show();
    //            $("[id^=txtincomdimweight]").hide();
    //            $("[id^=lblincommpf]").show();
    //            $("[id^=txtincommpf]").hide();
    //            $("[id^=lblincomduties]").show();
    //            $("[id^=txtincomduties]").hide();
    //            $("#btntransferincomingdetails").removeClass("BloomButtonProcessing");
    //            $("#DivExecutionResult").html("Data transfer successfully");
    //            clearInterval(myshedule);
    //            $("#progressBar").hide();
    //            $("#msgbox-select").dialog("close");
    //        }
    //        else {
    //            $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
    //            $("#msgbox-select").dialog("open");
    //        }
    //    }
    //}

    //VEN::31-Oct-2015::For View Header Image
    $("#DivHeaderImageDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 700,
        height: 550,
        modal: true,
        open: function () {
            if ($("#ctl00_LoggedUserType").html() == "vendor" || $("#ctl00_LoggedUserType").html() == "cargo agent")
                $("#trUploadHeaderFiles").show();
            else
                $("#trUploadHeaderFiles").hide();
        }
    });

    //VEN::19-Dec-2015::For View Scanning XML Files
    $("#DivScanningXMLDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 700,
        height: 550,
        modal: true
    });

    //VEN::09-Feb-2016::For View Box Details
    $("#DivBoxDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 900,
        height: 500,
        modal: true
    });


    //VEN::31-Oct-2015::For View Header Image
    $("#DivHeaderDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1080,
        height: 500,
        modal: true,
        //buttons: {
        //    Cancel: function () {
        //        $("#DivHeaderDetails").dialog("close");
        //    }
        //},
        //open: function () {
        //    $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-email')
        //    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        //}
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

    //MANI::07-JUN-2016::To verify User in Incoming With Poq
    $("[id^=btnVerifyUser]").live("click", function () {

        $("#msg").html("Please wait ...  <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");

        var WhereCondition = FramingFilters()
        var Query = $("#fgrdUserHeaders").flexOptions()[0].p.query;
        var QueryType = $("#fgrdUserHeaders").flexOptions()[0].p.qtype;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/VerifyIncomingDetails',
            data: '{"WhereCondition":"' + escape(WhereCondition) + '","Query":"' + Query + '","QueryType":"' + QueryType + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (output.d != "error") {
                    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'Filter', value: WhereCondition }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                }
            }
        });


    });


    function FramingFilters() {
        var condn = "";
        var today = Date.today().toString("MM/dd/yyyy");

        //2021/08/24
        //if ($('#lstFarmFilter').val() === null || $('#lstFarmFilter').val() === 'null') {
        //    window.location.href = "Login.aspx";
        //}

        if ($('#lstFarmFilter').val() != "All") {
            if ($('#lstAWBFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today) {
                    if ($('#lstAWBFilter').val() != null) {
                        condn = "AWB like '%" + $('#lstAWBFilter').val().replace(/-/g, '') + "' and Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                    }
                    else {
                        condn = "h1.Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                    }
                }
                else {
                    if ($('#lstAWBFilter').val() != null) {
                        condn = "AWB like '%" + $('#lstAWBFilter').val() == null ? '' : "'%"+$('#lstAWBFilter').val().replace(/-/g, '') + "' and Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    }
                    else {
                        condn = "h1.Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    }
                }
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    condn = "h1.Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    condn = "h1.Farm like '%" + $('#lstFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }
        else {
            if ($('#lstAWBFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today) {
                    if ($('#lstAWBFilter').val() != null) {
                        condn = "AWB like '%" + $('#lstAWBFilter').val().replace(/-/g, '') + "' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                    }
                    else {
                        condn = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                    }
                }
                else {
                    if ($('#lstAWBFilter').val() != null) {
                        condn = "AWB like '%" + $('#lstAWBFilter').val().replace(/-/g, '') + "' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    }
                    else {
                        condn = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    }
                }
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    condn = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    condn = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }        
        return condn;
    }
    $("#txtScanningValidationReceivingDate").datepicker({

        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtScanningValidationFlightDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());


    $("#txtScanningValidationCargoDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtReceivingDate").datepicker({

        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());


    $("#DivScanningValidationForAWBDialog").dialog({
        autoOpen: false,
        width: 350,
        height: 255,
        modal: true,
        resizable: false,
        title: 'Scanning Validation',
        buttons: {
            Validate: function () {
                var AWB = $("#txtScanningValidationAWB").val();
                //var Farm = $("#txtScanningValidationFarm").val();
                var ReceivingDate = $("#txtScanningValidationReceivingDate").val();
                var CargoDate = $("#txtScanningValidationCargoDate").val();
                var FlightDate = $("#txtScanningValidationFlightDate").val();
                if (AWB.trim() == "") {
                    $(".ScanningValidationYellowWarning").html("Please enter AWB#");
                    $(".ScanningValidationYellowWarning").show();
                    $("#txtScanningValidationAWB").focus();
                    return false;
                }
                    //else if (Farm.trim() == "") {
                    //    $(".ScanningValidationYellowWarning").html("Please enter farm");
                    //    $(".ScanningValidationYellowWarning").show();
                    //    $("#txtScanningValidationFarm").focus();
                    //    return false;
                    //}
                else if (ReceivingDate == "") {
                    $(".ScanningValidationYellowWarning").html("Please choose receiving date");
                    $(".ScanningValidationYellowWarning").show();
                    $("#txtScanningValidationReceivingDate").focus();
                    return false;
                }
                else if (CargoDate == "") {
                    $(".ScanningValidationYellowWarning").html("Please choose cargo date");
                    $(".ScanningValidationYellowWarning").show();
                    $("#txtScanningValidationCargoDate").focus();
                    return false;
                }

                if ($("#txtScanningValidationTransferFile").val().trim() == "" && $("#txtScanningValidationTransferFile").attr("placeholder") == "") {
                    $(".ScanningValidationYellowWarning").html("Please enter User #");
                    $(".ScanningValidationYellowWarning").show();
                    $("#txtScanningValidationTransferFile").focus();
                    return false;
                }
                if ($("#txtScanningValidationTransferFile").val().trim() != "") {
                    var TransferFile = $("#txtScanningValidationTransferFile").val()
                }
                else {
                    var TransferFile = "99"
                }

                $("#msg").html("Please wait ...  <img src='images/ajax-loader.gif' />");
                $("#msgbox-select").dialog("open");

                $("#DivScanningValidationForAWBDialog").dialog("close");
                $(".ScanningValidationYellowWarning").hide();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ScanningValidationForAWBAndFarm',
                    data: '{"AWB":"' + AWB + '","ReceivingDate":"' + ReceivingDate + '","CargoDate":"' + CargoDate + '","FlightDate":"' + FlightDate + '","TransferFile":"WINVNW' + TransferFile + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        //debugger;
                        //$("#msgbox-select").dialog("close");
                        if (output.d == "error") {
                            $("#msgbox-select").dialog("close");
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else if (output.d == "No records found") {
                            $("#msgbox-select").dialog("close");
                            $.MessageBox("No scanned boxes found for this AWB!!!");
                        }
                        else {
                            $("#fgrdUserHeaders").flexReload({ url: '/url/for/refresh' });
                            $("#msgbox-select").dialog("close");
                        }
                    }
                });

            },
            Cancel: function () {
                $("#DivScanningValidationForAWBDialog").dialog("close");
            }
        },
        open: function () {
            $(".ScanningValidationYellowWarning").hide();
            $("#txtScanningValidationAWB").val("");
            //$("#txtScanningValidationFarm").val("");
            $(".ui-dialog-buttonpane button:contains('Validate')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }
    });


    $("#btnShipmentupdate1").live("click", function () {
        if ($("#btnShipmentupdate1").hasClass("BloomButtonDisabled")) {
            return;
        }
        else {
            var ReceivingDate = new Date();
            ReceivingDate.setDate(ReceivingDate.getDate() + 2);

            var FlightDate = new Date();
            var CargoDate = new Date();
            FlightDate.setDate(FlightDate.getDate());
            CargoDate.setDate(CargoDate.getDate() - 1);
            $("#txtScanningValidationFlightDate").val($.datepicker.formatDate('mm/dd/yy', new Date(FlightDate)));
            $("#txtScanningValidationCargoDate").val($.datepicker.formatDate('mm/dd/yy', new Date(CargoDate)));
            $("#txtScanningValidationReceivingDate").val($.datepicker.formatDate('mm/dd/yy', new Date(ReceivingDate)));
            $("#DivScanningValidationForAWBDialog").dialog("open");
        }
    });


    function GetAvailableAWBForTheDate() {
        $("#ImgAvailableAWBs").hide();
        $("#LoaderAWB").show();
        //debugger;
        var FlightDate = $("#txtScanningValidationFlightDate").val();
        var dateArr = FlightDate.split('/');
        FlightDate = dateArr[2] + '-' + dateArr[0] + '-' + dateArr[1];

        $.ajax({
            type: "GET",
            url: 'https://cloud.logiztikalliance.com:5005/logCloudWS/api/ClientesExternosA/ListarTotalesGuiasPorCliente/251/99bOdf4S1W6ZCaC7d6dR9D6/' + FlightDate,
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
      
                if (status == "success") {
                    if (output.length > 0) {
                        var tblHtml = "<table style='margin-left:53px;position:absolute;'>";
                        tblHtml += "<tr><td class='AWBListtd' style='background-color: #dedede;text-align:center'>G&G</td></tr>";
                        $.each(output, function (i, item) {
                            tblHtml += "<tr>" +
                                "<td class='AWBListtd'><a href='#'  class='aAWBclick' style='outline: 0;'>" + item.awb + "</a>" + " (" + item.pieces + ") " + " (" + item.portCode + ") "+"</td>" +
                                "</tr>";
                        })
                        tblHtml += "</table>";
                        $("#AvailableAWBsDialog").html(tblHtml);
                    } else {
                        $("#AvailableAWBsDialog").html("No AWB Available for the day");
                    }
                    $(".aAWBclick").click(function () {
                        var AWB = $(this).html();
                        $("#txtScanningValidationAWB").val(AWB);
                        $("#AvailableAWBsDialog").dialog("close");
                        $("#txtScanningValidationTransferFile").focus();
                    });

                    $("#ImgAvailableAWBs").show();
                    $("#LoaderAWB").hide();
                    $("#AvailableAWBsDialog").dialog('option', 'title', "AWB List For Flight Date :: " + $("#txtScanningValidationFlightDate").val());
                    $("#AvailableAWBsDialog").dialog("open");
                } else {
                    $.growl.notice({ title: "", message: "Something went wrong!!" });
                }
            }
        });

        //*********-------- Commented by Belal on 28th Sept. 2020 -- will not be used anymore *********------------
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetAvailableAwbsFromService',
        //    data: '{"SelectedDate":"' + $("#txtScanningValidationFlightDate").val() + '"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        //        if (output.d != "" && output.d != "error") {
        //            $("#AvailableAWBsDialog").html(output.d);
        //        }
        //        else {
        //            $("#AvailableAWBsDialog").html("No AWB Available for the day");
        //        }

        //        $(".aAWBclick").click(function () {
        //            var AWB = $(this).html();
        //            $("#txtScanningValidationAWB").val(AWB);
        //            $("#AvailableAWBsDialog").dialog("close");
        //            $("#txtScanningValidationTransferFile").focus();
        //            //var buttonsValidate = $("#DivScanningValidationForAWBDialog").dialog("option", "buttons");
        //            //// Calls the event
        //            //buttonsValidate["Validate"]();
        //        });

        //        $("#ImgAvailableAWBs").show();
        //        $("#LoaderAWB").hide();
        //        $("#AvailableAWBsDialog").dialog('option', 'title', "AWB List For Flight Date :: " + $("#txtScanningValidationFlightDate").val());
        //        $("#AvailableAWBsDialog").dialog("open");
        //    }
        //});
    }

    $("#AvailableAWBsDialog").dialog({
        autoOpen: false,
        width: 450,
        height: 300,
        modal: true,
        resizable: false,
        title: 'AWB List For Date :: ' + $("#txtScanningValidationFlightDate").val(),
        buttons: {
            Cancel: function () {
                $("#AvailableAWBsDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#ImgAvailableAWBs").click(function () {
        GetAvailableAWBForTheDate();
    });

    if (("<%=ConfigurationManager.AppSettings("ScanningValidationKey")%>").toString() == "0") {
        $("#btnShipmentupdate").hide();
        $("#btnShipmentupdate1").hide();
        $("#tdShipmentupdate").hide();
        $("#tdShipmentupdate1").hide();
    }
    else if (("<%=ConfigurationManager.AppSettings("ScanningValidationKey")%>").toString() == "1") {
        $("#btnShipmentupdate").show();
        $("#btnShipmentupdate1").hide();
        $("#tdShipmentupdate").show();
        $("#tdShipmentupdate1").hide();
        if ($("#ctl00_LoggedUserType").html() == "vendor") {
            $("#btnShipmentupdate").hide()
            $("#tdShipmentupdate").hide()
        }
    }
    else if (("<%=ConfigurationManager.AppSettings("ScanningValidationKey")%>").toString() == "2") {
        $("#btnShipmentupdate").hide();
        $("#btnShipmentupdate1").show();
        $("#tdShipmentupdate").hide();
        $("#tdShipmentupdate1").show();
        if ($("#ctl00_LoggedUserType").html() == "vendor") {
            $("#btnShipmentupdate1").hide()
            $("#tdShipmentupdate1").hide()
        }
    }
    else {
        $("#btnShipmentupdate").hide();
        $("#btnShipmentupdate1").hide()
        $("#tdShipmentupdate").hide();
        $("#tdShipmentupdate1").hide();
    }
function connectToQb() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        data: '{}',
        url: "DefaultUser.aspx/GetQBAuthUrl",
        success: function (res) {
            if (res.d == "") {
                $.MessageBox("Invalid authorization URL");
            } else {
                window.open(res.d, "_blank", "menubar=0,scrollbars=1,width=780,height=900,top=10")
            }
        },
        error: function () {
            alert('An error has occured!');
        }
    });
}
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
$("#lstWarehouse").change(function () {
    var count = 0;
    var sumofFBE = 0;
    var Warehouse = "";
    var Airport = "";
    $('#fgrdUserHeaders tr').each(function () {
        if ($(this).attr("id") != "row0") {
            //debugger;
            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                count = count + 1;
                //debugger;
                //Calculate sum of fbe for selected rows
                try {
                    var invoiceNum = $(this).find("td div").eq(9)[0].textContent;
                    //var Farm = $(this).find("td div").eq(3)[0].textContent;
                    //var AWB = $(this).find("td div").eq(2)[0].textContent.replace(/[-]/g, '');

                    //var rowid = $(this).attr("id").replace("row", "") + "_" + invoiceNum + "_" + Farm + "_" + AWB;
                    var rowid = $(this).attr("id").replace("row", "") + "_" + invoiceNum;
                    Airport = $("#lblincomingAirport_" + rowid + "").html();
                    FBEValueForThisRow = $("#lblincomingFBE_" + rowid + "").html();
                    if (!isNaN(FBEValueForThisRow) && FBEValueForThisRow != 0) {
                        sumofFBE += parseFloat(FBEValueForThisRow);
                        //alert(sumofFBE.toFixed(3));
                    }
                    if ($("#DivAirport").html() == "") {
                        $("#DivAirport").html(Airport);
                    }                    
                }
                catch (err) {

                }
            }
        }
    });    
    var WH = $("#lstWarehouse").val();
    $("#DivWarehouse").html(WH);
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetFreightByAirportAndHandlingByWarehouse',
        data: '{"Airport":"' + $("#DivAirport").html() + '","Warehouse":"' + $('#lstWarehouse').val() + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {            
            var result = output.d.split("~");
            var FreightAmount = result[0];
            var HandlingCharge = result[1];
            $("#txtFreightAmount_Transfer").val((parseFloat(FreightAmount) * parseFloat(sumofFBE)).toFixed(3));
     //       $("#txtHandling_Transfer").val(parseFloat(HandlingCharge).toFixed(3) * parseFloat(sumofFBE).toFixed(3));
            $("#txtHandling_Transfer").val(parseFloat(HandlingCharge).toFixed(3));
            $("#DivAirport").html("");
            $("#DivWarehouse").html("");
        }
    });

});
</script>
