<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderSummary.ascx.vb" Inherits="pages_PageOrderSummary" %>
<link rel="stylesheet" href="css/Filters.css">
<link rel="stylesheet" href="css/AccordionMenuStyle.css">
<script src="js/Chart.js"></script>

<style type="text/css">
    .filter {
        /*background: url(images/EmptyFilter.png) no-repeat 10px 0px;*/
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    .DivFilterLabelStyle {
        color: #fff;
        font-size: 10px;
        font-weight: bold;
        font-family:sans-serif;
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

          

            #row0 td:nth-child(13) div {
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

    .tooltip-content {
        background: #fff;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, 1);
        border-radius: 5px;
        position: relative;
        width: 248px;
        height: 100%;
        z-index:1005;
    }

</style>

<div id="DivOrderSummaryDialog">
    <div class="slidediv" style="overflow: visible; display: block; height: 50px; ">
        <table>
            <tr>
                <td style="vertical-align: top">
                    <div class="filterbutton" id="divSummarydate" >
                        <table style="width: 100%; height: 100%;" id="tblsummarydate">
                            <tr>
                                <td style="font-size: 11px">
                                    <img id="imgsummarydate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                    DATE PERIOD
                                </td>

                            </tr>
                            <tr id="trsummary2" style="height: 18px; text-align: center;">
                                <td>
                                    <label class="DivFilterLabelStyle" id="lblsummarychosendate"></label>
                                    <label class="DivFilterLabelStyle" style="display: none" id="lblsummarychosendate1"></label>
                                    <label class="DivFilterLabelStyle" style="display: none" id="lblsummarychosendate2"></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                </tr>
                <tr class="rowcss" id="trsummarydatetitle">
                    <td style="vertical-align: top" >
                        <div id="divsummarydateFilter" class="filterdiv" style="display: none; width: 450px; height: 240px; vertical-align: middle">
                            <div class="tooltip-content" style="width: 450px; height: 240px;">
                                <table>
                                    <tr>
                                        <td>From
                                        </td>
                                        <td>
                                            <input type="text" id="txtsummaryfrmdate" style="width: 80px;" />

                                        </td>
                                        <td>To
                                        </td>
                                        <td>
                                            <input type="text" id="txtsummarytodate" style="width: 80px" />

                                        </td>
                                        <td>
                                            <input type="button" class="SmallButton" id="btnsummarydateok" value="Ok" />

                                        </td>
                                        <%--<td>
                                    <input type="button" class="SmallButton" id="btndateclear" value="Clear" />
                                </td>--%>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="divSummaryFromDate" style="max-height: 162px; vertical-align: top;"></div>
                                        </td>
                                        <td colspan="3">
                                            <div id="divSummaryToDate" style="max-height: 162px; vertical-align: top;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>

        </table>
    </div>

    <div id="DivOrderSummary" style="float: left;">
        <table id="fgrdOrderSummary" style="display: block;"></table>
    </div>

 <%--   
<div id="msgbox-select" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msg" class="DeleteDialogMsg"></p>
    </div>
</div>--%>

<div id="DivFilterSummary" runat="server" style="display: none"></div>

</div>

<script type="text/javascript">
    $(document).ready(new function () {
        //$("#txtsummaryfrmdate").focus();

        $(function () {
            $("#divSummaryFromDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtsummaryfrmdate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#divSummaryToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                onSelect: function (Date) {
                    $("#txtsummarytodate").val(Date);
                }
            }).datepicker("setDate", new Date());
            $("#txtsummaryfrmdate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txtsummarytodate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });

        var Filter = $("#ctl00_DivFilterSummary").html();

        $("#fgrdOrderSummary").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderSummaryListSQL',
            dataType: 'xml',
            colModel: [
             //{ display: 'RowNo', name: 'RowNo', width: 75, sortable: true, align: 'left',hide:true },
                { display: 'SLS#', name: 'SALESMAN', width: 50, sortable: true, align: 'left' },
                { display: 'Sales Person', name: 'SalesManName', width: 160, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'Boxes', width: 80, sortable: true, align: 'right' },
                { display: 'Sales', name: 'SALES', width: 80, sortable: true, align: 'right' },
                { display: 'Profit', name: 'PROFIT', width: 80, sortable: true, align: 'right' },
                { display: 'GPM%', name: 'gpm', width: 80, sortable: true, align: 'right' },
                { display: 'Customers', name: 'C', width: 80, sortable: true, align: 'right' },
                { display: 'Invoices', name: 'I', width: 80, sortable: true, align: 'right' },
                 { display: '$/INV', name: 'INV', width: 80, sortable: true, align: 'right' },
                 { display: '$/FBE', name: 'FBE', width: 80, sortable: true, align: 'right' }
            ],
            searchitems: [
                { display: 'SLS#', name: 'SALESMAN' },
                { display: 'Sales Person', name: 'SalesManName' }
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname: "SALES Desc",
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
            autoload: true,
            showTableToggleBtn: false,
            width: 975,
            height: 350,
            striped: true,
            params: [
              { name: 'Filter', value: Filter },
              { name: 'ExportCSV', value: '' },
              {name:'Exclude',value:''}
            ],
            onSuccess: function () {
                debugger;
                $(".imgLoaderForUser").hide();
                $(".imgLoaderForUser").hide();
                //For to show the error
                if ($("#fgrdOrderSummary tr#row-2").length > 0) {
                    $("#fgrdOrderSummary tr#row-2").hide();
                    $.MessageBox($("#fgrdOrderSummary tr#row-2")[0].innerText);
                    return false;
                }

                $('#fgrdOrderSummary #row0').addClass("TotalRows");
                $("#DivOrderSummary #ExportCSV").show();
            },
            onError: function (xhr, status, errorThrown) {
                debugger;
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                    //alert('Error');
                    //$("#DivOrderSummaryDialog").dialog("close");
                    //$("#msg").html("No records found");
                    //$("#msgbox-select").dialog("open");
                    return false;
                }
            }
        });


        $("#DivOrderSummary .sDiv").css('float', 'left').css('width', '550px');
        //$('#DivOrderSummary .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderSummary .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderSummary .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivOrderSummary .pDiv").find(".pDiv2").find(".btnseparator").hide();
        //$("#DivOrderSummary .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0').show();
        //$("#DivOrderSummary .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivOrderSummary .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateSession',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dateoutput, status) {

                var date = dateoutput.d;
                if (date == null || date == "" || date[0] === "" && date[1] === "") {
                    var fdate = "Today: " + $("#txtsummarytodate").val();
                    $("#lblsummarychosendate").html(fdate);
                    $("#lblsummarychosendate1").html($("#txtsummaryfrmdate").val());
                    $("#lblsummarychosendate2").html($("#txtsummarytodate").val());
                    $("#divSummaryFromDate").datepicker("setDate", new Date());
                    $("#divSummaryToDate").datepicker("setDate", new Date());
                    $("#imgsummarydate").attr("src", "images/Filter.png");
                    $("#trsummary2").addClass('FilterDivStyle');
                }
                else {
                    var fdate = date[0] + " to " + date[1];
                    $("#txtsummaryfrmdate").val(date[0]);
                    $("#txtsummarytodate").val(date[1]);
                    $("#lblsummarychosendate").html(fdate);
                    $("#lblsummarychosendate1").html(date[0]);
                    $("#lblsummarychosendate2").html(date[1]);
                    $("#divSummaryFromDate").datepicker("setDate", Date.parse(date[0]));
                    $("#divSummaryToDate").datepicker("setDate", Date.parse(date[1]));
                    $("#imgsummarydate").attr("src", "images/Filter.png");
                    $("#trsummary2").addClass('FilterDivStyle');
                }
            }
        });


    }); //End of document.ready()


    $('#divSummarydate').click(function (event) {
       // debugger;
        $(".rowcss").hide();
        $("#trsummarydatetitle").show();
        if ($('#divsummarydateFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divsummarydateFilter").slideToggle();
        }
        else {
            $("#divsummarydateFilter").slideToggle();
        }

    });
    

    $("[id^=btnsummarydateok]").live("click", function () {

        if ($("#txtsummaryfrmdate").val() != "" && $("#txtsummarytodate").val() == "") {
            $("#msg").html("Please choose ToDate!");
            $("#msgbox-select").dialog("open");

            return false;
        }
        else if ($("#txtsummaryfrmdate").val() == "" && $("#txtsummarytodate").val() != "") {
            $("#msg").html("Please choose From Date!");
            $("#msgbox-select").dialog("open");
            return false;
        }
        else if ($("#txtsummaryfrmdate").val() == "" && $("#txtsummarytodate").val() == "") {
            $("#msg").html("Please choose From Date and ToDate!");
            $("#msgbox-select").dialog("open");
            return false;
        }

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + $("#txtsummaryfrmdate").val() + "','ToDate':'" + $("#txtsummarytodate").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
            }
        });

        var fdate = $("#txtsummaryfrmdate").val() + " to " + $("#txtsummarytodate").val();

        $("#lblsummarychosendate").html(fdate);

        $("#trsummary2").addClass('FilterDivStyle');

        $("#lblsummarychosendate1").html($("#txtsummaryfrmdate").val());
        $("#lblsummarychosendate2").html($("#txtsummarytodate").val());

       
        $("#divSummaryFromDate").datepicker("setDate", Date.parse($("#txtsummaryfrmdate").val()));
        $("#divSummaryToDate").datepicker("setDate", Date.parse($("#txtsummarytodate").val()));

        $("#imgsummarydate").attr("src", "images/Filter.png");
        $("#divsummarydateFilter").slideToggle();

        var OrderDateFilter = "";
        if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
            if ($("#lblsummarychosendate1").html() != "" && $("#lblsummarychosendate2").html() != "")
                OrderDateFilter = "OrderDate >= ctod('" + $("#lblsummarychosendate1").html() + "') and OrderDate <= ctod('" + $("#lblsummarychosendate2").html() + "')";
        }
        else {
            if ($("#lblsummarychosendate1").html() != "" && $("#lblsummarychosendate2").html() != "")
                OrderDateFilter = "OrderDate >= cast('" + $("#lblsummarychosendate1").html() + "' as date) and OrderDate <= cast('" + $("#lblsummarychosendate2").html() + "' as date)";
        }

        $("#fgrdOrderSummary").flexOptions({ params: [{ name: 'Filter', value: "CUSTOMER<>0 and " + OrderDateFilter }, { name: 'ExportCSV', value: '' }, { name: 'Exclude', value: '' }], query: "", newp: 1 }).flexReload();
        
    });


    $("[id^=imgsummarydate]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {

            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtsummaryfrmdate").val(today);
            $("#txtsummarytodate").val(today);
            var fdate = "Today: " + today;
            $("#lblsummarychosendate").html(fdate);
            $("#lblsummarychosendate1").html(today);
            $("#lblsummarychosendate2").html(today);

            $("#divSummaryFromDate").datepicker("setDate", Date.parse(today));
            $("#divSummaryToDate").datepicker("setDate", Date.parse(today));

            $("#imgsummarydate").attr("src", "images/Filter.png");
            $("#trsummary2").addClass('FilterDivStyle');
            $("#divsummarydateFilter").hide();

            $.ajax({ //save date to the session 
                url: 'BloomService.asmx/SaveDateSession',
                type: 'POST',
                data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
            });

            var OrderDateFilter = "";
            if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
            if ($("#lblsummarychosendate1").html() != "" && $("#lblsummarychosendate2").html() != "")
                OrderDateFilter = "OrderDate >= ctod('" + $("#lblsummarychosendate1").html() + "') and OrderDate <= ctod('" + $("#lblsummarychosendate2").html() + "')";
        }
        else {
            if ($("#lblsummarychosendate1").html() != "" && $("#lblsummarychosendate2").html() != "")
                OrderDateFilter = "OrderDate >= cast('" + $("#lblsummarychosendate1").html() + "' as date) and OrderDate <= cast('" + $("#lblsummarychosendate2").html() + "' as date)";
        }

            $("#fgrdOrderSummary").flexOptions({ params: [{ name: 'Filter', value: "CUSTOMER<>0 and " + OrderDateFilter }, { name: 'ExportCSV', value: '' }, { name: 'Exclude', value: '' }], query: "", newp: 1 }).flexReload();

            e.stopPropagation();
        }
    });

</script>
