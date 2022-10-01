<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <meta charset="UTF-8" />
    <meta name="google" content="notranslate" />
    <meta http-equiv="Content-Language" content="en_US" />
    <link rel="icon" href="images/dflower2.ico" type="image/x-icon" />
    <title></title>
    <link href="css/LoginBloom.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/animated-menu.css" />



    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript">
        var J1_8 = $.noConflict(true);
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>

    <script type="text/javascript" src="js/messagebox.min.js"></script>
    <link rel="stylesheet" href="css/messagebox.css" />
<script src="js/jquery.fileDownload.js"></script>

</head>


<body>
   <%-- <div id="imgLoginLoader" style="display:none;">
        <img alt="Loding..." src="images/ajax_loader_blue_512.gif" class="imgloader" />
    </div>--%>
    <div class="header" style="position: static">

        <div style="float: left; margin-right: 5px;">
            <a href="#">
                <img id="imgHeaderLogo" src="images/transparent.PNG" alt="User" style="margin-left: 5px" height="50" /></a>
        </div>

        <div style="float: right; margin-right: 5px;">
            <nav>
                <ul style="padding: 8px; margin-right: -17px;position: absolute;">
                    <li style="width: 37px; height: 49px;"><a href="#">
                        <img src="images/DFLOWER.ico" title="For support contact: jose@dflower.com" alt="User" width="35px" /></a>
                    </li>
                </ul>
            </nav>
        </div>

        <section id="content">

            <form id="login" class="loginWithLogo" runat="server">
                <%--<h2>DFlower</h2>--%>
                <div id="logoDiv" style="margin-left: -35px;">
                    <!--//-->
                    <img id="loginLogo" src="images/transparent.png"  />
                </div>

                <div id="inputs">
                     
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"  required AutoComplete="on"></asp:TextBox><br />
                   <%-- <input id="txtPassword" class="inputBox" type="password" value="" placeholder="Password" required>--%>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Password" required/>
                    <%--<input id="Text1" class="inputBox" type="text" value="" placeholder="Username" autofocus required>
                    <input id="password1" class="inputBox" type="password" value="" placeholder="Password" required>--%>
                </div>
                <div style="text-align: right; margin-right: 35px;">
                     <input type="submit" id="btnForgotPassword" value="Forgot Password" />
                     
                </div>
                <div id="actions">
                    <input type="submit" id="btnLogin" value="Sign in" />
                     <img alt="Loding..." id="imgLoginLoader" style="height: 35px; width: 35px; padding-left: 10px; display: none" src="images/ajax_loader_blue_512.gif" />
                  
                </div>

            </form>

        </section>
 
</body>
<style>
    .ui-tooltip {
        padding: 8px;
        position: absolute;
        z-index: 9999;
        max-width: 300px;
        color: white;
        z-index: 9000;
        font-size: 10px;
        background: #9FB874;
    }


    .ui-helper-hidden-accessible {
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        padding: 0;
        position: absolute;
        width: 1px;
        display: none;
    }
    

#btnForgotPassword{
     background:none!important;
     color:inherit;
     border:none; 
     padding:0!important;
     font: inherit;
     /*border is optional*/
     border-bottom:1px solid #444; 
     border-bottom-color:blue;
     cursor: pointer;
     font-size: smaller;
     color: blue;
}

</style>


</html>

<script type="text/javascript">
    $(document).ready(new function () {

 
        document.title = '<%=ConfigurationManager.AppSettings("CompanyName")%>';
        $("#imgHeaderLogo").attr("src", "images/" + ('<%=ConfigurationManager.AppSettings("CompanyName")%>').toString().replaceAll(' ', '') + "headerlogo.PNG");
        $("#loginLogo").attr("src", "images/" + ('<%=ConfigurationManager.AppSettings("CompanyName")%>').toString().replaceAll(' ', '') + "logo-login.png");
        J1_8($(document)).tooltip();
    });

    $("#btnLogin").die("click").click(function (e) {
         if ($("#txtUsername").val().toString().trim() != "" && $("#txtPassword").val().toString().trim() != "") {
            $("#imgLoginLoader").show();
 

            $("#btnLogin").attr("disabled", true);


            var Username = $("#txtUsername").val();
            var Password = $("#txtPassword").val();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ValidateLogin',
                data: '{"Username":"' + Username + '","Password":"' + Password + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    //debugger;
                    if (output.d != "invalid" && output.d != "InActive") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/LoginNotification',
                            data: '{"LoggedUserName":"' + Username + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (Out) {
                                //debugger;
                                if (Out.d == "Success") {
                                    $("#imgLoginLoader").hide();
                                    var Result = output.d;
                                    if (Result.toString().indexOf("user~") >= 0) {
                                        var LandingPage = output.d.split("~")[1];
                                        if (LandingPage == "ALL")
                                            LandingPage = "ConfirmedPOs";

                                        window.location = "DefaultUser.aspx?Page=" + LandingPage;
                                        e.preventDefault();
                                    }

                                    else if (output.d == "admin") {
                                        window.location = "DefaultUser.aspx?Page=Setups";
                                        e.preventDefault();
                                    }
                                    else {
                                        $("#btnLogin").attr("disabled", false);
                                        $.MessageBox("Invalid credentials!!");
                                    }
                                }
                                else if (Out.d == "invalid") {
                                    $("#btnLogin").attr("disabled", false);
                                    $("#imgLoginLoader").hide();
                                    $.MessageBox("Invalid credentials!!");
                                }

                                else {
                                    $("#btnLogin").attr("disabled", false);
                                    $.MessageBox("OOPS!!! Something Wrong please try again, we will research the issue!!");
                                }
                            }
                        });
                    }
                    else if (output.d == "InActive") {
                        $("#imgLoginLoader").hide();
                        $("#btnLogin").attr("disabled", false);
                        $("#txtPassword").focus();
                        $.MessageBox("Your account is InActive. Please Contact Administrator!!");
                    }
                    else {
                        $("#btnLogin").attr("disabled", false);
                        $("#imgLoginLoader").hide();
                        $.MessageBox({
                            buttonDone: "OK",
                            message: "Invalid credentials!!"
                        }).done(function () {
                            $("#txtPassword").focus();
                        });
                        //$.MessageBox("invalid credentials!!")
                        $("#txtPassword").focus();
                    }
                }
            });

            //}
            e.preventDefault();
        }

    });

    $("#btnForgotPassword").die("click").click(function (e) {      
        if ($("#txtUsername").val().toString().trim() != "") {
            var Username = $("#txtUsername").val();

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ResetPassword',
                data: '{"UserName":"' + Username + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Out) {
                    if (Out.d == "valid") {
                        $("#imgLoginLoader").hide();
                        $.MessageBox("Credential sent to your email address. Please check your mail");
                    }
                    else if (Out.d == "invalid") {                      
                        $("#imgLoginLoader").hide();
                        $.MessageBox("Invalid credentials!!");
                    }
                    else {
                        $.MessageBox("OOPS!!! Something Wrong please try again, we will research the issue!!");
                    }
                }
            });

            e.preventDefault();
        }
    });

    $('#txtUsername').keypress(function (e) {
        if (e.which == 13) {
            $('#txtPassword').focus();
            e.preventDefault();
            e.stopPropagation();
        }
    });

    $('#txtPassword').keypress(function (e) {
        if (e.which == 13) {
            $("#btnLogin").click();
            e.preventDefault();
            e.stopPropagation();
        }
    });

</script>

