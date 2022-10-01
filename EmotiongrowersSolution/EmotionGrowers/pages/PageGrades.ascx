<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageGrades.ascx.vb" Inherits="pages_PageGrades" %>

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

    /*#EditGrades input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }
       #EditGrades select {
        background-color:cornsilk;
    }*/
</style>


<table>
    <tr>
        <td>

            <div id="DivGradesForFgrd">
                <table id="fgrdGrades" style="display: none;"></table>
                <div id="DeleteConfirmGrades" style="display: none;" title="Alert"></div>
                <div id="OldGradesId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditGrades" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>            
            <tr>
                <td style="width: 150px;">Category</td>
                <td>
                    <select id="lstGrade_Category" style="width: 203px; margin-top: 5px" />
                </td>
            </tr>  
            <tr>
                <td style="width: 150px;">Grade</td>
                <td>
                    <input type="text" id="txtGrade_Grade" style="width: 200px;text-transform:uppercase;" maxlength="15">
                </td>
            </tr>         
        </tbody>
    </table>
</div>

<div id="divGradesID" style="display:none;"></div>

<script type="text/javascript">

    $(document).ready(new function () {
        LoadCategory();
        
        $("#fgrdGrades").flexigrid({
            url: 'BloomService.asmx/GetGradesForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Category', name: 'Category', width: 90, sortable: true, align: 'left' },
                { display: 'Grade', name: 'Grade', width: 280, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Category', name: 'Category' },
                { display: 'Grade', name: 'Grade' }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewGrades },
            ],
            showTableToggleBtn: true,
            sortname: "Category",
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
                var sel = jQuery("#fgrdGrades tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivGradesForFgrd #ExportCSV").show();
                }

                if ($("#divGradesID").html() != "0" && $("#fgrdGrades #row" + $("#divGradesID").html()).css('display') == "table-row") {
                    var id = $("#divGradesID").html();
                    $("#fgrdGrades [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrades td.unsorted").addClass("sorted");
                    $("#fgrdGrades td.sorted").removeClass("unsorted");
                    $("#fgrdGrades #row" + id).addClass("trSelectedHeader");
                    $("#fgrdGrades #row" + id).removeClass("trSelected");
                    $("#fgrdGrades #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdGrades #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divGradesID").html($("#divGradesID tr:first td:nth-child(3) div").text());
                    $("#fgrdGrades tr:first").addClass("trSelectedHeader trSelected");
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
                $('#lstGrade_Category').empty();
                for (var i in data) {
                    var cat = data[i];
                    $('#lstGrade_Category').append('<option value="' + cat.TYPE + '">' + "(" + cat.TYPE + ") " + cat.NAME + '</option>');
                }
            }
        });

    }
      
    $("#EditGrades").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: 150,
        title: 'Grades Maintenance',
        buttons: {
            Save: function () {
                var GradesID = $("#divGradesID").html();
                var Category = $("#lstGrade_Category").val() == "" ? "" : $("#lstGrade_Category").val().toUpperCase();
                if (Category == "") {
                    $("#EditGrades").next('div').find(".msgui").html("Please select category..");
                    $("#EditGrades").next('div').find('.msgui').show();
                    ctrlFocus($("#lstGrade_Category"));
                    return false;
                }
                var Grade = $("#txtGrade_Grade").val() == "" ? $("#txtGrade_Grade").attr('placeholder').toUpperCase() : $("#txtGrade_Grade").val().toUpperCase();                                      
                var Mode = GradesID == "" || GradesID == "0" ? "1" : "2";
               
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectGrades',
                    data: '{"ID":"' + GradesID + '","Category":"' + Category + '","Grade":"' + Grade + '","Mode":"' + Mode + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditGrades").next('div').find(".msgui").html("Category (<b>" + Category.toUpperCase() + "</b>) and Grade <b>" + Grade.toUpperCase() + "</b> Already exists!");
                                $("#EditGrades").next('div').find('.msgui').css('height','22px').show();
                            }
                            else {
                                $("#EditGrades").dialog("close")
                                $("#fgrdGrades").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditGrades").next('div').find(".msgui").html(output.d);
                            $("#EditGrades").next('div').find('.msgui').show();
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

            $("#EditGrades").next('div').find('.msgui').remove();
            $("#EditGrades").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
            $("#EditGrades").next('div').find(".msgui").css("width", $("#EditGrades").width() - $('#EditGrades').next('div').find(".ui-dialog-buttonset").width());
            $("#EditGrades").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewGrades() {
        debugger;
        $("#divGradesID").html("0");
        $("#txtGrade_Grade").val("");
        $("#txtGrade_Grade").attr('placeholder', "");
        $("#EditGrades").dialog("option", "title", "Grade Maintenance");
        $("#EditGrades").dialog("open");
    }

    $("[id^=EditGrades_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var GradesID = ID.replace("EditGrades_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetGradesByID',
            data: '{"ID":"' + GradesID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var GradesDet = output.d;
                    $("#divGradesID").html(GradesDet.ID);
                    $("#lstGrade_Category").val(GradesDet.Category);
                    $("#txtGrade_Grade").val("");
                    $("#txtGrade_Grade").attr('placeholder', GradesDet.Grade);
                    $("#fgrdGrades [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdGrades #row" + GradesID).addClass("trSelectedHeader");
                    $("#fgrdGrades td.unsorted").addClass("sorted");
                    $("#fgrdGrades td.sorted").removeClass("unsorted");
                    $("#fgrdGrades #row" + GradesID).removeClass("trSelected");
                    $("#fgrdGrades #row" + GradesID + " td.sorted").addClass("unsorted");
                    $("#fgrdGrades #row" + GradesID + " td.unsorted").removeClass("sorted");
                    $("#EditGrades").dialog('option', 'title', "Grades Maintenance :: " + GradesDet.Grade);
                    $("#EditGrades").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteGrades_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteGrades_', '');
        $('#OldGradesId').html(ID);
        var Category = $(this).attr("data-category");
        var Grade = $(this).attr("data-grade");
        $("#DeleteConfirmGrades").html("<p>Are you sure to delete<b> " + Category + " " + Grade + "</b> ?</p>");
        $("#DeleteConfirmGrades").dialog("open");
    });

    $("#DeleteConfirmGrades").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);               
                var ID = $("#OldGradesId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectGrades',
                    data: '{"ID":"' + ID + '","Category":"","Grade":"","Mode":"3"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            adialog.dialog("close");
                            $("#fgrdGrades").flexReload({ url: '/url/for/refresh' });
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
                if ($(this).attr('id') == "txtGrade_Grade") {
                    $("#EditGrades").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                }
                else {
                    $(this).closest('tr').next().find('input').focus();
                }
                return false;
            }
        }
    });


    $("#lstGrade_Category").keydown(function (e) {
        debugger;
        var keycodegrade = e.which;
        if (keycodegrade == 13) {
            $("#txtGrade_Grade").focus();
            return false;
        }
    });

</script>
