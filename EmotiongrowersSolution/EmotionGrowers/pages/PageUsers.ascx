<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageUsers.ascx.vb" Inherits="pages_Pagecargo" %>

<link rel="stylesheet" href="css/Filters.css">

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
        background-color: #ADDB5F;
        -moz-border-radius: 28px;
        -webkit-border-radius: 28px;
        border-radius: 5px;
        border: 1px solid #84bbf3;
        display: inline-block;
        cursor: pointer;
        color: #ffffff;
        font-family: arial;
        font-size: 10px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #528ecc;
        margin-left: 7px;
        padding: 5px 5px 5px 5px;
        margin-top: 2px;
    }

        .SmallButton:hover {
            background-color: #378de5;
        }

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


    .filter {
        background: url(images/EmptyFilter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .LineSeparator {
        border-right-width: 1px;
        border-right-style: solid;
        border-right-color: grey;
        border-bottom-width: 1px;
        border-bottom-style: solid;
        border-bottom-color: grey;
    }

    .LineSeparatorLeft {
        border-left-width: 1px;
        border-left-style: solid;
        border-left-color: grey;
        border-bottom-width: 0px;
        border-bottom-style: solid;
        border-bottom-color: grey;
    }

    .trMAWB {
        background-color: beige;
        color: black;
        font-weight: bold;
        font-size: 12px;
    }

    .UserPleaseWaitOverlay {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        z-index: 10;
        background-color: #E5E5E5;
    }

    .trSelectedHeader {
        background-color: red !important;
    }

    /* Style the tab */
    div.tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

        /* Style the buttons inside the tab */
        div.tab input[type=button] {
            background-color: inherit;
            float: left;
            border: 1px solid #ccc;
            outline: none;
            cursor: pointer;
            padding: 5px; /*14px 16px;*/
            transition: 0.3s;
            font-size: 15px;
            color: #ff0000;
            font-weight: bold;
        }

            /* Change background color of buttons on hover */
            div.tab input[type=button]:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            div.tab input[type=button].active {
                background-color: #ccc;
                color: #0000ff;
                font-weight: bold;
            }

    .tabcontent {
        display: none;
        /*padding: 6px 12px;*/
        border: 1px solid #ccc;
        border-top: none;
    }

    DivOrderEntry3 tr:nth-child(even) {
        background-color: #f2f2f2;
    }
      .leftButtonDuplicatebtn {
        margin-right: 600px !important;
    }
       .leftMinButtonDuplicatebtn {
        margin-right: 400px !important;
    }
    /*#DivUser input[type="text"] {
        background-color:cornsilk;
    }
    #DivUser textarea, #DivUser select {
        background-color:cornsilk;
    }*/
</style>

<script type="text/javascript">
    var SelectedWarehouseList = "";
    var EnableOrders = false;
    var invtyplst = [];
    var isDuplicateBoxMaintance = false;
    
    $(document).ready(new function () {
        
        //$("#DivOrderEntry1 tr:odd").css({
        //    "background-color": " #f2f2f2",
        //});

        //$("#DivOrderEntry2 tr:odd").css({
        //    "background-color": " #f2f2f2",
        //});

        //$("#DivOrderEntry3 tr:odd").css({
        //    "background-color": " #f2f2f2",
        //});

        $("#hfSetupsFile").val(true);
        $("#hfSetupsReports").val(true);
        $("#hfSetupsAdmin").val(true);
        $("#hfSetupsImport").val(true);

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadUserType',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstUserType').empty();
                $('#lstUserType').append('<option selected="selected" value="0">None Selected</option>');
                $('#lstUserTypeFilter').append('<option selected="selected" value="0">ALL</option>');
                if (data.length == 0) {
                    $('#lstUserType').val("0");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        $('#lstUserType').append('<option value="' + res.ID + '">' + res.UserType + '</option>');
                        $('#lstUserTypeFilter').append('<option value="' + res.ID + '">' + res.UserType + '</option>');
                    }
                }
            }
        });

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadSalesPersonDetails',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstSalesPerson').empty();
                $('#lstSalesPerson').append('<option selected="selected" value="0">None Selected</option>');
                if (data.length == 0) {
                    $('#lstSalesPerson').val("0");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        var lstValue = "";
                        if (res.SlsName.trim() == "")
                            lstValue = "" + res.Salesman + "";
                        else
                            lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                        $('#lstSalesPerson').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                    }
                }
            }
        });

        $("#txtEmail_User").on('change keyup paste', function () {
            if ($("#OldUserID").html() == "~NEW~")
                $("#txtUserName").val($("#txtEmail_User").val());
        });

        $("#ChkIsActive").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsAdmin").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        //-------------------------
        $("#ChkPendingPOs").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkConfirmedPOs").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkUsers").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#ChkAvailability").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#ChkCredits").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkShippedPOs").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#chkemail").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsGrowerDelete").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsGrowerlock").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        /*Add Setups menu tabs to Users :: 07Feb2018*/
        $("#ChkIsSetupsFile").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsSetupsReports").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsSetupsAdmin").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#ChkIsSetupsImport").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#fgrdUserFarms").flexigrid({
            url: 'BloomService.asmx/GetUserFarmGrid',
            dataType: 'xml',
            colModel: [
                { display: 'Delete', name: 'Delete', width: 50, sortable: false, align: 'center' },
                { display: 'Farm', name: 'Farm', width: 30, sortable: false, align: 'left' },
                { display: 'Name', name: 'Name', width: 160, sortable: false, align: 'left' },
                { display: 'City', name: 'City', width: 30, sortable: false, align: 'left' },
            ],
            showTableToggleBtn: true,
            sortname: "Name",
            sortorder: "desc",
            usepager: false,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 350) / 28),
            qtype: "StatusId",
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: 355,
            width: 370,
            striped: true,
        });

        $("#fgrdUserWarehouse").flexigrid({
            url: 'BloomService.asmx/GetUserWarehouseGrid',
            dataType: 'xml',
            colModel: [
                { display: 'Delete', name: 'Delete', width: 50, sortable: false, align: 'center' },
                { display: 'WH', name: 'WH', width: 30, sortable: false, align: 'left' },
                { display: 'Name', name: 'Name', width: 160, sortable: false, align: 'left' },
                { display: 'City', name: 'City', width: 30, sortable: false, align: 'left' },
            ],
            showTableToggleBtn: true,
            sortname: "Name",
            sortorder: "asc",
            usepager: false,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 350) / 28),
            qtype: "StatusId",
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: 355,
            width: 370,
            striped: true,
        });

        $("#fgrdUsers").flexigrid({
            url: 'BloomService.asmx/GetUserList',
            dataType: 'xml',
            colModel: [
            { display: 'Delete', name: 'Delete', width: 40, sortable: true, align: 'center', process: EditUser },
            { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left', process: EditUser },
            { display: 'UserName', name: 'UserName', width: 200, sortable: true, align: 'left', process: EditUser },
            //{ display: 'Password', name: 'Password', width: 140, sortable: true, align: 'left' },
            { display: 'UserType', name: 'UserType', width: 100, sortable: true, align: 'left', process: EditUser },
            { display: 'Email', name: 'Email', width: 200, sortable: true, align: 'left', process: EditUser },
            { display: 'Landing', name: 'Landing', width: 100, sortable: true, align: 'left', process: EditUser },
            { display: 'Farm Code', name: 'FarmCode', width: 296, sortable: true, align: 'left', process: EditUser },
            { display: 'Last Login', name: 'LastLogin', width: 100, sortable: true, align: 'left', process: EditUser },
            { display: 'Active?', name: 'IsActive', width: 50, sortable: true, align: 'center', process: EditUser },
            ],
            searchitems: [
           { display: 'Name', name: 'Name' },
            { display: 'UserName', name: 'UserName' },
            { display: 'UserType', name: 'UserType' },
            { display: 'Email', name: 'Email' },
            { display: 'Landing', name: 'Landing' },
            { display: 'Active? (0=No;1=Yes)', name: 'IsActive' },
            ],
            buttons: [
            { name: 'Add New', bclass: 'add', onpress: addUserclicked },
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
            height: $(window).height() - 250,
            striped: true,
            params: [
              { name: 'Filter', value: '' },
              { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {

                //$("#DivUsers .sDiv").find(".sDiv2").append("<input style='height:24px;' type='button' id='ExportCSV'  value='Export' class='ExportCSV' />");

                var sel = jQuery("#fgrdUsers tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#ExportCSV").show();
                }

                $("#fgrdUsers tr:first").addClass("trSelectedHeader trSelected");
            }

        });
        // $("#DivUsers .sDiv").find(".sDiv2").append("<input style='height:24px;' type='button' id='ExportCSV'  value='Export' class='ExportCSV' onclick() />");
        //$("#DivUsers .tDiv").find(".tDiv2").append("<span style='margin-left: 500px;font-size: 16px;font-weight: bold;color: #0000ff;'>USER INFORMATION</span>");

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    //$("#divCarrierID").html(id.toString());

                    $("#fgrdUsers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdUsers #row" + id).addClass("trSelectedHeader");
                    $("#fgrdUsers td.unsorted").addClass("sorted");
                    $("#fgrdUsers td.sorted").removeClass("unsorted");
                    $("#fgrdUsers #row" + id).removeClass("trSelected");
                    $("#fgrdUsers #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdUsers #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        var length = $('#lstwarehouse > option').length;
        if (length <= 0) {
            //STA::24-OCT-2015::to load the warehouse list
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseList',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    //$('#lstwarehouse').append('<option value="0">Select</option>');
                    var data = output.d;
                    if (data.length != 0) {
                        length = data.length;
                        for (var i in data) {
                            var res = data[i];
                            $('#lstwarehouse').append('<option value="' + res.WarehouseID + '">' + res.WH + "--" + res.Name + '</option>');
                        }
                        LoadwarehouseList();
                    }
                }
            });
        }
    });
    var WarehouseIDListArray = [];
    function LoadwarehouseList() {
        J1_10($("#lstwarehouse")).selectize()[0].selectize.destroy();
        J1_10($("#lstwarehouse")).selectize({
            maxItems: null,
            valueField: 'value',
            labelField: 'name',
            onChange: function () {
                WarehouseIDListArray = [];
                var lstwarehouse = $("#lstwarehouse");
                if ($("#lstwarehouse")[0].value != "" || $("#lstwarehouse")[0].value != "0") {
                    for (i = 0; i < lstwarehouse[0].length; i++) {
                        WarehouseIDListArray.push($("#lstwarehouse")[0][i].value);
                    }
                }
            }
        })[0].selectize.setValue(WarehouseIDListArray);

    }

    function ClearUserFarmSession(IsFlexReloadNeeded) {

        $.ajax({        //Clear the session when Add Click
            url: 'BloomService.asmx/ClearUserSession',
            type: 'POST',
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (IsFlexReloadNeeded == true) {
                    $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdUserWarehouse").flexReload({ url: '/url/for/refresh' });
                }
            }

        });
    }

    function EditUser(celDiv, id) {
        $(celDiv).dblclick(function () {
            $("#DivUser").next('div').find('.msgui').hide();
            var sourceCtl = $(this);
            var ID = id;
            $("#OldUserID").html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUserByID',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var User = output.d;
                    if (User.ID == ID) {

                        $(".UserPleaseWaitOverlay").show()
                        $("#lstLanding").val(User.Landing);
                        $("#txtName").val(User.Name);
                        $("#txtEmail_User").val(User.Email)
                        $("#txtUserName").val(User.UserName);
                        $("#txtPassword").val(User.Password);
                        $("#lstUserType").val(User.UserTypeID);
                        //$("#lstUserType").prop("disabled", true);
                        $('#ChkIsActive').iButton("toggle", User.IsActive == '' ? false : true);
                        $('#ChkIsAdmin').iButton("toggle", User.Admin == '' ? false : true);
                        $('#ChkIsGrowerDelete').iButton("toggle", User.IsGrowerDelete == '' ? false : true);
                        $('#ChkIsGrowerlock').iButton("toggle", User.IsGrowerlock == '' ? false : true);
                        $("#hfCanDeleteGrower").val(User.IsGrowerDelete == '' ? false : true);
                        $("#hfCanlockGrower").val(User.IsGrowerlock == '' ? false : true);

                        $('#ChkIsSetupsFile').iButton("toggle", User.IsSetupsFile == '' ? false : true);
                        $('#ChkIsSetupsReports').iButton("toggle", User.IsSetupsReports == '' ? false : true);
                        $('#ChkIsSetupsAdmin').iButton("toggle", User.IsSetupsAdmin == '' ? false : true);
                        $('#ChkIsSetupsImport').iButton("toggle", User.IsSetupsImport == '' ? false : true);
                        $("#hfSetupsFile").val(User.IsSetupsFile == '' ? false : true);
                        $("#hfSetupsReports").val(User.IsSetupsReports == '' ? false : true);
                        $("#hfSetupsAdmin").val(User.IsSetupsAdmin == '' ? false : true);
                        $("#hfSetupsImport").val(User.IsSetupsImport == '' ? false : true);

                        $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdUserWarehouse").flexReload({ url: '/url/for/refresh' });
                        //$('#lstUserType').trigger('change');
                        AdminUserTypeChange();

                        WarehouseIDListArray = [];
                        //WarehouseIDListArray = User.WarehouseList
                        for (i = 0; i < User.WarehouseList.length; i++) {
                            WarehouseIDListArray.push(User.WarehouseList[i].WarehouseID);
                        }

                        J1_10($("#lstwarehouse")).selectize()[0].selectize.setValue(WarehouseIDListArray);
                        //$('#lstwarehouse').val(User.WarehouseList.WarehouseID);


                        $("#DivUser").next('div').find('.msgui').remove();
                        $("#DivUser").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                        $("#DivUser").next('div').find(".msgui").css("width", $("#DivUser").width() - $('#DivUser').next('div').find(".ui-dialog-buttonset").width());
                        $("#DivUser").next('div').find('.msgui').hide();
                        $("#DivUser").dialog('option', 'title', 'Edit User : ' + User.Name + '');
                        $("#DivUser").dialog("open");

                    }
                    else {
                        $("#msg").html("Unable to get the user details, please contact site admin.");
                        $("#msgbox-select").dialog("open");
                    }
                },
                error: function (e) {
                    $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue (GetUserByID).");
                    $("#msgbox-select").dialog("open");
                },
            });
        }).on("click", function () {

            $("#fgrdUsers [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdUsers #row" + id).addClass("trSelectedHeader");
            $("#fgrdUsers td.unsorted").addClass("sorted");
            $("#fgrdUsers td.sorted").removeClass("unsorted");
            $("#fgrdUsers #row" + id).removeClass("trSelected");
            $("#fgrdUsers #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdUsers #row" + id + " td.unsorted").removeClass("sorted");
        })
    }

    function filterclicked() {

        if ($(".slidediv").css('display') == "none") {
            $(".slidediv").slideDown("slow");

        }
        else {
            $(".slidediv").slideUp("slow");

        }

    }

    $('.button-group').each(function (i, buttonGroup) {
        var $buttonGroup = $(buttonGroup);
        $buttonGroup.on('click', 'button', function () {
            $buttonGroup.find('.is-checked').removeClass('is-checked');
            $(this).addClass('is-checked');
        });
    });



    function addUserclicked(com, grid) {
        $(".UserPleaseWaitOverlay").hide();
        ClearUserFarmSession(true);
        $(".trAgencyCode").hide();
        $(".trCustomerNo").hide();
        $(".trDivision").hide();
        $(".trSalesPerson").hide();
        $(".trwarehouse").hide();
        $("#DivUser").next('div').find('.msgui').hide();
        $('#lstUserType').val("0");
        $('#lstLanding').val("SELECT");
        $("#txtName").val("");
        $("#txtEmail_User").val("");
        $("#txtUserName").val("");
        $("#txtPassword").val("");
        $("#txtAgencyCode").val("");
        $("#txtCustomerNo").val("");
        $("#txtDivision").val("");
        //$("#txtSalesPerson").val("");
        $("#lstSalesPerson").val("0");
        $('#ChkIsActive').iButton("toggle", true);
        $('#ChkIsAdmin').iButton("toggle", false);
        $('#ChkIsGrowerDelete').iButton("toggle", false);
        $('#ChkIsGrowerlock').iButton("toggle", false);
        $(".IsAdmin").show();
        //----------------
        $('#ChkPendingPOs').iButton("toggle", false);
        $('#ChkShippedPOs').iButton("toggle", false);
        $('#ChkConfirmedPOs').iButton("toggle", false);
        $('#ChkUsers').iButton("toggle", false);
        $('#ChkAvailability').iButton("toggle", false);
        $('#ChkCredits').iButton("toggle", false);
        $('#chkemail').iButton("toggle", false);
        //-------------------------
        $("#lstUserType").show();
        $("#lblUserType").hide();
        $("#OldUserID").html("~NEW~");

        $(".trwebpermission").hide();
        $("#tdsecondcolumn").hide();

        $("#tdUserDetails").css("border-right", "0px");
        $("#tdUserDetails").css("border-bottom", "0px");
        $("#lstUserType").prop("disabled", false);
        $("#lstLanding").prop("disabled", false);

        $("#ChkIsSetupsFile").iButton("toggle", false);
        $("#ChkIsSetupsReports").iButton("toggle", false);
        $("#ChkIsSetupsAdmin").iButton("toggle", false);
        $("#ChkIsSetupsImport").iButton("toggle", false);
        $(".chkSetups").iButton("toggle", false);

        //$("#tdthirdcolumn").css("border-left", "0px");
        //$("#tdthirdcolumn").hide();

        $(".tdUserPermissionTabs").hide();
        resetSalesPersonPermissions();

        J1_10($("#lstwarehouse")).selectize()[0].selectize.setValue("");

        $("#DivUsertype").find('.is-checked').removeClass('is-checked');
        $("#DivUser").next('div').find('.msgui').remove();
        $("#DivUser").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
        $("#DivUser").next('div').find(".msgui").css("width", $("#DivUser").width() - $('#DivUser').next('div').find(".ui-dialog-buttonset").width());
        $("#DivUser").next('div').find('.msgui').hide();
        $("#DivUser").dialog('option', 'title', "Add New User");
        $("#DivUser").dialog("open");
        //$(".ui-dialog-buttonpane button:contains('Send Credentials')").removeClass('dialogbuttonstyle icon-email').hide();

        /*Added by Anubhuti*/
        $('#chkAccessToAllCustomers').iButton("toggle", true);
        $('#chkPrintCustomerList').iButton("toggle", true);
        $('#chkSetupDailyPrices').iButton("toggle", true);
        $('#chkOverrideMarketPrice').iButton("toggle", true);
        $('#chkAllowLockRelease').iButton("toggle", true);
        $('#chkAccessToOpenMarket').iButton("toggle", true);
        $('#chkAccessToReportsMenu').iButton("toggle", true);
        $('#chkViewSoldBoxes').iButton("toggle", true);
        $('#chkUpdateProductCodes').iButton("toggle", true);
        $('#chkUpdateGrowerCodes').iButton("toggle", true);
        $('#chkUpdateSalespersonCodes').iButton("toggle", true);
        $('#chkUpdateCarrierCodes').iButton("toggle", true);
        $('#chkUpdateToAirport').iButton("toggle", true);
        $('#chkUpdateToDuty').iButton("toggle", true);
        $('#chkUpdateToCredit').iButton("toggle", true);
        $('#chkUpdateToBox').iButton("toggle", true);
        $('#chkUpdateToProduct').iButton("toggle", true);
        $('#chkUpdateToCountry').iButton("toggle", true);
        /**/
        var Duplicatebtn = $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save')
        $(Duplicatebtn).hide();
    }

    function validateNumber(sNumber) {
        var intRegex = /^\d+$/;
        var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
        if (intRegex.test(sNumber) || floatRegex.test(sNumber)) {
            return true;
        }
        else {
            return false;
        }
    }

    function ValidateUser() {
        $("#DivUser").next('div').find('.msgui').hide();
        $("#DivUser").next('div').find(".msgui").css("width", $("#DivUser").width() - $('#DivUser').next('div').find(".ui-dialog-buttonset").width());

        var Name = $("#txtName").val();
        if (Name.toString().trim() == "") {
            $("#DivUser").next('div').find(".msgui").html("Name is Required");
            $("#DivUser").next('div').find('.msgui').show();
            $("#txtName").focus();
            return false;
        }
        if ($("#txtEmail_User").val().toString().trim() == "") {
            $("#DivUser").next('div').find(".msgui").html("Email is Required");
            $("#DivUser").next('div').find('.msgui').show();
            $("#txtEmail_User").focus();
            return false;
        }
        if ($("#txtUserName").val().toString().trim() == "") {
            $("#DivUser").next('div').find(".msgui").html("UserName is Required");
            $("#DivUser").next('div').find('.msgui').show();
            $("#txtUserName").focus();
            return false;
        }
        if ($("#txtPassword").val().toString().trim() == "") {
            $("#DivUser").next('div').find(".msgui").html("Password is Required");
            $("#DivUser").next('div').find('.msgui').show();
            $("#txtPassword").focus();
            return false;
        }

        if ($('#lstUserType option:selected').text().toLowerCase() == "none selected") {
            $("#DivUser").next('div').find(".msgui").html("Usertype is Required");
            $("#DivUser").next('div').find('.msgui').show();
            $("#lstUserType").focus();
            return false;
        }

        var Email = $("#txtEmail_User").val();
        var filter = /[\w-]+@([\w-]+\.)+[\w-]+/;
        if (!filter.test(Email)) {
            $("#DivUser").next('div').find(".msgui").html("Please enter valid email address");
            $("#DivUser").next('div').find('.msgui').show();
            return false;
        }

        if ($('#lstUserType option:selected').text().toLowerCase() == "customer") {
            if (!validateNumber($("#txtCustomerNo").val())) {
                $("#DivUser").next('div').find(".msgui").html("Please enter valid customer number");
                $("#DivUser").next('div').find('.msgui').show();
                $("#txtCustomerNo").focus();
                return false;
            }
        }
        if ($('#lstUserType option:selected').text().toLowerCase() == "vendor") {

            var sel = jQuery("#fgrdUserFarms tbody tr");
            var len = sel.length;
            if (len <= 0) {
                $("#DivUser").next('div').find(".msgui").html("Please enter farm details");
                $("#DivUser").next('div').find('.msgui').show();
                $("#txtFarm").focus();
                return false;
            }
        }


        var names_arr = ['customer', 'cargo agent', 'vendor', 'warehouse'];
        var UserTypeIdx = names_arr.indexOf($('#lstUserType option:selected').text().toLowerCase());

        if (UserTypeIdx == -1) {
            if (!validateNumber($("#txtDivision").val())) {
                $("#DivUser").next('div').find(".msgui").html("Please enter value for Division ");
                $("#DivUser").next('div').find('.msgui').show();
                $("#txtDivision").focus();
                return false;
            }

            if ($("#lstSalesPerson").val().toString().trim() == "0") {
                $("#DivUser").next('div').find(".msgui").html("Sales Person is Required");
                $("#DivUser").next('div').find('.msgui').show();
                $("#lstSalesPerson").focus();
                return false;
            }
        }


        //if ($('#lstUserType option:selected').text().toLowerCase() != "customer" || $('#lstUserType option:selected').text().toLowerCase() != "cargo agent" || $('#lstUserType option:selected').text().toLowerCase() != "vendor" || $('#lstUserType option:selected').text().toLowerCase() != "warehouse") {
        //    if (!validateNumber($("#txtDivision").val())) {
        //        $("#DivUser").next('div').find(".msgui").html("Please enter value for Division ");
        //        $("#DivUser").next('div').find('.msgui').show();
        //        $("#txtDivision").focus();
        //        return false;
        //    }

        //    if ($("#lstSalesPerson").val().toString().trim() == "0") {
        //        $("#DivUser").next('div').find(".msgui").html("Sales Person is Required");
        //        $("#DivUser").next('div').find('.msgui').show();
        //        $("#lstSalesPerson").focus();
        //        return false;
        //    }
        //}

        if ($('#lstLanding option:selected').text() == "SELECT") {
            $("#DivUser").next('div').find(".msgui").html("Please select the landing page");
            $("#DivUser").next('div').find('.msgui').show();
            $("#lstLanding").focus();
            return false;
        }

        return true;
    }

    $("#DivUser").dialog({
        autoOpen: false,
        width: 1100,
        height: 590,
        modal: true,
        resizable: false,
        buttons: {
            Duplicate: {
                class: 'leftButtonDuplicatebtn',
                text: 'Duplicate',
                click: function () {
                    debugger;
                    isDuplicateBoxMaintance = true;
                     saveuserdetails("save");
                }
            },
            "Send Credentials": function () {
                isDuplicateBoxMaintance = false;
                saveuserdetails("send credentials");
            },
            Save: function () {
                 isDuplicateBoxMaintance = false;
                saveuserdetails("save");
            },
            Cancel: function () {
                $("#OldUserID").html("");
                $("#divOldUserName").html("");
                $(".ui-dialog-buttonpane div.dialogProgress").hide();
                $("#DivUser").dialog("close");
            },
        },
        open: function () {
            debugger;
            $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Send Credentials')").addClass('dialogbuttonstyle icon-email')
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            $(".ui-dialog-buttonpane div.dialogProgress").remove();
            $(".ui-dialog-buttonpane").append("<div class='dialogProgress' style='float:left;margin:10px;display:none;'><b>Loading...</b><img src='images/ajax-loader.gif' /></div>")
        }
    });

    function saveuserdetails(SaveOrSaveandSend) {
        debugger;
        if (ValidateUser()) {
            $(".ui-dialog-buttonpane div.dialogProgress").show();
            var getusertype = $('#lstUserType option:selected').text().toLowerCase();
            var Name = $("#txtName").val();
            var Email = $("#txtEmail_User").val();
            var UserName = $("#txtUserName").val().toString().trim();
            var Landing = $("#lstLanding").val();
            var OldUserId = $("#OldUserID").html();
            var UserType = $('#lstUserType').val();
            var IsActive = $('#ChkIsActive').is(":checked") ? "1" : "0";
            var IsAdmin = getusertype != "vendor" ? getusertype == "admin" ? "1" : $('#ChkIsAdmin').is(":checked") ? "1" : "0" : "0";
            var IsGrowerDelete = getusertype != "vendor" ? $('#ChkIsGrowerDelete').is(":checked") ? "1" : "0" : "0";
            var IsGrowerlock = getusertype != "vendor" ? $('#ChkIsGrowerlock').is(":checked") ? "1" : "0" : "0";
            var permissions = "";
            var Features = "";
            var AgencyCode = $("#txtAgencyCode").val();
            var CustomerNo = $("#txtCustomerNo").val();
            var Division = $("#txtDivision").val();
            var SalesPerson = $("#lstSalesPerson").val();
            var IsSetupsFile = getusertype != "vendor" ? $("#ChkIsSetupsFile").is(":checked") ? "1" : "0" : "0";
            var IsSetupsReports = getusertype != "vendor" ? $("#ChkIsSetupsReports").is(":checked") ? "1" : "0" : "0";
            var IsSetupsAdmin = getusertype != "vendor" ? $("#ChkIsSetupsAdmin").is(":checked") ? "1" : "0" : "0";
            var IsSetupsImport = getusertype != "vendor" ? $("#ChkIsSetupsImport").is(":checked") ? "1" : "0" : "0";
            var Orders = '';
            if (WarehouseIDListArray.length > 0)
                var Warehouse = WarehouseIDListArray.join(",")
            else
                var Warehouse = 0

            debugger;
            var invaccestypes = "", invarr = [];
            invaccestypes = $("#txtAccessToInventory").val();
            invaccestypes = (invaccestypes == undefined ? "" : invaccestypes);
            if (invaccestypes.length > 1) {
                var vallen = invaccestypes.length;
                for (var i = 0; i < vallen; i++) {
                    var curval = invaccestypes.substring(i, i + 1);
                    invarr.push(curval.toString().toUpperCase());
                }
            }
            else {
                invarr.push(invaccestypes.toString().toUpperCase());
            }
            invarr.join(',');

            $(".chkwebpermission").each(function () {
                debugger;
                var PermissionID = this.id;
                if ($("#" + PermissionID).is(":checked")) {
                    permissions +=  PermissionID.substring(4) + ",";
                }
            });
            permissions = permissions.substring(0, permissions.length - 1);
            var seturl = SaveOrSaveandSend.toString().toLowerCase() == "send credentials" ? 'BloomService.asmx/SaveAndSendUserDetails' : 'BloomService.asmx/SaveOrUpdateUserDetails';
            debugger;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/Encrypt',
                data: '{"OriginalText":"' + $("#txtPassword").val().trim() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var Password = output.d;
                    if (SaveOrSaveandSend.toString().toLowerCase() != "send credentials" && OldUserId != "~NEW~") {
                        if ($("#divOldUserName").html().toLowerCase() == "admin" && $("#divOldUserName").html().toLowerCase() != UserName.toLowerCase()) {
                            $.MessageBox("You don't have permission to change administrator username..!!");
                            return true;
                        }
                    }
                    var setuserid = OldUserId == "~NEW~" ? "0" : OldUserId;
                    $.ajax({
                        type: "POST",
                        url: seturl,
                        data: '{"Name":"' + Name + '","Email":"' + Email + '","UserName":"' + UserName + '","Password":"' + Password + '","IsActive":"' + IsActive + '","Landing":"' + Landing + '","UserType":"' + UserType + '","Permissions":"' + permissions + '","AgencyCode":"' + AgencyCode + '","Warehouseid":"' + Warehouse + '","IsAdmin":"' + IsAdmin + '","CustomerNo":"' + CustomerNo + '","Division":"' + Division + '","SalesPerson":"' + SalesPerson + '","IsGrowerDelete":"' + IsGrowerDelete + '","IsGrowerlock":"' + IsGrowerlock + '","IsSetupsFile":"' + IsSetupsFile + '","IsSetupsReports":"' + IsSetupsReports + '","IsSetupsAdmin":"' + IsSetupsAdmin + '","IsSetupsImport":"' + IsSetupsImport + '","ORDER":"' + GetSalesPersonPermissionForUsers() + '","OldUserID":"' + setuserid + '","InventoryAccesstypes":"' + invarr + '","isDuplicateBoxMaintance":"' + isDuplicateBoxMaintance + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            debugger;
                            if (SaveOrSaveandSend.toString().toLowerCase() == "send credentials") {
                                var CredentialBodyMessage = "";
                                if (output.d != null) {
                                    if (output.d.ErrorMessage == "" || output.d.ErrorMessage == null) {
                                        $("#fgrdUsers").flexReload({ url: '/url/for/refresh' });
                                        $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                        $("#DivUser").dialog("close");
                                        $("#txtUserCreadentialsToemails").val("");
                                        $("#txtUserCreadentialsSubjects").val("");
                                        $("#txtUserCreadentialsBody").val("");
                                        var User = output.d;
                                        if ($("#txtUserCreadentialsToemails").val() != "" || $("#txtUserCreadentialsToemails").val() != null) {
                                            var emailcreadential = $("#ctl00_divLoggedInUserEmail").html();
                                            $("#txtUserCreadentialsToemails").val(User.Email);
                                            $("#txtUserCreadentialsSubjects").val("Your credentials for " + ('<%=ConfigurationManager.AppSettings("CompanyName")%>').toString() + " web site");
                                            CredentialBodyMessage = "Username :" + User.UserName + "\n Password :" + User.Password;
                                            FullCnstrEmail = "mailto:" + $("#txtUserCreadentialsToemails").val() + "?subject=" + $("#txtUserCreadentialsSubjects").val();
                                            FullCnstrEmail = FullCnstrEmail + "&body=" + CredentialBodyMessage;
                                            // window.location.href = FullCnstrEmail
                                        }
                                        else {
                                            $("#txtUserCreadentialsToemails").val(output.d);
                                        }
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/GetCredentialEmailContentSettings',
                                            data: "{}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (output, status) {
                                                var CredentialContent = output.d;
                                                FullCnstrEmail = "mailto:" + $("#txtUserCreadentialsToemails").val() + "?subject=" + $("#txtUserCreadentialsSubjects").val();
                                                if (CredentialContent != null && CredentialContent != "") {
                                                    var CredentialMessage = CredentialContent.Content.replace("&", "and") + "\n\n" + CredentialBodyMessage;
                                                    $("#txtUserCreadentialsBody").val(CredentialMessage);
                                                    FullCnstrEmail = FullCnstrEmail + "&body=" + CredentialMessage;
                                                }
                                                else {
                                                    $("#txtUserCreadentialsBody").val(CredentialBodyMessage);
                                                    FullCnstrEmail = FullCnstrEmail + "&body=" + CredentialBodyMessage;
                                                }
                                                FullCnstrEmail = encodeURI(FullCnstrEmail);
                                                window.location.href = FullCnstrEmail;
                                            }
                                        });
                                        $("#SelecteduserEmailid").html("");
                                        $("#SelecteduserEmailid").html($("#txtEmail_User").val());
                                        //$("#SendCreadentials").dialog("open");
                                        //$("#SendCreadentials").dialog('option', 'title', "Credentials");
                                    }
                                    else if (output.d.ErrorMessage.indexOf("UNIQUE KEY constraint") >= 0) {
                                        $.MessageBox("UserName already exists!");
                                        $("#messagebox_overlay").css("z-index", $("[aria-labelledby='ui-dialog-title-DivUser']").css("z-index") + 1);
                                        $("#DivUser").next('div').find(".msgui").html("User name already exists!!");
                                        $("#DivUser").next('div').find('.msgui').show();
                                        $("#DivExecutionResult").html("User name already exists!");
                                        $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                    }
                                    else {
                                        $("#DivUser").next('div').find('.msgui').hide();
                                        return false;
                                    }
                                }
                            }
                            else {
                                if (output.d == 'LogOut') {
                                    window.location.href = "Login.aspx";
                                }
                                else if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                    if (output.d.indexOf("UNIQUE KEY constraint") >= 0) {
                                        $.MessageBox("UserName already exists!");
                                        $("#messagebox_overlay").css("z-index", $("[aria-labelledby='ui-dialog-title-DivUser']").css("z-index") + 2);
                                        $("#DivUser").next('div').find(".msgui").html("User name already exists!!");
                                        $("#DivUser").next('div').find('.msgui').show();
                                        $("#DivExecutionResult").html("User name already exists!");
                                        $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                    }
                                }
                                else {
                                    if (OldUserId == "~NEW~") {
                                        if (output.d != '0' && output.d != 'LogOut' && output.d.indexOf("UNIQUE KEY constraint") < 0) {
                                            $("#OldUserID").html("");
                                            $("#fgrdUsers").flexReload({ url: '/url/for/refresh' });
                                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                            $("#DivUser").dialog("close");
                                            if (getParameterByName("Page") == "ConfirmedPOs") {
                                                var str = $("#divConfirmedPOsFilter").html().replace("&gt;", "").replace("&lt;", "").replace('&amp;', '&');
                                                $("#fgrdConfirmedPOs").flexOptions({ params: [{ name: 'Filter', value: str }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                                            }
                                            return true;
                                        }
                                    }
                                    else {
                                        if (output.d == 'valid') {
                                            $("#OldUserID").html("");
                                            $("#fgrdUsers").flexReload({ url: '/url/for/refresh' });
                                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                                            $("#DivUser").dialog("close");
                                            return true;
                                        }
                                    }
                                }
                            }
                        },
                        error: function (e) {
                            $("#DivUser").next('div').find(".msgui").html("OOPS! Unable to process your request. Please contact admin! (SaveAndSendUserDetails or SaveAndUpdateUserDetails)");
                            $("#DivUser").next('div').find('.msgui').show();
                            return false;
                        }
                    });
                }
            });

        }
    }

    function GetSalesPersonPermissionForUsers() {
        debugger;
        var Order = '';
        var getusertype = $('#lstUserType option:selected').text().toLowerCase();
        var countOrderEntry1Left = $("input[name=OrderEntry1Left]").length;
        var countOrderEntry1Right = $("input[name=OrderEntry1Right]").length;
        var countOrderEntry2Left = $("input[name=OrderEntry2Left]").length;
        var countOrderEntry2Right = $("input[name=OrderEntry2Right]").length;
        var countOrderEntry3Left = $("input[name=OrderEntry3Left]").length;
        var orderentry = "";

        if ($(".tdUserPermissionTabs").css("display") != "none" || getusertype == "sales person" || getusertype == "warehouse" || getusertype == "employee" || getusertype == "sales manager" || getusertype == "owner" || getusertype == "inventory" || getusertype == "credit manager" || getusertype == "admin") {
            var IsOrdersChecked = $(".chkSales").is(":checked") ? true : false;
            if (IsOrdersChecked || getusertype == "admin") {

                //1. ORDER ENTRY TAB 1 SETUPs
                //1.1 ORDER ENTRY 1 TAB LEFT SETUPs
                orderentry = "input[name=OrderEntry1Left]";
                Order = constructOrderEntrySetups(orderentry, countOrderEntry1Left, Order, getusertype);
                //Start Inventories to Block User Permission Issue Fixed:Anand[08/10/2021]
                //var invacestypes = $("#txtAccessToInventory").val();
                ////M,L,B,A,S,H,E
                //var setinvaccess = "";
                //if (invacestypes != "") {
                //    invacestypes = invacestypes.toLowerCase();
                //    setinvaccess = ((invacestypes.includes("M".toLowerCase())) || (invacestypes.includes("L".toLowerCase())) || (invacestypes.includes("B".toLowerCase())) || (invacestypes.includes("A".toLowerCase())) || (invacestypes.includes("S".toLowerCase())) || (invacestypes.includes("H".toLowerCase())) || (invacestypes.includes("E".toLowerCase()))) ? "Y" : "N";
                //}
                //else setinvaccess = "";
                //Order += (getusertype == "admin" ? "Y" : setinvaccess);
                //End Inventories to Block User Permission Issue Fixed: Anand[08/10/2021]

                //1.2 ORDER ENTRY 1 TAB RIGHT SETUPs
                orderentry = "";
                orderentry = "input[name=OrderEntry1Right]";
                Order = constructOrderEntrySetups(orderentry, countOrderEntry1Right, Order, getusertype);
                Order += " ";

                //2. ORDER ENTRY TAB 2 SETUPs
                //2.1 ORDER ENTRY 2 TAB LEFT SETUPs
                orderentry = "";
                orderentry = "input[name=OrderEntry2Left]";
                Order = constructOrderEntrySetups(orderentry, countOrderEntry2Left, Order, getusertype);

                //2.2 ORDER ENTRY 2 TAB RIGHT SETUPs
                orderentry = "";
                orderentry = "input[name=OrderEntry2Right]";
                Order = constructOrderEntrySetups(orderentry, countOrderEntry2Right, Order, getusertype);
                Order += " ";

                //3. ORDER ENTRY TAB 3 SETUPs
                //3.1 ORDER ENTRY 3 TAB LEFT SETUPs
                orderentry = "";
                orderentry = "input[name=OrderEntry3Left]";
                Order = constructOrderEntrySetups(orderentry, countOrderEntry3Left, Order, getusertype);
            }
            else {
                resetSalesPersonPermissions();
            }
        }
        return Order;
    }

    function constructOrderEntrySetups(OrderEntrySetupTab, countOrderEntry, Order, getusertype) {
        debugger;
        for (var i = 0; i < countOrderEntry; i++) {
            Order += (Order.split(',').length == 1) ? (getusertype == "admin" ? "Y" : $("#" + $(OrderEntrySetupTab)[i].id + "").is(":checked") ? "Y" : "N") : ("," + getusertype == "admin" ? "Y" : $("#" + $(OrderEntrySetupTab)[i].id + "").is(":checked") ? "Y" : "N")
        }
        if (OrderEntrySetupTab = "input[name=OrderEntry1Left]" && Order.length == 19) {
            Order += "N";
        }
        return Order;
    }

    function resetSalesPersonPermissions() {
        debugger;
        $("[id^=DivOrderEntry]").find("input[type='checkbox']").iButton("toggle", false);
        $("[id^=DivOrderEntry]").find("input[type='text']").val("");
    }

    $("[id^=edituser_]").die("click").live("click", function () {

        $("#DivUser").next('div').find('.msgui').hide();
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(9);
        $("#OldUserID").html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                var User = output.d;
                if (User.ID == ID) {
                    $(".UserPleaseWaitOverlay").show()
                    $("#lstLanding").val(User.Landing);
                    $("#txtName").val(User.Name);
                    $("#txtEmail_User").val(User.Email)
                    $("#txtUserName").val(User.UserName);
                    $("#divOldUserName").html(User.UserName);
                    $("#txtPassword").val(User.Password);
                    $("#lstUserType").val(User.UserTypeID);
                    $("#txtAgencyCode").val(User.AgencyCode);
                    $("#txtCustomerNo").val(User.CustomerNo);
                    $("#txtDivision").val(User.Division);
                    $("#lstSalesPerson").val(User.SalesPerson);
                    //$("#lstUserType").prop("disabled", true);
                    $('#ChkIsActive').iButton("toggle", User.IsActive == '' ? false : true);
                    $('#ChkIsAdmin').iButton("toggle", User.Admin == '' ? false : true);
                    $('#ChkIsGrowerDelete').iButton("toggle", User.IsGrowerDelete == '' ? false : true);
                    $("#hfCanDeleteGrower").val(User.IsGrowerDelete == '' ? false : true);
                    $('#ChkIsGrowerlock').iButton("toggle", User.IsGrowerlock == '' ? false : true);
                    $("#hfCanlockGrower").val(User.IsGrowerlock == '' ? false : true);

                    $('#ChkIsSetupsFile').iButton("toggle", User.IsSetupsFile == '' ? false : true);
                    $("#hfSetupsFile").val(User.IsSetupsFile == '' ? false : true);
                    $('#ChkIsSetupsReports').iButton("toggle", User.IsSetupsReports == '' ? false : true);
                    $("#hfSetupsReports").val(User.IsSetupsReports == '' ? false : true);
                    $('#ChkIsSetupsAdmin').iButton("toggle", User.IsSetupsAdmin == '' ? false : true);
                    $("#hfSetupsAdmin").val(User.IsSetupsAdmin == '' ? false : true);
                    $('#ChkIsSetupsImport').iButton("toggle", User.IsSetupsImport == '' ? false : true);
                    $("#hfSetupsImport").val(User.IsSetupsImport == '' ? false : true);
                    

                    if ($("#hfSetupsFile").val() == true || $("#hfSetupsReports").val() == true || $("#hfSetupsAdmin").val() == true || $("#hfSetupsImport").val() == true) {
                        $(".chkSetups").iButton("toggle", true);
                    }
                    else {
                        $(".chkSetups").iButton("toggle", false);
                    }

                    $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdUserWarehouse").flexReload({ url: '/url/for/refresh' });
                    // $('#lstUserType').trigger('change');
                    $(".IsAdmin").show();
                    AdminUserTypeChange();
                    WarehouseIDListArray = [];
                    //WarehouseIDListArray = User.WarehouseList
                    for (i = 0; i < User.WarehouseList.length; i++) {
                        WarehouseIDListArray.push(User.WarehouseList[i].WarehouseID);
                    }
                    debugger;
                    J1_10($("#lstwarehouse")).selectize()[0].selectize.setValue(WarehouseIDListArray);

                    if (User.ORDER.trim() != "") {
                        debugger;
                        var OrderEntryPermissionList = User.ORDER.split(" ");
                        //Order Entry 1 SETUP
                        var DivOrderEntryCount = $("#DivOrderEntry1").find("input").length;
                        setUserOrderEntrySetup(OrderEntryPermissionList, DivOrderEntryCount, "DivOrderEntry1", 0);
                        debugger;
                        var invaccesstypes = "";
                        invaccesstypes = $("#txtAccessToInventory").val();
                        if (invaccesstypes == "") $("#txtAccessToInventory").val("");
                        else {
                            invaccesstypes = User.InventoryAccesstypes;
                            if (invaccesstypes == "" || invaccesstypes == null || invaccesstypes == undefined) $("#txtAccessToInventory").val("".toUpperCase());
                            else {
                                if (invaccesstypes.includes(',')) {
                                    invaccesstypes = invaccesstypes.replace(/,/g, "");
                                    $("#txtAccessToInventory").val(invaccesstypes);
                                }
                                else {
                                    $("#txtAccessToInventory").val(invaccesstypes);
                                }
                            }
                        }

                        //Order Entry 2 SETUP
                        DivOrderEntryCount = 0;
                        DivOrderEntryCount = $("#DivOrderEntry2").find("input").length;
                        setUserOrderEntrySetup(OrderEntryPermissionList, DivOrderEntryCount, "DivOrderEntry2", 1);

                        //Order Entry 3 SETUP
                        DivOrderEntryCount = 0;
                        DivOrderEntryCount = $("#DivOrderEntry3").find("input").length;
                        setUserOrderEntrySetup(OrderEntryPermissionList, DivOrderEntryCount, "DivOrderEntry3", 2);
                    }
                    else {
                        resetSalesPersonPermissions();
                    }

                    J1_10($("#lstwarehouse")).selectize()[0].selectize.setValue(WarehouseIDListArray);
                    $("#DivUser").next('div').find('.msgui').remove();
                    $("#DivUser").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                    $("#DivUser").next('div').find(".msgui").css("width", $("#DivUser").width() - $('#DivUser').next('div').find(".ui-dialog-buttonset").width());
                    $("#DivUser").next('div').find('.msgui').hide();
                    $("#DivUser").dialog('option', 'title', 'Edit User : ' + User.Name + '');
                    $("#DivUser").dialog("open");
                    $(".ui-dialog-buttonpane button:contains('Send Credentials')").addClass('dialogbuttonstyle icon-email').show();
                    $(".ui-dialog-buttonpane button:contains('Save and Send Credentials')").addClass('dialogbuttonstyle icon-email').hide();
                    var Duplicatebtn = $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save')
                    $(Duplicatebtn).show();
                }
                else {
                    $("#msg").html("Unable to get the user details, please contact site admin.");
                    $("#msgbox-select").dialog("open");
                }
            },
            error: function (e) {
                $("#msg").html("OOPS! Something went wrong, please try again, we will research the issue. (GetUserByID)");
                $("#msgbox-select").dialog("open");
            }
        });
    });

    function setUserOrderEntrySetup(OrderEntryPermissionList, OrderEntryCount, DivOrderEntry, ordertab) {
        debugger;
        for (var i = 0; i < OrderEntryCount; i++) {
            var OrderEntry1ID = '';
            if ($("#" + DivOrderEntry + "").find("input")[i].type == "text") {
                OrderEntry1ID = $("#" + DivOrderEntry + "").find("input")[i].id;
                $("#" + OrderEntry1ID).val(OrderEntryPermissionList[ordertab][i]);
            }
            else {
                OrderEntry1ID = $("#" + DivOrderEntry + "").find("input")[i].id;
                $("#" + OrderEntry1ID).iButton("toggle", OrderEntryPermissionList[ordertab][i] == 'Y' ? true : false);
            }
        }
    }

    function hideOverlay() {
        $(".UserPleaseWaitOverlay").fadeOut();
    }

    $("[id^=deleteuser_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(11);
        $("#DivUser").next('div').find('.msgui').hide();
        $('#OldId').html(ID);

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var List = output.d;
                if (output.d.UserName.toLowerCase() == "admin" && output.d.UserTypeID == "1") {
                    $.MessageBox("You are not authorised to delete this user..");
                }
                else {
                    $("#Deleteconfirm_User").html("<p>Are you sure to delete<b> " + List.UserName + "</b> ?</p>");
                    $("#Deleteconfirm_User").dialog("open");
                }
            }

        });
    });

    $("#Deleteconfirm_User").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#deleteuser_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteUser',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'valid') {
                            adialog.dialog("close");
                            $("#fgrdUsers").flexReload({ url: '/url/for/refresh' });
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

    $("[id^=Farmdelete_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var SlNo = sourceCtl.attr('id').substring(11);
        $("#DivUser").next('div').find('.msgui').hide();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DelUserFirmBySNo',
            data: '{"SlNo":"' + SlNo + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == 'Valid') {
                    $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                }
            }
        });
    });

    $("#txtNameFilter").autocomplete({

        source: function (request, response) {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetNameAuto',
                data: "{'Name': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (item) {
                        return {
                            label: item.Name

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
        select: function (e, i) {
            $("#txtNameFilter").val(i.item.label);
            $("#lblNameFilter").html(i.item.label);
            $("#btnapply").click();
            $("#tr1").addClass('FilterDivStyle');
            $("#imgName").attr("src", "images/Filter.png");
            $("#divNameFilter").slideToggle();
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtNameFilter").val("");
                $("#lblNameFilter").html("");
                $("#txtNameFilter").focus();

            }
        },
        minLength: 1
    });

    $("[id^=imgName]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgName").attr("src", "images/EmptyFilter.png");
            $("#txtNameFilter").val("");
            $("#lblNameFilter").html("");
            $("#tr1").removeClass();
            $("#btnapply").click();
            $("#divNameFilter").slideToggle();
        }
    });

    $("[id^=imgUserType]").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgUserType").attr("src", "images/EmptyFilter.png");
            $("#lblUserTypeFilter").html("");
            $("#tr1").removeClass();
            $('#lstUserTypeFilter').val("0");
            $("#btnapply").click();
            $("#divUserTypeFilter").hide();
            e.stopPropagation();
        }
    });

    $('#lstUserTypeFilter').change(function () {

        $("#lblUserTypeFilter").html($('#lstUserTypeFilter option:selected').text());
        $("#btnapply").click();
        $("#tr1").addClass('FilterDivStyle');
        $("#imgUserType").attr("src", "images/Filter.png");
        $("#divUserTypeFilter").slideToggle();
    });

    //$('#lstUserType').bind("change",function (e) {
    function AdminUserTypeChange() {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWebPermissionforUserType',
            data: "{'UserType': '" + $("#lstUserType option:selected").text() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                $("#txtFarm").css("width", "320px");
                $("#btnAddUIOFarms").hide();
                $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                $("#lstLanding").attr("disabled", false);
                $(".trwebpermission").hide();
                $("#tdsecondcolumn").hide();
                $(".trDivision").hide();
                $(".trSalesPerson").hide();
                $(".trAgencyCode").hide();
                $(".trCustomerNo").hide();
                $(".trwarehouse").hide();
                $(".IsAdmin").show();
                // WarehouseIDListArray = [];
                // $("#txtAgencyCode").val("");
                if (output.d != "" && output.d != "<tr class='trwebpermission trTitle'><td style='font-weight: bold; height: 32px;'>WEB Permission</td></tr>") {
                    $("#tdUserDetails").css("border-right", "1px solid grey");
                    $("#tdUserDetails").css("border-bottom", "1px solid grey");
                    $(".tblwebpermission tr.trwebpermission").remove();
                    $(".tblwebpermission").append(output.d);
                    $(".chkwebpermission").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    //**Grower Report Section:Start**//
                    $("#ChkIsGrowerDelete").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $("#ChkIsGrowerlock").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $(".chkGrowerReports").change(function () {
                        var chkGrowerReports = $(".chkGrowerReports").is(":checked") ? "1" : "0";
                        switch (chkGrowerReports) {
                            case "0":
                                $("#ChkIsGrowerDelete").iButton("toggle", false);
                                $("#ChkIsGrowerlock").iButton("toggle", false);
                                $(".trGrowerReportSub").hide();
                                break;
                            case "1":
                                $("#ChkIsGrowerDelete").iButton("toggle", $("#hfCanDeleteGrower").val() == true ? true : false);
                                $("#ChkIsGrowerlock").iButton("toggle", $("#hfCanlockGrower").val() == true ? true : false);
                                //$("#hfCanDeleteGrower").val(User.IsGrowerDelete == '' ? false : true);
                                $(".trGrowerReportSub").show();
                                break;
                        }
                    });
                    //**Grower Report Section:end**//

                    //**Setups Menu Section:Start**//
                    $("#ChkIsSetupsFile").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $("#ChkIsSetupsReports").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $("#ChkIsSetupsAdmin").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $("#ChkIsSetupsImport").iButton({
                        labelOn: "Yes",
                        labelOff: "No"
                    });

                    $(".chkSetups").change(function () {
                        debugger;
                        var chkSetups = $(".chkSetups").is(":checked") ? "1" : "0";
                        switch (chkSetups) {
                            case "0":
                                $("#ChkIsSetupsFile").iButton("toggle", false);
                                $("#ChkIsSetupsReports").iButton("toggle", false);
                                $("#ChkIsSetupsAdmin").iButton("toggle", false);
                                $("#ChkIsSetupsImport").iButton("toggle", false);
                                $("#hfSetupsFile").val(false);
                                $("#hfSetupsReports").val(false);
                                $("#hfSetupsAdmin").val(false);
                                $("#hfSetupsImport").val(false);
                                $(".trSetupsSub").hide();
                                break;
                            case "1":
                                if ($("#OldUserID").html() != "~NEW~") {
                                    $("#ChkIsSetupsFile").iButton("toggle", $("#hfSetupsFile").val() == true ? true : false);
                                    $("#ChkIsSetupsReports").iButton("toggle", $("#hfSetupsReports").val() == true ? true : false);
                                    $("#ChkIsSetupsAdmin").iButton("toggle", $("#hfSetupsAdmin").val() == true ? true : false);
                                    $("#ChkIsSetupsImport").iButton("toggle", $("#hfSetupsImport").val() == true ? true : false);
                                    //$("#hfCanDeleteGrower").val(User.IsGrowerDelete == '' ? false : true);
                                }
                                else {
                                    $("#ChkIsSetupsFile").iButton("toggle", true);
                                    $("#ChkIsSetupsReports").iButton("toggle", true);
                                    $("#ChkIsSetupsAdmin").iButton("toggle", true);
                                    $("#ChkIsSetupsImport").iButton("toggle", true);
                                    $("#hfSetupsFile").val(true);
                                    $("#hfSetupsReports").val(true);
                                    $("#hfSetupsAdmin").val(true);
                                    $("#hfSetupsImport").val(true);
                                }
                                $(".trSetupsSub").show();
                                break;
                        }
                    });
                    var getUserType = $('#lstUserType option:selected').text().toLowerCase();
                    $(".chkSales").change(function () {
                        debugger;
                        if (getUserType != "retail customer" && getUserType != "vendor" && getUserType != "customer" && getUserType != "cargo agent") {
                            var IsOrdersChecked = $(".chkSales").is(":checked") ? true : false;
                            IsOrdersChecked == true ? $(".tdUserPermissionTabs").show() : $(".tdUserPermissionTabs").hide();
                        }
                        else
                            $(".tdUserPermissionTabs").hide();
                    });

                    //**Setups Menu Section:end**//
                    debugger;
                    $("#trIsAdmin").show();
                    switch (getUserType) {
                        case "cargo agent":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $(".trAgencyCode").show();
                            $("#btnAddUIOFarms").show();
                            $("#txtFarm").css("width", "280px");
                            break;
                        case "warehouse":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            //$(".trDivision").show();
                            break;
                        case "inventory":
                        case "sales person":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $(".trDivision").show();
                            $(".trSalesPerson").show();
                            //$(".tdUserPermissionTabs").show();
                            break;
                        case "credit manager":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $(".trDivision").show();
                            $(".trSalesPerson").show();
                            break;
                        case "retail customer":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $(".trDivision").show();
                            break;
                        case "admin":
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $("#trIsAdmin").hide();
                            break;
                        case "customer":
                            $(".trSalesPerson").hide();
                            $(".trwarehouse").show();
                            $(".trCustomerNo").show();
                            $("#trIsAdmin").hide();
                            $(".trDivision").hide();
                            break;
                        case "vendor":
                            $(".trSalesPerson").hide();
                            $(".trwarehouse").hide();
                            $("#trIsAdmin").hide();
                            break;
                        default:
                            $(".trSalesPerson").show();
                            $(".trwarehouse").show();
                            $(".trDivision").show();
                            $(".trAgencyCode").hide();
                            $("#txtAgencyCode").val("")
                            $("#tdUserDetails").css("border-right", "1px solid grey");
                            $("#tdUserDetails").css("border-bottom", "1px solid grey");
                            break;
                    }

                    //if (getUserType == "cargo agent") {
                    //    $(".trAgencyCode").show();
                    //    $("#btnAddUIOFarms").show();
                    //    $("#txtFarm").css("width", "280px");
                    //}
                    //else if (getUserType == "warehouse") {
                    //    $(".trwarehouse").show();
                    //    $(".trDivision").show();
                    //}
                    //    //Abi
                    //else if (getUserType == "inventory" || getUserType == "sales person") {
                    //    $(".trDivision").show();
                    //    $(".trSalesPerson").show();
                    //    //$(".tdUserPermissionTabs").show();
                    //}
                    //else if (getUserType == "inventory" || getUserType == "retail customer")
                    //    $(".trDivision").show();
                    //else if (getUserType == "admin")
                    //    $(".IsAdmin").hide();
                    //else if (getUserType == "customer") {
                    //    $(".trCustomerNo").show();
                    //    $(".trDivision").show();
                    //}
                    //else {
                    //    $(".trAgencyCode").hide();
                    //    $("#txtAgencyCode").val("")
                    //    $("#tdUserDetails").css("border-right", "1px solid grey");
                    //    $("#tdUserDetails").css("border-bottom", "1px solid grey");
                    //}

                    if (getUserType == "vendor" || getUserType == "admin") {
                        $(".trAgencyCode").hide();
                        $(".trCustomerNo").hide();
                        $(".trwebpermission").show();
                        $("#tdUserDetails").css("border-right", "1px solid grey");
                        $("#tdUserDetails").css("border-bottom", "1px solid grey");
                    }
                    if (getUserType == "vendor" || getUserType == "cargo agent") {
                        $("#tdsecondcolumn").show();
                        //$(".tdUserPermissionTabs").hide();
                        $("#tdUserDetails").css("border-right", "1px solid grey");
                        $("#tdUserDetails").css("border-bottom", "1px solid grey");
                    }

                    if (getUserType != "customer" && getUserType != "retail customer" && getUserType != "vendor" && getUserType != "cargo agent" && getUserType != "admin") {
                        $(".tablinks").removeClass("active");
                        $(".tabcontent").hide();
                        $("#btnOrder1").addClass("active");
                        $("#DivOrderEntry1").show();

                        $("#DivUser").dialog("option", "width", "1100px");
                        var IsOrdersChecked = $(".chkSales").is(":checked") ? true : false;
                        IsOrdersChecked == true ? $(".tdUserPermissionTabs").show() : $(".tdUserPermissionTabs").hide();
                    }
                    else {
                        $("#DivUser").dialog("option", "width", "900px");
                        $(".tdUserPermissionTabs").hide();
                    }

                    if ($("#OldUserID").html() != "~NEW~" && $("#OldUserID").html() != "") {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetPermissionforUserID',
                            data: "{'UserID': '" + $("#OldUserID").html() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                debugger;
                                var webpermission = output.d
                                var i

                                for (i = 0; i < webpermission.length; i++) {
                                    $("#chk_" + webpermission[i].PageID).iButton("toggle", true);
                                }
                                var chkGrowerReports = $(".chkGrowerReports").is(":checked") ? "1" : "0";
                                switch (chkGrowerReports) {
                                    case "0":
                                        $("#ChkIsGrowerDelete").iButton("toggle", false);
                                        $("#ChkIsGrowerlock").iButton("toggle", false);
                                        $(".trGrowerReportSub").hide();
                                        break;
                                    case "1":
                                        $("#ChkIsGrowerDelete").iButton("toggle", $("#hfCanDeleteGrower").val() == true ? true : false);
                                        $("#ChkIsGrowerlock").iButton("toggle", $("#hfCanlockGrower").val() == true ? true : false);
                                        //$("#hfCanDeleteGrower").val(User.IsGrowerDelete == '' ? false : true);
                                        $(".trGrowerReportSub").show();
                                        break;
                                }

                                /*Setups Menu*/
                                var chkSetups = $(".chkSetups").is(":checked") ? "1" : "0";
                                switch (chkSetups) {
                                    case "0":
                                        $("#ChkIsSetupsFile").iButton("toggle", false);
                                        $("#ChkIsSetupsReports").iButton("toggle", false);
                                        $("#ChkIsSetupsAdmin").iButton("toggle", false);
                                        $("#ChkIsSetupsImport").iButton("toggle", false);
                                        $(".trSetupsSub").hide();
                                        break;
                                    case "1":
                                        $(".trSetupsSub").show();
                                        $("#ChkIsSetupsFile").iButton("toggle", $("#hfSetupsFile").val() == true ? true : false);
                                        $("#ChkIsSetupsReports").iButton("toggle", $("#hfSetupsReports").val() == true ? true : false);
                                        $("#ChkIsSetupsAdmin").iButton("toggle", $("#hfSetupsAdmin").val() == true ? true : false);
                                        $("#ChkIsSetupsImport").iButton("toggle", $("#hfSetupsImport").val() == true ? true : false);
                                        break;
                                }
                            },

                        }).done(function () {
                            setTimeout(function () { hideOverlay() }, 1000)
                        });
                    }
                    else {
                        if (getUserType == "vendor") {
                            $("#lstLanding").val("ConfirmedPOs");
                            $("#chk_4").iButton("toggle", true);
                        }
                        if (getUserType == "customer") {
                            $("#lstLanding").val("Order");
                            $("#chk_9").iButton("toggle", true);
                        }

                        var chkGrowerReports = $(".chkGrowerReports").is(":checked") ? "1" : "0";
                        switch (chkGrowerReports) {
                            case "0":
                                $("#ChkIsGrowerDelete").iButton("toggle", false);
                                $("#ChkIsGrowerlock").iButton("toggle", false);
                                $(".trGrowerReportSub").hide();
                                break;
                            case "1":
                                $(".trSetupsSub").show();
                                $("#ChkIsGrowerDelete").iButton("toggle", $("#hfCanDeleteGrower").val() == true ? true : false);
                                $("#ChkIsGrowerlock").iButton("toggle", $("#hfCanlockGrower").val() == true ? true : false);
                                break;
                        }

                        /*Setups menu*/
                        var chkSetups = $(".chkSetups").is(":checked") ? "1" : "0";
                        switch (chkSetups) {
                            case "0":
                                $("#ChkIsSetupsFile").iButton("toggle", false);
                                $("#ChkIsSetupsReports").iButton("toggle", false);
                                $("#ChkIsSetupsAdmin").iButton("toggle", false);
                                $("#ChkIsSetupsImport").iButton("toggle", false);
                                $(".trSetupsSub").hide();
                                break;
                            case "1":
                                $(".trSetupsSub").show();
                                $("#ChkIsSetupsFile").iButton("toggle", $("#hfSetupsFile").val() == true ? true : false);
                                $("#ChkIsSetupsReports").iButton("toggle", $("#hfSetupsReports").val() == true ? true : false);
                                $("#ChkIsSetupsAdmin").iButton("toggle", $("#hfSetupsAdmin").val() == true ? true : false);
                                $("#ChkIsSetupsImport").iButton("toggle", $("#hfSetupsImport").val() == true ? true : false);
                                break;
                        }
                    }
                }
                else {
                    $(".trwebpermission").hide();
                    $("#tdsecondcolumn").hide();
                    $("#tdUserDetails").css("border-right", "0px");
                    $("#tdUserDetails").css("border-bottom", "0px");
                    if ($("#OldUserID").html() != "~NEW~" && $("#OldUserID").html() != "") {
                        setTimeout(function () { hideOverlay() }, 1000)
                    }
                    var getUserType = $('#lstUserType option:selected').text().toLowerCase();
                    if (getUserType == "admin") {
                        $(".tdUserPermissionTabs").hide();
                        $("#trIsAdmin").hide();
                    }
                }

                //if ($('#lstUserType option:selected').text() == "Warehouse") 
                //    $("#tbluserwarehouse").show();

                //if ($('#OldUserID').html() == "" || $('#OldUserID').html() == "~NEW~") {                
                //    ClearUserFarmSession(true);
                //}
            },
        });
        //  e.preventDefault();
        //});
        var Duplicatebtn = $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save')
        if ($("#lstUserType").val() == '3' || $("#lstUserType").val() == '1' || $("#lstUserType").val() == '2' || $("#lstUserType").val() == '5' || $("#lstUserType").val() == '7') {
            $(Duplicatebtn).addClass('leftMinButtonDuplicatebtn');
            $(Duplicatebtn).removeClass('leftButtonDuplicatebtn');
        }
        else {
            $(Duplicatebtn).removeClass('leftMinButtonDuplicatebtn');
            $(Duplicatebtn).addClass('leftButtonDuplicatebtn');
        }
    }



    $("#txtUserNameFilter").autocomplete({
        source: function (request, response) {

            $.ajax({

                type: "POST",
                url: 'BloomService.asmx/GetUserNameAuto',
                data: "{'UserName': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (item) {
                        return {
                            label: item.UserName

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
        select: function (e, i) {

            $("#txtUserNameFilter").val(i.item.label);
            $("#lblUserNameFilter").html(i.item.label);
            $("#btnapply").click();
            $("#tr2").addClass('FilterDivStyle');
            $("#imgUserName").attr("src", "images/Filter.png");
            $("#divUserNameFilter").slideToggle();

        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtUserNameFilter").val("");
                $("#lblUserNameFilter").html("");
                $("#txtUserNameFilter").focus();

            }
        },
        minLength: 1
    });

    $("#txtFarm").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFarmForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.FarmCode + "] " + item.Name + "   -" + item.City + "-",
                            Code: item.FarmCode,
                            Name: item.Name,
                            City: item.City
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
        select: function (e, i) {
            $("#DivUser").next('div').find('.msgui').hide();
            $("#txtFarm").val(i.item.Farm);
            autocomplteSelect(i.item.Code, i.item.Name, i.item.City);
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtFarm").val("");
                $("#txtFarm").focus();
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function autocomplteSelect(FarmCode, Name, City) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "BloomService.asmx/AddFarm",
            data: "{'Farm':'" + FarmCode + "','Name':'" + escape(Name) + "','City':'" + City + "'}",
            dataType: "json",
            success: function (output, status) {

                if (output.d == 'Valid') {
                    $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                    $("#txtFarm").val("");
                    return true;
                }
                else {
                    $("#DivUser").next('div').find(".msgui").html(output.d);
                    $("#DivUser").next('div').find('.msgui').show();
                    $("#txtFarm").val("");
                    return false;
                }

            },
            error: function (e) {
                $("#DivUser").next('div').find(".msgui").html("OOPS! Unable to process your request. Please contact admin! (AddFarm)");
                $("#DivUser").next('div').find('.msgui').show();
                return false;
            }
        });
    }

    $("[id^=imgUserName]").live("click", function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgUserName").attr("src", "images/EmptyFilter.png");
            $("#txtUserNameFilter").val("");
            $("#lblUserNameFilter").html("");
            $("#tr2").removeClass();
            $("#btnapply").click();
            $("#divUserNameFilter").slideToggle();
        }
    });

    $("#txtLandingFilter").autocomplete({
        source: function (request, response) {

            $.ajax({

                type: "POST",
                url: 'BloomService.asmx/GetLandingAuto',
                data: "{'Landing': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (item) {
                        return {
                            label: item.Landing

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
        select: function (e, i) {
            $("#txtLandingFilter").val(i.item.label);
            $("#lblLandingFilter").html(i.item.label);
            $("#btnapply").click();
            $("#tr3").addClass('FilterDivStyle');
            $("#imgLanding").attr("src", "images/Filter.png");
            $("#divLandingFilter").slideToggle();

        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtLandingFilter").val("");
                $("#lblLandingFilter").html("");
                $("#txtLandingFilter").focus();

            }
        },
        minLength: 1
    });

    $("[id^=imgLanding]").live("click", function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#imgLanding").attr("src", "images/EmptyFilter.png");
            $("#txtLandingFilter").val("");
            $("#lblLandingFilter").html("");
            $("#tr3").removeClass();
            $("#btnapply").click();
            $("#divLandingFilter").slideToggle();
        }
    });

    $("#btnClearAll").click(function () {

        $("#txtNameFilter").val("");
        $("#txtUserNameFilter").val("");
        $("#txtLandingFilter").val("");

        $("#lblNameFilter").html("");
        $("#lblUserNameFilter").html("");
        $("#lblLandingFilter").html("");


        $("#txtNameFilter").removeClass();
        $("#txtUserNameFilter").removeClass();
        $("#txtLandingFilter").removeClass("");

        $("#tr1").removeClass();
        $("#tr2").removeClass();
        $("#tr3").removeClass();


        $("#imgName").attr("src", "images/EmptyFilter.png");
        $("#imgUserName").attr("src", "images/EmptyFilter.png");
        $("#imgLanding").attr("src", "images/EmptyFilter.png");

        codeparam = ""

        $("#btnapply").click();
    });

    $("#btnName").click(function () {

        $("#divNameFilter").slideToggle();
        $("#btnapply").click();
        $("#imgName").attr("src", "images/Filter.png");
    });

    $("[id^=btnName1]").live("click", function () {

        $("#txtNameFilter").val("");
        $("#lblNameFilter").html("");

        $("#btnapply").click();
        $("#divNameFilter").slideToggle();

    });

    $("#btnUserName").click(function () {

        $("#divUserNamefilter").slideToggle();
        $("#btnapply").click();
        $("#imgUserName").attr("src", "images/Filter.png");
    });

    $("[id^=btnUserName1]").live("click", function () {

        $("#txtUserNameFilter").val("");
        $("#lblUserNameFilter").html("");

        $("#btnapply").click();
        $("#divUserNameFilter").slideToggle();

    });

    $("#btnLanding").click(function () {

        $("#divLandingfilter").slideToggle();
        $("#btnapply").click();
        $("#imgLanding").attr("src", "images/Filter.png");
    });

    $("[id^=btnLanding1]").live("click", function () {

        $("#txtLandingFilter").val("");
        $("#lblLandingFilter").html("");

        $("#btnapply").click();
        $("#divLandingFilter").slideToggle();

    });

    $('#divProjectName').click(function (event) {

        $(".rowcss").show();


        if ($('#divNameFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divNameFilter").slideToggle();
        }
        else {
            $("#divNameFilter").slideToggle();
        }

        $("#txtNameFilter").val("");
        $("#txtNameFilter").focus();

    });

    $('#divProjectUserType').click(function (event) {
        $(".rowcss").show();

        if ($('#divUserTypeFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divUserTypeFilter").slideToggle();
        }
        else {
            $("#divUserTypeFilter").slideToggle();
        }
    });

    $("[id^=imgName]").click(function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#lblNameFilter").html("");
            $("#txtNameFilters").val("");
            $("#divNameFilter").hide();
            $("#imgName").attr("src", "images/EmptyFilter.png");
            $('#tblName tr').removeClass("FilterDivStyle");
            $("#btnapply").click();
            e.stopPropagation();
        }
    });

    $('#divProjectUserName').click(function (event) {

        $(".rowcss").show();


        if ($('#divUserNameFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divUserNameFilter").slideToggle();
        }
        else {
            $("#divUserNameFilter").slideToggle();
        }

        $("#txtUserNameFilter").val("");
        $("#txtUserNameFilter").focus();

    });

    $("[id^=imgUserName]").click(function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#lblUserNameFilter").html("");
            $("#txtUserNameFilters").val("");
            $("#divUserNameFilter").hide();
            $("#imgUserName").attr("src", "images/EmptyFilter.png");
            $('#tblUserName tr').removeClass("FilterDivStyle");
            $("#btnapply").click();
            e.stopPropagation();
        }
    });


    $('#divProjectLanding').click(function (event) {

        $(".rowcss").show();


        if ($('#divLandingFilter').css('display') == 'none') {

            $(".filterdiv").hide();
            $("#divLandingFilter").slideToggle();
        }
        else {
            $("#divLandingFilter").slideToggle();
        }

        $("#txtLandingFilter").val("");
        $("#txtLandingFilter").focus();

    });

    $("[id^=imgLanding]").click(function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            $("#lblLandingFilter").html("");
            $("#txtLandingFilters").val("");
            $("#divLandingFilter").hide();
            $("#imgLanding").attr("src", "images/EmptyFilter.png");
            $('#tblLanding tr').removeClass("FilterDivStyle");
            $("#btnapply").click();
            e.stopPropagation();
        }
    });


    $("#btnapply").click(function () {


        var str = FramingFilters();

        str = str.replace('&amp;', '&');
        var empty = ""
        $('input[name=q]').val("");

        $("#fgrdUsers").flexOptions({ params: [{ name: 'Filter', value: str }, { name: 'codeParam', value: empty }], query: "", newp: 1 }).flexReload();

        $("#msgbox-select").dialog("close");
    });

    function FramingFilters() {


        var condn = "";
        if ($("#lblUserTypeFilter").html() != "" && $("#lblUserTypeFilter").html() != "ALL")
            condn = condn + "UserType=" + "'" + $("#lblUserTypeFilter").html() + "'" + " And ";

        var lastIndex = condn.lastIndexOf("And")
        var str = condn.substring(0, lastIndex);

        return str;
    }

    $("[id^=isactive_]").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(9);
        $("#DivUser").next('div').find('.msgui').hide();
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var user = output.d;
                if (user.IsActive) {
                    $("#confirmIsActive").html("<p>Are you sure set <b>" + user.Name + "</b> to InActive?</p>");
                    $("#IsActiveStatus").html("0");
                }
                else {
                    $("#confirmIsActive").html("<p>Are you sure set <b>" + user.Name + "</b> to Active?</p>");
                    $("#IsActiveStatus").html("1");
                }
                $("#confirmIsActive").dialog("open");
            }
        });
    });

    $("#confirmIsActive").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var src = $("#isactive_" + $("#OldId").html());
                var ID = $("#OldId").html();
                var IsActive = $("#IsActiveStatus").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ToggleUsersIsActive',
                    data: '{"ID":"' + ID + '","IsActive":"' + IsActive + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'valid') {
                            if (IsActive == "0")
                                src.attr("src", "images/check-off.png");
                            else
                                src.attr("src", "images/check-on.png");
                            adialog.dialog("close");
                        }
                        else {
                            adialog.dialog("close");
                            $("#msg").html("There was an error during togggle the details!");
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


    $("#SendCreadentials").dialog({
        autoOpen: false,
        width: 650,
        height: 350,
        modal: true,
        resizable: false,
        buttons: {
            Send: function () {

                if ($("#txtUserCreadentialsToemails").val() == "") {
                    $.MessageBox("Please enter to emails!!!!");
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UsersCredentailEmailLogs',
                    data: '{"ToEmails":"' + $("#txtUserCreadentialsToemails").val() + '","Subject":"' + $("#txtUserCreadentialsSubjects").val()
                                + '","BodyContent":"' + $("#txtUserCreadentialsBody").val().replace(/\n/g, '<br/>') + '","UserEmailid":"' + $("#SelecteduserEmailid").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "Success") {
                            $("#DivExecutionResult").html("Credentials Sent Successfully");
                            $("#SelecteduserEmailid").html("");
                            if (getParameterByName("Page") == "ConfirmedPOs") {
                                var str = $("#divConfirmedPOsFilter").html().replace("&gt;", "").replace("&lt;", "").replace('&amp;', '&');
                                $("#fgrdConfirmedPOs").flexOptions({ params: [{ name: 'Filter', value: str }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                            }
                            $("#SendCreadentials").dialog("close");
                        }
                    }
                });

            },
            Cancel: function () {
                $("#SendCreadentials").dialog("close");
            }
        },
        open: function () {


            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    //STA::23-OCT-2015::to delete the User Warehouse details
    $("[id^=Warehousedelete_]").die("click").live("click", function () {
        var DelWHId = $(this)[0].id.replace("Warehousedelete_", "");
        var WhName = $("#fgrdUserWarehouse tr#row" + DelWHId + " td:eq(2)")[0].textContent;

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "BloomService.asmx/DeleteUserWarehouse",
            data: "{'WhName':'" + WhName + "','Id':'" + DelWHId + "'}",
            dataType: "json",
            success: function (output, status) {
                if (output.d == 'success') {
                    $("#fgrdUserWarehouse").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });

    $("#btnAddUIOFarms").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "BloomService.asmx/AddFarmsinUIOCity",
            data: "{'UserID':'" + $("#OldUserID").html() + "'}",
            dataType: "json",
            success: function (output, status) {
                if (output.d == 'success') {
                    $("#fgrdUserFarms").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });
    intitalize_iButton();
    function intitalize_iButton() {
        $("[id^=DivOrderEntry]").find("input[type='checkbox']").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
    }

    //tblOrderEntry3left end

    function openTab(evt, tabName) {
        debugger;
        var i, tabcontent, tablinks;
        $(".editableText").attr("disabled", true);

        var tabc = $("div[data-name='" + tabName + "']");
        tabcontent = $(".tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = $(".tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        $("div[data-name='" + tabName + "']").show();

        evt.currentTarget.className += " active";
    }

    $('.tabcontent table tr td table tr').each(function (idx) {
        $(this).children().first().prepend(".");
        $(this).children().first().prepend(idx + 1);
    });

    $("#txtAccessToInventory").keypress(function (e) {
        debugger;
        var regex = new RegExp("^[a-zA-Z0-9]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
        else {
            if (e.which == 77 || e.which == 109 || e.which == 76 || e.which == 108 || e.which == 66 || e.which == 98 || e.which == 65 || e.which == 97 || e.which == 83 || e.which == 115 || e.which == 72 || e.which == 104 || e.which == 69 || e.which == 101 || e.which == 80 || e.which == 112) {
                var keyval = e.key;
                var txtval = $("#txtAccessToInventory").val();
                if (txtval != "") {
                    if (txtval.includes(keyval) == true) {
                        return false;
                    }
                }
            }
            else {
                return false;
            }
        }
    });
</script>


<div class="slidediv filesTab" style="overflow: visible; display: none; height: 50px;">
    <table>
        <tr>
            <td style="vertical-align: top; width: 100px;">
                <div class="filterbutton" id="divProjectUserType">
                    <table style="width: 100%; height: 100%;" id="tblUserType">
                        <tr>
                            <td style="font-size: 11px">
                                <img id="imgUserType" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                UserType
                            </td>

                        </tr>
                        <tr id="tr1" style="height: 18px; text-align: center;">
                            <td>
                                <label class="DivFilterLabelStyle" id="lblUserTypeFilter"></label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <td style="vertical-align: top; width: 100px;">
                <div id="divApply">
                    <table style="width: 100%; height: 100%;" id="Table1">
                        <tr>
                            <td style="vertical-align: top; width: 100px;">
                                <input id="btnapply" type="button" class="Acctionbuttons" value="APPLY" style="display: none" />
                                <input id="btnClearAll" type="button" class="Acctionbuttons" value="RESET" style="display: none" />
                            </td>
                        </tr>

                    </table>
                </div>
            </td>
        </tr>
        <tr class="rowcss" id="trUserTypetitle">

            <td style="vertical-align: top" colspan="5">

                <div id="divUserTypeFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                    <div class="tooltip-content" style="width: 175px">
                        <select id="lstUserTypeFilter" style="width: 160px; margin-left: 5px; margin-top: 3px" />
                    </div>
                </div>
            </td>

        </tr>

    </table>


</div>

<div id="OldUserID" style="display: none"></div>

<div id="DivUser" style="display: none;" align="center" class="filesTab">
    <div class="UserPleaseWaitOverlay" style="display: none">
        <div style="top: 51px; margin-top: 216px; font-size: 16px;">
            Please wait... 
            <img src="images/ajax-loader.gif" alt="" />
        </div>
    </div>

    <table style="text-align: left; border-collapse: collapse; float: left">

        <tr>
            <td style="border-right: 1px solid grey; border-bottom: 1px solid grey;" id="tdUserDetails">
                <table style="margin-left: 16px; width: 350px; margin-bottom: 15px;" class="tblUserDetails">
                    <tr class="truserdetails">
                        <td>UserType</td>
                        <td>
                            <select id="lstUserType" onchange="$('#hfCanDeleteGrower').val(false);$('#hfCanlockGrower').val(false);AdminUserTypeChange()" style="width: 180px;" class="AllUpperCaseTextBox"></select>
                            <label id="lblUserType" style="color: blue"></label>
                        </td>
                    </tr>
                    <tr class="truserdetails">

                        <td style="font-weight: bold; height: 32px;">User Details
                    
                        </td>
                    </tr>
                    <tr class="truserdetails">
                        <td>Name
                        </td>
                        <td align="left">
                            <input type="text" id="txtName" style="width: 173px;" value="" class="AllUpperCaseTextBox" /></td>
                    </tr>
                    <tr class="truserdetails">
                        <td>Email
                        </td>
                        <td align="left">
                            <input type="text" id="txtEmail_User" style="width: 175px;" value="" class="" /></td>
                    </tr>
                    <tr class="truserdetails">
                        <td>UserName
                        </td>
                        <td align="left">
                            <input type="text" id="txtUserName" style="width: 175px;" value="" class="" /></td>
                    </tr>
                    <tr class="truserdetails">
                        <td>Password
                        </td>
                        <td align="left">
                            <input type="text" id="txtPassword" style="width: 175px;" value="" class="" /></td>
                    </tr>

                    <tr class="truserdetails">
                        <td>Landing</td>
                        <td>
                            <select id="lstLanding" style="width: 179px;" class="AllUpperCaseTextBox">
                                <option value="ALL">SELECT</option>
                                <option value="Accounts">Accounts Receivable</option>
                                <option value="ConfirmedPOs">Confirmed POs</option>
                                <option value="Credits">Credits</option>
                                <option value="Grower">Grower Reports</option>
                                <option value="Incoming">Incoming</option>
                                <option value="Order">Order</option>
                                <option value="PendingPOs">Pending POs</option>
                                <option value="Reports">Reports</option>
                                <option value="Sales">Sales</option>
                                <option value="Setups">Settings</option>
                                <option value="ShippedPOs">Shipped POs</option>
                                <option value="ManualPO">Users</option>
                                <option value="PO">Purchase Orders</option>
                            </select></td>
                    </tr>
                    <tr class="trDivision" style="display: none;">
                        <td>Division</td>
                        <td>
                            <input type="text" id="txtDivision" maxlength="2" style="width: 173px" value="" class="AllUpperCaseTextBox"></td>
                    </tr>
                    <%--load sales person detail from f_slsman sql table:: Abi ::04May17 --%>
                    <tr class="trSalesPerson" style="display: none;">
                        <td>Sales Person</td>
                        <td>
                            <select id="lstSalesPerson" style="width: 200px"></select>
                            <%--<input type="text" id="txtSalesPerson" maxlength="3" style="width: 173px" value="" class="AllUpperCaseTextBox"></td>--%>
                    </tr>
                    <tr class="trwarehouse">
                        <td>Warehouse</td>
                        <td>
                            <select id="lstwarehouse" placeholder='Choose warehouse...' style="width: 179px;">
                            </select></td>
                    </tr>
                    <tr class="trAgencyCode" style="display: none;">
                        <td>Agency Code</td>
                        <td>
                            <input type="text" id="txtAgencyCode" maxlength="2" style="width: 173px" value="" class="AllUpperCaseTextBox"></td>
                    </tr>
                    <tr class="trCustomerNo" style="display: none;">
                        <td>Customer No</td>
                        <td>
                            <input type="text" id="txtCustomerNo" style="width: 173px" value="" class="AllUpperCaseTextBox"></td>
                    </tr>
                    <tr class="truserdetails">
                        <td>Active?</td>
                        <td>
                            <input type="checkbox" id="ChkIsActive" /></td>
                    </tr>
                    <tr id="trIsAdmin" class="truserdetails IsAdmin">
                        <td id="lblIsAdmin">IsAdmin?</td>
                        <td>
                            <input type="checkbox" id="ChkIsAdmin" /></td>
                    </tr>
                    <%-- <tr class="truserdetails">
                        <td>Can Delete Grower?</td>
                        <td>
                            <input type="checkbox" id="ChkIsGrowerDelete" />
                        </td>
                    </tr>--%>
                </table>
            </td>

            <td style="vertical-align: top; padding-left: 25px; padding-right: 25px; display: none;" class="tduserfarms" id="tdsecondcolumn" rowspan="2">
                <table class="tblUserFarms" style="width: 450px;">
                    <tr class="trUserFarms">
                        <td colspan="2" style="font-weight: bold; height: 25px;">User Farms
                        </td>
                    </tr>
                    <tr class="trUserFarms">
                        <td>Farms
                        </td>
                        <td>
                            <input type="text" id="txtFarm" style="width: 320px; float: left;" value="" class="AllUpperCaseTextBox" />
                            <input type="hidden" id="hfFarmCode" />
                            <input type="button" style="float: left; display: none" class="SmallButton" id="btnAddEditFarm" value="Save">
                            <input type="button" style="float: left; font-weight: bold; display: none" class="SmallButton" id="btnAddUIOFarms" value="Load Farms in UIO">
                        </td>

                    </tr>
                    <tr class="trUserFarms">
                        <td colspan="4">
                            <table id="fgrdUserFarms" style="display: none;"></table>
                        </td>
                    </tr>

                </table>
            </td>

            <!-- Show permission's list for the users :: created by Abinaya :: 18Sep2018-->
            <td id="tdUserPermission" class="tdUserPermissionTabs" style="display: none; vertical-align: top; position: absolute;">

                <div style="display: none;">
                    <input type="button" class="BloomButtonEnabled" id="btnSalesPersonPermissionImport" value="Import" />
                </div>
                <div id="DivUserPermissionTabs" style="top: 5px; border: 3px solid #ccc; border-radius: 5px; width: 662px; /*position: absolute; */">

                    <div class="tab">
                        <input type="button" class="tablinks" style="width: 220px" id="btnOrder1" onclick="openTab(event, 'ORDER1');" value="ORDER ENTRY 1" />
                        <input type="button" class="tablinks" style="width: 220px" id="btnOrder2" onclick="openTab(event, 'ORDER2');" value="ORDER ENTRY 2" />
                        <input type="button" class="tablinks" style="width: 220px" id="btnOrder3" onclick="openTab(event, 'ORDER3');" value="ORDER ENTRY 3" />
                    </div>
                    <div id="DivOrderEntry1" data-name="ORDER1" data-value="ORDER1" class="tabcontent">
                        <table>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table id="tblOrderEntry1Left">
                                        <tr>
                                            <td style="font-weight: bold;">Enter Orders?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkEnterOrders" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Update Orders?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkUpdateOrders" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can update printed invoices?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkUpdatePrintedInvoices" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can update price on a printed invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkFullyUpdateAnInvoice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Void Orders?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkVoidOrders" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Override credit terms?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkOverrideCreditTerms" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Override credit limits?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkOverrideCreditLimits" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Sell to cust over 60 days?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkSellToCustOver60Days" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Print picking list?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkPrintPickingList" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Print Invoices?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkPrintInvoices" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Close the Day and Flip Invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkCloseDay" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Enter new Customers?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkEnterNewCustomers" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access to all Customers?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkAccessToAllCustomers"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Print Customer List?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkPrintCustomerList" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Set-up Daily Prices?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkSetupDailyPrices" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Override Market price?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkOverrideMarketPrice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow release lock on inven?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkAllowLockRelease" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access to Open Market account?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkAccessToOpenMarket" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access to Reports Menu?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Left" id="chkAccessToReportsMenu" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Inventories to Block?  (M,L,A,S,P,H)</td>
                                            <td>
                                                <input type="text" style="width: 80px" class="AllUpperCaseTextBox" id="txtAccessToInventory" maxlength="6"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="vertical-align: top;">
                                    <table id="tblOrderEntry1Right">
                                        <tr>
                                            <td style="font-weight: bold;">Can see cost on Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkSeeCostOnInventory" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can see Receiving Dates?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkSeeReceivingDates" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Delete purchased product?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkViewCust" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can sell freshest product?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkSellFreshestProduct" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can view only his/her sales?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkViewOnlyHisOrHerSales" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Check Only Me ON?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkViewAllInvoice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Select lots to sell?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkSelectLotsToSee" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View inventory in boxes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkViewInventoryInBoxes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View sold boxes? (Details)</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkViewSoldBoxes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Product Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateProductCodes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Grower Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateGrowerCodes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Salesperson Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateSalespersonCodes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Carrier Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateCarrierCodes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Airport Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToAirport" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Duty Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToDuty" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Credit Terms?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToCredit" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Box Sizes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToBox" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Product Types?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToProduct" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can Update Country Codes?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry1Right" id="chkUpdateToCountry" />
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="DivOrderEntry2" data-name="ORDER2" data-value="ORDER2" class="tabcontent">
                        <table>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table id="tblOrderEntry2Left">
                                        <tr>
                                            <td style="font-weight: bold;">Hide Sales Charts</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAllowNonFob" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can access Market Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToMarket" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can access Local Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToLocal" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can access Standing Order Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToStandingPre" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can access Hold Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessHold" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can access Arriving Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessArriving" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can see Pre-Booked Inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkSeeEverything" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Show Detail Button on Sales Tab?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkSeeMarketArrive" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Show Summary Button on Sales Tab?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkViewSoldInvn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access Print Picking List?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToPrintPickingList" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access Print Invoices?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessTPrintInvoice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access warehouse Menu?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToWarehouse" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access Print Labels?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToPrintAccess" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Open.......</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkPrintInvPickLabels" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access Print Hunt List?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToPrintHuntList" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access update Puller Info?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToUpdatePuller" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access shipping Bills Menu?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToShippingBills" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access upc Labels Menu?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToUpcLabels" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access FedEx option Menu?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Left" id="chkAccessToFedexOption" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="vertical-align: top;">
                                    <table id="tblOrderEntry2Right">
                                        <tr>
                                            <td style="font-weight: bold;">Can Release a Scanned Order?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkReleaseScanOrder" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View Cost as default?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewCostDefault" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Sell zero price products?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkSellZeroPriceProducts" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View inventory thru 0/E(#7)?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewInvThr" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Show FOB column in colors?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkShowFobinColors" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Approve Price Override</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewInvFirst" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View AWB numbers?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewAWBNos" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Sell from different warehouses?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkSellDiffWarehouse" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View Farms?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewFarms" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View Types?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkViewTypes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Include freight in cost?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkIncludeFreightCost" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Approve shipping date?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkAppShippingDate" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Delete from Hold invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkDelFromHoldInv" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Enter standing/Pre-books?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkEnterStandPreBooks" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Update/Delete S/P orders?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkUpdDelSpOrders" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Print S/P Reports?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkPrintSpReports" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Create Invoices from S/P?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkCreateInvoice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Approve standing/Pre-Book?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry2Right" id="chkApproveStandingPre" />
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="DivOrderEntry3" data-name="ORDER3" data-value="ORDER3" class="tabcontent">
                        <table>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table id="tblOrderEntry3Left">
                                        <tr>
                                            <td style="font-weight: bold;">Enter a Credit Request?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkEnterCreditReq" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Delete a Credit Requets?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkDelCreditReq" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Approve credit Requets?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkApprCreditReq" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Invoice message when saving?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkInvmsgSaving" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can send statements?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkSendStatement" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow printing of Pick List for Cod customers?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowPrintPicklistCod" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Can view GROSS PROFIT in view sales?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkViewGrossProfit" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Show all boxes when selling? (no to show 1)</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkShowallBox" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow to view/update someone else invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowViewUpdOtherInv" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Access to Re-print a Pick List?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowtoReprint" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow to sell below cost?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowtoSellBelowCost" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Disable Printers.Bat?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkDisablePrintersBat" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Disable transfer a closed invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkDisableTransferClosedInv" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow printing Bill of Lading?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowPrintBillLading" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow printing Picking List?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowPrintPickList" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow printing Labels?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowPrintLabels" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow to leave empty orders?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowtoleaveEmpty" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow to consolidate invoices?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowtoConslidateInv" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">Allow to Drop into another invoice?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAllowtoDropAnotherInv" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">View all columns in inventory?</td>
                                            <td>
                                                <input type="checkbox" name="OrderEntry3Left" id="chkAlowToViewAllColsInInvenList" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td style="border-right: 1px solid grey;" id="tdWebPermission">
                <table style="margin-left: 16px; width: 350px;" class="tblwebpermission">
                    <tr class="trwebpermission trTitle">

                        <td style="font-weight: bold; height: 32px;">WEB Permission
                    
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>

</div>

<div id="DivUsers" class="Cargodiv">
    <table id="fgrdUsers" style="display: none;"></table>
</div>

<div id="Deleteconfirm_User" style="display: none;" title="Alert"></div>
<div id="OldId" style="display: none;"></div>
<div id="divOldUserName" style="display: none;"></div>
<div id="IsActiveStatus" style="display: none;"></div>
<div id="confirmIsActive" style="display: none;" title="Alert"></div>
<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>

<div id="SendCreadentials" style="display: none" class="filesTab">

    <table>
        <tbody>
            <tr>
                <td>
                    <div id="divLoggedInUserEmail" runat="server" style="display: none"></div>
                    <input type="text" style="width: 590px" id="txtUserCreadentialsToemails">
                </td>

            </tr>
            <tr>
                <td style="width: 200px">
                    <input type="text" style="width: 590px" id="txtUserCreadentialsSubjects">
                </td>
            </tr>
            <tr>
                <td>
                    <textarea rows="4" style="width: 590px; height: 190px;" cols="85" id="txtUserCreadentialsBody"></textarea>
                </td>
            </tr>
        </tbody>
    </table>

</div>
<div id="SelecteduserEmailid" style="display: none"></div>
<div id="hfCanDeleteGrower" style="display: none;">false</div>
<div id="hfCanlockGrower" style="display: none;">false</div>

<div id="hfSetupsFile" style="display: none;">true</div>
<div id="hfSetupsReports" style="display: none;">true</div>
<div id="hfSetupsAdmin" style="display: none;">true</div>
<div id="hfSetupsImport" style="display: none;">true</div>


<%-------------------------------%>
<%--23-OCT-2015:::Page Modified By Stalin:for to add the Warehouse user type Settings--%>
<%-------------------------------%>

