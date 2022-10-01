<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageInventorytoKomet.ascx.vb" Inherits="pages_PageInventorytoKomet" %>
<div>
    <table id="fgrdInventorytoKomet" style="display: none;"></table>

    <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
</div>

<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="DivPostConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgPostConfirm" class="PostDialogMsg"></p>
    </div>
</div>
<div id="divInventorytoKometID" style="display: none;">0</div>

<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .KometExport {
        background: url(images/Update.png) no-repeat 10px 0px;
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
</style>

<script type="text/javascript">
    function KometVisibility() {
        var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'
        if (IsKometSales.toUpperCase() != 'YES') {
            $('.KometExport').parent().parent().hide();
        }
        else {
            $('.KometExport').parent().parent().show();
        }
    }
    $(document).ready(new function () {
        $("#fgrdInventorytoKomet").flexigrid({
            url: 'BloomService.asmx/GetInventoryToKometForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'Product', name: 'ProductCode', width: 80, sortable: true, align: 'left' },
                { display: 'Product Name', name: 'ProductName', width: 180, sortable: true, align: 'left' },
                { display: 'Cat', name: 'ProductCategory', width: 100, sortable: true, align: 'left' },
                { display: 'Variety', name: 'Variety', width: 130, sortable: true, align: 'left' },
                { display: 'Color', name: 'Color', width: 100, sortable: true, align: 'left' },
                { display: 'Grade', name: 'Grade', width: 50, sortable: true, align: 'left' },
                { display: 'Farm', name: 'Farm', width: 35, sortable: true, align: 'left' },
                { display: 'City', name: 'City', width: 35, sortable: false, align: 'left' },
                { display: 'BoxNo', name: 'BoxNumber', width: 35, sortable: false, align: 'left' },
                { display: 'Type', name: 'Soldas', width: 35, sortable: false, align: 'left' },
                 { display: 'Units', name: 'Units', width: 25, sortable: false, align: 'right' },
                { display: 'Bunches', name: 'UnitesBunch', width: 35, sortable: false, align: 'right' },
                { display: 'StemBunch', name: 'StemBunch', width: 50, sortable: false, align: 'right' },
                { display: 'Qty', name: 'Qty', width: 25, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 35, sortable: false, align: 'right' },
                { display: 'PriceA', name: 'Price', width: 35, sortable: false, align: 'right' },
                 { display: 'PriceB', name: 'PriceB', width: 35, sortable: false, align: 'right' },
                 { display: 'FUEL', name: 'FUEL', width: 35, sortable: false, align: 'right' },
                 { display: 'FBE', name: 'FBE', width: 35, sortable: false, align: 'right' },
                 { display: 'FEE', name: 'FEE', width: 35, sortable: false, align: 'right' },
                 { display: 'Cost', name: 'Cost', width: 35, sortable: false, align: 'right' },
                { display: 'Days', name: 'Date', width: 60, sortable: false, align: 'left' },
            ],
            searchitems: [
            { display: 'Product', name: 'Product' },
            { display: 'Product Name', name: 'ProductName' },
            { display: 'Cat', name: 'Category' },
            { display: 'Variety', name: 'Variety' },
            { display: 'Color', name: 'Color' },
            { display: 'Grade', name: 'Grade' },
            { display: 'Farm', name: 'Farm' },
            { display: 'City', name: 'City' },
            { display: 'Qty', name: 'Qty' },
            ],
            buttons: [
                { name: 'Post Inventory', bclass: 'KometExport', onpress: exportclicked }           
            ],
            showTableToggleBtn: true,
            sortname: "ProductName",
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
            striped: true,
            onSuccess: function () {
                $("#ExportCSV").show();
                //ChangeEntryGridRowColor();
            },
            params: [
                { name: 'Filter', value: '' },
            { name: 'ExportCSV', value: '' }
            ],
        });

        KometVisibility();

        ////For To Change color of the Row based on Bunches and UnitsBunch
        //function ChangeEntryGridRowColor() {

        //    $('#fgrdInventorytoKomet tr').each(function () {
        //        var Bunches = $(this).find("td").eq(13).text();
        //        var UnitsBunch = $(this).find("td").eq(14).text();
        //        if (Bunches == "0")
        //            $(this).find('td:nth-child(13) div').css('background', 'red').css('height', '17px');
        //        if (UnitsBunch == "0")
        //            $(this).find('td:nth-child(14) div').css('background', 'red').css('height', '17px');
        //    });
        //}

        function exportclicked(com, grid) {

            var count = 0
            $("[id^=select_]").each(function () {
                if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                    count = count + 1;
                }
            });
            if (count == 0) {
                $("#msg").html("Please choose inventory to POST!");
                $("#msgbox-select").dialog("open");
            }
            else {
                $("#DivPostConfirmDialog").dialog("open");
                $("#msgPostConfirm").html("Do you want POST selected inventory?");
            }



        }

        $("#DivPostConfirmDialog").dialog({
            autoOpen: false,
            resizable: false,
            width: 320,
            modal: true,
            buttons: {
                Yes: function () {
                    $("#DivPostConfirmDialog").dialog("close");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ExportSelectedInventoryToKomet',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else {
                                $("#fgrdInventorytoKomet").flexReload({ url: '/url/for/refresh' });
                                $("#DivPostConfirmDialog").dialog("close");
                                $("[id ^= SelectAll]").attr("src", "images/check-off.png");
                                $("#msg").html("Inventory ID requested successfully.");
                                $("#msgbox-select").dialog("open");
                            }
                        }
                    });
                },
                No: function () {
                    $("#DivPostConfirmDialog").dialog("close");
                }
            },

            open: function () {
                $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
                $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            }
        });
        
        $("[id^=select_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var img = sourceCtl.attr("src").toLowerCase();

            var SelectedID = ID.replace("select_", "");
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleSelectedInventory',
                data: "{'Selected':'" + Selected + "','ID':'" + SelectedID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        $("[id ^= SelectAll]").attr("src", "images/check-off.png");

                    }

                }
            });

        });


        $("#SelectAll").die('click').live("click", function (e) {
            var sourceCtl = $(this);
            var img = sourceCtl.attr("src").toLowerCase();
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleSelectedAllInventory',
                data: "{'SelectedAll':'" + Selected + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $("#msgbox-select").dialog("close");
                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                        $("[id^=select_]").prop("src", "images/check-on.png");
                        // $("#fgrdInventorytoKomet").flexReload({ url: '/url/for/refresh' });

                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        $("[id^=select_]").prop("src", "images/check-off.png");
                        // $("#fgrdInventorytoKomet").flexReload({ url: '/url/for/refresh' });
                    }
                }
            });

        });


    });

</script>
