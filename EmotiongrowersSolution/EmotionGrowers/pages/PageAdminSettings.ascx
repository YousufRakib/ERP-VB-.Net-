<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageAdminSettings.ascx.vb" Inherits="pages_PageAdminSettings" %>


<link href="css/easy-responsive-tabs.css" rel="stylesheet" />
<script type="text/javascript" src="js/easyResponsiveTabs.js"></script>


<style>
    #imgprvw {
        width: 200px;
        height: 167px;
        margin-bottom: 10px;
        margin-left: 15px;
        object-fit: contain;
    }
</style>

<%--<div id='cssmenu'>
    <ul>
        <li><a href="Default.aspx?Page=User"><span>Users</span></a></li>
        <li class='active'><a href='Default.aspx?Page=admin'><span>Admin</span></a></li>
        <li><a href='Default.aspx?Page=email'><span>Email</span></a></li>
        <li class='last'><a href='Login.aspx'><span>Logout</span></a></li>
    </ul>
    <div id="divLoginUserName" class="LoginUserName" runat="server"></div>
</div>--%>


<div class="resptabs" id="ChildVerticalTab_1" style="width: 1300px;height:547px; padding-top: 1px; overflow:auto" >
    <ul id="ulsubtabs_1" class="resp-tabs-list ver_1">
        <li id="subTab_Features">Features And Settings</li>
        <li id="subTab_EmailContents">Email Contents</li>
    </ul>
    <div id="DivResponseContent_Admin" class="resp-tabs-container ver_1" style="font-size: 13px;padding:4px;background: #d3d3d3";  >
        <div>
            <div id="divFeatures" style="margin-top: 5px; float: left;padding:8px;margin:2px;width:315px;background: #f1e0e0">
            <%--    <fieldset style="width: 350px; height: 422px">
                    <legend style="color: blue">Features</legend>--%>
                <div style="font-weight:bold;padding:10px;padding-left:0px">Features</div>
                    <table id="tblFeatureDetails">
                    </table>
                <%--</fieldset>--%>
            </div>

            <div id="divAdminSettings" style="margin-top: 5px; float: left;padding:8px;margin:2px;width:735px;background: #f1e0e0">
                <%--<fieldset style="width: 400px; height: 157px">
                    <legend style="color: blue">Settings</legend>--%>
                <div style="font-weight:bold;padding:10px;padding-left:0px">Settings</div>
                    <table>
                        <tr>
                            <td style="width: 150px">LabelType</td>
                            <td>
                                <select id="lstLabelType">
                                </select>
                            </td>                           
                            <td>
                                <button type="button" id="btnUpdateAdminsettings" class="dialogbuttonstyle icon-save" style="cursor: pointer" role="button" aria-disabled="false">
                                    <span class="ui-button-text">Save</span>
                                </button>
                            </td>
                        </tr>
                        <tr>
                             <td style="width: 150px">Inventory App Emails</td>
                            <td colspan="2">
                                <input type="text" style="width: 500px;" id="txtInvAppEmails" />                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top: 6px;">
                                <label id="lblModifiedDate"></label>
                            </td>

                        </tr>
                    </table>
                <%--</fieldset>--%>
            </div>
            <div id="divCompanyDetails" style="float: left;padding:8px;margin:2px;width:735px;background: #f1e0e0; height:300px" >
              <%--  <fieldset style="width: 680px; height: 250px">
                    <legend style="color: blue"></legend>--%>
                <div style="font-weight:bold;padding:10px;padding-left:0px">CompanyDetails</div>
                    <table>
                        <tr>
                            <td style="width: 150px">Company Name</td>
                            <td>
                                <input type="text" style="width: 315px;" id="txtCompanyName" />
                            </td>
                            <td rowspan="4" style="width: 190px;">
                                <img id="imgprvw" src="images/no_logo.gif" />
                                <form action="UploadCompanyLogo.aspx" method="post" enctype="multipart/form-data" target="upload_target" id="fileuploader" style="margin-left: 20px">
                                    <input name="myfile" id="myfile" type="file" />
                                </form>
                                <input type="hidden" id="hfImage">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Address</td>
                            <td>
                                <textarea rows="4" style="width: 315px; height: 105px; margin-bottom: 7px" cols="85" id="txtCompanyAddress" spellcheck="false"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td>
                                <input type="text" style="width: 315px;" id="txtCompanyPhoneno" />
                            </td>
                        </tr>
                        <tr>
                            <td>Fax</td>
                            <td>
                                <input type="text" style="width: 315px;" id="txtCompanyFax" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <button type="button" id="btnUpdateCompanyDetails" class="dialogbuttonstyle icon-save" style="cursor: pointer; float: left;" role="button" aria-disabled="false">
                                    <span class="ui-button-text">Save</span>
                                </button>
                                <div id="divCompanyDetailsID" style="display: none"></div>
                                <div style="float: left; padding-top: 11px; margin-left: 10px;">
                                    Last Updated Date :
                    <label style="color: rgb(0, 0, 153); font-weight: bold" id="lblCompanyDetailsModifiedDate"></label>
                                </div>
                            </td>
                        </tr>
                    </table>
                <%--</fieldset>--%>
            </div>
        </div>
        <div>
            <div id="divGrowerReportEmailContent" style="margin-top: 5px; width: 663px; float: left;">
                <%--<fieldset style="width: 425px;">--%>
                    <%--<legend style="color: blue">Grower Email Content</legend>--%>
                <div style="font-weight:bold;padding:10px">Grower Email Content</div>
                    <table>
                        <tr>
                            <td>
                                <textarea rows="23" cols="80" id="txtGrowerReportEmailcontent"></textarea>
                                <div id="DivGrowerReportEmailContentId" style="display: none"></div>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2">Last Updated Date :
                    <label style="color: rgb(0, 0, 153); font-weight: bold" id="lblGrowerReportEmailContentModifiedDate"></label>
                                  <button type="button" id="btnUpdateGrowerReportEmailContent" class="dialogbuttonstyle icon-save" style="cursor: pointer" role="button" aria-disabled="false">
                                    <span class="ui-button-text">Save</span>
                                </button>
                            </td>
                            
                        </tr>
                    </table>
                <%--</fieldset>--%>
            </div>

            <div id="divAdminCredentialsContent" style="margin-top: 5px; width: 380px; float: left;display:block;">
            <%--<fieldset style="width: 380px;">--%>
                <%--<legend style="color: blue"></legend>--%>
                <div style="font-weight:bold;padding:10px;padding-left:0px">Credential Email Content</div>
                <table>
                    <tr>
                        <td>
                            <textarea rows="4" style="width: 375px; height: 105px; margin-bottom: 7px" cols="85" style="height: 100px" id="txtemailcredentialcontent"></textarea>
                            <div id="DivCredentialEmailContentId" style="display: none"></div>
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">Last Updated Date :

                    <label style="color: rgb(0, 0, 153); font-weight: bold" id="lblcrentialcontentModifiedDate"></label>
                             <button type="button" id="btnUpdateCredentialContent" class="dialogbuttonstyle icon-save" style="cursor: pointer" role="button" aria-disabled="false">
                                <span class="ui-button-text">Save</span>
                            </button>
                        </td>
                         
                    </tr> 
                </table>
            <%--</fieldset>--%>

 
        


        </div>
</div>




    </div>
</div>







<div id="msgbox-select" style="display: none;" title="Alert">
    <p id="msg">
        First select any contact from the list and try again.
    </p>
</div>


<script type="text/javascript">
    $(document).ready(new function () {

        

        //$("#chkFlowerColor").iButton({
        //    labelOn: "Yes",
        //    labelOff: "No"
        //});
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CheckIsAdmin',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                if (output.d == false)
                    window.location.href = "Login.aspx";
            }
        });

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetLabelType',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstLabelType').empty();
                $('#lstLabelType').append('<option selected="selected" value="0">None Selected</option>');
                if (data.length == 0) {
                    $('#lstLabelType').val("0");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        $('#lstLabelType').append('<option value="' + res.ID + '">' + res.Labeltype + '</option>');
                    }
                    getFeatureSettings();
                    getAdminSettings();
                    GetEmailCredentialContent();
                    GetGrowerReportEmailContent();
                    GetCompanyDetails();
                }
            }
        });
    });



    function getAdminSettings() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAdminSettings',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                if (data.length > 0) {
                    $("#txtInvAppEmails").val(data[0].InvAppEmails)
                    $('#lstLabelType').val(data[0].LabelTypeID);
                    //$('#chkFlowerColor').iButton("toggle", data[0].FlowerColor);
                    if (data[0].ModifiedDate != "") {
                        $('#lblModifiedDate').html("Last Updated Date:<b style='color:rgb(0, 0, 153)'>" + data[0].ModifiedDate + "</b>");
                    }
                    else {
                        $('#lblModifiedDate').html("");
                    }
                }
            }
        });
    }

    function GetEmailCredentialContent() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCredentialEmailContentSettings',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var CredentialContent = output.d;
                if (CredentialContent != null && CredentialContent != "") {
                    $("#txtemailcredentialcontent").val(CredentialContent.Content);
                    $("#DivCredentialEmailContentId").html(CredentialContent.ID);
                    $("#lblcrentialcontentModifiedDate").html(CredentialContent.ModifiedDate);
                }
            }
        });
    }


    function GetGrowerReportEmailContent() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetGrowerReportEmailContent',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var EmailContent = output.d;
                if (EmailContent != null && EmailContent != "") {
                    $("#txtGrowerReportEmailcontent").val(EmailContent.Content);
                    $("#DivGrowerReportEmailContentId").html(EmailContent.ID);
                    $("#lblGrowerReportEmailContentModifiedDate").html(EmailContent.ModifiedDate);
                }
            }
        });
    }

    function getFeatureSettings() {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFeatureWithValues',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != "") {
                    $("#tblFeatureDetails").html("");
                    $("#tblFeatureDetails").append(output.d);
                    $(".chkFeature").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $(".chkArmellini").change(function () {
                        if ($(".chkArmellini").is(':checked')) {
                            $(".ArmellniFields").show();
                        } else {
                            $(".ArmellniFields").hide();
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetFeature',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            var PicklistID = $("[id^=Picklist_]").attr("id").replace("Picklist_", "");
                            if (output.d != null) {
                                var Feature = output.d
                                var i
                                for (i = 0; i < Feature.length; i++) {
                                    if (Feature[i].Name == "Picklist Option") {
                                        $("#Picklist_" + PicklistID).val(Feature[i].Options);
                                    }
                                    else if (Feature[i].Name == "Auto Send ArXML") {
                                        $("#chkAR_" + Feature[i].FeatureID).iButton("toggle", Feature[i].Value);
                                    }
                                    else {
                                        $("#chk_" + Feature[i].FeatureID).iButton("toggle", Feature[i].Value);
                                    }
                                }
                            }
                        }
                    });
                }
            }
        });
    }



    $("#btnUpdateFeatures").die('click').live("click", function (e) {
        debugger;
        var Features = "";
        var PiclistID = $("[id^=Picklist_]").attr("id").replace("Picklist_", "");
        var AutoSendARXMLID = $("[id^=chkAR_]").attr("id").replace("chkAR_", "");
        $(".chkFeature").each(function () {
            var FeatureID = this.id;
            if (this.id != $("[id^=chkAR_]").attr("id")) {
                Features += "<Feature><FeatureID>" + FeatureID.substring(4) + "</FeatureID><FeatureValue>" + $("#" + FeatureID).is(":checked") + "</FeatureValue><FeatureOption></FeatureOption></Feature>";
            }
        });

        $(".Printertext").each(function () {
            var FeatureID = this.id;
            Features += "<Feature><FeatureID>" + FeatureID.substring(3) + "</FeatureID><FeatureValue>0</FeatureValue><FeatureOption></FeatureOption><FeaturePrinter>" + $("#" + FeatureID).val() + "</FeaturePrinter></Feature>";
        });
        Features += "<Feature><FeatureID>" + PiclistID + "</FeatureID><FeatureValue></FeatureValue><FeatureOption>" + $("#Picklist_" + PiclistID).val() + "</FeatureOption></Feature>";

        //get username , password for Armelini service in AutoSendARXML
        Features += "<Feature><FeatureID>" + AutoSendARXMLID + "</FeatureID><FeatureValue>" + $("#chkAR_" + AutoSendARXMLID).is(":checked") + "</FeatureValue><FeatureOption>" + $("#txtARUsername").val() + "*~~~~*" + $("#txtARPassword").val() + "</FeatureOption></Feature>";
        Features = "<FeatureDetails>" + Features + "</FeatureDetails>";




        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/SaveFeatureValues',
            data: "{'FeatureDetails':'" + escape(Features) + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                if (data == "valid") {
                    $.MessageBox("Setting Updated Successfully");
                    getFeatureSettings();
                }
            }
        });
    });


    $("#btnUpdateAdminsettings").die('click').live("click", function (e) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateAdminSettings',
            data: "{'LabelTypeID':'" + $("#lstLabelType").val() + "','InvAppEmails':'" + $("#txtInvAppEmails").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                if (data == "valid") {
                    $.MessageBox("Setting Updated Successfully");
                    getAdminSettings();
                }
            }
        });

    });
    //STA::24-NOV-2015::to save the Email-Credential Content
    $("#btnUpdateCredentialContent").die("click").live("click", function () {
        if ($("#txtemailcredentialcontent").val() != "") {
            var CredentialContentId = $("#DivCredentialEmailContentId").html() == "" ? "0" : $("#DivCredentialEmailContentId").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateCredentialEmailContentSettings',
                data: "{'Id':'" + CredentialContentId + "','Content':'" + $("#txtemailcredentialcontent").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    if (data == "valid") {
                        GetEmailCredentialContent();
                    }
                }
            });
        }
    });


    $("#btnUpdateGrowerReportEmailContent").die("click").live("click", function () {
        if ($("#txtGrowerReportEmailcontent").val() != "") {
            var ContentId = $("#DivGrowerReportEmailContentId").html() == "" ? "0" : $("#DivGrowerReportEmailContentId").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateGrowerReportEmailContent',
                data: "{'Id':'" + ContentId + "','Content':'" + escape($("#txtGrowerReportEmailcontent").val()) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    if (data == "valid") {
                        GetGrowerReportEmailContent();
                    }
                }
            });
        }
    });

    //VEN::03-Dec-2015::For Company Details Changes

    $("#myfile").change(function () {
        var val = $(this).val();
        switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
            case 'png':
            case 'jpg':
                $("#msg").html("Uploading Photo... <br /> <br /><img src='images/uploading.gif' alt='Uploading...'  /></div>");
                $("#msgbox-select").dialog("open");
                var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
                $("body").append(iframe);
                var form = $('#fileuploader');
                form.attr("target", "postiframe");
                form.attr("file", $('#myfile').val());

                form.submit();
                break;
            default:
                $(this).val('');
                $("#msg").html("Please select only JPG/PNG file!");
                $("#msgbox-select").dialog("open");
                break;
        }
    });

    $("#msgbox-select").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    function stopUpload(success, filename) {
        var result = '';
        if (success == 1) {
            result = '<span class="msg">The file was uploaded successfully!<\/span><br/><br/>';
            $("#hfImage").val(filename);
            $("#imgprvw").attr("src", filename);
            $("#hiddenedit").val("New");
            $("#msg").html(result);
            $("#msgbox-select").dialog("close");
        }
        else {
            result = '<span class="emsg">There was an error during file upload!<\/span><br/><br/>';
            $("#msg").html(result);
        }
    }

    $("#btnUpdateCompanyDetails").die("click").live("click", function () {
    debugger;
        if ($("#txtCompanyName").val() != "" && $("#imgprvw").attr("src") != "images/no_logo.gif") {
            var CompanyDetailsID = $("#divCompanyDetailsID").html() == "" ? "0" : $("#divCompanyDetailsID").html();
            var ImagePath = ""

            if ($("#imgprvw").attr("src").indexOf("CompanyLogoHandler.ashx?ID=") < 0)
                ImagePath = $("#imgprvw").attr("src")
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateCompanyDetails',
                data: "{'Id':'" + CompanyDetailsID + "','CompanyName':'" + $("#txtCompanyName").val() + "','Address':'" + $("#txtCompanyAddress").val()
                    + "','Phone':'" + $("#txtCompanyPhoneno").val() + "','Fax':'" + $("#txtCompanyFax").val() + "','CompanyLogoPath':'" + ImagePath + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    if (data == "valid") {
                        GetCompanyDetails();
                    }
                }
            });
        }
    });

    function GetCompanyDetails() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCompanyDetails',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var CompanyDetails = output.d;
                if (CompanyDetails != null && CompanyDetails != "") {
                    $("#txtCompanyName").val(CompanyDetails.CompanyName);
                    $("#txtCompanyAddress").val(CompanyDetails.Address);
                    $("#txtCompanyPhoneno").val(CompanyDetails.Phone);
                    $("#txtCompanyFax").val(CompanyDetails.Fax);
                    $("#imgprvw").attr("src", CompanyDetails.CompanyLogo);
                    $("#divCompanyDetailsID").html(CompanyDetails.ID);
                    $("#lblCompanyDetailsModifiedDate").html(CompanyDetails.ModifiedDate);
                }
            }
        });
    }

    ////Responsive Tabs//
    $('.resptabs').easyResponsiveTabs({
        type: 'vertical',
        width: 'auto',
        fit: true,
        tabidentify: 'ver_1', // The tab groups identifier
        activetab_bg: 'rgb(211, 211, 211)', // background color for active tabs in this group
        inactive_bg: '#fff', // background color for inactive tabs in this group
        active_border_color: '#c1c1c1', // border color for active tabs heads in this group
        active_content_border_color: '#5AB1D0', // border color for active tabs contect in this group so that it matches the tab head border
    });

</script>
