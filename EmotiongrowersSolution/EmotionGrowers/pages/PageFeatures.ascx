<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageFeatures.ascx.vb" Inherits="pages_PageFeatures" %>
<style type="text/css">
    /* ---- button ---- */
    button {
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
        background-color: #00A2FF;
    }

    .button.is-checked {
        color: white;
    }


    .button-group:after {
        content: '';
        display: block;
        clear: both;
    }

    .button-group .button {
        float: left;
        padding: 5px 5px;
        border-radius: 4px;
        margin-left: 0;
        margin-right: 1px;
        width: 100px;
        border-right: 1px solid gray;
        border-bottom: 1px solid gray;
    }

    .SmallButton {
        background-color: #333D49;
        -moz-border-radius: 28px;
        -webkit-border-radius: 28px;
        border-radius: 28px;
        border: 1px solid #84bbf3;
        display: inline-block;
        cursor: pointer;
        color: #ffffff;
        font-family: arial;
        font-size: 9px;
        padding: 4px 7px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #528ecc;
    }

        .SmallButton:hover {
            background-color: #378de5;
        }

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    #tblFeaturedetails tr td:first-child {
        width: 120px;
    }

    #tblFeaturedetails tr {
        height: 40px;
    }

    .btnusertypelist {
        width: 200px;
        height: 25px;
        line-height: 24px;
        display: inline-block;
        color: black;
        background-color: rgb(133, 136, 140);
        font-weight: bold;
        font-size: 11px;
        text-align: center;
        text-decoration: none;
        margin-left: 8px;
        border: 1px solid black;
        border-radius: 2px;
        white-space: nowrap;
        margin-top: 8px;
        margin-bottom: 8px;
        cursor: pointer;
        /* border-radius: 2px 25px 2px 25px; */
        padding-left: 2px;
        padding-right: 2px;
    }

    .btnusertypelistSelected {
        border: 1px solid black;
        background-color: #4679BD;
        color: white;
    }
</style>

<script type="text/javascript">
    $(document).ready(new function () {



        $("#fgrdFeature").flexigrid({
            url: 'BloomService.asmx/GetFeatureList',
            dataType: 'xml',
            colModel: [
            { display: 'Delete', name: 'Delete', width: 50, sortable: true, align: 'center' },
            { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left' }
            ],
            searchitems: [
            { display: 'Name', name: 'Name' },
            ],
            buttons: [
            { name: 'Add New', bclass: 'add', onpress: addclicked },
            ],
            showTableToggleBtn: true,
            sortname: "Name",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 350) / 28),
            qtype: "Name",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 290,

            striped: true,
            params: [
              { name: 'Filter', value: '' }
            ],

        });



        function addclicked(com, grid) {
            $(".YellowWarning").hide();
            $(".Warning").hide();
            $("#DivSection").find("button").removeClass("is-checked");
            $("#DivSection").find("button:first").addClass("is-checked");
            $("#DivSection").find("button:first").trigger('click');
            $("#txtFeatureName").val("");
            $("[id^=btnUserType_]").removeClass("btnusertypelistSelected");
            $('#ChkIsActive').iButton("toggle", true);
            $("#OldFeatureID").html("~NEW~");
            $("#DivFeature").dialog('option', 'title', "Add Feature");
            $("#DivFeature").dialog("open");
        }



        $("#DivFeature").dialog({
            autoOpen: false,
            width: 400,
            height: 150,
            modal: true,
            resizable: false,
            buttons: {

                Save: function () {

                    var Name = $("#txtFeatureName").val();
                    if (Name.toString().trim() == "") {
                        $('.YellowWarning').html("Feature Name is Required")
                        $('.YellowWarning').show();
                        $("#txtFeatureName").focus();
                        return false;
                    }

                    var OldFeatureID = $("#OldFeatureID").html();


                    $('.YellowWarning').html("Please wait...");
                    $('.YellowWarning').show();
                    $('.Warning').hide();
                    $(".YellowWarning").hide();
                    $(".Warning").hide();
                    if (OldFeatureID == "~NEW~") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveFeatureDetails',
                            data: '{"Name":"' + Name + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {

                                if (output.d == 'valid') {
                                    $("#DivFeature").dialog("close");
                                    $("#OldFeatureID").html("");
                                    $("#fgrdFeature").flexReload({ url: '/url/for/refresh' });
                                    return true;
                                }
                                else {
                                    $.MessageBox("OOPS!! please try again, we will research the issue!!");
                                }
                            }
                        });
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/UpdateFeatureDetails',
                            data: '{"Name":"' + Name + '","FeatureID":"' + OldFeatureID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {

                                if (output.d == 'valid') {
                                    $("#DivFeature").dialog("close");
                                    $("#OldFeatureID").html("");
                                    $("#fgrdFeature").flexReload({ url: '/url/for/refresh' });
                                    return true;
                                }
                                else {
                                    $.MessageBox("OOPS!! please try again, we will research the issue!!");
                                }
                            }
                        });
                    }
                },

                Cancel: function () {
                    $(this).dialog("close");
                },

            },
            open: function () {
                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }

        });

    });

    $("[id^=editFeature_]").live("click", function () {
        $('.YellowWarning').hide();
        $('.Warning').hide();
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(12);        
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFeatureforFeatureID',
            data: '{"FeatureID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var Feature = output.d;
                if (Feature.FeatureID == ID) {
                    $("#OldFeatureID").html(ID);
                    $("#txtFeatureName").val(Feature.Name);                    
                    $("#DivFeature").dialog('option', 'title', 'Edit Feature : ' + Feature.Name + '');
                    $("#DivFeature").dialog("open");                    
                }

            },
            error: function (e) {
                $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
                $("#msgbox-select").dialog("open");
            }
        });
    });

    $("[id^=deleteFeature_]").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(14);
        $('.YellowWarning').hide();
        $('#OldFeatureID').html(ID);

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFeatureforFeatureID',
            data: '{"FeatureID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var List = output.d;
                $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + List.Name + "</b> ?</p>");
                $("#Deleteconfirm").dialog("open");
            }

        });
    });


    $("#Deleteconfirm").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#deleteFeature_" + $("#OldFeatureID").html());
                var ID = $("#OldFeatureID").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteFeatureDetails',
                    data: '{"FeatureID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'valid') {
                            adialog.dialog("close");
                            $("#fgrdFeature").flexReload({ url: '/url/for/refresh' });
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


</script>

<div id="OldUserID" style="display: none"></div>
<div id="DivFeature" style="display: none;">
    <table style="text-align: left; border-collapse: collapse; margin-left: 5px;" id="tblFeaturedetails">
        <tr style="height: 28px">

            <td colspan="2">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr>
            <td>Feature</td>
            <td>
                <input type="text" id="txtFeatureName" style="width: 300px" />
            </td>
        </tr>

    </table>
</div>
<div class="Cargodiv">
    <table id="fgrdFeature" style="display: none;"></table>
</div>

<div id="Deleteconfirm" style="display: none;" title="Alert"></div>
<div id="OldFeatureID" style="display: none;"></div>
<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>

