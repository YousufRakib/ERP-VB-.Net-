<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageWebPermission.ascx.vb" Inherits="pages_PageWebPermission" %>
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

    #tblWebPermissiondetails tr td:first-child {
        width: 120px;
    }

    #tblWebPermissiondetails tr {
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

        $("#ChkIsActive").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        

        $("#fgrdWebpermission").flexigrid({
            url: 'BloomService.asmx/GetWebPermissionList',
            dataType: 'xml',
            colModel: [
            { display: 'Delete', name: 'Delete', width: 50, sortable: true, align: 'center' },
            { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left' },
            { display: 'Page', name: 'UserName', width: 200, sortable: true, align: 'left' },
            //{ display: 'Password', name: 'Password', width: 140, sortable: true, align: 'left' },
            { display: 'UserType', name: 'UserType', width: 200, sortable: true, align: 'left' },
            //{ display: 'Email', name: 'Email', width: 200, sortable: true, align: 'left' },
            //{ display: 'Landing', name: 'Landing', width: 200, sortable: true, align: 'left' },

            ],
            searchitems: [
            { display: 'Name', name: 'Name' },
            { display: 'UserType', name: 'UserType' },
            ],
            buttons: [
            { name: 'Add New', bclass: 'add', onpress: addclicked },
            //{ name: 'Filter', bclass: 'filter', onpress: filterclicked }
            ],
            showTableToggleBtn: true,
            sortname: "Name",
            sortorder: "desc",
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


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserTypeList',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "") {
                    $("#DivUserTypes").html(output.d);
                }
            }
        });

        function addclicked(com, grid) {
            $(".YellowWarning").hide();
            $(".Warning").hide();
            $("#DivSection").find("button").removeClass("is-checked");
            $("#DivSection").find("button:first").addClass("is-checked");
            $("#DivSection").find("button:first").trigger('click');
            $("#txtWebPermissionName").val("");
            $("#txtWebPermissionPage").val("");
            $("[id^=btnUserType_]").removeClass("btnusertypelistSelected");
            $('#ChkIsActive').iButton("toggle", true);
            $("#OldWebPermissionID").html("~NEW~");
            $("#DivWebPermission").dialog('option', 'title', "Add WebPermission");
            $("#DivWebPermission").dialog("open");
        }

        $("[id^=btnUserType_]").live("click", function () {
            if ($(this).attr("class") != "btnusertypelist btnusertypelistSelected")
                $(this).addClass("btnusertypelistSelected");
            else
                $(this).removeClass("btnusertypelistSelected");
        });

        $('#DivSection.button-group').each(function (i, buttonGroup) {
            var $buttonGroup = $(buttonGroup);
            $buttonGroup.on('click', 'button', function () {
                $buttonGroup.find('.is-checked').removeClass('is-checked');
                $(this).addClass('is-checked');
                if ($(this)[0].id.substring(7) == "1") {
                    $('[id^=btnUserType_]').hide();
                    $("#btnUserType_1").show();
                }
                else {
                    $('[id^=btnUserType_]').show();
                    $("#btnUserType_1").hide();
                }
            });
        });

        $("#DivWebPermission").dialog({
            autoOpen: false,
            width: 650,
            height: 450,
            modal: true,
            resizable: false,
            buttons: {

                Save: function () {

                    var Name = $("#txtWebPermissionName").val();
                    if (Name.toString().trim() == "") {
                        $('.YellowWarning').html("Permission Name is Required")
                        $('.YellowWarning').show();
                        $("#txtWebPermissionName").focus();
                        return false;
                    }
                    if ($("#txtWebPermissionPage").val().toString().trim() == "") {
                        $('.YellowWarning').html("Permission Page is Required")
                        $('.YellowWarning').show();
                        $("#txtWebPermissionPage").focus();
                        return false;
                    }
                    var UserTypeList = "";
                    var UsrTypAlrt = 1;
                    $("[id^=btnUserType_]").each(function () {
                        if ($(this).attr("class") == "btnusertypelist btnusertypelistSelected") {
                            UserTypeList += $(this)[0].id.substring(12) + ",";
                            UsrTypAlrt = 0;
                        }
                    });
                    UserTypeList = UserTypeList.substring(0, UserTypeList.length - 1);
                    var IsAdmin = $("#DivSection .button.is-checked")[0].id.substring(7)
                    var IsActive = $('#ChkIsActive').is(":checked") ? "1" : "0";
                    var OldWebPermissionID = $("#OldWebPermissionID").html();
                    var Page = $("#txtWebPermissionPage").val().toString().trim()
                    if (UsrTypAlrt == 0) {
                        $('.YellowWarning').html("Please wait...");
                        $('.YellowWarning').show();
                        $('.Warning').hide();
                        $(".YellowWarning").hide();
                        $(".Warning").hide();
                        if (OldWebPermissionID == "~NEW~") {                           
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/SaveWebPermissionDetails',
                                data: '{"Name":"' + Name + '","Page":"' + Page + '","UserTypeList":"' + UserTypeList + '","IsAdmin":"' + IsAdmin + '","IsActive":"' + IsActive + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output) {
                                    
                                    if (output.d == 'valid') {
                                        $("#DivWebPermission").dialog("close");
                                        $("#OldWebPermissionID").html("");
                                        $("#fgrdWebpermission").flexReload({ url: '/url/for/refresh' });
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
                                url: 'BloomService.asmx/UpdateWebPermissionDetails',
                                data: '{"Name":"' + Name + '","Page":"' + Page + '","UserTypeList":"' + UserTypeList + '","IsAdmin":"' + IsAdmin + '","IsActive":"' + IsActive + '","PageID":"' + OldWebPermissionID + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output) {
                                    
                                    if (output.d == 'valid') {
                                        $("#DivWebPermission").dialog("close");
                                        $("#OldWebPermissionID").html("");
                                        $("#fgrdWebpermission").flexReload({ url: '/url/for/refresh' });
                                        return true;
                                    }
                                    else {
                                        $.MessageBox("OOPS!! please try again, we will research the issue!!");
                                    }
                                }
                            });
                        }
                    }
                    else {
                        $('.YellowWarning').html("Usertype is Required")
                        $('.YellowWarning').show();
                        return false;
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

    $("[id^=editpermission_]").live("click", function () {
        $('.YellowWarning').hide();
        $('.Warning').hide();
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(15);
        $("#OldWebPermissionID").html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPermissionforPageID',
            data: '{"PageID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                
                var WebPermission = output.d;
                if (WebPermission.PageID == ID) {
                    $("#txtWebPermissionName").val(WebPermission.Name);
                    $("#txtWebPermissionPage").val(WebPermission.Page);
                    $("#DivSection").find("button").removeClass("is-checked");
                    $("[id^=btnUserType_]").removeClass("btnusertypelistSelected");
                    if (WebPermission.IsAdmin) {
                        $("#DivSection").find("button#btnSEC_1").addClass("is-checked");
                        $("#DivSection").find("button#btnSEC_1").trigger('click');
                    }
                    else {
                        $("#DivSection").find("button#btnSEC_0").addClass("is-checked");
                        $("#DivSection").find("button#btnSEC_0").trigger('click');
                    }
                    var UserTypeList = WebPermission.UserTypeIDs;
                    var i=0;
                    for (i; i < WebPermission.UserTypeIDs.split(",").length; i++) {
                        $("#btnUserType_" + WebPermission.UserTypeIDs.split(",")[i].toString().trim()).addClass("btnusertypelistSelected");
                    }                    
                    $('#ChkIsActive').iButton("toggle", WebPermission.IsActive);
                    $("#DivWebPermission").dialog('option', 'title', 'Edit WebPermission : ' + WebPermission.Name + '');
                    $("#DivWebPermission").dialog("open");
                    $("#fgrdWebpermission").flexReload({ url: '/url/for/refresh' });
                }

            },
            error: function (e) {
                $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue.");
                $("#msgbox-select").dialog("open");
            }
        });
    });

    $("[id^=deletepermission_]").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(17);
        $('.YellowWarning').hide();
        $('#OldWebPermissionID').html(ID);

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPermissionforPageID',
            data: '{"PageID":"' + ID + '" }',
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
                var List = $("#deletepermission_" + $("#OldWebPermissionID").html());
                var ID = $("#OldWebPermissionID").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteWebPermissionDetails',
                    data: '{"PageID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'valid') {
                            adialog.dialog("close");
                            $("#fgrdWebpermission").flexReload({ url: '/url/for/refresh' });
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
<div id="DivWebPermission" style="display: none;">
    <table style="text-align: left; border-collapse: collapse; margin-left: 20px;" id="tblWebPermissiondetails">
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
            <td>Section</td>
            <td>
                <div style="float: left" class="button-group" id="DivSection">
                    <button class="button" type="button" name="btnSection" value="Admin" id="btnSEC_1">Admin</button>
                    <button class="button" type="button" name="btnSection" value="User" id="btnSEC_0">User</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>Permission</td>
            <td>
                <input type="text" id="txtWebPermissionName" style="width: 300px" />
            </td>
        </tr>
        <tr>
            <td>Page</td>
            <td>
                <input type="text" id="txtWebPermissionPage" style="width: 300px" />
            </td>
        </tr>
        <tr>
            <td>UserType
            </td>
            <td>
                <div id="DivUserTypes"></div>
            </td>
        </tr>
        <tr>
            <td>IsActive
            </td>
            <td>
                <input type="checkbox" id="ChkIsActive" />
            </td>
        </tr>
    </table>
</div>
<div class="Cargodiv">
    <table id="fgrdWebpermission" style="display: none;"></table>
</div>

<div id="Deleteconfirm" style="display: none;" title="Alert"></div>
<div id="OldWebPermissionID" style="display: none;"></div>
<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>



