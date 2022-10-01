<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageEmail.ascx.vb" Inherits="pages_PageEmail" %>


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

<%--<div id='cssmenu'>
    <ul>
        <li><a href="Default.aspx?Page=User"><span>Users</span></a></li>
        <li><a href='Default.aspx?Page=admin'><span>Admin</span></a></li>
        <li class='active'><a href='Default.aspx?Page=email'><span>Email</span></a></li>        
        <li class='last'><a href='Login.aspx'><span>Logout</span></a></li>
    </ul>
    <div id="divLoginUserName" class="LoginUserName" runat="server" ></div>
</div>--%>

<div>
    <table id="fgrdUserEmail" style="display: none;"></table>
</div>


<div id="OldId" style="display: none;"></div> 
<div id="confirmIsWebLogin" style="display: none;" title="Alert"></div>
<div id="confirmIsInvoice" style="display: none;" title="Alert"></div>
<div id="confirmIsErrors" style="display: none;" title="Alert"></div>
<div id="confirmIsLabelNotification" style="display: none;" title="Alert"></div>
<div id="confirmIsXmlNotification" style="display: none;" title="Alert"></div>
<div id="Status" style="display: none;"></div>
<div id="Deleteconfirm" style="display: none;" title="Alert"></div>

<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>

<div id="DivSystemEmail" style="display: none;" align="center">
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
                        <td align="left">Email</td>
                        <td><input id="txtUserEmail" style="width: 250px;" /></td>
                    </tr>

                    <tr>
 
                    </tr>                  

  
                </table>
            </td>
            
        </tr>

    </table>
</div>


<script type="text/javascript">

    $(document).ready(new function () {

        //if ($("#ctl00_divEmail").html() == "True") {
            //$("#cssmenu ul li").removeClass('active');
            //$("#Dboard_MenuEmail").addClass('active');


            $("#IsWebLogin").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });

            $("#IsErrors").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });
            $("#IsLabelNotify").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });
            $("#IsXmlNotification").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });

            $("#IsARXmlNotification").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });
            $("#IsShipLabelNotify").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });
            $("#IsEodReports").iButton({
                labelOn: "Yes",
                labelOff: "No"
            });

            $("#fgrdUserEmail").flexigrid({
                url: 'BloomService.asmx/GetUserEmail',
                dataType: 'xml',
                colModel: [
                    { display: 'Delete', name: 'Delete', width: 50, sortable: true, align: 'center' },
                    { display: 'Email', name: 'Email', width: 240, sortable: true, align: 'left' },
                    { display: 'Web Login', name: 'WebLogin', width: 75, sortable: true, align: 'center' },
                    { display: 'Errors', name: 'Errors', width: 75, sortable: true, align: 'center' },
                    { display: 'Label Notification', name: 'LabelNotification', width: 85, sortable: true, align: 'center' },
                    { display: 'XML', name: 'XmlNotification', width: 85, sortable: true, align: 'center' },
                    { display: 'ARXML', name: 'ARXmlNotification', width: 85, sortable: true, align: 'center' },
                    { display: 'ShippingLabelNotification',name:'ShippingLabelNotification',width:126,sortable:true,align:'center'},
                    { display: 'End of Day Reports', name: 'EodReports', width: 120, sortable: true, align: 'center' }
                ],
                searchitems: [
                    { display: 'Email', name: 'Email' },
                ],

                buttons: [
                    { name: 'Add New', bclass: 'add', onpress: addclicked },
                    //{ name: 'Delete', bclass: 'delete', onpress: deleteclicked }
                ],

                showTableToggleBtn: true,
                sortname: "Email",
                sortorder: "asc",
                usepager: true,
                title: false,
                useRp: true,
                //rp: parseInt(($(window).height() - 350) / 28),
                qtype: "Email",
                nomsg: 'No records found!',
                singleSelect: true,
                showToggleBtn: false,
                resizable: false,
                autoload: true,
                showTableToggleBtn: false,
                height: $(window).height() - 280,
                striped: true,


            });

            function addclicked(com, grid) {

                //$.ajax({
                //    url: 'BloomService.asmx/SaveUserEmail',
                //    type: 'POST',
                //    async: false,
                //    data: {},
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json"
                //});

                $(".YellowWarning").hide();
                $("#IsWebLogin").iButton("toggle", true)
                //$("#IsInvoiceCreate").iButton("toggle", true)
                $("#IsErrors").iButton("toggle", true);
                $("#IsLabelNotify").iButton("toggle", true);
                $("#IsShipLabelNotify").iButton("toggle", true);
                $("#IsXmlNotification").iButton("toggle", true);
                $("#IsARXmlNotification").iButton("toggle", true);
                $("#IsEodReports").iButton("toggle", true);
                $("#DivSystemEmail").dialog('option', 'title', "Add New Email");
                $("#DivSystemEmail").dialog("open");
                $("#txtUserEmail").val("");
                $("#OldId").html("~NEW~");
                $(".Warning").hide();



            }

            function validate() {


                $('.YellowWarning').hide();
                if ($("#txtUserEmail").val() == "") {
                    $('.YellowWarning').html("Email is required to save!");
                    $('.YellowWarning').show();
                    $("#txtUserEmail").focus();
                    return false;
                }
                return true;
            }

            $("#DivSystemEmail").dialog({

                autoOpen: false,
                width: 465,
                modal: true,
                resizable: false,
                buttons: {
                    Save: function () {
                        if (validate()) {

                            $('.YellowWarning').html("Please wait...");
                            $('.YellowWarning').show();
                            $('.Warning').hide();
                            var OldId = $("#OldId").html();
                            var UserEmail = $("#txtUserEmail").val();

                            var filter = /[\w-]+@([\w-]+\.)+[\w-]+/;
                            if (!filter.test(UserEmail)) {
                                $('.YellowWarning').html("Please enter a valid email address");
                                $('.YellowWarning').show();
                                $('.Warning').hide();
                                return false;
                            }
                            else {
                                $('.YellowWarning').html("Email address is valid");
                                $('.YellowWarning').hide();
                                $('.Warning').hide();
                            }

                            var WebLogin = $('#IsWebLogin').is(":checked") ? "1" : "0";
                            //var InvoiceCreate = $('#IsInvoiceCreate').is(":checked") ? "1" : "0";
                            var Errors = "0";
                            var isLabelNotify =  "0";
                            var isShipLabelNotify = "0";
                            var IsXmlNotification = "0";
                            var IsARXmlNotification = "0";
                            var IsEodReports = "0";

                            if (OldId == "~NEW~") {

                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/SaveSystemEmail',
                                    data: '{"UserEmail":"' + UserEmail + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {

                                        if (output.d == 'valid') {

                                            $("#fgrdUserEmail").flexReload({ url: '/url/for/refresh' });
                                            $("#DivSystemEmail").dialog("close");
                                            return true;
                                        }
                                        else {
                                            if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                                $.MessageBox("Email-Id already exists!");
                                                $("#txtUserEmail").focus();
                                            }
                                            else

                                                $.MessageBox("Email-Id already exists!");
                                            return false;
                                        }
                                    },
                                    error: function (e) {
                                        alert(e.responseText);
                                        $('.YellowWarning').hide();
                                        $('.Warning').show();
                                        return false;
                                    }
                                });
                            }

                            else {

                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/EditSystemEmail',
                                    data: '{"UserEmail":"' + UserEmail + '","OldId":"' + OldId + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        
                                        if (output.d == 'valid') {
                                            $("#fgrdUserEmail").flexReload({ url: '/url/for/refresh' });
                                            $("#DivSystemEmail").dialog("close");
                                            return true;
                                        }
                                        else {
                                            if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                                $.MessageBox("Email already exists!");
                                                $("#txtUserEmail").focus();
                                            }
                                            else

                                                $.MessageBox("Email already exists!");
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


            $("[id^=Emailedit_]").live("click", function () {
                $('.YellowWarning').hide();
                $('.Warning').hide();
                var sourceCtl = $(this);
                var ID = sourceCtl.attr('id').substring(10);

                $("#OldId").html(ID);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetSystemEmailById',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        var List = output.d;
                        
                        if (List.ID == ID) {

                            $("#txtUserEmail").val(List.Email);
                            $("#IsWebLogin").iButton("toggle", List.WebLogin == '' ? false : true);
                            $("#IsErrors").iButton("toggle", List.Errors == '' ? false : true);
                            $("#IsLabelNotify").iButton("toggle", List.LabelNotification == '' ? false : true);
                            $("#IsShipLabelNotify").iButton("toggle", List.ShippingLabelNotification == '' ? false : true);
                            $("#IsXmlNotification").iButton("toggle", List.XmlNotification == '' ? false : true);
                            $("#IsARXmlNotification").iButton("toggle", List.ARXmlNotification == '' ? false : true);
                            $("#IsEodReports").iButton("toggle", List.EodReports == '' ? false : true);
                            $("#DivSystemEmail").dialog('option', 'title', 'SystemEmail :: Edit');
                            $("#DivSystemEmail").dialog("open");
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


            $("[id^=Emaildelete_]").live("click", function () {
                var sourceCtl = $(this);
                var ID = sourceCtl.attr('id').substring(12);
                $('.YellowWarning').hide();
                $('#OldId').html(ID);

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetSystemEmailById',
                    data: '{"ID":"' + ID + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        var List = output.d;

                        $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + List.Email + "</b> ?</p>");
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
                        var List = $("#Emaildelete_" + $("#OldId").html());
                        var ID = $("#OldId").html();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/DeleteSystemEmail',
                            data: '{"ID":"' + ID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                if (output.d == 'valid') {
                                    adialog.dialog("close");
                                    $("#fgrdUserEmail").flexReload({ url: '/url/for/refresh' });
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

            $("[id^=isweblogin_]").live("click", function () {

                var sourceCtl = $(this);
                var ID = sourceCtl.attr('id').substring(11);
                $('.YellowWarning').hide();
                $('#OldId').html(ID);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetSystemEmailById',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        var item = output.d;
                        if (item.WebLogin) {

                            $("#confirmIsWebLogin").html("<p>Are you sure set <b>" + item.Email + "</b> web Login alert to False?</p>");
                            $("#Status").html("0");
                        }
                        else {
                            $("#confirmIsWebLogin").html("<p>Are you sure set <b>" + item.Email + "</b> web Login alert to True?</p>");
                            $("#Status").html("1");
                        }
                        //$("#confirmIsWebLogin").dialog("open");

                        var login = $("#isweblogin_" + $("#OldId").html());
                        var ID = $("#OldId").html();
                        var IsWebLogin = $("#Status").html();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ToggleWebLogin',
                            data: '{"ID":"' + ID + '","WebLogin":"' + IsWebLogin + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == 'valid') {
                                    if (IsWebLogin == "0")
                                        login.attr("src", "images/check-off.png");
                                    else
                                        login.attr("src", "images/check-on.png");
                                   // adialog.dialog("close");
                                }
                                else {
                                    //adialog.dialog("close");
                                    $("#msg").html("There was an error during save the details!");
                                    $("#msgbox-select").dialog("open");
                                }
                            }
                        });

                    }

                });
            });


            $("#confirmIsWebLogin").dialog({
                autoOpen: false,
                resizable: false,
                title: "Alert",
                modal: true,
                buttons: {
                    Yes: function () {
                        var adialog = $(this);
                        var login = $("#isweblogin_" + $("#OldId").html());
                        var ID = $("#OldId").html();
                        var IsWebLogin = $("#Status").html();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ToggleWebLogin',
                            data: '{"ID":"' + ID + '","WebLogin":"' + IsWebLogin + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == 'valid') {
                                    if (IsWebLogin == "0")
                                        login.attr("src", "images/check-off.png");
                                    else
                                        login.attr("src", "images/check-on.png");
                                    adialog.dialog("close");
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



            $("[id^=iserrors_]").live("click", function () {
                var sourceCtl = $(this);
                var ID = sourceCtl.attr('id').substring(9);
                $('.YellowWarning').hide();
                $('#OldId').html(ID);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetSystemEmailById',
                    data: '{"ID":"' + ID + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        var item = output.d;
                        if (item.Errors) {
                            //$("#confirmIsErrors").html("<p>Are you sure set <b>" + item.Email + "</b> Errors Alert to False?</p>");
                            $("#Status").html("0");
                        }
                        else {
                           // $("#confirmIsErrors").html("<p>Are you sure set <b>" + item.Email + "</b> Errors Alert to True?</p>");
                            $("#Status").html("1");
                        }
                        //$("#confirmIsErrors").dialog("open");

                        var errors = $("#iserrors_" + $("#OldId").html());
                        var ID = $("#OldId").html();
                        var IsErrors = $("#Status").html();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ToggleErrors',
                            data: '{"ID":"' + ID + '","Errors":"' + IsErrors + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == 'valid') {
                                    if (IsErrors == "0")
                                        errors.attr("src", "images/check-off.png");
                                    else
                                        errors.attr("src", "images/check-on.png");
                                    
                                }
                                else {                                    
                                    $("#msg").html("There was an error during save the details!");
                                    $("#msgbox-select").dialog("open");
                                }
                            }
                        });
                    }
                });
            });

    });


    $("[id^=isLabelNotification_]").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(20);
        $('.YellowWarning').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSystemEmailById',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var item = output.d;
                if (item.LabelNotification) {
                    //$("#confirmIsLabelNotification").html("<p>Are you sure set <b>" + item.Email + "</b> Label Notification Alert to False?</p>");
                    $("#Status").html("0");
                }
                else {
                    //$("#confirmIsLabelNotification").html("<p>Are you sure set <b>" + item.Email + "</b> Label Notification Alert to True?</p>");
                    $("#Status").html("1");
                }
                //$("#confirmIsLabelNotification").dialog("open");

                var errors = $("#isLabelNotification_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsErrors = $("#Status").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleLabelNotification',
                    data: '{"ID":"' + ID + '","IsLabelNotification":"' + IsErrors + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsErrors == "0")
                                errors.attr("src", "images/check-off.png");
                            else
                                errors.attr("src", "images/check-on.png");
                            
                        }
                        else {
                            
                            $("#msg").html("There was an error during save the details!");
                            $("#msgbox-select").dialog("open");
                        }
                    }
                });
            }

        });
    });


 

    $("[id^=isXmlNotification_]").live("click", function () {
        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(18);
        $('.YellowWarning').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSystemEmailById',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                
                var Email = output.d;
                if (Email.XmlNotification) {
                    //$("#confirmIsXmlNotification").html("<p>Are you sure set <b>" + Email.Email + "</b> Xml Notification Alert to False?</p>");
                    $("#Status").html("0");
                }
                else {
                    //$("#confirmIsXmlNotification").html("<p>Are you sure set <b>" + Email.Email + "</b> Xml Notification Alert to True?</p>");
                    $("#Status").html("1");
                }
                //$("#confirmIsXmlNotification").dialog("open");

                var email = $("#isXmlNotification_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsXml = $("#Status").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleXmlNotification',
                    data: '{"ID":"' + ID + '","XmlNotification":"' + IsXml + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsXml == "0")
                                email.attr("src", "images/check-off.png");
                            else
                                email.attr("src", "images/check-on.png");
                            
                        }
                        else {
                            adialog.dialog("close");
                            $("#msg").html("There was an error during save the details!");
                           
                        }
                    }
                });
            }
        });
    });

    $("[id^=isARXmlNotification_]").live("click", function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(20);
        $('.YellowWarning').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSystemEmailById',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var Email = output.d;
                if (Email.ARXmlNotification) {
                    //$("#confirmIsXmlNotification").html("<p>Are you sure set <b>" + Email.Email + "</b> Xml Notification Alert to False?</p>");
                    $("#Status").html("0");
                }
                else {
                    //$("#confirmIsXmlNotification").html("<p>Are you sure set <b>" + Email.Email + "</b> Xml Notification Alert to True?</p>");
                    $("#Status").html("1");
                }
                //$("#confirmIsXmlNotification").dialog("open");

                var email = $("#isARXmlNotification_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsXml = $("#Status").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleARXmlNotification',
                    data: '{"ID":"' + ID + '","ARXmlNotification":"' + IsXml + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsXml == "0")
                                email.attr("src", "images/check-off.png");
                            else
                                email.attr("src", "images/check-on.png");

                        }
                        else {
                            adialog.dialog("close");
                            $("#msg").html("There was an error during save the details!");

                        }
                    }
                });
            }
        });
    });



    $("[id^=isShipLabelNotification_]").live("click", function () {
        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(24);
        $('.YellowWarning').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSystemEmailById',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var item = output.d;
                if (item.ShippingLabelNotification) {
                    $("#Status").html("0");
                }
                else {
                    $("#Status").html("1");
                }
                //$("#confirmIsLabelNotification").dialog("open");

                var errors = $("#isShipLabelNotification_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsErrors = $("#Status").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleShipLabelNotification',
                    data: '{"ID":"' + ID + '","IsShipLabelNotification":"' + IsErrors + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsErrors == "0")
                                errors.attr("src", "images/check-off.png");
                            else
                                errors.attr("src", "images/check-on.png");

                        }
                        else {

                            $("#msg").html("There was an error during save the details!");
                            $("#msgbox-select").dialog("open");
                        }
                    }
                });
            }

        });
    });
    $("[id^=isEodReports_]").live("click", function () {        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace("isEodReports_", "");
        $('.YellowWarning').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSystemEmailById',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var item = output.d;
                if (item.EodReports) {
                    $("#Status").html("0");
                }
                else {
                    $("#Status").html("1");
                }                
                var errors = $("#isEodReports_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsErrors = $("#Status").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleEodReports',
                    data: '{"ID":"' + ID + '","EodReports":"' + IsErrors + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsErrors == "0")
                                errors.attr("src", "images/check-off.png");
                            else
                                errors.attr("src", "images/check-on.png");

                        }
                        else {

                            $("#msg").html("There was an error during save the details!");
                            $("#msgbox-select").dialog("open");
                        }
                    }
                });
            }

        });
    });

</script>