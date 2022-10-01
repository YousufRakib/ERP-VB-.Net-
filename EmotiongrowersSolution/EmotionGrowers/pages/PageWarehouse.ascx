<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageWarehouse.ascx.vb"
    Inherits="pages_PageWarehouse" %>
<script src="js/validation.js"></script>
<style type="text/css">
    .add
    {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    .close
    {
        background: url(images/Filter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    .trSelectedHeader
    {
        background-color: red !important;
    }
    /*#EditWarehouse input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }
       #EditWarehouse textarea {
        background-color:cornsilk;
    }*/
    .leftButtonWHHandling {
        margin-right: 311px !important;
    }
</style>
<div id="DivWarehousepage">
    <table id="fgrdWarehouse" style="display: none;">
    </table>
    <div id="DeleteconfirmWarehouse" style="display: none;" title="Alert">
    </div>
    <div id="OldId" style="display: none;">
    </div>
</div>
<div id="EditWarehouse" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;"
        cellpadding="3">
        <tbody>
            <tr>
                <td>
                    Warehouse
                </td>
                <td>
                    <input type="text" id="txtWarehouseWH" style="width: 50px;" maxlength="5" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <input type="text" id="txtWarehouseName" style="width: 190px;" maxlength="20" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    Address
                </td>
                <td>
                    <input type="text" id="txtWarehouseAddress" style="width: 190px;" maxlength="30"
                        class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    City
                </td>
                <td>
                    <select id="lstWHCity" style="width: 80px;">
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Picking
                </td>
                <td>
                    <input type="text" id="txtWarehousePicking" style="width: 400px;" maxlength="45"
                        class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    Invoices
                </td>
                <td>
                    <input type="text" id="txtWarehouseInvoices" style="width: 400px;" maxlength="45"
                        class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    Shipping Labels
                </td>
                <td>
                    <input type="text" id="txtWarehouseShippingLabels" style="width: 400px;" maxlength="45"
                        class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    Inventory Labels
                </td>
                <td>
                    <input type="text" id="txtWarehouseInventoryLabels" style="width: 400px;" maxlength="45"
                        class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    Fax
                </td>
                <td>
                    <input type="text" id="txtWarehouseFax" style="width: 150px;" maxlength="20" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <textarea id="txtWarehouseEmail" style="width: 500px; height: 55px;" rows="3" maxlength="100"
                        class="AllUpperCaseTextBox"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Handling/FB
                </td>
                <td>
                    <input type="text" id="txtWarehouseHandling" style="width: 120px;" maxlength="20"
                        class="ClsDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    GPM Markup (A)
                </td>
                <td>
                    <input type="text" id="txtWarehouseMarkupA" style="width: 120px;" maxlength="10"
                        class="ClsDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    Markup (B)
                </td>
                <td>
                    <input type="text" id="txtWarehouseMarkupB" style="width: 120px;" maxlength="10"
                        class="ClsDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    Markup (C)
                </td>
                <td>
                    <input type="text" id="txtWarehouseMarkupC" style="width: 120px;" maxlength="10"
                        class="ClsDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div id="divWarehouseHeaderID" style="display: none;">
</div>
<div id="divWarehouseID" style="display: none;">
</div>
<div id="DivViewWHHandlingForFgrd" style="display: none;">
    <table>
        <tr>
            <td>
               <div id="DivWHHandlingGrid">
                <div class="flexigrid">
                    <div class="tDiv">
                        <div class="tDiv2" style="height: 20px;">
                            <div class="link"><a class="links"><span class="add" onclick="addWHHandlingclicked()">Add</span></a></div>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                </div>
                <table id="fgrdWHHandling" style="display: none;"></table>
                <div id="DeleteconfirmWHHandlingId" style="display: none;" title="Alert"></div>
                <div id="OldWHHandlingId" style="display: none;"></div>
            </div>
            </td>
        </tr>
    </table>
</div>
<div id="WHHandlingDialog" style="display: none;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">UOM</label>
                        </td>
                        <td>
                            <div>
                                <select id="lstHandlingWHUOM" style="width: 65px; height: 23px"></select>
                                <input type="hidden" id="hfHandlingWHUOM" />
                                <input type="text" id="txtHandlingWHDesc" style="width: 150px;" class="AllUpperCaseTextBox" maxlength="50">
                            </div>
                        </td>
                    </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px;">Handling</label>
                        </td>
                        <td>
                            <input type="text" id="txtHandlingWHHandling" style="width: 220px;" placeholder="0.000">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<div id="divWHHandlingID" style="display: none;">
</div>
<script type="text/javascript">
    $("#divWHHandlingID").html("0");
    var UOMListForHandling = [];
    $(document).ready(new function () {
        //Added :: Muthu Nivetha M :: 07Feb2020 :: Changed city textbox to dropdown :: Warehouse City/Handling requirements
        LoadAirportForWH();

        /*Warehouse grid loading :: Modified on 19April2018 by Abi*/
        $("#fgrdWarehouse").flexigrid({
            url: 'BloomService.asmx/GetWarehouseForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'WH', name: 'WH', width: 30, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Address', name: 'Address', width: 150, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'City', name: 'City', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
                //{ display: 'Picking', name: 'Picking', width: 50, sortable: false, align: 'left' },
                //{ display: 'Invoice', name: 'Invoice', width: 50, sortable: false, align: 'left' },
                //{ display: 'ShipLabel', name: 'ShipLabel', width: 50, sortable: false, align: 'left' },
                //{ display: 'INVlabel', name: 'INVlabel', width: 50, sortable: false, align: 'left' },
                //{ display: 'Default', name: 'Default', width: 50, sortable: false, align: 'left' },
                //{ display: 'AWB', name: 'AWB', width: 50, sortable: false, align: 'left' },
                //{ display: 'ShippingBI', name: 'ShippingBI', width: 50, sortable: false, align: 'left' },
                
            ],
            searchitems: [
                { display: 'WH', name: 'WH' },
                { display: 'Name', name: 'Name' },
                { display: 'Address', name: 'Address' },
                { display: 'City', name: 'City' },
            ],
            buttons: [
                //{ name: 'Import Warehouse', bclass: 'import', onpress: importWHclicked },
                { name: 'Add', bclass: 'add', onpress: AddWareHouse },
            ],
            showTableToggleBtn: true,
            sortname: "Name",
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
            height: $(window).height() - 250,
            width: 550,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger
                var sel = jQuery("#fgrdWarehouse tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivWarehousepage  #ExportCSV").show();
                }
                
                //For to show the error
                if ($("#fgrdWarehouse tr#row-2").length > 0) {
                    $("#fgrdWarehouse tr#row-2").hide();
                    $.MessageBox($("#fgrdWarehouse tr#row-2")[0].innerText);
                    return false;
                }
                debugger;
                if ($("#divWarehouseID").html() != "0" && $("#fgrdWarehouse #row" + $("#divWarehouseID").html()).css('display') == "table-row") {
                    var id = $("#divWarehouseID").html();
                    $("#fgrdWarehouse [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWarehouse td.unsorted").addClass("sorted");
                    $("#fgrdWarehouse td.sorted").removeClass("unsorted");
                    $("#fgrdWarehouse #row" + id).addClass("trSelectedHeader");
                    $("#fgrdWarehouse #row" + id).removeClass("trSelected");
                    $("#fgrdWarehouse #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdWarehouse #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divWarehouseID").html($("#fgrdWarehouse tr:first td:nth-child(3) div").text());
                    $("#fgrdWarehouse tr:first").addClass("trSelectedHeader trSelected");
                }
            }
        });

        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divWarehouseID").html(id.toString());

                    $("#fgrdWarehouse [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWarehouse #row" + id).addClass("trSelectedHeader");
                    $("#fgrdWarehouse td.unsorted").addClass("sorted");
                    $("#fgrdWarehouse td.sorted").removeClass("unsorted");
                    $("#fgrdWarehouse #row" + id).removeClass("trSelected");
                    $("#fgrdWarehouse #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdWarehouse #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        function importWHclicked(com, grid) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ImportWarehousefromDBF',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if(output.d=="Inserted")
                        $("#fgrdWarehouse").flexReload({ url: '/url/for/refresh' });
                }
            });
        }
    });

    /*Dialog for Add/Edit screen to Save :: Created by Abi :: 19April2018*/
    $("#EditWarehouse").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 790,
        height: $(window).height() - 190,
        title: 'Warehouse Definition Table',
        buttons: {
            Handling: {
                text: 'Handling',
                click: function () {
                    debugger;
                    if ($("#txtWarehouseName").val() == "") {
                        $("#EditWarehouse").next('div').find(".msgui").html("Please enter the Warehouse Name..");
                        $("#EditWarehouse").next('div').find('.msgui').show();
                        ctrlFocus($("#txtWarehouseName"));
                        return false;
                    }
                    var wh = "[" + $("#txtWarehouseWH").attr('placeholder') + "]" + $("#txtWarehouseName").val();
                    LoadWarehouseHandling(wh);
                }
            },
            HandlingReport: {
                class: 'leftButtonWHHandling',
                text: 'Handling Report',
                click: function () {
                }
            },
            Save: function () {
                SaveWarehousedetails();
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            debugger;
            $("#EditWarehouse").next('div').find('.msgui').remove();
            $("#EditWarehouse").next('div').append("<div class='msgui' style='margin-left: 280px;height: 22px;position:fixed;'></div>").css('height', '35px');
            //$("#EditWarehouse").next('div').find(".msgui").css("width", $("#EditWarehouse").width() - $('#EditWarehouse').next('div').find(".ui-dialog-buttonset").width());
            $("#EditWarehouse").next('div').find(".msgui").css("width", '300px');
            $("#EditWarehouse").next('div').find('.msgui').hide();

            $("#txtWarehouseWH").focus();
            $(".ui-dialog-buttonpane button:contains('Handling')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('HandlingReport')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function SaveWarehousedetails() {
        var WarehouseID = $("#divWarehouseID").html();
        var WarehouseWH = $("#txtWarehouseWH").val() == "" ? $("#txtWarehouseWH").attr('placeholder') : $("#txtWarehouseWH").val();

        var WarehouseName = $("#txtWarehouseName").val();
        if (WarehouseName == "") {
            $("#EditWarehouse").next('div').find(".msgui").html("Please enter the Warehouse Name..");
            $("#EditWarehouse").next('div').find('.msgui').show();
            ctrlFocus($("#txtWarehouseName"));
            return false;
        }
        var Address = $("#txtWarehouseAddress").val();
        var City = $("#lstWHCity").val();
        var Picking = $("#txtWarehousePicking").val();
        var Invoice = $("#txtWarehouseInvoices").val();
        var ShipLabel = $("#txtWarehouseShippingLabels").val();
        var INVLabel = $("#txtWarehouseInventoryLabels").val();
        var Email = $("#txtWarehouseEmail").val();
        var HandlingFB = $("#txtWarehouseHandling").val();
        debugger;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SaveWarehouse',
            data: '{"ID":"' + WarehouseID + '","WH":"' + WarehouseWH.toUpperCase() + '","Name":"' + WarehouseName.toUpperCase() + '","Address":"' + escape(Address.toUpperCase()) + '","City":"' + City.toUpperCase() + '","Picking":"' + escape(Picking.toUpperCase()) + '","Invoice":"' + escape(Invoice.toUpperCase()) + '","ShipLabel":"' + escape(ShipLabel.toUpperCase()) + '","INVLabel":"' + escape(INVLabel.toUpperCase()) + '","Email":"' + escape(Email.toUpperCase()) + '","Handling":"' + escape(HandlingFB.toUpperCase()) + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                        $("#EditWarehouse").next('div').find(".msgui").html("Warehouse (<b>" + WarehouseWH.toUpperCase() + "</b>) Already exists!");
                        $("#EditWarehouse").next('div').find('.msgui').show();
                    }
                    else {
                        $("#EditWarehouse").dialog("close")
                        $("#fgrdWarehouse").flexReload({ url: '/url/for/refresh' });
                    }
                }
                else {
                    $("#EditWarehouse").next('div').find(".msgui").html(output.d);
                    $("#EditWarehouse").next('div').find('.msgui').show();
                }
            }
        });
    }

    /*Empty the controls and Reset its values when Add button clicked*/
    function AddWareHouse() {
        debugger;
        LoadAirportForWH()
        $("#divWarehouseID").html("0");
        $("#txtWarehouseWH").val("");
        $("#txtWarehouseWH").attr('placeholder', "");
        $("#txtWarehouseName").val("");
        $("#txtWarehouseAddress").val("");
        $("#lstWHCity").val("");
        $("#txtWarehousePicking").val("");
        $("#txtWarehouseInvoices").val("");
        $("#txtWarehouseShippingLabels").val("");
        $("#txtWarehouseInventoryLabels").val("");

        $("#txtWarehouseFax").val("");
        $("#txtWarehouseEmail").val("");
        $("#txtWarehouseHandling").val("0.00");
        $("#txtWarehouseMarkupA").val("0.00");
        $("#txtWarehouseMarkupB").val("0.00");
        $("#txtWarehouseMarkupC").val("0.00");

        $('.ui-dialog-buttonpane button:contains("Handling")').button().hide();
        $('.ui-dialog-buttonpane button:contains("HandlingReport")').button().hide();
        $("#EditWarehouse").dialog("open");
    }
//    /* Added by Prashant for the Assign Shortcut Keys*/  
//    $(document).keydown(function (e) 
//    {
//        if ($("div[aria-labelledby='ui-dialog-title-DivWarehousePage']").css("display") != "none") 
//        {
//            if ($("div[aria-labelledby='ui-dialog-title-EditWarehouse']").css("display") == "none" && !$(".qsbox").is(":focus")) 
//            {
//                if ((e.which == 65 || e.which == 97)) 
//                {
//                    AddWareHouse();
//                    e.preventDefault();
//                    return false;
//                }
//                if ((e.which == 69 || e.which == 101) || e.which == 13) 
//                {
//                    $(".trSelectedHeader").find("td").eq(1).click();
//                    $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
//                    $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
//                    e.preventDefault();
//                    return false;
//                }
//                if ((e.which == 38)) 
//                {
//                    var row = $(".trSelectedHeader");
//                    var prevrow = row.prev();
//                    if (prevrow.length > 0) 
//                    {
//                        $(prevrow).addClass("trSelectedHeader");
//                        $(row).removeClass("trSelectedHeader");
//                    }
//                    e.preventDefault();
//                    return false;
//                }
//                if ((e.which == 40)) 
//                {
//                    var row = $(".trSelectedHeader");
//                    var nextrow = row.next();
//                    if (nextrow.length > 0) {
//                        $(nextrow).addClass("trSelectedHeader");
//                        $(row).removeClass("trSelectedHeader");
//                    }
//                    e.preventDefault();
//                    return false;
//                }
//            }                
//        }
//    });
    /*Edit the Terms values on Edit screen by Abi*/
    $("[id^=EditWarehouse_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var WarehouseID = ID.replace("EditWarehouse_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseDetailByID',
            data: '{"ID":"' + WarehouseID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var WarehouseDet = output.d;
                    $("#divWarehouseID").html(WarehouseDet.WarehouseID);
                    $("#txtWarehouseWH").val("");
                    $("#txtWarehouseWH").attr('placeholder', WarehouseDet.WH);
                    $("#txtWarehouseName").val(WarehouseDet.Name);
                    $("#lstWHCity").val(WarehouseDet.City);
                    $("#txtWarehouseAddress").val(WarehouseDet.Address);
                    $("#txtWarehousePicking").val(WarehouseDet.Picking);
                    $("#txtWarehouseInvoices").val(WarehouseDet.Invoice);
                    $("#txtWarehouseShippingLabels").val(WarehouseDet.ShipLabel);
                    $("#txtWarehouseInventoryLabels").val(WarehouseDet.INVlabel);
                    $("#txtWarehouseEmail").val(WarehouseDet.Email);
                    $("#txtWarehouseHandling").val(WarehouseDet.Handling);

                    $("#txtWarehouseFax").val("");
//                    $("#txtWarehouseEmail").val("");
//                    $("#txtWarehouseHandling").val("0.000");
                    $("#txtWarehouseMarkupA").val("0.000");
                    $("#txtWarehouseMarkupB").val("0.000");
                    $("#txtWarehouseMarkupC").val("0.000");


                    $("#fgrdWarehouse [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWarehouse #row" + WarehouseID).addClass("trSelectedHeader");
                    $("#fgrdWarehouse td.unsorted").addClass("sorted");
                    $("#fgrdWarehouse td.sorted").removeClass("unsorted");
                    $("#fgrdWarehouse #row" + WarehouseID).removeClass("trSelected");
                    $("#fgrdWarehouse #row" + WarehouseID + " td.sorted").addClass("unsorted");
                    $("#fgrdWarehouse #row" + WarehouseID + " td.unsorted").removeClass("sorted");

                    $('.ui-dialog-buttonpane button:contains("Handling")').button().show();
                    $('.ui-dialog-buttonpane button:contains("HandlingReport")').button().show();
                    $("#EditWarehouse").dialog('option', 'title', "Warehouse Details :: " + WarehouseDet.WH);
                    $("#EditWarehouse").dialog("open");
                }
            }
        });
    });
    var currentRowId = 0;
    /*Confirmation dialog to Delete the terms by Abi*/
    $("[id^=DeleteWarehouse_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        //$.MessageBox($("#fgrdWarehouse tr#row2")[0].innerText);
        if (currentRowId == 0) {
            $("#fgrdWarehouse .trSelectedHeader").removeClass("trSelectedHeader");
            $("#fgrdWarehouse .erow").addClass("erow");
        } else {
            $("#fgrdWarehouse #row" + currentRowId).removeClass("trSelectedHeader");
            $("#fgrdWarehouse #row" + currentRowId).addClass("erow");
        }

        var ID = sourceCtl.attr('id').replace('DeleteWarehouse_', '');    
        currentRowId = ID;
        var $row = $(this).closest('table').children('tr:first');
        $("#fgrdWarehouse #row" + ID).addClass("trSelectedHeader");
        
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) 
            {
                debugger
                var res = output.d;
                $("#DeleteconfirmWarehouse").html("<p>Are you sure to delete<b> " + res.WH + " - " + res.Name + "</b> ?</p>");
                $("#DeleteconfirmWarehouse").dialog("open");
                
            },
            error: function (err) 
            {
                debugger
                alert(err)
            }
        });
    });

    /*Delete terms details from table by Abi*/
    $("#DeleteconfirmWarehouse").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: 
        {
            Yes: function () 
            {
                var adialog = $(this);
                var List = $("#DeleteWarehouse_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteWarehousebyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) 
                    {
                        if (output.d == 'Success') 
                        {
                            adialog.dialog("close");
                            $("#fgrdWarehouse").flexReload({ url: '/url/for/refresh' });
                            //$("#fgrdWarehouse tr:first").addClass("trSelectedHeader trSelected");
                        }
                        else 
                        {
                            adialog.dialog("close");
                            $("#msg").html("There was an error during save the details!");
                            $("#msgbox-select").dialog("open");
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

    /*Enter key navigation by Abi*/
    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            switch($(this).attr('id'))
            {
                case "txtWarehouseWH":
                    $("#txtWarehouseName").focus();
                    return false;
                    break;
                case "txtWarehouseName":
                    $("#txtWarehouseAddress").focus();
                    return false;
                    break;
                case "txtWarehouseAddress":
                    $("#txtWarehousePicking").focus();
                    return false;
                    break;
                case "txtWarehousePicking":
                    $("#txtWarehouseInvoices").focus();
                    return false;
                    break;
                case "txtWarehouseInvoices":
                    $("#txtWarehouseShippingLabels").focus();
                    return false;
                    break;
                case "txtWarehouseShippingLabels":
                    $("#txtWarehouseInventoryLabels").focus();
                    return false;
                    break;
                case "txtWarehouseInventoryLabels":
                    $("#txtWarehouseEmail").focus();
                    return false;
                    break;
                case "txtWarehouseFax":
                    $("#txtWarehouseEmail").focus();
                    return false;
                    break;
                case "txtWarehouseEmail":
                    $("#txtWarehouseHandling").focus();
                    return false;
                    break;
                case "txtWarehouseHandling":
                     $("#EditWarehouse").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                    break;
                //case "txtWarehouseMarkupA":
                //     $("#txtWarehouseMarkupB").focus();
                //    return false;
                //    break;
                //case "txtWarehouseMarkupB":
                //     $("#txtWarehouseMarkupC").focus();
                //    return false;
                //    break;
                //case "txtWarehouseMarkupC":
                //     $("#EditWarehouse").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                //    return false;
                //    break;

                //Region Warehouse handling
                case "lstHandlingWHUOM":
                    $("#txtHandlingWHDesc").focus();
                    break;
                case "txtHandlingWHDesc":
                    $("#txtHandlingWHHandling").focus();
                    break;
                case "txtHandlingWHHandling":
                    $("#WHHandlingDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                    break;
                //End-RegionWarehouse handling
            }
        }
    });

    $("#txtWarehouseEmail").on('keydown', function (e) {
            debugger;
            if (e.which == 13 && !e.shiftKey) {
                $("#txtWarehouseHandling").focus();
                //e.preventDefault();
                return false;
            }
        });

    //Region "Warehouse Handling"
    //Added :: Muthu Nivetha M :: 07Feb2020 :: Changed city textbox to dropdown :: Warehouse City/Handling requirements
    function LoadAirportForWH() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $('#lstWHCity').empty();
                var CODEdata = output.d;
                $('#lstWHCity').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    var tmpAirport = "", tmpName = "";
                    tmpAirport = (CODE.Airport != null || CODE.Airport != "" ? CODE.Airport.toUpperCase() : "");
                    tmpName = (CODE.Name != null || CODE.Name != "" ? CODE.Name.toUpperCase() : "");
                    $('#lstWHCity').append('<option value="' + tmpAirport + '">' + tmpAirport + ' - ' + tmpName + '</option>');
                }
            }
        });
    }

    $("#fgrdWHHandling").flexigrid({
        url: 'BloomService.asmx/GetWHHandlingForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: true, align: 'Center' },
            { display: '', name: '', width: 20, sortable: true, align: 'Center' },
            { display: 'WH', name: 'WH', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left', hide: true },
            { display: 'UOM', name: 'UOM', width: 50, sortable: false, align: 'center' },
            { display: 'Desc', name: 'Description', width: 200, sortable: false, align: 'left' },
            { display: 'Handling', name: 'Handling', width: 150, sortable: false, align: 'right' },
        ],
        searchitems: [
            { display: 'WH', name: 'WH' },
            { display: 'Name', name: 'Name' },
        ],
        showTableToggleBtn: true,
        sortname: "Name",
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
        height: $(window).height() - 250,
        width: 525,
        striped: true,
        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'WarehouseId', value: '' }
        ],
        onSuccess: function () {
            debugger
            var sel = jQuery("#fgrdWHHandling tbody tr");
            var len = sel.length;
            if (len >= 1) {
                $("#DivWHHandlingGrid  #ExportCSV").show();
            }
            // LoadUOMForHandling(function (callback) { });

            //For to show the error
            if ($("#fgrdWHHandling tr#row-2").length > 0) {
                $("#fgrdWHHandling tr#row-2").hide();
                $.MessageBox($("#fgrdWHHandling tr#row-2")[0].innerText);
                return false;
            }
            debugger;
            if ($("#divWHHandlingID").html() != "0" && $("#fgrdWHHandling #row" + $("#divWHHandlingID").html()).css('display') == "table-row") {
                var id = $("#divWHHandlingID").html();
                $("#fgrdWHHandling [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdWHHandling td.unsorted").addClass("sorted");
                $("#fgrdWHHandling td.sorted").removeClass("unsorted");
                $("#fgrdWHHandling #row" + id).addClass("trSelectedHeader");
                $("#fgrdWHHandling #row" + id).removeClass("trSelected");
                $("#fgrdWHHandling #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdWHHandling #row" + id + " td.unsorted").removeClass("sorted");
            }
            else {
                $("#divWHHandlingID").html($("#fgrdWHHandling tr:first td:nth-child(3) div").text());
                $("#fgrdWHHandling tr:first").addClass("trSelectedHeader trSelected");
            }
        }
    });
    

    function LoadWarehouseHandling(WH) {
        $("#fgrdWHHandling").flexOptions({
            params: [{ name: 'ExportCSV', value: '' },
            { name: 'WarehouseId', value: $("#divWarehouseID").html() }], query: "", newp: 1
        }).flexReload();
        $("#DivViewWHHandlingForFgrd").data('inData', { SelectedWH: WH }).dialog("open");
    }

    $("#DivViewWHHandlingForFgrd").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Warehouse Handling",
        width: 550,
        open: function (e) {
            var selectedwh = $("#DivViewWHHandlingForFgrd").data("inData")["SelectedWH"];
            $("#DivViewWHHandlingForFgrd").dialog('option', 'title', "Handling :: " + selectedwh.toUpperCase());
        },
        close: function () {
        }
    });

    function addWHHandlingclicked() {
        $("#divWHHandlingID").html("0");
        $("#txtHandlingWHDesc").val("");
        $("#txtHandlingWHDesc").attr('placeholder', '');
        $("#txtHandlingWHHandling").val("");
        $("#txtHandlingWHHandling").attr("placeholder", parseFloat(0).toFixed(3));
        $("#lstHandlingWHUOM").val("");
        $("#hfHandlingWHUOM").val("");
        LoadUOMForHandling(function (callback) { });
        $("#WHHandlingDialog").dialog('option', 'title', "Add Handling");
        $("#WHHandlingDialog").dialog("open");
    }

    $("#WHHandlingDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Add Recipe",
        width: 450,
        height: 150,
        buttons: {
            Save: function () {
                debugger
                SaveUpdateWHHandling();
            },
            Cancel: function () {
                $("#WHHandlingDialog").dialog("close");
            },
        },
        open: function (e) {
            debugger;
            ctrlFocus($("#txtHandlingWHDesc"));
            $("#WHHandlingDialog").next('div').find('.msgui').remove();
            $("#WHHandlingDialog").next('div').append("<div class='msgui' style='height: 22px;position:fixed;'></div>").css('height', '35px');
            $("#WHHandlingDialog").next('div').find(".msgui").css("width", '239px');
            $("#WHHandlingDialog").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {

        }
    });

    function LoadUOMForHandling(callback) {
        debugger;
        var Farm ="";
        var length = $('#lstHandlingWHUOM > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForWHHandling',
                data: "{'FarmCode':'" + Farm + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    if (output.d != null) {
                        UOMListForHandling = [];
                        $('#lstHandlingWHUOM').empty();
                        UOMList = [];
                        UOMList = output.d;
                        var UOMdata = output.d;
                        for (var i in UOMdata) {
                            var UOM = UOMdata[i];
                            UOMListForHandling.push({ "UOM": UOM.UOM, "Name": UOM.Name });
                            if ($("#lstHandlingWHUOM").html().indexOf('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>') == -1) {
                                $('#lstHandlingWHUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
                            }
                        }

                        if ($("#hfHandlingWHUOM").val() != "" && $("#hfHandlingWHUOM").val() != 0)
                            $('#lstHandlingWHUOM').val($("#hfHandlingWHUOM").val()).change();
                        else
                            $('#lstHandlingWHUOM').val("QB").change();
                    }
                    callback(true);
                }
            });
        }
        else {
            var WH_HandlingId=$("#divWHHandlingID").html();
            if ($("#hfHandlingWHUOM").val() == "" && WH_HandlingId == "0") {
                $('#lstHandlingWHUOM').val("QB").change()
            }
            else {
                $('#lstHandlingWHUOM').val($("#hfHandlingWHUOM").val()).change();
            }
            callback(true);
        }
    }

    $('#lstHandlingWHUOM').change(function () {
        var tmpuom = "", tmpname = "";
        var selecteduom = $('#lstHandlingWHUOM').val();
        for (var i = 0; i <= UOMListForHandling.length - 1; i++) {
            if (UOMListForHandling[i]["UOM"] == selecteduom) {
                tmpuom = UOMListForHandling[i]["UOM"];
                tmpname = UOMListForHandling[i]["Name"];
            }
        }
        $("#txtHandlingWHDesc").val("");
        $("#txtHandlingWHDesc").attr('placeholder', tmpname);
        //$("#hfHandlingWHUOM").val(tmpuom);
        });

    function SaveUpdateWHHandling() {
        debugger;
        var WH_HandlingId=$("#divWHHandlingID").html();
        var WarehouseID = $("#divWarehouseID").html();
        var WHUOM = $("#lstHandlingWHUOM").val();
        var WH_HandlingDesc = (($("#txtHandlingWHDesc").val() == "") ? $("#txtHandlingWHDesc").attr('placeholder') : $("#txtHandlingWHDesc").val());
        var WH_Handling = (($("#txtHandlingWHHandling").val() == "") ? $("#txtHandlingWHHandling").attr('placeholder') : $("#txtHandlingWHHandling").val());

        if (WHUOM == "" || WHUOM == null || WHUOM == undefined) {
            $("#WHHandlingDialog").next('div').find(".msgui").html("Please Select WH..");
            $("#WHHandlingDialog").next('div').find('.msgui').show();
            ctrlFocus($("#lstHandlingWHUOM"));
            return false;
        }
        if (WH_HandlingDesc == "" || WH_HandlingDesc == null || WH_HandlingDesc == undefined) {
            $("#WHHandlingDialog").next('div').find(".msgui").html("Please enter Handling Description..");
            $("#WHHandlingDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtHandlingWHDesc"));
            return false;
        }
        if (WH_Handling == "" || WH_Handling == null || WH_Handling == undefined) {
            $("#WHHandlingDialog").next('div').find(".msgui").html("Please enter Handling..");
            $("#WHHandlingDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtHandlingWHHandling"));
            return false;
        }
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveWarehouseHandling",
            data: "{'Id':'" + WH_HandlingId + "','WarehouseId':'" + WarehouseID + "','UOM':'" + WHUOM + "','Desc':'" + WH_HandlingDesc.toUpperCase() + "','Handling':'" + WH_Handling + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var res = output.d;
                if (output.d == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d.toLowerCase().indexOf("UOM EXIST ALREADY".toLowerCase()) >= 0) {
                    $("#WHHandlingDialog").next('div').find(".msgui").html("UOM (<b>" + WHUOM.toUpperCase() + "</b>) Already exists for this Warehouse!");
                    $("#WHHandlingDialog").next('div').find('.msgui').show();
                }
                else {
                    $("#WHHandlingDialog").dialog("close");
                    $("#fgrdWHHandling").flexReload({ url: '/url/for/refresh' });
                }
            }
        });
    }

    $('#txtHandlingWHHandling').keypress(function (event) {
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            //alert('hello');
            if ((event.which != 46 || $(this).val().indexOf('.') != -1)) {
            }
            event.preventDefault();
        }
        if (this.value.indexOf(".") > -1 && (this.value.split('.')[1].length > 2)) {
            event.preventDefault();
        }
    });

    $("[id^=EditWHHandling_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var WH_HandlingID = ID.replace("EditWHHandling_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWHHandlingDetailByID',
            data: '{"ID":"' + WH_HandlingID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var WH_HandlingDet = output.d;
                    $("#divWHHandlingID").html(WH_HandlingDet.WHHandlingChargeId);
                    $("#lstHandlingWHUOM").val("");
                    $("#hfHandlingWHUOM").val(WH_HandlingDet.UOM);
                    LoadUOMForHandling(function (callback) { });
                    $("#txtHandlingWHDesc").val("");
                    $("#txtHandlingWHDesc").attr('placeholder', WH_HandlingDet.Description);
                    $("#txtHandlingWHHandling").val(WH_HandlingDet.Handling);

                    $("#fgrdWHHandling [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWHHandling #row" + WH_HandlingID).addClass("trSelectedHeader");
                    $("#fgrdWHHandling td.unsorted").addClass("sorted");
                    $("#fgrdWHHandling td.sorted").removeClass("unsorted");
                    $("#fgrdWHHandling #row" + WH_HandlingID).removeClass("trSelected");
                    $("#fgrdWHHandling #row" + WH_HandlingID + " td.sorted").addClass("unsorted");
                    $("#fgrdWHHandling #row" + WH_HandlingID + " td.unsorted").removeClass("sorted");

                    $("#WHHandlingDialog").dialog('option', 'title', "");
                    $("#WHHandlingDialog").dialog("open");
                }
            }
        });
    });

    var currentHandlingRowId = 0;
    $("[id^=DeleteWHHandling_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        if (currentHandlingRowId == 0) {
            $("#fgrdWHHandling .trSelectedHeader").removeClass("trSelectedHeader");
            $("#fgrdWHHandling .erow").addClass("erow");
        } else {
            $("#fgrdWHHandling #row" + currentHandlingRowId).removeClass("trSelectedHeader");
            $("#fgrdWHHandling #row" + currentHandlingRowId).addClass("erow");
        }

        var ID = sourceCtl.attr('id').replace('DeleteWHHandling_', '');
        currentHandlingRowId = ID;
        var $row = $(this).closest('table').children('tr:first');
        $("#fgrdWHHandling #row" + ID).addClass("trSelectedHeader");

        $('#OldWHHandlingId').html(ID);
        $("#DeleteconfirmWHHandlingId").html("<p>Are you sure to delete selected UOM ?</p>");
        $("#DeleteconfirmWHHandlingId").dialog("open");
    });

    $("#DeleteconfirmWHHandlingId").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons:
        {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteWHHandling_" + $("#OldWHHandlingId").html());
                var ID = $("#OldWHHandlingId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteWHHandlingByID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdWHHandling").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            adialog.dialog("close");
                            $("#msg").html("There was an error during save the details!");
                            $("#msgbox-select").dialog("open");
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

    //End Region "Warehouse Handling"
</script>
