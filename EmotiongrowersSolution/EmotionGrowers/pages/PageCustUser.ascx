<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustUser.ascx.vb" Inherits="pages_PageCustUser" %>
<link rel="stylesheet" href="css/Filters.css">
<style>
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

    #fgrdCustManualPODetail input[type="text"] {
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
</style>
<div>
    <div class="CustUserslidediv" style="overflow: visible; display: block; height: 50px;">
        <table>
            <tr>
           
                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="CustUserdivHeaderAWB">
                        <table style="width: 100%; height: 100%;" id="CustUsertblAWB">
                            <tr>
                                <td style="font-size: 11px">
                                    <img id="CustUserimgAWB" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                    AWB
                                </td>

                            </tr>
                            <tr id="CustUsertrAWB" style="height: 18px; text-align: center;">
                                <td>
                                    <label class="DivFilterLabelStyle" id="CustUserlblAWBFilter"></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>


                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="CustUserdivHeaderFarm">
                        <table style="width: 100%; height: 100%;" id="CustUsertblFarm">
                            <tr>
                                <td style="font-size: 11px">
                                    <img id="CustUserimgFarm" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                    FARM
                                </td>

                            </tr>
                            <tr id="CustUsertr1" style="height: 18px; text-align: center;">
                                <td>
                                    <label class="DivFilterLabelStyle" id="CustUserlblFarmFilter"></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>

                <td style="vertical-align: top; width: 100px;">
                    <div class="filterbutton" id="CustUserdivHeaderdate">
                        <table style="width: 100%; height: 100%;" id="CustUsertbldate">
                            <tr>
                                <td style="font-size: 11px">
                                    <img id="CustUserimgdate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                    DATE PERIOD
                                </td>

                            </tr>
                            <tr id="CustUsertr2" style="height: 18px; text-align: center;">
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
                                    <input id="btnlookupboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Lookup Box#" />
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
                            <select id="lstCustUserAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="rowcss" id="trFarmtitle">
                <td style="vertical-align: top"></td>
                <td style="vertical-align: top" colspan="5">
                    <div id="divFarmFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 170px;">
                            <select id="lstCustUserFarmFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
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
    <div id="DivCustManualPODetail">
        <table id="fgrdCustManualPODetail"></table>
    </div>
</div>

<%-- VEN::09-Feb-2016:: For view Box details --%>
<div id="DivCustUserBoxDetails" style="display: none">
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
                <table id="fgrdCustUserBoxDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>
<%-- END --%>
<div id="LoggedUserId" runat="server" class="notranslate" style="display: none"></div>
<div id="DivShipmentStatus" runat="server" class="notranslate" style="display: none"></div>

<script>
    var DefaultWC = "";
    var DefLabelPrintDetails = "";
    var IsLabelPrintLogDetailsGridInitialize = false;

    var ShipmentHiddenStatus = $("#ctl00_DivShipmentStatus").html();
    $(".DetailsTitleDiv").show();
    $(document).ready(new function () {
        $("#fgrdCustManualPODetail").flexigrid({
            url: 'BloomService.asmx/GetCustManualPODetailForFgrd',
            dataType: 'xml',
            colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'left', hide: true },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'left', hide: true },
            { display: '<img style="Cursor:pointer;" id="ManualPOselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', hide: true },
            { display: 'AWB', name: 'AWB', width: 85, sortable: true, align: 'left' },
            { display: 'ShipDate', name: 'ShipDate', width: 55, sortable: true, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
            { display: 'Flower', name: 'Flower', width: 50, sortable: true, align: 'left' },
            { display: 'Description', name: 'FlowerName', width: 150, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 18, sortable: true, align: 'left' },
            //{ display: 'Units/bunch', name: 'Units', width: 30, sortable: true, align: 'right' },
            { display: 'Units/Bunch', name: 'UnitsPerBunch', width: 30, sortable: true, align: 'right' },
            { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
            { display: 'Total Units', name: 'Units', width: 40, sortable: true, align: 'right' },
            { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
            { display: 'Total Cost', name: 'TotalCost', width: 50, sortable: true, align: 'right' },
            { display: 'Type', name: 'Type', width: 15, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'CustNumber', width: 25, sortable: true, align: 'left' },
            { display: 'Comments', name: 'Comments', width: 60, sortable: true, align: 'left' },
            { display: 'Agency', name: 'AgencyCode', width: 40, sortable: true, align: 'left' },
            { display: 'Airport', name: 'Airport', width: 30, sortable: true, align: 'left' },
            { display: 'BreakDown', name: 'BreakDown', width: 90, sortable: true, align: 'left' },
            { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left' },
            { display: 'BoxNum', name: 'BoxNumber', width: 35, sortable: true, align: 'left' },
            { display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: true },
            { display: 'Missing', name: 'Missing', width: 30, sortable: true, align: 'left', hide: ShipmentHiddenStatus }
            ],
            searchitems: [
            { display: 'Farm', name: 'Farm' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'FlowerName' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Bunches', name: 'Bunches' },
            { display: 'AWB#', name: 'AWB' },
            { display: 'HAWB#', name: 'HAWB' },
            { display: 'Invoice#', name: 'Invoice' },
            { display: 'PO#', name: 'PONumber' },
            { display: 'BoxCode', name: 'BoxCode' },
            { display: 'BoxNum', name: 'BoxNumber' },
            { display: 'CustNumber', name: 'CustNumber' },
            { display: 'Type', name: 'Type' }
            ],
            showTableToggleBtn: true,
            sortname: "Flower",
            sortorder: "asc",
            usepager: true,
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
            { name: 'Filter', value: DefaultWC }
            ],
            height: $(window).height() - 230,
            //width: $(window).width() - 310,
            striped: true,
            onSuccess: function () {

                //For to show the error
                if ($("#fgrdCustManualPODetail tr#row-2").length > 0) {
                    $("#fgrdCustManualPODetail tr#row-2").hide();
                    $.MessageBox($("#fgrdCustManualPODetail tr#row-2")[0].innerText);
                    return false;
                }

               

                //$('#fgrdCustManualPODetail #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                $('#fgrdCustManualPODetail #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                $('#fgrdCustManualPODetail #row0').addClass("TotalRows")

            }
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
                    $("#CustUserimgdate").attr("src", "images/Filter.png");
                    $("#CustUsertr2").addClass('FilterDivStyle');
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
                    $("#CustUserimgdate").attr("src", "images/Filter.png");
                    $("#CustUsertr2").addClass('FilterDivStyle');
                }
                if ($('#lstCustUserFarmFilter').val() == "All")
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                else
                    DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";

            }
        });

        $("#DivCustManualPODetail .sDiv").css('float', 'left').css('width', '500px');
        $('#DivCustManualPODetail .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivCustManualPODetail .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivCustManualPODetail .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivCustManualPODetail .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -50px').show();
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetFamrsForCustUser',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $('#lstCustUserFarmFilter').empty();
            $('#lstCustUserFarmFilter').append('<option value="All">All</option>');
            var data = output.d;
            //if (data == null) {
            //    LoadFarm();
            //}
            if (data.length > 0) {
                for (var i in data) {
                    var DefFarm = data[i];
                    //DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                    $('#lstCustUserFarmFilter').append('<option value="' + DefFarm.Farm + '">' + DefFarm.Farm + '</option>');
                }
            }

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetAWBNumbersForCustUser',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstCustUserAWBFilter').empty();
                    $('#lstCustUserAWBFilter').append('<option value="All">All</option>');
                    var data = output.d;
                    //if (data == null) {
                    //    LoadFarm();
                    //}
                    if (data.length > 0) {
                        for (var i in data) {
                            var DefAWB = data[i];
                            //DefaultUserFarms += "'" + DefFarm.Farm + "'" + ",";
                            $('#lstCustUserAWBFilter').append('<option value="' + DefAWB.AWB + '">' + DefAWB.AWB + '</option>');
                        }
                    }
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

    //Anitha::02-03-2016::TO ADD DATE FILTER HEADER CLICK EVENTS
    $('#CustUserdivHeaderdate').click(function (event) {
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

    //Anitha::02-03-2016::TO ADD FARM FILTER HEADER CLICK EVENTS
    $('#CustUserdivHeaderFarm').click(function (event) {

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

    $('#CustUserdivHeaderAWB').click(function (event) {

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

                $("#CustUsertr2").addClass('FilterDivStyle');
                $("#lblchosendate1").html($("#txtHeaderDate").val());
                $("#lblchosendate2").html($("#txtHeaderToDate").val());

                $("#divFromDate").datepicker("setDate", Date.parse($("#txtHeaderDate").val()));
                $("#divToDate").datepicker("setDate", Date.parse($("#txtHeaderToDate").val()));

                $("#CustUserimgdate").attr("src", "images/Filter.png");
                $("#divdateFilter").slideToggle();
                //  $("#btnapply").click();
                if ($('#lstCustUserAWBFilter').val() == "All") {
                    if ($('#lstCustUserFarmFilter').val() == "All")
                        DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    else
                        DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                }
                else {
                    if ($('#lstCustUserFarmFilter').val() == "All")
                        DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                    else
                        DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
                }
                $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
            }
        });




    });


    $("[id^=CustUserimgAWB]").live("click", function (e) {
        $("#lstCustUserAWBFilter").val("All");

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#CustUserimgAWB").attr("src", "images/EmptyFilter.png");
            $("#txtAWBFilter").val("");
            $("#CustUserlblAWBFilter").html("");
            $("#CustUsertrAWB").removeClass();
            // $("#btnapply").click();
            $("#divAWBFilter").hide();

            var today = Date.today().toString("MM/dd/yyyy");
            if ($("#lblchosendate").html() == "Today: " + today)
                DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
            else
                DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";

            if ($('#lstCustUserFarmFilter').val() != "All")
                DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and " + DefaultWC;

            $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
            e.stopPropagation();
        }
    });
    $("[id^=CustUserimgFarm]").live("click", function (e) {
        $("#lstCustUserFarmFilter").val("All");

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#CustUserimgFarm").attr("src", "images/EmptyFilter.png");
            $("#txtFarmFilter").val("");
            $("#CustUserlblFarmFilter").html("");
            $("#CustUsertr1").removeClass();
            // $("#btnapply").click();
            $("#divFarmFilter").hide();

            var today = Date.today().toString("MM/dd/yyyy");
            if ($("#lblchosendate").html() == "Today: " + today)
                DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
            else
                DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";

            if ($('#lstCustUserAWBFilter').val() != "All")
                DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and " + DefaultWC;
            $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
            e.stopPropagation();
        }
    });


    $("[id^=CustUserimgdate]").live("click", function (e) {
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

            $("#CustUserimgdate").attr("src", "images/Filter.png");
            $("#CustUsertr2").addClass('FilterDivStyle');
            $("#divdateFilter").hide();
            $.ajax({ //save date to the session 
                url: 'BloomService.asmx/SaveDateSession',
                type: 'POST',
                data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if ($('#lstCustUserFarmFilter').val() == "All")
                        DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                    else
                        DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";

                    if ($('#lstCustUserAWBFilter').val() != "All")
                        DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and " + DefaultWC;
                    $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
                }
            });
            e.stopPropagation();
        }
    });

    $('#lstCustUserFarmFilter').change(function () {
        $("#CustUserlblFarmFilter").html($('#lstCustUserFarmFilter').val());
        $("#CustUsertr1").addClass('FilterDivStyle');
        $("#CustUserimgFarm").attr("src", "images/Filter.png");
        $("#divFarmFilter").slideToggle();
        var today = Date.today().toString("MM/dd/yyyy");
        if ($('#lstCustUserFarmFilter').val() != "All") {
            if ($('#lstCustUserAWBFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }
        else {
            if ($('#lstCustUserAWBFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }
        $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
    });


    $('#lstCustUserAWBFilter').change(function () {
        $("#CustUserlblAWBFilter").html($('#lstCustUserAWBFilter').val());
        $("#CustUsertrAWB").addClass('FilterDivStyle');
        $("#CustUserimgAWB").attr("src", "images/Filter.png");
        $("#divAWBFilter").slideToggle();
        var today = Date.today().toString("MM/dd/yyyy");
        if ($('#lstCustUserAWBFilter').val() != "All") {
            if ($('#lstCustUserFarmFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "AWB like '%" + $('#lstCustUserAWBFilter').val().replace(/-/g, '') + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }
        else {
            if ($('#lstCustUserFarmFilter').val() != "All") {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "Farm like '%" + $('#lstCustUserFarmFilter').val() + "%' and cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
            else {
                if ($("#lblchosendate").html() == "Today: " + today)
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'";
                else
                    DefaultWC = "cast(ShippedDate as date) >= '" + $("#lblchosendate1").html() + "'" + " And " + " cast(ShippedDate as date) <= '" + $("#lblchosendate2").html() + "'";
            }
        }


        $("#fgrdCustManualPODetail").flexOptions({ params: [{ name: 'Filter', value: DefaultWC }], query: "", newp: 1 }).flexReload();
    });

    $("[id^=btnlookupboxdetails]").live("click", function () {

        $("#txtBoxDetails_Farm").val("");
        $("#txtBoxDetails_BoxNum").val("");
        $(".Warning").hide();
        $(".YellowWarning").hide();
        var Farm = '';
        var Boxnum = 0;
        var wharecondition = "Farm='" + Farm + "' and BoxNum=" + Boxnum;
        DefLabelPrintDetails = wharecondition;

        if (IsLabelPrintLogDetailsGridInitialize == false) {
            InitializeLabelPrintLogDetailGrid();
            IsLabelPrintLogDetailsGridInitialize = true;
        }
        else {
            $("#fgrdCustUserBoxDetails").flexOptions({ params: [{ name: 'Filter', value: DefLabelPrintDetails }], query: "", newp: 1 }).flexReload();
        }
        $("#DivCustUserBoxDetails").dialog('option', 'title', 'Get box Details');
        $("#DivCustUserBoxDetails").dialog("open");
    });

    //VEN::09-Feb-2016::For View Box Details
    $("#DivCustUserBoxDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1000,
        height: 500,
        modal: true
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
            $("#fgrdCustUserBoxDetails").flexOptions({ params: [{ name: 'Filter', value: DefLabelPrintDetails }], query: "", newp: 1 }).flexReload();
        }
    }

    function InitializeLabelPrintLogDetailGrid() {
        $("#fgrdCustUserBoxDetails").flexigrid({
            url: 'BloomService.asmx/GetLabelPrintLogsForFgrd',
            dataType: 'xml',
            colModel: [
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
            { display: 'Description', name: 'FlowerName', width: 150, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'Quantity', width: 30, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left' },
            { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
            { display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
            { display: 'Cust#', name: 'CustNumber', width: 40, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 70, sortable: true, align: 'left' },
            { display: 'Application', name: 'ImportedFrom', width: 60, sortable: true, align: 'left' },
            { display: 'Sequence', name: 'Sequence', width: 50, sortable: true, align: 'left', hide: false },
            { display: 'Date', name: 'PrintedDate', width: 120, sortable: true, align: 'left' },
            { display: 'By', name: 'PrintedUser', width: 40, sortable: true, align: 'left' },
            { display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left' },
            { display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left', },
            { display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: true }
            ],
            searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'FlowerName' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Invoice#', name: 'Invoice' },
            { display: 'PO#', name: 'PONumber' },
            { display: 'Customer', name: 'CustNumber' },
            ],
            showTableToggleBtn: true,
            sortname: "PrintedDate",
            sortorder: "desc",
            usepager: true,
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
            { name: 'Filter', value: DefLabelPrintDetails }
            ],
            height: 285,
            width: 970,
            striped: true,
            //onSuccess: function () {
            //    //For to show the error
            //    if ($("#fgrdHeaderDetails tr#row-2").length > 0) {
            //        $("#fgrdHeaderDetails tr#row-2").hide();
            //        $.MessageBox($("#fgrdHeaderDetails tr#row-2")[0].innerText);
            //        return false;
            //    }
            //}
        });
    }

</script>