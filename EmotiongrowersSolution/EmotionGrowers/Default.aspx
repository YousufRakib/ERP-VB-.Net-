<%@ Page Language="VB" MasterPageFile="~/Dashboard.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="detail" runat="Server">


    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            var height = $(window).height();
            $("#leftpanel").css('height', height - 115);
            var MyTime;
            $(document).ajaxStart(function () {
                ////$('.pageContent').addClass("PWOverlay");
                //PWnotif({
                //    type: "processing",
                //    msg: "Please wait...",
                //    position: "center",
                //    fade: true,
                //    bgcolor: 'rgb(249, 250, 249)',
                //    border: 'rgb(132, 136, 132)',
                //    autohide: 0,
                //});
                $("#imgAdminLoader").show();
                $("#DivExecutionResult").html("");
                clearTimeout(MyTime);
                $("#DivExecutionResult").hide();
            });
            $(document).ajaxError(function (event, jqxhr, settings, exception) {
                //debugger;
                if (jqxhr.status == 401) {
                    // unauthorized
                    window.location.href = "Login.aspx";
                }
                else if (jqxhr.responseText.indexOf("There was no endpoint listening at ") >= 0) {
                    window.location.href = "404Error.aspx";
                }
                else if (jqxhr.responseText.indexOf("System.OutOfMemoryException") >= 0) {
                    window.location.href = "404Error.aspx";
                }
            });
            $(document).ajaxStop(function () {
                // $('#ui_PWnotifIt').hide();
                $("#imgAdminLoader").hide();

                $("#DivExecutionResult").show();
                MyTime = setTimeout(function () {

                    $("#DivExecutionResult").hide();
                }, 5000);
            });



            var page = getParameterByName("Page");
            var para = '';
            if (page == '') {
                window.location = "Default.aspx?Page=Users";
                return false;
            }

            var mypage = '';


            if (page != "") {
                $("#cssmenu ul li").removeClass('active');
                $("#Dboard_Menu" + page).addClass('active');
            }

            var UserId = $("#ctl00_divUserID").html();

            $("#leftpanel").addClass("modal");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUsersFormRights',
                data: '{"UserID":"' + UserId + '","Form":"' + page + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    mypage = output.d;
                    if ($("#ctl00_divIsAdmin").html() == "True")
                        mypage = "page"
                    if (mypage != 'error' && mypage != "" || page == "Logs" || page == "DynamicGrid") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetPage',
                            data: '{ "controlName":"pages/Page' + page + '.ascx","controlPara":"' + para + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response, status) {
                                if (response.d.indexOf("System.Web.HttpException") >= "0") {
                                    window.location.href = "Login.aspx"
                                }
                                else {
                                    $('#leftpanel').html(response.d);
                                    $("#leftpanel").removeClass("modal");
                                }
                            },
                            error: function (msg) {

                                $('#leftpanel').html(msg.d);
                                $("#leftpanel").removeClass("modal");
                            }
                        });
                    }
                    else {
                        $('#leftpanel').html("<div id='DispUnAuthorisedPage' style='display:block;padding:35px;margin-top:-40px;'> " +
                                            " <br /><br /><br /> " +
                                            " <img src='images/warn.jpg'/><div style='font-size:22px; margin-left: 75px; margin-top: -40px;'>" +
                                            "<b >You are not authorized to view this page</b></div>" +
                                            " <br /> " +
                                            " <br /> " +
                                            " <div style='font-size:16px;'> " +
                                            " you do not have permission to view this directory or page " +
                                            " using the credentials you supplied.<br /> " +
                                            " <br /> " +
                                            "<hr />" +
                                            "<br /><br /><br />" +
                                            "<b> Please contact the Administrator</b><br /><br /><br />" +
                                            "</div></div>");
                        $("#leftpanel").removeClass("modal");
                    }
                }
            });

            //VEN::12-Nov-2015::For Update Password
            $("#divChangePasswordDialog").dialog({
                autoOpen: false,
                resizable: false,
                title: "Alert",
                width: 450,
                height: 230,
                modal: true,
                buttons: {
                    Save: function () {
                        if ($("#txtloginpassword").val() == "") {
                            $(".Warning").hide();
                            $(".YellowWarning").show();
                            $(".YellowWarning").html("Please enter Password...")
                            $("#txtloginpassword").focus();
                            return false;
                        }
                        if ($("#txtloginconfirmpass").val() == "") {
                            $(".Warning").hide();
                            $(".YellowWarning").show();
                            $(".YellowWarning").html("Please enter Confirm Password...")
                            $("#txtloginconfirmpass").focus();
                            return false;
                        }
                        if ($("#txtloginconfirmpass").val() != $("#txtloginpassword").val()) {
                            $(".Warning").hide();
                            $(".YellowWarning").show();
                            $(".YellowWarning").html("Password and confirm password not match...")
                            $("#txtloginconfirmpass").focus();
                            return false;
                        }
                        var UserID = $("#ctl00_divUserID").html();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/UpdateUserPassword',
                            data: '{"UserID":"' + UserID + '","Password":"' + $("#txtloginpassword").val() + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == "success") {
                                    $("#DivExecutionResult").html("Password change successfully..")
                                    $("#divChangePasswordDialog").dialog("close");
                                }
                                else if (output.d == "error") {
                                    $(".Warning").show();
                                    $(".YellowWarning").hide();
                                }
                            }
                        });
                    },
                    Cancel: function () {
                        $("#divChangePasswordDialog").dialog("close");
                    }
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
                }
            });

            $("#txtloginpassword").on('change keyup paste', function () {
                $("#txtloginconfirmpass").val("");
            });
        });


        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(window.location.search);
            if (results == null)
                return "";
            else
                return decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        function ctrlFocus(ctrl) {
            $(ctrl).addClass('ValidateWarning');
            $(ctrl).focus();
            //to hight light the text box 5 sec
            setTimeout(function () {
                $(ctrl).removeClass('ValidateWarning');
            }, 3000);
            $(ctrl).effect("highlight", {}, 3000);
        }

        //VEN::12-Nov-2015::For Update Password
        $(".loginuserdetails").die("click").live("click", function () {
            var UserID = $("#ctl00_divUserID").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUserByID',
                data: '{"ID":"' + UserID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var User = output.d;
                    if (User.ID == UserID) {
                        $(".Warning").hide();
                        $(".YellowWarning").hide();
                        $("#txtloginusername").val(User.UserName);
                        $("#txtloginemail").val(User.Email);
                        $("#txtloginpassword").val(User.Password);
                        $("#txtloginconfirmpass").val(User.Password);
                        $("#divChangePasswordDialog").dialog('option', 'title', 'Change Password : ' + User.Name + '');
                        $("#divChangePasswordDialog").dialog("open");
                    }
                }
            });
        });

    </script>

</asp:Content>

