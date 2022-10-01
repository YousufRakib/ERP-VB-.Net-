<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageLabelType.ascx.vb" Inherits="pages_PageLabelType" %>

<link rel="stylesheet" href="css/Filters.css">
<link type="text/css" href="css/Head1.css" rel="stylesheet" />

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
</style>

<style type="text/css">
    .UsersDiv {
        width: 100%;
        float: left;
    }

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }


    .delete {
        background: url(images/Delete-icon.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

   
</style>

<div id='cssmenu'>
    <ul>
        <li><a href="Default.aspx?Page=User"><span>Users</span></a></li>
        <li><a href='#'><span>Admin</span></a></li>
        <li class=''><a href='Default.aspx?Page=email'><span>Email</span></a></li>
        <li class='active'><a href='Default.aspx?Page=LabelType'><span>LabelType</span></a></li>
        <li class='last'><a href='Login.aspx'><span>Logout</span></a></li>
    </ul>
    <div id="divLoginUserName" class="LoginUserName" runat="server" ></div>
</div>

<div>
    <table id="fgrdLabeltype" style="display: none;"></table>
</div>

<div id="OldId" style="display: none;"></div> 
<div id="Deleteconfirm" style="display: none;" title="Alert"></div>

<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>

<div id="DivLabeltype" style="display: none;" align="center">
    <table style="text-align: left;">

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
            <td>
                <table style="margin-left: 16px">
                    <tr>
                        <td align="left">Label Type</td>
                        <td><input id="txtLabeltype" style="width: 250px;" /></td>
                    </tr>
                    <tr style="height:20px"></tr>
                  
                </table>
            </td>
            
        </tr>

    </table>
</div>

<script type="text/javascript">

    $(document).ready(new function () {


        $("#fgrdLabeltype").flexigrid({
            url: 'BloomService.asmx/GetLabeltype',
            dataType: 'xml',
            colModel: [
                { display: 'Delete', name: 'Delete', width: 50, sortable: true, align: 'center' },
                { display: 'Label Type', name: 'LabelType', width: 240, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'Label Type', name: 'LabelType' },
                
            ],

            buttons: [
                { name: 'Add New', bclass: 'add', onpress: addclicked },
                
            ],

            showTableToggleBtn: true,
            sortname: "LabelType",
            sortorder: "desc",
            usepager: true,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 350) / 28),
            qtype: "LabelType",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 240,
            striped: true,

        });

        function addclicked(com, grid) {
          
            $(".YellowWarning").hide();
            $("#txtLabeltype").val("");
            $("#DivLabeltype").dialog('option', 'title', "Add New Labeltype");
            $("#DivLabeltype").dialog("open");
            $("#OldId").html("~NEW~");
            $(".Warning").hide();

        }

        function validate() {

            $('.YellowWarning').hide();
            if ($("#txtLabeltype").val() == "") {
                $('.YellowWarning').html("Labletype is required!");
                $('.YellowWarning').show();
                $("#txtLabeltype").focus();
                return false;
            }
            return true;
        }


        $("#DivLabeltype").dialog({

            autoOpen: false,
            width: 400,
            height:175,
            modal: true,
            resizable: false,   
            buttons: {
                Save: function () {
                    if (validate()) {

                        var OldId = $("#OldId").html();
                        var Labeltype = $("#txtLabeltype").val();
                        
                        if (OldId == "~NEW~") {
                            
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/SaveLabeltype',
                                data: '{"Labeltype":"' + Labeltype + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output) {
                                   
                                    
                                    if (output.d == 'valid') {

                                        $("#fgrdLabeltype").flexReload({ url: '/url/for/refresh' });
                                        $("#DivLabeltype").dialog("close");
                                        return true;
                                    }
                                    else {
                                        if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                            $.MessageBox("LabelType is already exists!");
                                            $("#txtLabeltype").focus();
                                        }
                                        else

                                            $.MessageBox("LabelType is already exists!");
                                        return false;
                                    }
                                },
                                error: function (e) {
                                    $('.YellowWarning').hide();
                                    $('.Warning').show();
                                    return false;
                                }
                            });
                        }

                        else {
                            debugger
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/EditLabeltype',
                                data: '{"Labeltype":"' + Labeltype + '","OldId":"' + OldId + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output, status) {
                                    
                                    if (output.d == 'valid') {
                                        $("#fgrdLabeltype").flexReload({ url: '/url/for/refresh' });
                                        $("#DivLabeltype").dialog("close");
                                        return true;
                                    }
                                    else {
                                        if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                            $.MessageBox("LabelType is already exists!");
                                            $("#txtLabeltype").focus();
                                        }
                                        else

                                            $.MessageBox("LabelType is already exists!");
                                        return false;
                                    }
                                },
                                error: function (e) {
                                    $('.YellowWarning').hide();
                                    $('.Warning').show();
                                    return false;
                                }
                            });
                        }

                    }
                    else
                        return false;

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

        $("[id^=Labtypeedit_]").live("click", function () {
            $('.YellowWarning').hide();
            $('.Warning').hide();
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(12);

            $("#OldId").html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetLabelTypeById',
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var List = output.d;

                    if (List.ID == ID) {

                        $("#txtLabeltype").val(List.Labeltype);
                        $("#DivLabeltype").dialog('option', 'title', 'Label Type :: Edit');
                        $("#DivLabeltype").dialog("open");
                    }
                    else {
                        $("#msg").html("Unable to get the item details, please contact site admin.");
                        $("#msgbox-select").dialog("open");
                    }
                },
                error: function (e) {
                    $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
                    $("#msgbox-select").dialog("open");
                }
            });
        });


        $("[id^=Labtypedelete_]").live("click", function () {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(14);
            $('.YellowWarning').hide();
            $('#OldId').html(ID);

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetLabelTypeById',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var List = output.d;

                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + List.Labeltype + "</b> ?</p>");
                    $("#Deleteconfirm").dialog("open");
                }

            });
        });



        $("#Deleteconfirm").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            modal: true,
            buttons: {
                Yes: function () {
                    var adialog = $(this);
                    var List = $("#Labtypedelete_" + $("#OldId").html());
                    var ID = $("#OldId").html();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteLabelType',
                        data: '{"ID":"' + ID + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            if (output.d == 'valid') {
                                adialog.dialog("close");
                                $("#fgrdLabeltype").flexReload({ url: '/url/for/refresh' });
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


    });
</script>