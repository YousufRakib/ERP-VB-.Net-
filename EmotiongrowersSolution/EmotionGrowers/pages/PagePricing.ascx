<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePricing.ascx.vb" Inherits="pages_PagePricing" %>
<link rel="stylesheet" href="css/Filters.css">
<style type="text/css">
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



    #fgrdInventoryPricing input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
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

    .tdGPMClass {
        text-align: right;
        padding-top: 3px;
        padding-right: 5px;
    }
</style>

<script type="text/javascript">
    document.title = "Pricing";
</script>

<table id="tblInventoryPricing" style="float: left; width: 100%; height: 100%;">
    <tr>
        <td style="vertical-align: top; padding: 5px; margin: 0px;">
            <div id="DivInventoryPricing" style="float: left; width: 100%; height: 100%;">
                <table id="fgrdInventoryPricing" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>

<script type="text/javascript">
    var CustomerUsingKomet = false;

    $(document).ready(new function () {

        if (('<%=ConfigurationManager.AppSettings("IsKometSales")%>').toLowerCase() != "yes") {

            CustomerUsingKomet = true;
        }
        else {
            CustomerUsingKomet = false;
        }

        $("#fgrdInventoryPricing").flexigrid({
            url: 'BloomService.asmx/GetPricingDetail',
            dataType: 'xml',
            colModel: [
                 { display: '<img style="Cursor:pointer; display:none;" id="selectall" src="images/check-off.png"/>', name: 'Selected', width: 40, sortable: false, align: 'center' },
                { display: 'AWB', name: 'AWB', width: 45, sortable: true, align: 'left', process: procMe },
                { display: 'FARM', name: 'FARM', width: 35, sortable: true, align: 'left', process: procMe },
                //{ display: 'Product', name: 'Product', width: 180, sortable: true, align: 'left' },
                { display: 'Cat', name: 'ProductCategory', width: 35, sortable: true, align: 'left', process: procMe },
                { display: 'Color', name: 'Color', width: 120, sortable: true, align: 'left', hide: true },
                { display: 'Variety', name: 'Variety', width: 150, sortable: true, align: 'left', hide: true },
                { display: 'DESCRIPTION', name: 'Productname', width: 230, sortable: true, align: 'left' },
                { display: 'QTY', name: 'QTY', width: 45, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 55, sortable: false, align: 'right' },
                { display: 'UNITS', name: 'UNITS', width: 40, sortable: false, align: 'right' },
                { display: 'A', name: 'A', width: 45, sortable: false, align: 'right' },
                 { display: 'B', name: 'B', width: 45, sortable: false, align: 'right' },
                 { display: 'C', name: 'C', width: 45, sortable: false, align: 'right' },
                 { display: 'GPM%', name: 'GPM', width: 45, sortable: false, align: 'right' },
                 { display: 'COST', name: 'COST', width: 45, sortable: false, align: 'right', hide: false },
                 { display: 'LANDED', name: 'LANDED', width: 60, sortable: false, align: 'right' },
                { display: 'CUST', name: 'CUST', width: 30, sortable: false, align: 'right' },
                { display: 'HOLD', name: 'HOLD', width: 25, sortable: false, align: 'right' },
                  { display: 'FLAG', name: 'FLAG', width: 45, sortable: true, align: 'left' },
                { display: 'DAYS', name: 'Days', width: 45, sortable: false, align: 'right' },
                { display: 'SQLID', name: 'SqlID', width: 35, sortable: true, align: 'right', hide: CustomerUsingKomet },
                { display: 'SQLQTY', name: 'SQLQty', width: 40, sortable: true, align: 'right', hide: CustomerUsingKomet },
                { display: 'nPer0', name: 'nPer0', width: 40, sortable: true, align: 'right', hide: true },
                { display: 'nPer1', name: 'nPer1', width: 40, sortable: true, align: 'right', hide: true },
                { display: 'nPer2', name: 'nPer2', width: 40, sortable: true, align: 'right', hide: true }
            ],
            searchitems: [
             { display: 'Description', name: 'Productname' },
             { display: 'AWB', name: 'LOT' },
            { display: 'FARM', name: 'FARM' },
            //{ display: 'Product', name: 'FLOWER' },
            { display: 'Qty', name: 'Qty' },
            { display: 'Cat', name: 'ProductCategory' },
            //{ display: 'Color', name: 'Color' },
            //{ display: 'Variety', name: 'Variety' },
            { display: 'UOM', name: 'UOM' },
            { display: 'UNITS', name: 'UNITS' },
            { display: 'CUST', name: 'CUST' },
            { display: 'FLAG', name: 'FLAG' },
            { display: 'DAYS', name: 'DAYS' },
            ],
            buttons: [
                { name: 'Update', bclass: 'Update', onpress: UpdatePrice },
                 { name: 'ShowAll', bclass: 'ShowAll', onpress: ShowAll }
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
            height: $(window).height() - 210,
            striped: true,
            onSuccess: function () {

                //For to show the error
                if ($("#fgrdInventoryPricing tr#row-2").length > 0) {
                    $("#fgrdInventoryPricing tr#row-2").hide();
                    $.MessageBox($("#fgrdInventoryPricing tr#row-2")[0].innerText);
                    return false;
                }
                gridFormat()
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
        $('#DivInventoryPricing .pDiv').find('.pDiv2').find('.pGroup').children(1).not('.pReload').hide();
        //$('#DivInventoryPricing .bDiv').css("height", "445px");//vinoth Changes
        $('#DivInventoryPricing .pDiv').css("height", "35px")
        $('#fgrdInventoryPricing').css("margin-bottom", "5px");

    })

    function UpdatePrice(com, grid) {

        var PricingDetails = "";
        var UpdateBreak = false;
        PricingDetails = "<PDetails>"
        $('#fgrdInventoryPricing tr').each(function () {


            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                    var ID = $(this).attr("id").replace("row", "");
                    if ($("#editPriceA_" + ID).val() == "")
                        $("#editPriceA_" + ID).val($("#editPriceA_" + ID).attr("placeholder"));
                    //if ($("#editPriceB_" + ID).val() == "")
                    //    $("#editPriceB_" + ID).val($("#editPriceB_" + ID).attr("placeholder"));
                    //if ($("#editPriceC_" + ID).val() == "")
                    //    $("#editPriceC_" + ID).val($("#editPriceC_" + ID).attr("placeholder"));

                    if ($("#PriceB_" + ID).html() == "")
                        $("#PriceB_" + ID).html($("#PriceB_" + ID).attr("placeholder"));
                    if ($("#PriceC_" + ID).html() == "")
                        $("#PriceC_" + ID).html($("#PriceC_" + ID).attr("placeholder"));


                    if ($("#editCustNum_" + ID).val() == "")
                        $("#editCustNum_" + ID).val($("#editCustNum_" + ID).attr("placeholder"));
                    if ($("#editCsHold_" + ID).val() == "")
                        $("#editCsHold_" + ID).val($("#editCsHold_" + ID).attr("placeholder"));

                    if ($("#editFlag_" + ID).val() == "")
                        $("#editFlag_" + ID).val($("#editFlag_" + ID).attr("placeholder"));

                    PricingDetails += "<PDetail>" +
                    "<ID>" + ID + "</ID>" +
                    "<PriceA>" + $("#editPriceA_" + ID).val() + "</PriceA>" +
                     "<PriceB>" + $("#PriceB_" + ID).html() + "</PriceB>" +
                      "<PriceC>" + $("#PriceC_" + ID).html() + "</PriceC>" +
                    "<CustNo>" + $("#editCustNum_" + ID).val() + "</CustNo>" +
                    "<Hold>" + $("#editCsHold_" + ID).val() + "</Hold>" +
                    "<Flag>" + $("#editFlag_" + ID).val() + "</Flag>" +
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
                        debugger;
                        $('#fgrdInventoryPricing tr').each(function () {

                            if ($(this).attr("id") != "row0") {

                                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                    var ID = $(this).attr("id").replace("row", "");
                                    $("#txtPriceA_" + ID).html($("#editPriceA_" + ID).val())
                                    //$("#txtPriceB_" + ID).html($("#editPriceB_" + ID).val());
                                    //$("#txtPriceC_" + ID).html($("#editPriceC_" + ID).val());
                                    $("#txtCustNum_" + ID).html($("#editCustNum_" + ID).val());
                                    $("#txtCsHold_" + ID).html($("#editCsHold_" + ID).val());
                                    $("#txtFlag_" + ID).html($("#editFlag_" + ID).val());

                                    $("#editPriceA_" + ID).attr("placeholder", $("#editPriceA_" + ID).val());
                                    //$("#editPriceB_" + ID).attr("placeholder", $("#editPriceB_" + ID).val());
                                    //$("#editPriceC_" + ID).attr("placeholder", $("#editPriceC_" + ID).val());
                                    $("#editCustNum_" + ID).attr("placeholder", $("#editCustNum_" + ID).val());
                                    $("#editCsHold_" + ID).attr("placeholder", $("#editCsHold_" + ID).val());
                                    $("#editFlag_" + ID).attr("placeholder", $("#editFlag_" + ID).val());

                                    $("#PriceB_" + ID).attr("placeholder", $("#PriceB_" + ID).html());
                                    $("#PriceC_" + ID).attr("placeholder", $("#PriceC_" + ID).html());

                                    $("#editPriceA_" + ID).val("");
                                    //$("#editPriceB_" + ID).val("");
                                    //$("#editPriceC_" + ID).val("");
                                    //$("#PriceB_" + ID).html("");
                                    //$("#PriceC_" + ID).html("");
                                    $("#editCustNum_" + ID).val("");
                                    $("#editCsHold_" + ID).val("");
                                    $("#editFlag_" + ID).val("");
                                    debugger;
                                    if ($("#fgrdInventoryPricing .trChecked:last").next("tr").attr("id") == undefined) {
                                        nextRow = $("#fgrdInventoryPricing tr")[0].id.replace('row', '');
                                    }
                                    else {
                                        nextRow = $("#fgrdInventoryPricing .trChecked:last").next("tr").attr("id").replace("row", "");
                                    }
                                }
                            }
                        });


                        $("img#selectall").prop("src", "images/check-off.png");
                        $("[id ^= teselect_]").attr("src", "images/check-off.png");
                        $('#fgrdInventoryPricing tr').removeClass("trChecked");

                        $("[id^=teselect_]").prop("src", "images/check-off.png");
                        $("[id^=txtPriceA_]").show();
                        $("[id^=editPriceA_]").hide();
                        //$("[id^=txtPriceB_]").show();
                        //$("[id^=editPriceB_]").hide();
                        //$("[id^=txtPriceC_]").show();
                        //$("[id^=editPriceC_]").hide();

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
    function procMe(celDiv, id) {
        $(celDiv).click(function () {
            //alert(id);
        });
    }
    function ShowAll(com, grid) {
        $("#fgrdInventoryPricing").flexOptions({ params: [{ name: 'Filter', value: "ALL" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    }
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
                            UpdatePrice('Update', $(this));
                        }
                        return false;
                    }
                }
            }
        });
    }

    function ResetFields() {
        $("[id ^= teselect_]").attr("src", "images/check-off.png");
    }

    $("[id^=teselect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var getIdOnly = sourceCtl.attr('id').split('_')[1];
        var priceA = $("#fgrdInventoryPricing tr#row" + getIdOnly + " td:eq(10)")[0].innerText;
        if (parseFloat(priceA).toFixed(2) == "0.00") {
            CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), getIdOnly)
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
            //$("#txtPriceB_" + headers[1]).hide();
            //$("#editPriceB_" + headers[1]).show();
            //$("#txtPriceC_" + headers[1]).hide();
            //$("#editPriceC_" + headers[1]).show();

            $("#txtCustNum_" + headers[1]).hide();
            $("#editCustNum_" + headers[1]).show();

            $("#txtCsHold_" + headers[1]).hide();
            $("#editCsHold_" + headers[1]).show();

            $("#txtFlag_" + headers[1]).hide();
            $("#editFlag_" + headers[1]).show();

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

        //if (count == "0") {


        //}
        //else if ($("#divawb_" + ID.replace("teselect_", "")).html() != "" && $("#divawb_" + ID.replace("teselect_", "")).html() != null &&
        //$("#divhawb_" + ID.replace("teselect_", "")).html() != "" && $("#divhawb_" + ID.replace("teselect_", "")).html() != null) {

        //}
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

    $("[id^=editPriceA_").focusout().live('focusout', function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').split('_')[1];
        // alert($(this).val() + " ID:" + ID);
        var priceA = $(this).val() == "" ? $(this).attr('placeholder') : $(this).val();
        // priceA = $("#fgrdInventoryPricing tr#row" + ID + "  td:eq(10)").find("div a")[0].innerText;
        CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), ID)
        if (priceA == "" || priceA == "0.00") { }
        else { }
    });

    function CalculatePriceBandPriceCByPriceA(PriceA, SelectedId) {
        debugger;
        var priceA = PriceA;
        var LandedCost = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(15)")[0].innerText;
        var nPer0 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(22)")[0].innerText;
        var nPer1 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(23)")[0].innerText;
        var nPer2 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(24)")[0].innerText;
        var actualPriceA = LandedCost * nPer0;
        if (priceA == "0.00") {
            $("#fgrdInventoryPricing tr#row" + SelectedId + "  td:eq(10)").find("div a")[0].innerText = parseFloat(actualPriceA).toFixed(2);
            $("#fgrdInventoryPricing tr#row" + SelectedId + "  td:eq(10)").find("div input[type=text]")[0].placeholder = parseFloat(actualPriceA).toFixed(2);
        }
        if (parseFloat(priceA).toFixed(2) == parseFloat(actualPriceA).toFixed(2)) { }
        else {

        }
        var priceB = (priceA) * (nPer1);
        var priceC = (priceA) * (nPer2);
        $("#fgrdInventoryPricing tr#row" + SelectedId + "  td:eq(11)").find("div label")[0].innerText = parseFloat(priceB).toFixed(2);
        $("#fgrdInventoryPricing tr#row" + SelectedId + "  td:eq(12)").find("div label")[0].innerText = parseFloat(priceC).toFixed(2);
    }
</script>
