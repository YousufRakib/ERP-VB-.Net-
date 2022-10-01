<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageProdCategories.ascx.vb" Inherits="pages_PageProdCategories" %>

<script src="js/validation.js"></script>
<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    .close {
        background: url(images/Filter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    .trSelectedHeader {
        background-color: red !important;
    }
    /*#EditProdCat input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
</style>

<table>
    <tr>
        <td>

            <div id="DivProdCatPage">
                <table id="fgrdProdCat" style="display: none;"></table>
                <div id="DeleteConfirmProdCat" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditProdCat" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 150px;">Category</td>
                <td>
                    <input type="text" id="txtProdCatCategory" style="width: 30px; text-transform: uppercase;" maxlength="3">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" id="txtProdCatName" style="width: 200px; text-transform: uppercase;" maxlength="15">
                </td>
            </tr>
            <tr>
                <td>Sold by the</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtProdCatSoldas" style="width: 25px;" maxlength="2">
                    <label style="margin-left: 100px;">Minimum units</label>
                    <input type="text" id="txtProdCatMinUnits" style="width: 80px; margin-left: 20px; text-align:right;" maxlength="5"  class="ClsNumbersOnly">
                </td>
            </tr>
            <tr>
                <td>Minimum Price</td>
                <td>
                    <input type="text" id="txtProdCatMinPrice" style="width: 80px; text-align:right;" maxlength="10"  class="ClsDecimalsOnly">
                    <label style="margin-left: 45px;">Maximum Price</label>
                    <input type="text" id="txtProdCatMaxPrice" style="width: 80px; margin-left: 20px; text-align:right;" maxlength="10"  class="ClsDecimalsOnly">
                </td>
            </tr>
            <tr>
                <td>Type</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtProdCatType" style="width: 100px;"  maxlength="10" >
                    <label style="margin-left: 25px;">Expiration Days</label>
                    <input type="text" id="txtProdCatExpDays" style="width: 25px; margin-left: 12px; text-align:right;" maxlength="3"  class="ClsNumbersOnly">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td></td>
                <td style="/* float: right; */">
                    <label style="margin-left: 135px;">PRICE  A</label>
                    <label style="margin-left: 40px;">PRICE  B</label>
                    <label style="margin-left: 40px;">PRICE  C</label>
                </td>
            </tr>
            <tr>
                <td style="/* padding-right: 200px; */">Markup Percentages</td>
                <td>
                    <input type="text" id="txtProdCatPer0" style="width: 30px; margin-left: 140px; text-align:right;" maxlength="5" class="clsNegativDecimals">
                    <label>%</label>
                    <input type="text" id="txtProdCatPer1" style="width: 30px; margin-left: 45px; text-align:right;" maxlength="5" class="clsNegativDecimals">
                    <label >%</label>
                    <input type="text" id="txtProdCatPer2" style="width: 30px; margin-left: 45px; text-align:right;" maxlength="5" class="clsNegativDecimals">
                    <label>%</label>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divProdCatID" style="display:none;"></div>


<script>
    $(document).ready(new function () {
        /*Load product categories grid details by Abi*/
        $("#fgrdProdCat").flexigrid({
            url: 'BloomService.asmx/GetProdCatDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Type', name: 'TYPE', width: 50, sortable: true, align: 'left',process:HeaderRowClick },
                { display: 'Product Name', name: 'NAME', width: 140, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Class', name: 'MainType' , width: 80, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Markups', name: '', width: 80, sortable: true, align: 'left', process: HeaderRowClick },
                { display: '/Units/Days', name: '', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Type', name: 'TYPE' },
                { display: 'Product Name', name: 'NAME' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewProdCat },
            ],
            showTableToggleBtn: true,
            sortname: "Type",
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
            height: $(window).height() - 270,
	        width:550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;

                /*Add Export button if grid has rows :: Added by Ani :: 28Sep2018*/
                var sel = jQuery("#fgrdProdCat tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivProdCatPage  #ExportCSV").show();
                }

                if ($("#divProdCatID").html() != "0" && $("#fgrdProdCat #row" + $("#divProdCatID").html()).css('display') == "table-row") {
                    var id = $("#divProdCatID").html();
                    $("#fgrdProdCat [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdProdCat td.unsorted").addClass("sorted");
                    $("#fgrdProdCat td.sorted").removeClass("unsorted");
                    $("#fgrdProdCat #row" + id).addClass("trSelectedHeader");
                    $("#fgrdProdCat #row" + id).removeClass("trSelected");
                    $("#fgrdProdCat #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdProdCat #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divProdCatID").html($("#fgrdProdCat tr:first td:nth-child(3) div").text());
                    $("#fgrdProdCat tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    /*Selected row higlighted with red color by Abi*/
    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divProdDetailsID").html(id.toString());

                $("#fgrdProdCat [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdProdCat #row" + id).addClass("trSelectedHeader");
                $("#fgrdProdCat td.unsorted").addClass("sorted");
                $("#fgrdProdCat td.sorted").removeClass("unsorted");
                $("#fgrdProdCat #row" + id).removeClass("trSelected");
                $("#fgrdProdCat #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdProdCat #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $("#EditProdCat").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 600,
        height: $(window).height() - 380,
        title: 'Product Categories Maintenance',
        buttons: {
            Save: function () {
                var ProdCatID = $("#divProdCatID").html();
                var ProdCatType = $("#txtProdCatCategory").val() == "" ? $("#txtProdCatCategory").attr('placeholder') : $("#txtProdCatCategory").val();
                if (ProdCatType == "") {
                    $("#EditProdCat").next('div').find(".msgui").html("Please enter Product Category..");
                    $("#EditProdCat").next('div').find('.msgui').show();
                    ctrlFocus($("#txtProdCatType"));
                    return false;
                }
                var ProdCatName = $("#txtProdCatName").val();
                var Soldas = $("#txtProdCatSoldas").val() == "" ? $("#txtProdCatSoldas").attr('placeholder') : $("#txtProdCatSoldas").val();
                var MinUnits = $("#txtProdCatMinUnits").val() == "" ? $("#txtProdCatMinUnits").attr('placeholder') == "" ? "0" : $("#txtProdCatMinUnits").attr('placeholder') : $("#txtProdCatMinUnits").val();
                var ExpirationDays = $("#txtProdCatExpDays").val() == "" ? $("#txtProdCatExpDays").attr('placeholder') == "" ? "0" : $("#txtProdCatExpDays").attr('placeholder') : $("#txtProdCatExpDays").val();
                //Add by Prashant on 05 Aug 2019 for save min max price
                var MinPrice = $("#txtProdCatMinPrice").val() == "" ? $("#txtProdCatMinPrice").attr('placeholder') == "" ? "0" : $("#txtProdCatMinPrice").attr('placeholder') : $("#txtProdCatMinPrice").val();
                var MaxPrice= $("#txtProdCatMaxPrice").val() == "" ? $("#txtProdCatMaxPrice").attr('placeholder') == "" ? "0" : $("#txtProdCatMaxPrice").attr('placeholder') : $("#txtProdCatMaxPrice").val();

                var Percent0 = $("#txtProdCatPer0").val() == "" ? $("#txtProdCatPer0").attr('placeholder') == "" ? "0" : $("#txtProdCatPer0").attr('placeholder') : $("#txtProdCatPer0").val();
                var Percent1 = $("#txtProdCatPer1").val() == "" ? $("#txtProdCatPer1").attr('placeholder') == "" ? "0" : $("#txtProdCatPer1").attr('placeholder') : $("#txtProdCatPer1").val();
                var Percent2 = $("#txtProdCatPer2").val() == "" ? $("#txtProdCatPer2").attr('placeholder') == "" ? "0" : $("#txtProdCatPer2").attr('placeholder') : $("#txtProdCatPer2").val();
                var MainType = $("#txtProdCatType").val() == "" ? $("#txtProdCatType").attr('placeholder') : $("#txtProdCatType").val();
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveProdCat',//ID, ProdCatType, ProdCatName, Soldas, Units, Days, Percent0, Percent1, Percent2
                    data: '{"ID":"' + ProdCatID + '","ProdCatType":"' + ProdCatType.toUpperCase() + '","ProdCatName":"' + ProdCatName.toUpperCase() +
                        '","Soldas":"' + Soldas.toUpperCase() + '","Units":"' + MinUnits + '","Days":"' + ExpirationDays + '","Percent0":"' + Percent0 + '","Percent1":"' + Percent1 +
                        '","Percent2":"' + Percent2 + '","MinPrice":"' + MinPrice + '","MaxPrice":"' + MaxPrice + '","MainType":"' + MainType + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditProdCat").next('div').find(".msgui").html("Category (<b>" + ProdCatType.toUpperCase() + "</b>) Already exists!");
                                $("#EditProdCat").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditProdCat").dialog("close")
                                $("#fgrdProdCat").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditProdCat").next('div').find(".msgui").html(output.d);
                            $("#EditProdCat").next('div').find('.msgui').show();
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            debugger

            $("#EditProdCat").next('div').find('.msgui').remove();
            $("#EditProdCat").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditProdCat").next('div').find(".msgui").css("width", $("#EditProdCat").width() - $('#EditProdCat').next('div').find(".ui-dialog-buttonset").width());
            $("#EditProdCat").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewProdCat() {
        debugger;
        $("#divProdCatID").html("0");       
        $("#txtProdCatCategory").val("");
        $("#txtProdCatCategory").attr('placeholder',"");
        $("#txtProdCatName").val("");
        $("#txtProdCatSoldas").val("");
        $("#txtProdCatSoldas").attr("placeholder", "");
        $("#txtProdCatMinUnits").val("");
        $("#txtProdCatMinUnits").attr("placeholder", "");
        $("#txtProdCatMinPrice").val("0.0000");
        $("#txtProdCatMaxPrice").val("0.0000");
        $("#txtProdCatType").val("");
        $("#txtProdCatExpDays").val("");
        $("#txtProdCatExpDays").attr("placeholder","");

        $("#txtProdCatPer0").val("");
        $("#txtProdCatPer0").attr('placeholder', "");
        $("#txtProdCatPer1").val("");
        $("#txtProdCatPer1").attr('placeholder', "");
        $("#txtProdCatPer2").val("");
        $("#txtProdCatPer2").attr('placeholder', "");

        $("#EditProdCat").dialog("open");
    }

    $("[id^=EditProdCat_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ProdCatID = ID.replace("EditProdCat_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetProdCatDetailByID',
            data: '{"ID":"' + ProdCatID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var ProdCatDet = output.d;
                    $("#divProdCatID").html(ProdCatDet[0].ID);
                    $("#txtProdCatCategory").val("");
                    $("#txtProdCatCategory").attr('placeholder', ProdCatDet[0].TYPE);
                    $("#txtProdCatName").val(ProdCatDet[0].NAME);
                    $("#txtProdCatSoldas").val("");
                    $("#txtProdCatSoldas").attr('placeholder',ProdCatDet[0].SOLDAS);                    
                    
                    $("#txtProdCatType").val("");
                    $("#txtProdCatType").attr("placeholder", ProdCatDet[0].MainType);

                    $("#txtProdCatMinUnits").val("");
                    $("#txtProdCatMinUnits").attr("placeholder", ProdCatDet[0].UNITS);

                    $("#txtProdCatExpDays").val("");
                    $("#txtProdCatExpDays").attr("placeholder", ProdCatDet[0].DAYS);

                    $("#txtProdCatPer0").val("");
                    $("#txtProdCatPer0").attr('placeholder', ProdCatDet[0].PERCENT0);
                    $("#txtProdCatPer1").val("");
                    $("#txtProdCatPer1").attr('placeholder', ProdCatDet[0].PERCENT1);
                    $("#txtProdCatPer2").val("");
                    $("#txtProdCatPer2").attr('placeholder', ProdCatDet[0].PERCENT2);

                    $("#txtProdCatMinPrice").val("");
                    $("#txtProdCatMinPrice").attr('placeholder',parseFloat(ProdCatDet[0].MINPRICE).toFixed(4));
                    $("#txtProdCatMaxPrice").val("");
                    $("#txtProdCatMaxPrice").attr('placeholder',parseFloat(ProdCatDet[0].MAXPRICE).toFixed(4)) ;

                    $("#fgrdProdCat [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdProdCat #row" + ProdCatID).addClass("trSelectedHeader");
                    $("#fgrdProdCat td.unsorted").addClass("sorted");
                    $("#fgrdProdCat td.sorted").removeClass("unsorted");
                    $("#fgrdProdCat #row" + ProdCatID).removeClass("trSelected");
                    $("#fgrdProdCat #row" + ProdCatID + " td.sorted").addClass("unsorted");
                    $("#fgrdProdCat #row" + ProdCatID + " td.unsorted").removeClass("sorted");

                    $("#EditProdCat").dialog('option', 'title', "Product Categories Maintenance :: " + ProdCatDet[0].TYPE);
                    $("#EditProdCat").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteProdCat_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteProdCat_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetProdCatDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmProdCat").html("<p>Are you sure to delete<b> " + res[0].TYPE + " - " + res[0].NAME + "</b> ?</p>");
                $("#DeleteConfirmProdCat").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmProdCat").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteProdCat_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteProdCatbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdProdCat").flexReload({ url: '/url/for/refresh' });
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
            $("#txtProdCatType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtProdCatCategory") {
                $("#txtProdCatName").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatName") {
                $("#txtProdCatSoldas").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatSoldas") {
                $("#txtProdCatMinUnits").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatMinUnits") {
                $("#txtProdCatMinPrice").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatMinPrice") {
                $("#txtProdCatMaxPrice").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatMaxPrice") {
                $("#txtProdCatType").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatType") {
                $("#txtProdCatExpDays").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatExpDays") {
                $("#txtProdCatPer0").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatPer0") {
                $("#txtProdCatPer1").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatPer1") {
                $("#txtProdCatPer2").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdCatPer2") {
                $("#EditProdCat").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

</script>