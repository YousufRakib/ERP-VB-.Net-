<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageProdDetails.ascx.vb" Inherits="pages_PageProdDetails" %>

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
    /* #EditProdDetails input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }
   #EditProdDetails select {
        height: 17px;
        background-color:cornsilk;
    }*/
    
    /*Added :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    .leftButtonDuplicateForBoxMain {
        margin-right: 336px !important;
    }

</style>

<table>
    <tr>
        <td>

            <div>
                <table id="fgrdProdDetails" style="display: none;"></table>
                <div id="DeleteConfirmProdDetails" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
    <%--  commented by Abinaya on 25April2018 :: mentioned by jose on Email
        <tr>
        <td>
            <input id="btnProdDetailsBrowse" type="button" class="BloomButtonEnabled" value="B=Browse" style=" width: 80px; background: red;" />
        </td>
    </tr>--%>
</table>

<div id="EditProdDetails" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr style="height: 25px;">
                <td colspan="2">
                    <div class="Warning" align="center" style="display: none;">
                        OOPS! Unable to process your request. Please contact admin!
                    </div>
                    <div class="YellowWarning" align="center" style="display: none;">
                        All fields are required fields, Please try again.
                    </div>
                </td>
            </tr>
            <tr>
                <td>Grower Code</td>
                <td>
                    <input type="text" id="txtProdDetailsFarm" style="width: 65px;" maxlength="5" class="AllUpperCaseTextBox"/>
                </td>
            </tr>
            <tr>
                <td>Product Category</td>
                <td>
                    <select id="lstProdDetailsType" style="width: 65px; height: 23px"></select>
                    <input type="hidden" id="hfProdDetailsType">
                </td>
            </tr>
            <tr>
                <td>Uom</td>
                <td>
                    <input type="text" id="txtProdDetailsUOM" style="width: 35px;" maxlength="5" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" id="txtProdDetailsName" style="width: 270px;" maxlength="25" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>Full Box Equivalence(FBE)</td>
                <td>
                    <input type="text" id="txtProdDetailsFBE" style="width: 110px;text-align:right;" maxlength="13" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal">
                </td>
            </tr>
            <%--    commented by Abinaya on 25April2018 :: mentioned by jose on Email
                <tr>
                <td>Armellini Product Code</td>
                <td>
                    <input type="text" id="txtProdDetailsARProdCode" style="width: 70px;" maxlength="5">
                </td>
            </tr>
            <tr>
                <td>Armellini Size Code</td>
                <td>
                    <input type="text" id="txtProdDetailsARSizeCode" style="width: 50px;" maxlength="3">
                </td>
            </tr>--%>
            <tr>
                <td>Armellini Physical Size</td>
                <td>
                    <input type="text" id="txtProdDetailsARPhysicalSize" style="width: 90px;" maxlength="6" class="ClsNumbersOnly">
                </td>
            </tr>
            <tr>
                <td>Actual Dimensions:  Length:</td>
                <td>
                    <input type="text" id="txtProdDetailsLength" style="width: 70px;text-align:right;" maxlength="7" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                    <label style="margin-left: 10px; margin-right: 5px;">Width:</label>
                    <input type="text" id="txtProdDetailsWidth" style="width: 70px;text-align:right;" maxlength="7" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                    <label style="margin-left: 10px; margin-right: 5px;">Height:</label>
                    <input type="text" id="txtProdDetailsHeight" style="width: 70px;text-align:right;" maxlength="7" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr>
                <td>Box Volume   (in CuFT)</td>
                <td>
                    <input type="text" id="txtProdDetailsBoxVolume" style="width: 80px;text-align:right;" maxlength="10" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr>
                <td>Box Weight   (in Lbs)</td>
                <td>
                    <input type="text" id="txtProdDetailsBoxWeight" style="width: 80px;text-align:right;" maxlength="10" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <%--<tr>
                <td>Customer Packing Charge</td>
                <td>
                    <input type="text" id="txtProdDetailsPacking" style="width: 70px;text-align:right;" maxlength="10" class="ClsDecimalsOnly">
                </td>
            </tr>
            <tr>
                <td>Packing Charge for Grower</td>
                <td>
                    <input type="text" id="txtProdDetailsGrowerCharge" style="width: 70px;text-align:right;" maxlength="10" class="ClsDecimalsOnly">
                </td>
            </tr>
            <tr>
                <td>Handling Charges</td>
                <td>
                    <input type="text" id="txtProdDetailsHandlingCharges" style="width: 70px;text-align:right;" maxlength="10" class="ClsDecimalsOnly">
                </td>
            </tr>--%>
        </tbody>
    </table>
</div>

<div id="divProdDetailsID" style="display:none;"></div>


<script type="text/javascript">
    var isDuplicateBoxMaintance = false; /*Added :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    $(document).ready(new function () {
        //$.mask.definitions['9'] = "[0-9]";
        //$.mask.definitions['#'] = "[0-9]";

        //$("#txtProdDetailsARPhysicalSize").mask("99x99x99");

        //LoadFarm();
        LoadTypes();    /*Call Types details loading functionality by Abi*/
        /*Load product details grid details by Abi*/
        $("#fgrdProdDetails").flexigrid({
            url: 'BloomService.asmx/GetProdForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Farm', name: 'FARM', width: 40, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Cat', name: 'CAT', width: 40, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Uom', name: 'UOM', width: 40, sortable: true, align: 'left', process:HeaderRowClick },
                { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'FBE', name: 'FBE', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Size', name: 'SIZE', width: 70, sortable: true, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'FARM', name: 'FARM' },
                { display: 'Category', name: 'CAT' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Name', name: 'Name' },
                { display: 'FBE', name: 'FBE' },
                { display: 'SiZE', name: 'SIZE' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewProdDetails },
            ],
            showTableToggleBtn: true,
            sortname: "UOM",
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
                { name: 'Filter', value: '' }
            ],
            onSuccess: function () {
                debugger;

                var sel = jQuery("#fgrdProdDetails tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivProdDetailsPage #ExportCSV").show();
                }

                if ($("#divProdDetailsID").html() != "0" && $("#fgrdProdDetails #row" + $("#divProdDetailsID").html()).css('display') == "table-row") {
                    var id = $("#divProdDetailsID").html();
                    $("#fgrdProdDetails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdProdDetails td.unsorted").addClass("sorted");
                    $("#fgrdProdDetails td.sorted").removeClass("unsorted");
                    $("#fgrdProdDetails #row" + id).addClass("trSelectedHeader");
                    $("#fgrdProdDetails #row" + id).removeClass("trSelected");
                    $("#fgrdProdDetails #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdProdDetails #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divProdDetailsID").html($("#fgrdPendingInfo tr:first td:nth-child(3) div").text());
                    $("#fgrdProdDetails tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divProdDetailsID").html(id.toString());

                $("#fgrdProdDetails [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdProdDetails #row" + id).addClass("trSelectedHeader");
                $("#fgrdProdDetails td.unsorted").addClass("sorted");
                $("#fgrdProdDetails td.sorted").removeClass("unsorted");
                $("#fgrdProdDetails #row" + id).removeClass("trSelected");
                $("#fgrdProdDetails #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdProdDetails #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    /*Dialog for Add/Edit screen to Save by Abi ::*/
    /*Altered :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    $("#EditProdDetails").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 660,
        height: $(window).height()-320,
        title: 'Box Size Maintenance',
        buttons: {
            Duplicate: {
                class: 'leftButtonDuplicateForBoxMain',
                text: 'Duplicate',
                click: function () {
                    debugger;
                    isDuplicateBoxMaintance = true;
                    saveBoxMaintananceDetails();
                }
            },
            Save: function () {
                isDuplicateBoxMaintance = false;
                saveBoxMaintananceDetails();
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            debugger
            $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    /*Added :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    function saveBoxMaintananceDetails() {
        var ProdDetailsID = $("#divProdDetailsID").html();
        var ProdDetailsFarm = $("#txtProdDetailsFarm").val() == "" ? $("#txtProdDetailsFarm").attr('placeholder') : $("#txtProdDetailsFarm").val();
        var ProdDetailsType = $("#lstProdDetailsType").val() == "" ? $("#lstProdDetailsType").attr('placeholder') : $("#lstProdDetailsType").val();
        var ProdDetailsUOM = $("#txtProdDetailsUOM").val();
        var ProdDetailsName = $("#txtProdDetailsName").val();
        if (ProdDetailsName == "") {
            $(".YellowWarning").html("Please enter Product Name..");
            $(".YellowWarning").show();
            ctrlFocus($("#txtProdDetailsName"));
            return false;
        }
        var ProdDetailsFBE = $("#txtProdDetailsFBE").val() == "" ? $("#txtProdDetailsFBE").attr('placeholder') : $("#txtProdDetailsFBE").val();
        var ProdDetailsARProdCode = "";// $("#txtProdDetailsARProdCode").val();
        var ProdDetailsARSizeCode = "";// $("#txtProdDetailsARSizeCode").val();
        debugger;
        var ProdDetailsARPhysicalSize = $("#txtProdDetailsARPhysicalSize").val() == "" ? "" : $("#txtProdDetailsARPhysicalSize").val();

        var ProdDetailsLength = $("#txtProdDetailsLength").val() == "" ? $("#txtProdDetailsLength").attr('placeholder') : $("#txtProdDetailsLength").val();
        var ProdDetailsWidth = $("#txtProdDetailsWidth").val() == "" ? $("#txtProdDetailsWidth").attr('placeholder') : $("#txtProdDetailsWidth").val();
        var ProdDetailsHeight = $("#txtProdDetailsHeight").val() == "" ? $("#txtProdDetailsHeight").attr('placeholder') : $("#txtProdDetailsHeight").val();
        var ProdDetailsBoxVolume = $("#txtProdDetailsBoxVolume").val() == "" ? $("#txtProdDetailsBoxVolume").attr('placeholder') : $("#txtProdDetailsBoxVolume").val();
        var ProdDetailsBoxWeight = $("#txtProdDetailsBoxWeight").val() == "" ? $("#txtProdDetailsBoxWeight").attr('placeholder') : $("#txtProdDetailsBoxWeight").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SaveProdDetails',
            data: '{"ID":"' + ProdDetailsID + '","CODE":"' + ProdDetailsType + '","FARM":"' + ProdDetailsFarm.toUpperCase() + '","NAME":"' + ProdDetailsName.toString().toUpperCase() + '","UOM":"' + ProdDetailsUOM + '","SIZE":"' + ProdDetailsARPhysicalSize + '","FBE":"' + ProdDetailsFBE + '","VOLUME":"' + ProdDetailsBoxVolume + '","WEIGHT":"' + ProdDetailsBoxWeight + '","H":"' + ProdDetailsHeight + '","W":"' + ProdDetailsWidth + '","L":"' + ProdDetailsLength + '","isDuplicateBoxMaintance":' + isDuplicateBoxMaintance + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "error") {
                    $(".Warning").show();
                }
                else if (output.d.toString().toLowerCase().includes("BoxSize already exist with FARM".toLowerCase())) {
                    $.MessageBox(output.d.toString());
                }
                else {
                    $("#EditProdDetails").dialog("close")
                    $("#fgrdProdDetails").flexReload({ url: '/url/for/refresh' });
                    
                }
                isDuplicateBoxMaintance = false;
            }
        });
    }

    /*Empty the controls and Reset its values when Add button clicked*/
    /*Altered :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    function AddNewProdDetails() {
        debugger;
        $("#divProdDetailsID").html("0");
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#txtProdDetailsFarm").val("");
        $("#txtProdDetailsFarm").attr("placeholder","")
        $("#lstProdDetailsType").val("");
        $("#txtProdDetailsUOM").val("");
        $("#txtProdDetailsName").val("");
        $("#txtProdDetailsFBE").val("");
        $("#txtProdDetailsFBE").attr('placeholder', "0.0000");
        //$("#txtProdDetailsARProdCode").val("");
        //$("#txtProdDetailsARSizeCode").val("");
        $("#txtProdDetailsARPhysicalSize").val("");

        $("#txtProdDetailsLength").val("");
        $("#txtProdDetailsLength").attr('placeholder', "0.00");
        $("#txtProdDetailsWidth").val("");
        $("#txtProdDetailsWidth").attr('placeholder',"0.00");
        $("#txtProdDetailsHeight").val("");
        $("#txtProdDetailsHeight").attr('placeholder',"0.00");

        $("#txtProdDetailsBoxVolume").val("");
        $("#txtProdDetailsBoxVolume").attr("placeholder","0.00");
        $("#txtProdDetailsBoxWeight").val("");
        $("#txtProdDetailsBoxWeight").attr("placeholder","0.00");

        //$("#txtProdDetailsPacking").val("");
        //$("#txtProdDetailsPacking").attr("placeholder","0.00");
        //$("#txtProdDetailsGrowerCharge").val("");
        //$("#txtProdDetailsGrowerCharge").attr("placeholder", "0.00");
        //$("#txtProdDetailsHandlingCharges").val("");
        //$("#txtProdDetailsHandlingCharges").attr('placeholder', "0.00");
        $('.ui-dialog-buttonpane button:contains("Duplicate")').button().hide();
        $("#EditProdDetails").dialog("open");
    }

    /*Edit the product details on Edit screen by Abi*/
    /*Altered :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button*/
    $("[id^=EditProdDetails_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ProdDetailsID = ID.replace("EditProdDetails_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetProdDetailsByID',
            data: '{"ID":"' + ProdDetailsID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var ProdDetailsDet = output.d;
                    $("#divProdDetailsID").html(ProdDetailsDet[0].ID);
                    $("#txtProdDetailsFarm").val("");
                    $("#txtProdDetailsFarm").attr('placeholder',ProdDetailsDet[0].FARM);
                    $("#lstProdDetailsType").val(ProdDetailsDet[0].CODE);
                    $("#txtProdDetailsUOM").val(ProdDetailsDet[0].UOM);
                    $("#txtProdDetailsName").val(ProdDetailsDet[0].NAME);
                    $("#txtProdDetailsFBE").val("");
                    $("#txtProdDetailsFBE").attr('placeholder',parseFloat(ProdDetailsDet[0].FBE).toFixed(4));
                    //$("#txtProdDetailsARProdCode").val(ProdDetailsDet[0].ARMELPROD);
                    //$("#txtProdDetailsARSizeCode").val(ProdDetailsDet[0].ARMELLINI);
                    $("#txtProdDetailsARPhysicalSize").val(ProdDetailsDet[0].SIZE);

                    $("#txtProdDetailsLength").val("");
                    $("#txtProdDetailsLength").attr('placeholder',parseFloat( ProdDetailsDet[0].L).toFixed(2));
                    $("#txtProdDetailsWidth").val("");
                    $("#txtProdDetailsWidth").attr('placeholder',parseFloat(ProdDetailsDet[0].W).toFixed(2));
                    $("#txtProdDetailsHeight").val("");
                    $("#txtProdDetailsHeight").attr('placeholder', parseFloat(ProdDetailsDet[0].H).toFixed(2));

                    $("#txtProdDetailsBoxVolume").val("");
                    $("#txtProdDetailsBoxVolume").attr("placeholder",parseFloat( ProdDetailsDet[0].VOLUME).toFixed(2));
                    $("#txtProdDetailsBoxWeight").val("");
                    $("#txtProdDetailsBoxWeight").attr("placeholder",parseFloat(ProdDetailsDet[0].WEIGHT).toFixed(2));

                    //$("#txtProdDetailsPacking").val("");
                    //$("#txtProdDetailsPacking").attr("placeholder",parseFloat( ProdDetailsDet[0].PACKING).toFixed(2));
                    //$("#txtProdDetailsGrowerCharge").val("");
                    //$("#txtProdDetailsGrowerCharge").attr("placeholder","0.00");
                    //$("#txtProdDetailsHandlingCharges").val("");
                    //$("#txtProdDetailsHandlingCharges").attr('placeholder', "0.00");
                    
                    $("#fgrdProdDetails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdProdDetails #row" + ProdDetailsID).addClass("trSelectedHeader");
                    $("#fgrdProdDetails td.unsorted").addClass("sorted");
                    $("#fgrdProdDetails td.sorted").removeClass("unsorted");
                    $("#fgrdProdDetails #row" + ProdDetailsID).removeClass("trSelected");
                    $("#fgrdProdDetails #row" + ProdDetailsID + " td.sorted").addClass("unsorted");
                    $("#fgrdProdDetails #row" + ProdDetailsID + " td.unsorted").removeClass("sorted");

                    $(".YellowWarning").hide();
                    $(".Warning").hide();
                    $('.ui-dialog-buttonpane button:contains("Duplicate")').button().show();
                    $("#EditProdDetails").dialog('option', 'title', "Box Size Maintenance");
                    $("#EditProdDetails").dialog("open");
                }
            }
        });
    });


    //function LoadFarm() {
    //    var length = $('#lstProdDetailsFarm > option').length;
    //    if (length <= 0) {
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/LoadFarm',
    //            data: "{}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (output, status) {
    //                $('#lstProdDetailsFarm').empty();
    //                var FARMdata = output.d;
    //                $('#lstProdDetailsFarm').append('<option value="0">Select</option>');
    //                for (var i in FARMdata) {
    //                    var FARM = FARMdata[i];
    //                    $('#lstProdDetailsFarm').append('<option value="' + FARM.Farm + '">' + FARM.Farm + '</option>');
    //                }

    //                if ($("#hfProdDetailsFarm").val() != "" && $("#hfProdDetailsFarm").val() != 0)
    //                    $('#lstProdDetailsFarm').val($("#hfProdDetailsFarm").val());
    //                else
    //                    $("#lstProdDetailsFarm").val("QB");
    //            }
    //        });
    //    }
    //    else {
    //        $('#lstProdDetailsFarm').val($("#hfSPORDEditFARM").val());
    //        callback(true);
    //    }
    ////}

    /*Load Types from f_types table by Abi*/
    function LoadTypes() {
        var length = $('#lstProdDetailsType > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadTypes',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstProdDetailsType').empty();
                    var TYPEdata = output.d;
                    $('#lstProdDetailsType').append('<option value="0">Select</option>');
                    for (var i in TYPEdata) {
                        var TYPE = TYPEdata[i];
                        $('#lstProdDetailsType').append('<option value="' + TYPE.TYPE + '">' + TYPE.TYPE + '</option>');
                    }

                    if ($("#lstProdDetailsType").val() != "" && $("#hfProdDetailsTYPE").val() != 0)
                        $('#lstProdDetailsType').val($("#hfProdDetailsTYPE").val());
                    else
                        $("#lstProdDetailsType").val("QB");
                }
            });
        }
        else {
            $('#lstProdDetailsType').val($("#hfProdDetailsType").val());
            callback(true);
        }
    }

    /*Confirmation dialog to Delete the Product details by Abi*/
    $("[id^=DeleteProdDetails_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteProdDetails_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetProdDetailsByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmProdDetails").html("<p>Are you sure to delete<b> " + res[0].CODE + " :: " + res[0].FARM + " :: " + res[0].UOM + "</b> ?</p>");
                $("#DeleteConfirmProdDetails").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    /*Delete product details from table by Abi*/
    $("#DeleteConfirmProdDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteProdDetails_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteProdDetailsbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdProdDetails").flexReload({ url: '/url/for/refresh' });
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
            $("#txtProdDetailsType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    /*Move focus while an item selected from select control*/
    $("#lstProdDetailsType").change(function () {
        debugger;
        $("#txtProdDetailsUOM").focus();
    });

    /*Enter key navigation by Abi*/
    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtProdDetailsFarm") {
                $("#lstProdDetailsType").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsUOM") {
                $("#txtProdDetailsName").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsName") {
                $("#txtProdDetailsFBE").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsFBE") {
            //    $("#txtProdDetailsARProdCode").focus();
            //    return false;
            //}
            //else if ($(this).attr('id') == "txtProdDetailsARProdCode") {
            //    $("#txtProdDetailsARSizeCode").focus();
            //    return false;
            //}
            //else if ($(this).attr('id') == "txtProdDetailsARSizeCode") {
                $("#txtProdDetailsARPhysicalSize").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsARPhysicalSize") {
                $("#txtProdDetailsLength").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsLength") {
                $("#txtProdDetailsWidth").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsWidth") {
                $("#txtProdDetailsHeight").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsHeight") {
                $("#txtProdDetailsBoxVolume").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsBoxVolume") {
                $("#txtProdDetailsBoxWeight").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtProdDetailsBoxWeight") {
              $("#EditProdDetails").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

    $("#lstProdDetailsType").keydown(function (e) {
        debugger;
        var keycodevar = e.which;
        if (keycodevar == 13) {
            if ($("#lstProdDetailsType").val() == 0) {
                $("#lstProdDetailsType").focus();
            }
            else {
                $("#txtProdDetailsUOM").focus();
                return false;
            }
        }
    });
    

</script>