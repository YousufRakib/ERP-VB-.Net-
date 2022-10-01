<%@ Page Language="VB" MasterPageFile="~/DashboardUsers.master" AutoEventWireup="false" CodeFile="DefaultUser.aspx.vb" Inherits="_DefaultUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="detail" runat="Server">

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            var UserId = $("#ctl00_divUserID").html();
            var UserType = $("#ctl00_divUserType").html();
            var page = getParameterByName("Page");
            //if ($("#cssmenu ul").html() == "") {
            //    $.ajax({
            //        type: "POST",
            //        url: 'BloomService.asmx/GetUserPageList',
            //        data: '{"UserID":"' + $("#ctl00_divUserID").html() + '" }',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (output, status) {
            //            var User = output.d;
            //            var wpdata = User.WebPermissions
            //            if (wpdata != null) {
            //                $("#cssmenu ul").html("");
            //                for (var i in wpdata) {
            //                    var wpdetails = wpdata[i];
            //                    $('#cssmenu ul').append("<li id='UDboard_Menu" + wpdetails.Page + "'><a href='DefaultUser.aspx?Page=" + wpdetails.Page + "'><span>" + wpdetails.Name.replace(" ?", "") + "</span></a></li>");
            //                }
            //                $('#cssmenu ul').append("<li class='last'><a href='Login.aspx'><span>Logout</span></a></li>");
            //            }
            //            if (page != "") {
            //                $("#cssmenu ul li").removeClass('active');
            //                $("#UDboard_Menu" + page).addClass('active');
            //            }
            //        }
            //    });
            //}
            
            //$.ajax({
            //    type: "POST",
            //    url: 'BloomService.asmx/GetUserPageList',
            //    data: '{"UserID":"' + $("#ctl00_divUserID").html() + '" }',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (output, status) {
            //        var User = output.d;
            //        var wpdata = User.WebPermissions
            //        if (wpdata != null) {                        
            //            for (var i in wpdata) {
            //                var wpdetails = wpdata[i];
            //                $("#UDboard_Menu" + wpdetails.Page).show();
            //            }                        
            //        }
            //        if (page != "") {
            //            $("#cssmenu ul li").removeClass('active');
            //            $("#UDboard_Menu" + page).addClass('active');
            //        }
            //    }
            //});


            var height = $(window).height();
            $("#leftpanel").css('height', height - 102);
            var MyTime;

            $(document).ajaxStart(function () {
                //$('.pageContent').addClass("PWOverlay");
                //PWnotif({
                //    type: "processing",
                //    msg: "Please wait...",
                //    position: "center",
                //    fade: true,
                //    bgcolor: 'rgb(249, 250, 249)',
                //    border: 'rgb(132, 136, 132)',
                //    autohide: 0,
                //});               
                $("#imgUserLoader").show();
                $("#DivExecutionResult").html("");
                clearTimeout(MyTime);
                $("#DivExecutionResult").hide();
            });

            $(document).ajaxError(function (event, jqxhr, settings, exception) {
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
                $("#imgUserLoader").hide();

                $("#DivExecutionResult").show();
                MyTime = setTimeout(function () {

                    $("#DivExecutionResult").hide();
                }, 5000);
            });


            var para = '';

            //if (UserType == "Customer") {
            //    if (page == "ManualPO") {
            //        page = "CustUser";
            //    }
            //}

            if (page == '') {
                window.location = "DefaultUser.aspx?Page=User";
                return false;
            }
            if (page != "") {
                $("#cssmenu ul li").removeClass('active');
                $("#UDboard_Menu" + page).addClass('active');
            }

            var mypage = '';
            $("#leftpanel").addClass("modal");

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUsersFormRights',
                data: '{"UserID":"' + UserId + '","Form":"' + page + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    mypage = output.d;
                    //if ($("#ctl00_divIsAdmin").html() == "True")
                    //    mypage = "page"
                    if (mypage != "") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetPage',
                            data: '{ "controlName":"pages/Page' + page + '.ascx","controlPara":"' + para + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response, status) {
                                if (response.d.indexOf("does not exist.") >= "0") {
                                    //$('#leftpanel').html("<Div style='position: absolute;top: 40%;left: 27%;font-size: 50px;font-weight: bold;'>Page Under Construction.</Div>");
                                    $('#leftpanel').html("");
                                    $("#leftpanel").removeClass("modal");
                                }
                                else if (response.d.indexOf("System.Web.HttpException") >= "0") {
                                   window.location.href="Login.aspx"
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

            $("#CreditLimitsApprovalDialog").dialog({
                autoOpen: false,
                resizable: false,
                title: "Credit Limits Approval",
                modal: true,
                width: 550,
                open: function () {
                    // $(this).focus();
                    $("#txtCLACustomerName").val("");
                    $("#txtCLACustomerName").focus();
                    $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                   // alert("opened");
                },
                beforeClose: function (event, ui) {
                    //if ($("#msgbox-CLACustDetailsWarning").dialog('isOpen')) {
                    //    return false;
                    //}

                }
            });

            $("#txtCLACustomerName").autocomplete({
                source: function (request, response) {

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetCustForAutocomplete',
                        data: "{'Searchtext': '" + request.term + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                            response($.map(data.d, function (item) {
                                return {
                                    label: "[" + item.Customer + "] " + item.Name,
                                    Customer: item.Customer,
                                    Name: item.Name
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                open: function (event, ui) {
                    $(".ui-menu").css("z-index", 101000);
                },
                select: function (e, i) {
                    $("#txtCLACustomerName").val(i.item.Customer);
                    autocompletePostPay(i.item.Customer, i.item.Name);
                },
                change: function (e, i) {
                    if (i.item == null || i.item == undefined) {
                        $("#txtCLACustomerName").val("");
                        $("#txtCLACustomerName").focus();
                        $(".ui-menu").css("display", "none");
                    }
                },
                minLength: 1,
                autoFocus: true
            });

            /*Show Invoice details for the selected customer*/
            function autocompletePostPay(Customer, Name) {
                $("#msghtml-CLACustDetailsWarning").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
                $("#msgbox-CLACustDetailsWarning").dialog("open");
                $(".imgLoaderForUser").show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPage',
                    data: '{ "controlName":"pages/PageCreditLimitsApproval.ascx","controlPara":"' + Customer + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        //debugger;
                        $("#DivPageCreditLimitsApproval").html(output.d).dialog("open"); 
                        $("#msgbox-CLACustDetailsWarning").dialog("close");
                    }
                });
            }

            $("#DivPageCreditLimitsApproval").dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 730,
                //height: $(window).height() - 50,
                title: "Credit Limits Approval",
                close: function () {
                    $("#txtCLACustomerName").val("");
                    $("#CreditLimitsApprovalDialog").dialog("close");
                },
                open:function(){
                    $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").hide();
                },
                buttons: {
                    Save: function () {
                        //$(this).dialog("close");
                        //debugger;
                        var Customer = $("#ctl00_DivCLACustomerNo").html();
                        var AMTAPPROV = $("#txtCLAAdditionalAmount").val() == "" ? $("#txtCLAAdditionalAmount").attr("placeholder") : $("#txtCLAAdditionalAmount").val();
                        var APPROVED = $("#chkCLAAppoveOrder").is(":checked") ? "Y" : "N";
                        var HOLLYDAYAM = $("#txtCLAHolidayCreditLimit").val() == "" ? $("#txtCLAHolidayCreditLimit").attr("placeholder") : $("#txtCLAHolidayCreditLimit").val();
                        var EXPDATE = $("#txtExpiresOn").val();
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveCustomerDetailsforCreditLimitsApproval',
                            data: '{"Customer":"' + Customer + '","AMTAPPROV":"' + AMTAPPROV + '","APPROVED":"' + APPROVED + '","HOLLYDAYAM":"' + HOLLYDAYAM + '","EXPDATE":"' + EXPDATE + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                //debugger;
                                $("#DivPageCreditLimitsApproval").dialog("close");
                                $("#CreditLimitsApprovalDialog").dialog("close");
                            }
                        });
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                }
            });

            //VEN::12-Nov-2015::For Password update
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
        

        $('.TotalRows>td>div').live('mouseover', function (e) {
            var element = $(this)[0].innerText.trim();
            if (element.toLowerCase() != "total" && element != "") {
                $(this).attr('title', '');
               $(this).attr('title', element);
            }
        });


<%--        // Start Notification
        // Added by: Subhajit On: 06-17-2022
        // Request notification permission on page load
        document.addEventListener('DOMContentLoaded', function () {
            if (!Notification) {
                $.MessageBox('Desktop notifications not available in your browser. Try Google Chrome or Microsoft Edge.');
                return;
            }

            if (Notification.permission !== 'granted') {
                $.MessageBox('<h4>Approval Notifications will not work!</h4> <p>Desktop notifications is not allowed for this website.</p> <p>Please allow from the address bar above.</p>');
                Notification.requestPermission();
            }
        });

        var hasPermissionToApprovePriceChange = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(64, 1).ToString()%>' == "Y" ? true : false;
        if (hasPermissionToApprovePriceChange) {
            showApprovalDesktopNotification();
        }

        function showApprovalDesktopNotification() {
            if (Notification.permission !== 'granted')
                Notification.requestPermission();
            else {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPendingRecordsCount',
                    data: [],
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (output, status) {
                        var Result = output.d; 
                        if (Result > 0) {
                            // Show notification
                            var notification = new Notification('Pending Approvals!', {
                                body: 'Hi! You have Price approval(s) pending!',
                            });
                            notification.onclick = function () {
                                //window.open('http://');
                            };
                        }
                    },
                    error: function (status, error) {
                        
                    }
                });                
            }

            setTimeout(showApprovalDesktopNotification, 900000);
        }
        // End Notification--%>


    </script>
     
</asp:Content>

