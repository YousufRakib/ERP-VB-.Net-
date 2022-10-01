<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageLookupBox.ascx.vb" Inherits="pages_PageLookupBox" %>

<div>
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
                <input type="text" id="txtBoxDetails_Farm" class="AllUpperCaseTextBox" style='width:50px'/>
                <label>BoxNum:</label>
                <input type="text" id="txtBoxDetails_BoxNum" class="NumbersOnly" style='width:70px' />
                <input id="btnEditInvendetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Edit" />
                <input id="btnGetInvenDetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px; visibility: hidden;" value="Print Label" />
                <input id="btnGetShowBoxNumHistory" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Show History" />
                <input id="btnGetboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Get Label Print Log" />
                <input id="btnGetScannedSeqFromXML" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="SCAN XML" />
              </td>
        </tr>
        <tr>
            <td>
                <table id="fgrdBoxDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>

<div id="DivBoxnumSeqDetails" style="display:none;">
        <%--<table id="fgrdBoxnumSeqDetails" style="display: block;"></table>--%>
</div>

<div id="divLookupOrder" style="display:none;" runat="server"></div>
<div id="divLookupBoxnum" style="display:none;" runat="server"></div>
<div id="divLookupFarm" style="display:none;" runat="server"></div>
<div id="InventoryLockLookupReleaseDialog" style="display: none"></div>
<div id="DivForInventoryLockRelease" style="display: none" runat="server"></div>
<div id="DivLoggedInUserType" style="display: none" runat="server"></div>

<script>

    var IsLabelPrintLogDetailsGridInitialize = false;
    $(document).ready(new function () {
                
        $("#txtBoxDetails_Farm").val("");
        $("#txtBoxDetails_BoxNum").val("0");
        $("#btnGetScannedSeqFromXML").hide();
        $("#txtBoxDetails_Farm").attr("disabled", false);
        $("#txtBoxDetails_BoxNum").attr("disabled", false);

        if ($("#ctl00_divLookupOrder").html() != "") {
            $("#txtBoxDetails_Farm").val("");
            $("#txtBoxDetails_BoxNum").val("");

            $("#btnGetScannedSeqFromXML").show();
            $("#txtBoxDetails_Farm").attr("disabled", true);
            $("#txtBoxDetails_BoxNum").attr("disabled", true);
            $("#txtBoxDetails_Farm").val($("#ctl00_divLookupFarm").html());
            $("#txtBoxDetails_BoxNum").val($("#ctl00_divLookupBoxnum").html());

            $("#btnGetScannedSeqFromXML").attr("data-order", $("#ctl00_divLookupOrder").html());
            $("#btnGetScannedSeqFromXML").attr("data-farm", $("#ctl00_divLookupFarm").html());
            $("#btnGetScannedSeqFromXML").attr("data-boxnum", $("#ctl00_divLookupBoxnum").html());
        }

        $(".Warning").hide();
        $(".YellowWarning").hide();
            
        var Farm = $("#txtBoxDetails_Farm").val();
        var Boxnum = $("#txtBoxDetails_BoxNum").val();

        var wharecondition = "Farm='" + Farm + "' and BoxNum=" + Boxnum;
        DefLabelPrintDetails = wharecondition;
        if (IsLabelPrintLogDetailsGridInitialize == false) {
            InitializeLabelPrintLogDetailGrid();
            IsLabelPrintLogDetailsGridInitialize = true;
        }
        else {
            $("#fgrdBoxDetails").flexOptions({ params: [{ name: 'Filter', value: DefLabelPrintDetails }], query: "", newp: 1 }).flexReload();
        }
        //$("#DivBoxDetails").dialog('option', 'title', 'Get box Details');
        //$("#DivBoxDetails").dialog("open");

    });

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
            //{ display: 'Cost', name: 'CostPerUnits', width: 40, sortable: true, align: 'right' },
            { display: 'Cust#', name: 'CustNumber', width: 40, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left' },
            { display: 'Application', name: 'ImportedFrom', width: 60, sortable: true, align: 'left' },
            { display: 'Seq', name: 'Sequence', width: 40, sortable: true, align: 'left', hide: false },
            { display: 'Rack', name: 'Rack', width: 40, sortable: true, align: 'left' },
            { display: 'Date', name: 'PrintedDate', width: 100, sortable: true, align: 'left' },
            { display: 'By', name: 'PrintedUser', width: 40, sortable: true, align: 'left' },
            //{ display: 'BreakDown', name: 'BreakDown', width: 120, sortable: true, align: 'left' },
            //{ display: 'BoxCode', name: 'BoxCode', width: 50, sortable: true, align: 'left', },
            //{ display: 'PO#', name: 'PONumber', width: 60, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: 'HAWB', name: 'HAWB', width: 40, sortable: true, align: 'left', hide: true }
            ],
            searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'FlowerName' },
            { display: 'Boxes', name: 'Quantity' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Invoice', name: 'Invoice' },
           // { display: 'PO#', name: 'PONumber' },
            { display: 'Cust#', name: 'CustNumber' },
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
            width: 875,
            striped: true,
            onSuccess: function () {

            }
        });
        $("#DivBoxDetails .sDiv").css('float', 'left').css('width', '545px');
        $('#DivBoxDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivBoxDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivBoxDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivBoxDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
    }
    
    $("#txtBoxDetails_Farm").keypress(function (e) {
        if (e.which == 13) {
            $("#txtBoxDetails_BoxNum").focus();
        }
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
        
    $("[id^=btnGetInvenDetails]").live("click", function () {
        $(".Warning").hide();
        $(".YellowWarning").hide();
        PrintInventoryLabel();
    });

    function PrintInventoryLabel() {

        var Farm = $("#txtBoxDetails_Farm").val();
        var Boxnum = 0;
        if ($("#txtBoxDetails_BoxNum").val() == "")
            Boxnum = 0;
        else
            Boxnum = $("#txtBoxDetails_BoxNum").val();
     
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInventorybyFarmAndBOXNUM',
            data: "{'FARM':'" + Farm + "','BOXNUM':'" + Boxnum + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    var inven = output.d;
                    var AWB = inven.AWB;
                    var Flower = inven.ProductCode;
                    var DateRec = ToJavaScriptDate(inven.DateRec);
                    var TableName = inven.TableName;
                    var ReceivedPiecesOnly = inven.ReceivedPiecesOnly;

                    var w = window.open('GeneratingPDF.html');
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/PrintInventoryLabel',
                        data: "{'AWB':'" + AWB + "','Farm':'" + Farm + "','Flower':'" + Flower + "','DateRec':'" + DateRec
                                + "','BoxNum':'" + Boxnum + "','TableName':'inven','ReceivedPiecesOnly':'" + ReceivedPiecesOnly + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d != null) {
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
                            else {
                                w.close();
                                $.MessageBox("Please check the inventory data!");
                            }
                        }
                    });
                }
            }
        });
    }

    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
    }

    var LockedInventoryOnEdit = []
    var PageOrderEditLoaded = false;

    $("#btnEditInvendetails").die('click').live('click', function () {
        debugger;
        var farmno = $("#txtBoxDetails_Farm").val();
        var Boxno = $("#txtBoxDetails_BoxNum").val();

        if (farmno == null || farmno == "") {

            $('.YellowWarning').html("Enter Farm number..");
            $('.YellowWarning').show();
            $("#txtBoxDetails_Farm").focus();
            return false;
        }
        if (Boxno == null || Boxno == "") {
            $('.YellowWarning').html("Enter Box number ..");
            $('.YellowWarning').show();
            $("#txtBoxDetails_BoxNum").focus();
            return false;
        }

        $.ajax({
            type: "POST",
            data: '{"Farmno":"' + farmno + '","Boxno":"' + Boxno + '"}',
            url: 'BloomService.asmx/GetinvenIdbyfarmandbox',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d.ID == 0) {
                    $.MessageBox("OOPS! I can not find this box number either on inven or history!");
                    $('.YellowWarning').hide();
                }
                else {
                    $('.YellowWarning').hide();
                    var idno = output.d.ID;
                    var farm = output.d.Farm;
                    var product = output.d.Flower;
                    var inventable = output.d.InvenTbl;
                    //26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
                    var para = "InvenID=" + idno + "&" + "tableName=" + inventable + "&" + "isFromLookup=" + true;
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertLock',
                        data: "{ 'LockRecord': '" + idno + "','Page':'PageInventory','Functionality':'InvenLock_LookUp'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            debugger;
                            var data = output.d;

                            if (data == "Logout") {
                                window.location.href = "Login.aspx"
                            }
                            else if (data == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                            else if (data.indexOf("NotExist") >= 0) {
                                openEditInventoryLookup(idno, farm, product, para, inventable);
                            }
                            else if (data != "") {
                                var tmp = data.split("_");
                                var index = 16;
                                var sentence = $("#ctl00_DivForInventoryLockRelease").html();

                                //Get Sales Permission has rights to modify the printed order
                                var hasPermissionToReleaseLockedInventory = sentence.charAt(index);
                                if (hasPermissionToReleaseLockedInventory.toUpperCase() == "Y" || $("#ctl00_DivLoggedInUserType").html().toLowerCase() == "admin") {
                                    debugger;
                                    $("#InventoryLockLookupReleaseDialog").html("<div><p>This item has been locked by " + tmp[0].toString().toUpperCase() + "!  <b>Are you sure to Release this item?</b></p></div>");
                                    $("#InventoryLockLookupReleaseDialog").data("inData", { ReleaseInventory: idno, ReleaseInvenFarm: farm, ReleaseInvenProduct: product, ReleaseInvenPara: para, ReleaseInventblname: inventable }).dialog("open");
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
                }
            }
        });
    });

//Region "Release - Lock"
    $("#InventoryLockLookupReleaseDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Release Lock",
        width: 350,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var InventoryId = $("#InventoryLockLookupReleaseDialog").data("inData")["ReleaseInventory"];
                var farm = $("#InventoryLockLookupReleaseDialog").data("inData")["ReleaseInvenFarm"];
                var product = $("#InventoryLockLookupReleaseDialog").data("inData")["ReleaseInvenProduct"];
                var para = $("#InventoryLockLookupReleaseDialog").data("inData")["ReleaseInvenPara"];
                var inventable = $("#InventoryLockLookupReleaseDialog").data("inData")["ReleaseInventblname"];

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteLock',
                    data: "{ 'LockRecord': '" + InventoryId + "','Page':'PageLookupBox','Functionality':'InvenLockRelease_Release'}",
                    contentType: "application/json; charset=utf-8",
                    async: false,
                    dataType: "json",
                    success: function (output, status) {
                        var data = output.d;
                        $("#InventoryLockLookupReleaseDialog").dialog("close");
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
                                    openEditInventoryLookup(InventoryId, farm, product, para, inventable);
                                }
                                else if (data != "") {
                                    debugger;
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
                $("#InventoryLockLookupReleaseDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
        //beforeClose: function () {            
        //}
    });

    //Muthu Nivetha M :: 06Mar2020 :: Modified :: Implemented to deactivate the save button in edit for warehouse user
    function openEditInventoryLookup(InvenId, _Farm, _Product,_Para,tblname) {
        debugger;
        LockedInventoryOnEdit.push(InvenId);
        var dialogTitle = "";
        if (tblname == "inven")
            dialogTitle = 'Edit Cooler :: ' + _Farm + "-" + _Product;
        else
            dialogTitle = '<p style="color:red">Edit History' + '::' + _Farm + "-" + _Product + '</p>';

        if (PageOrderEditLoaded == false) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageInventoryEdit.ascx","controlPara":"' + _Para + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('<div id="EditInventoryPODetails">/div>').dialog({
                        title: dialogTitle,
                        autoOpen: false,
                        width: 810,
                        height: 575,
                        modal: true,
                        resizable: false,
                        //closeOnEscape:false,
                        close: function () {
                            ClearLockedInventoryOnEdit(function (callback) {
                            });
                            $('.YellowWarning').hide();
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
                    $("#EditInventoryPODetails").dialog('option', 'title', dialogTitle)
                    $("#EditInventoryPODetails").html(output.d).dialog("open");

                    PageOrderEditLoaded = true;
                    $("#txtBoxDetails_Farm").val("");
                    $("#txtBoxDetails_BoxNum").val("");
                }
            });
        }
        else {
            $("#ctl00_divinventid").html(InvenId);
            $("#ctl00_divtablename").html(tblname);
            $("#EditInventoryPODetails").dialog('option', 'title', dialogTitle)
            inventedit(InvenId, tblname)
            $("#EditInventoryPODetails").dialog("open");
        }
    }

//End Region "Release - Lock"

    $("#btnGetScannedSeqFromXML").die("click").live("click", function () {
        debugger;
        var Order = $(this).attr("data-order");
        var Boxnum = $(this).attr("data-boxnum");
        var Farm = $(this).attr("data-farm");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetBoxnumSequenceFromXML',
            data: "{'Order': '" + Order + "','Farm':'" + Farm + "','Boxnum':'" + Boxnum + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                debugger;
                var res = data.d;
                $("#DivBoxnumSeqDetails").dialog("open");
                $("#DivBoxnumSeqDetails").dialog('option', 'title', 'Farm :: ' + Farm + ' Boxnum :: ' + Boxnum + '');
                $("#DivBoxnumSeqDetails").html(res);
            }
        });
    });

    $("#DivBoxnumSeqDetails").dialog({
        autoOpen: false,
        resizable: false,
        width: 450,
        height: 350,
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