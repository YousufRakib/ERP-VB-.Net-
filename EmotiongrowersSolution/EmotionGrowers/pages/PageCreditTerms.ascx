<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCreditTerms.ascx.vb" Inherits="pages_PageCreditTerms" %>
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

    /*#EditCreditTerms input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/

</style>

<table>
    <tr>
        <td>

            <div id="DivCreditTermsForFgrd">
                <table id="fgrdCreditTerms" style="display: none;"></table>
                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditCreditTerms" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 150px;">Term Code</td>
                <td> 
                    <input type="text" class="AllUpperCaseTextBox" id="txtCreditTermsCode" style="width: 35px; " maxlength="2">
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtCreditTermsDesc" style="width: 250px;" maxlength="50" >
                </td>
            </tr>
            <tr>
                <td>C.O.D  Code?</td>
                <td>
                    <input type="checkbox" id="txtCreditTermsCOD" style="width: 45px !important;" />
                    <%--<input type="text" class="AllUpperCaseTextBox ClsAlphabetsOnly" id="txtCreditTermsCOD" style="width: 15px;" maxlength="1">--%>
                </td>
            </tr>
            <tr>
                <td>Credit Card?</td>
                <td>
                     <input type="checkbox" id="txtCreditTermsCrCard" style="width: 45px !important;" />
                    <%--<input type="text" class="AllUpperCaseTextBox ClsAlphabetsOnly" id="txtCreditTermsCrCard" style="width: 15px;" maxlength="1">--%>
                </td>
            </tr>
            <tr>
                <td>Days to pay</td>
                <td>
                    <input type="text" id="txtCreditTermsDays" style="width: 40px;" maxlength="3" class="ClsNumbersOnly">
                </td>
            </tr>
            <tr>
                <td>Discount %</td>
                <td>
                    <input type="text" id="txtCreditTermsDiscount" style="width: 80px;" maxlength="6" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>
            <tr>
                <td>Discount Days</td>
                <td>
                    <input type="text" id="txtCreditTermsDDays" style="width: 40px;" maxlength="3" class="ClsNumbersOnly">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divCreditTermsHeaderID" style="display:none;"></div>
<div id="divCreditTermsID" style="display:none;"></div>

<script>
    $(document).ready(new function () {
        /*Load Terms grid details by Abi*/
        $("#fgrdCreditTerms").flexigrid({
            url: 'BloomService.asmx/GetTermsDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'Code', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Terms Description', name: 'TermsDesc', width: 270, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Credit Card', name: 'CreditCard', width: 80, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'COD?', name: 'COD', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Code', name: 'Code' },
                { display: 'Terms Description', name: 'TermsDesc' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewTerms },
            ],
            showTableToggleBtn: true,
            sortname: "Code",
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
            height: $(window).height() - 230,
            width: 550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdCreditTerms tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCreditTermsForFgrd #ExportCSV").show();
                }

                if ($("#divCreditTermsID").html() != "0" && $("#fgrdCreditTerms #row" + $("#divCreditTermsID").html()).css('display') == "table-row") {
                    var id = $("#divCreditTermsID").html();
                    $("#fgrdCreditTerms [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCreditTerms td.unsorted").addClass("sorted");
                    $("#fgrdCreditTerms td.sorted").removeClass("unsorted");
                    $("#fgrdCreditTerms #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCreditTerms #row" + id).removeClass("trSelected");
                    $("#fgrdCreditTerms #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCreditTerms #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divCreditTermsID").html($("#fgrdPendingInfo tr:first td:nth-child(3) div").text());
                    $("#fgrdCreditTerms tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    /*Selected row higlighted with red color by Abi :: 23Apr2018*/
    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divCreditTermsID").html(id.toString());

                $("#fgrdCreditTerms [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCreditTerms #row" + id).addClass("trSelectedHeader");
                $("#fgrdCreditTerms td.unsorted").addClass("sorted");
                $("#fgrdCreditTerms td.sorted").removeClass("unsorted");
                $("#fgrdCreditTerms #row" + id).removeClass("trSelected");
                $("#fgrdCreditTerms #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCreditTerms #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    /*Dialog for Add/Edit screen to Save by Abi ::*/
    $("#EditCreditTerms").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 390,
        title: 'Payment Terms Maintenance',
        buttons: {
            Save: function () {
                var CreditTermsID = $("#divCreditTermsID").html();
                var CreditTermsCode = $("#txtCreditTermsCode").val() == "" ? $("#txtCreditTermsCode").attr('placeholder') : $("#txtCreditTermsCode").val();
                if (CreditTermsCode == "") {
                    $("#EditCreditTerms").next('div').find(".msgui").html("Please enter Term Code..");
                    $("#EditCreditTerms").next('div').find('.msgui').show();
                    ctrlFocus($("#txtCreditTermsCode"));
                    return false;
                }
                var CreditTermsDesc = $("#txtCreditTermsDesc").val();
                 /*Added by Anubhuti*/
                var COD = $('#txtCreditTermsCOD').is(":checked") ? "Y" : "N";
                var CreditCard = $('#txtCreditTermsCrCard').is(":checked") ? "Y" : "N";
                 /**/
                //var COD = $("#txtCreditTermsCOD").val() == "" ? $("#txtCreditTermsCOD").attr('placeholder') : $("#txtCreditTermsCOD").val();
                //var CreditCard = $("#txtCreditTermsCrCard").val() == "" ? $("#txtCreditTermsCrCard").attr('placeholder') : $("#txtCreditTermsCrCard").val();
                var Days = $("#txtCreditTermsDays").val()==""?parseInt( $("#txtCreditTermsDays").attr('placeholder')):parseInt( $("#txtCreditTermsDays").val());
                var Discount = $("#txtCreditTermsDiscount").val()==""?parseFloat($("#txtCreditTermsDiscount").attr('placeholder')):parseFloat($("#txtCreditTermsDiscount").val());
                var DDays = $("#txtCreditTermsDDays").val() == "" ? parseInt($("#txtCreditTermsDDays").attr('placeholder')) : parseInt($("#txtCreditTermsDDays").val());
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCreditTerms',
                    data: '{"ID":"' + CreditTermsID + '","CreditTermsCode":"' + CreditTermsCode.toUpperCase() + '","CreditTermsDesc":"' + CreditTermsDesc.toUpperCase() + '","COD":"' + COD.toUpperCase() + '","CreditCard":"' + CreditCard.toUpperCase() + '","Days":"' + Days + '","Discount":' + Discount + ',"DDays":' + DDays + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditCreditTerms").next('div').find(".msgui").html("Credit Code (<b>" + CreditTermsCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditCreditTerms").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditCreditTerms").dialog("close")
                                $("#fgrdCreditTerms").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditCreditTerms").next('div').find(".msgui").html(output.d);
                            $("#EditCreditTerms").next('div').find('.msgui').show();
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

            $("#EditCreditTerms").next('div').find('.msgui').remove();
            $("#EditCreditTerms").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditCreditTerms").next('div').find(".msgui").css("width", $("#EditCreditTerms").width() - $('#EditCreditTerms').next('div').find(".ui-dialog-buttonset").width());
            $("#EditCreditTerms").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    /*Empty the controls and Reset its values when Add button clicked*/
    function AddNewTerms() {
        debugger;       
        $("#divCreditTermsID").html("0");
        $("#txtCreditTermsCode").val("");
        $("#txtCreditTermsCode").attr('placeholder', "");
        $("#txtCreditTermsDesc").val("");
        //$("#txtCreditTermsCOD").val("");
        //$("#txtCreditTermsCOD").attr('placeholder', "");
        //$("#txtCreditTermsCrCard").val("");
        //$("#txtCreditTermsCrCard").attr('placeholder',"");
         /*Added by Anubhuti*/
        $('#txtCreditTermsCOD').iButton("toggle", false);
        $('#txtCreditTermsCrCard').iButton("toggle", false);
         /**/
        $("#txtCreditTermsDays").val("");
        $("#txtCreditTermsDays").attr('placeholder', "0");
        $("#txtCreditTermsDiscount").val("");
        $("#txtCreditTermsDiscount").attr('placeholder', "0.00");
        $("#txtCreditTermsDDays").val("");
        $("#txtCreditTermsDDays").attr('placeholder', "0");
        $("#EditCreditTerms").dialog("open");
    }

    /*Edit the Terms values on Edit screen by Abi*/
    $("[id^=EditCreditTerms_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var CreditTermsID = ID.replace("EditCreditTerms_", "");
        $("#EditCreditTerms").dialog('option', 'title', "Payment Terms Maintenance:: " + CreditTermsID);
        $("#EditCreditTerms").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditTermsDetailByID',
            data: '{"ID":"' + CreditTermsID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var CreditTermsDet = output.d;
                    $("#divCreditTermsID").html(CreditTermsDet[0].ID);
                    $("#txtCreditTermsCode").val("");
                    $("#txtCreditTermsCode").attr('placeholder', CreditTermsDet[0].Code);
                    $("#txtCreditTermsDesc").val(CreditTermsDet[0].TermsDesc);
                    //$("#txtCreditTermsCOD").val("");
                    //$("#txtCreditTermsCOD").attr('placeholder', CreditTermsDet[0].COD);
                    //$("#txtCreditTermsCrCard").val("");
                    //$("#txtCreditTermsCrCard").attr('placeholder', CreditTermsDet[0].CreditCard);
                    /*Added by Anubhuti*/
                    $('#txtCreditTermsCOD').iButton("toggle", CreditTermsDet[0].COD == 'N' ? false : true);
                    $('#txtCreditTermsCrCard').iButton("toggle", CreditTermsDet[0].CreditCard == 'N' ? false : true);
                     /**/
                    $("#txtCreditTermsDays").val("");
                    $("#txtCreditTermsDays").attr('placeholder', CreditTermsDet[0].Days);
                    $("#txtCreditTermsDiscount").val("");
                    $("#txtCreditTermsDiscount").attr('placeholder',parseFloat( CreditTermsDet[0].Discount).toFixed(2));
                    $("#txtCreditTermsDDays").val("");
                    $("#txtCreditTermsDDays").attr('placeholder', CreditTermsDet[0].DDays);


                    $("#fgrdCreditTerms [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCreditTerms #row" + CreditTermsID).addClass("trSelectedHeader");
                    $("#fgrdCreditTerms td.unsorted").addClass("sorted");
                    $("#fgrdCreditTerms td.sorted").removeClass("unsorted");
                    $("#fgrdCreditTerms #row" + CreditTermsID).removeClass("trSelected");
                    $("#fgrdCreditTerms #row" + CreditTermsID + " td.sorted").addClass("unsorted");
                    $("#fgrdCreditTerms #row" + CreditTermsID + " td.unsorted").removeClass("sorted");

                    $("#EditCreditTerms").dialog('option', 'title', "Payment Terms Maintenance :: " + CreditTermsDet[0].Code);
                    $("#EditCreditTerms").dialog("open");
                }
            }
        });
    });

    /*Confirmation dialog to Delete the terms by Abi*/
    $("[id^=DeleteCreditTerms_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteCreditTerms_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditTermsDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + res[0].Code + " - " + res[0].TermsDesc + "</b> ?</p>");
                $("#Deleteconfirm").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    /*Delete terms details from table by Abi*/
    $("#Deleteconfirm").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteCreditTerms_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCreditTermsbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdCreditTerms").flexReload({ url: '/url/for/refresh' });
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

    /*Enter key navigation by Abi*/
    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtCreditTermsCode") {
                $("#txtCreditTermsDesc").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsDesc") {
                $("#txtCreditTermsCOD").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsCOD") {
                $("#txtCreditTermsCrCard").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsCrCard") {
                $("#txtCreditTermsDays").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsDays") {
                $("#txtCreditTermsDiscount").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsDiscount") {
                $("#txtCreditTermsDDays").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditTermsDDays") {
                $("#EditCreditTerms").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

      $("#txtCreditTermsCOD").iButton({
            labelOn: "Yes",
            labelOff: "No"
    });

      $("#txtCreditTermsCrCard").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
</script>