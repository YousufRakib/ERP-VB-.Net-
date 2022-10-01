<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageVarieties.ascx.vb" Inherits="pages_PageVarieties" %>

<style>
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .trSelectedHeader {
        background-color: red !important;
    }

    /*#EditVarieties input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }
    #EditVarieties select {
        background-color:cornsilk;
    }*/

</style>


<table>
    <tr>
        <td>

            <div id="DivVarietiesForFgrd">
                <table id="fgrdVarieties" style="display: none;"></table>
                <div id="DeleteConfirmVarieties" style="display: none;" title="Alert"></div>
                <div id="OldVarietiesId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditVarieties" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>            
            <tr>
                <td style="width: 150px;">Category</td>
                <td>
                    <select id="lstVar_Category" style="width: 203px; margin-top: 5px" />
                </td>
            </tr>  
            <tr>
                <td style="width: 150px;">Variety Name</td>
                <td>
                    <input type="text" id="txtVar_Variety" style="width: 200px;text-transform:uppercase;" maxlength="20">
                </td>
            </tr>   
            <tr>
                <td style="width: 150px;">Short Code</td>
                <td>
                    <input type="text" id="txtVar_ShortCode" style="width: 25px;text-transform:uppercase;" maxlength="2">
                </td>
            </tr>             
        </tbody>
    </table>
</div>

<div id="divVarietiesID" style="display:none;"></div>

<script type="text/javascript">

    $(document).ready(new function () {

        LoadCategory();

        $("#fgrdVarieties").flexigrid({
            url: 'BloomService.asmx/GetVarietiesForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Category', name: 'Category', width: 50, sortable: true, align: 'left' },
                { display: 'Variety', name: 'Variety', width: 270, sortable: true, align: 'left' },
                { display: 'Short Code', name: 'ShortCode', width: 85, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Category', name: 'Category' },
                { display: 'Variety', name: 'Variety' }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewVarieties },
            ],
            showTableToggleBtn: true,
            sortname: "Category,Variety",
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
	        width:550,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                var sel = jQuery("#fgrdVarieties tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivVarietiesForFgrd #ExportCSV").show();
                }

                if ($("#divVarietiesID").html() != "0" && $("#fgrdVarieties #row" + $("#divColorsID").html()).css('display') == "table-row") {
                    var id = $("#divVarietiesID").html();
                    $("#fgrdVarieties [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdVarieties td.unsorted").addClass("sorted");
                    $("#fgrdVarieties td.sorted").removeClass("unsorted");
                    $("#fgrdVarieties #row" + id).addClass("trSelectedHeader");
                    $("#fgrdVarieties #row" + id).removeClass("trSelected");
                    $("#fgrdVarieties #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdVarieties #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divVarietiesID").html($("#divVarietiesID tr:first td:nth-child(3) div").text());
                    $("#fgrdVarieties tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    function LoadCategory() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadTypes',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstVar_Category').empty();
                for (var i in data) {
                    var cat = data[i];
                    $('#lstVar_Category').append('<option value="' + cat.TYPE + '">' + "(" + cat.TYPE + ") " + cat.NAME + '</option>');
                }
            }
        });

    }
      
    $("#EditVarieties").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: 180,
        title: 'Editing',
        buttons: {
            Save: function () {
                var VarietiesID = $("#divVarietiesID").html();
                var Category = $("#lstVar_Category").val() == "" ? "" : $("#lstVar_Category").val().toUpperCase();
                if (Category == "") {
                    $("#EditVarieties").next('div').find(".msgui").html("Please select category..");
                    $("#EditVarieties").next('div').find('.msgui').show();
                    ctrlFocus($("#lstVar_Category"));
                    return false;
                }
                var Variety = $("#txtVar_Variety").val() == "" ? $("#txtVar_Variety").attr('placeholder').toUpperCase() : $("#txtVar_Variety").val().toUpperCase();
                if (Variety == "") {
                    $("#EditVarieties").next('div').find(".msgui").html("Please enter variety..");
                    $("#EditVarieties").next('div').find('.msgui').show();
                    ctrlFocus($("#txtVar_Variety"));
                    return false;
                }

                var ShortCode = $("#txtVar_ShortCode").val() == "" ? $("#txtVar_ShortCode").attr('placeholder').toUpperCase() : $("#txtVar_ShortCode").val().toUpperCase();                
                var Mode = VarietiesID == "" || VarietiesID == "0" ? "1" : "2";
               
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectVarieties',
                    data: '{"ID":"' + VarietiesID + '","Category":"' + Category + '","Variety":"' + Variety + '","ShortCode":"' + ShortCode + '","Mode":"' + Mode + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != null) {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditVarieties").next('div').find(".msgui").html("Color Code (<b>" + ColorCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditVarieties").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditVarieties").dialog("close")
                                $("#fgrdVarieties").flexReload({ url: '/url/for/refresh' });
                            }
                        }                       
                        else {
                            $("#EditVarieties").next('div').find(".msgui").html(output.d);
                            $("#EditVarieties").next('div').find('.msgui').show();
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

            $("#EditVarieties").next('div').find('.msgui').remove();
            $("#EditVarieties").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
            $("#EditVarieties").next('div').find(".msgui").css("width", $("#EditVarieties").width() - $('#EditVarieties').next('div').find(".ui-dialog-buttonset").width());
            $("#EditVarieties").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewVarieties() {
        debugger;
        $("#divVarietiesID").html("0");       
        $("#txtVar_Variety").val("");
        $("#txtVar_Variety").attr('placeholder', "");
        $("#txtVar_ShortCode").val("");
        $("#txtVar_ShortCode").attr('placeholder', "");
        $("#EditVarieties").dialog("option", "title", "Varieties Maintenance");
        $("#EditVarieties").dialog("open");
    }

    $("[id^=EditVarieties_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var VarietiesID = ID.replace("EditVarieties_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetVarietiesByID',
            data: '{"ID":"' + VarietiesID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var VarietiesDet = output.d;
                    $("#divVarietiesID").html(VarietiesDet.ID);
                    $("#lstVar_Category").val(VarietiesDet.Category);
                    $("#txtVar_Variety").val("");
                    $("#txtVar_Variety").attr('placeholder', VarietiesDet.Variety);
                    $("#txtVar_ShortCode").val("");
                    $("#txtVar_ShortCode").attr('placeholder', VarietiesDet.Code);
                    $("#fgrdVarieties [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdVarieties #row" + VarietiesID).addClass("trSelectedHeader");
                    $("#fgrdVarieties td.unsorted").addClass("sorted");
                    $("#fgrdVarieties td.sorted").removeClass("unsorted");
                    $("#fgrdVarieties #row" + VarietiesID).removeClass("trSelected");
                    $("#fgrdVarieties #row" + VarietiesID + " td.sorted").addClass("unsorted");
                    $("#fgrdVarieties #row" + VarietiesID + " td.unsorted").removeClass("sorted");
                    $("#EditVarieties").dialog('option', 'title', "Varieties Maintenance :: " + VarietiesDet.Variety);
                    $("#EditVarieties").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteVarieties_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteVarieties_', '');
        $('#OldVarietiesId').html(ID);
        var Variety = $(this).attr("data-variety");
        $("#DeleteConfirmVarieties").html("<p>Are you sure to delete<b> " + Variety + "</b> ?</p>");
        $("#DeleteConfirmVarieties").dialog("open");
    });

    $("#DeleteConfirmVarieties").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);               
                var ID = $("#OldVarietiesId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectVarieties',
                    data: '{"ID":"' + ID + '","Category":"","Variety":"","ShortCode":"","Mode":"3"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            adialog.dialog("close");
                            $("#fgrdVarieties").flexReload({ url: '/url/for/refresh' });
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

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {            
            if ($(this).closest('tr').next().find('input')) {
                if ($(this).attr('id') == "txtVar_ShortCode") {
                    $("#EditVarieties").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                }
                else {
                    $(this).closest('tr').next().find('input').focus();
                }
                return false;
            }
        }
    });

    $("#lstVar_Category").keydown(function (e) {
        debugger;
        var keycodevar = e.which;
        if (keycodevar == 13) {
            $("#txtVar_Variety").focus();
            return false;
        }
    });
    

</script>
