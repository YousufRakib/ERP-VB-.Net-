<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePriceApproval.ascx.vb" Inherits="pages_PagePriceApproval" %>
<script src="js/validation.js"></script>


<style type="text/css">
    .Menubutton {
        border: none;
        background-color: #176eb1;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
        border-radius: 8px;
        width: 110px;
        color: white;
        height: 30px;
    }

    .button-pad {
        padding: 8px;
    }

    .flowerDescription {
        margin-top: -5px;
        margin-left: -5px;
        padding-bottom: 3px;
        margin-right: -5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }



    #tblApprovalsDetails {
        font-size: 12px;
        font-family: Verdana,Arial,sans-serif;
    }

    #lblApprovalHead {
        font-size: 26px;
        color: #176eb1;
        font-weight: bold;
        text-align: left;
        text-transform: uppercase;
        padding-left: 13px;
    }
</style>


<div id="dvPriceApprovalDialog">
    <table cellpadding="2" cellspacing="0">
        <tr>
            <td>
                <input type="button" id="btnShowAll" value="All" class="BloomButtonEnabled button-pad" style="width: auto; background: darkblue;" />
            </td>
            <td>
                <input type="button" id="btnShowPending" value="Pending" class="BloomButtonEnabled button-pad" style="width: auto; background: fuchsia;" />
            </td>
            <td>
                <input type="button" id="btnShowApproved" value="Approved" class="BloomButtonEnabled button-pad" style="width: auto; background: darkgreen;" />
            </td>
            <td>
                <input type="button" id="btnShowDenied" value="Denied" class="BloomButtonEnabled button-pad" style="width: auto; background: darkred;" />
            </td>
            <td>&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <input type="button" id="btnShowApprovedToday" value="Today" class="BloomButtonEnabled button-pad" style="width: auto; background: darkblue;" />
            </td>
            <td>
                <input type="button" id="btnShowApprovedYesterday" value="Yesterday" class="BloomButtonEnabled button-pad" style="width: auto; background: darkblue;" />
            </td>
            <td>
                <input type="button" id="btnShowApprovedThisMonth" value="This Month" class="BloomButtonEnabled button-pad" style="width: auto; background: darkblue;" />
            </td>
            <td>&nbsp;
            </td>
            <td style="font-size: 15px; font-weight: bold;">Status: 
                <input type="hidden" disabled="disabled" id="hdnApproved" value="" />
                <span id="spanApproved">Pending</span>&nbsp;&nbsp;
                Show:
                <input type="hidden" disabled="disabled" id="hdnFilter" value="Today" />
                <span id="spanFilter">Today</span>
            </td>
        </tr>
    </table>
    <div id="dvApprovalList">
        <table id="fgrdApprovalList" style="display: block;"></table>
    </div>

    <div id="DivApprovalsDetails" style="display: none; padding: 0px;">
        <table id="tblApprovalsDetails" cellpadding="5" style="background-color: #f0f0f0; width: 100%;">
            <tbody>
                <tr>
                    <td>Customer
                    </td>
                    <td colspan="5">
                        <input type="text" id="txtCustomerNo" style="" value="" disabled="disabled" />
                        <input type="text" id="txtCustomerName" style="" value="" disabled="disabled" />
                        <input type="text" id="txtRecNo" style="display: none;" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblAwb">Awb</label>
                    </td>
                    <td>
                        <input type="text" id="txtAwb" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label id="lblDaterec">Daterec</label>
                    </td>
                    <td>
                        <input type="text" id="txtDaterec" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label id="lblFarm" style="">Farm</label>
                    </td>
                    <td>
                        <input type="text" id="txtFarm" style="" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblFlower">Flower</label>
                    </td>
                    <td colspan="5">
                        <input type="text" id="txtFlower" style="" disabled="disabled" />
                        <input type="text" id="txtDesc" style="width: 300px;" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblPrice">Price</label>
                    </td>
                    <td>
                        <input type="text" id="txtPrice" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label id="lblMarket" style="">Market</label>
                    </td>
                    <td>
                        <input type="text" id="txtMarket" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label id="lblCost" style="">Cost</label>
                    </td>
                    <td>
                        <input type="text" id="txtCost" style="" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblBoxes" style="">Boxes</label>
                    </td>
                    <td>
                        <input type="text" id="txtBoxes" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label style="" id="lblCshand">On Hand</label>
                    </td>
                    <td>
                        <input type="text" id="txtCshand" style="" value="" disabled="disabled" />
                    </td>

                    <td style="background-color: #c3c4c5;">
                        <label class="trshowonlyforapproved" id="lblApproved">Status</label>
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <input class="trshowonlyforapproved" type="text" id="txtApproved" value="" disabled="disabled" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblUnits">Units</label>
                    </td>
                    <td>
                        <input type="text" id="txtUnits" style="" disabled="disabled" />
                    </td>
                    <td>
                        <label id="lblUOM" style="">UOM</label>
                    </td>
                    <td>
                        <input type="text" id="txtUOM" style="" disabled="disabled" />
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <label class="trshowonlyforapproved" style="display: none;" id="lblApprovedby">By</label>
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <input class="trshowonlyforapproved" type="text" id="txtApprovedby" style="display: none;" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label id="lblAskedby">Asked by</label>
                    </td>
                    <td>
                        <input type="text" id="txtAskedby" style="" value="" disabled="disabled" />
                    </td>
                    <td>
                        <label style="" id="lblAskedDate">Asked Date</label>
                    </td>
                    <td>
                        <input type="text" id="txtAskedDate" style="" value="" disabled="disabled" />
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <label class="trshowonlyforapproved" style="display: none;" id="lblTransdate">Date</label>
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <input class="trshowonlyforapproved" type="text" id="txtTransdate" style="display: none;" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input class="trshowonlyforapproved" type="text" id="txtPlaceholder" style="visibility: hidden;" value="" disabled="disabled" />
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <label class="trshowonlyforapproved" style="display: none;" id="lblRejectReason">Reason</label>
                    </td>
                    <td style="background-color: #c3c4c5;">
                        <input class="trshowonlyforapproved" type="text" id="txtRejectReason" style="display: none;" value="" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="trshowonlyforapproved" style="display: none;" id="lblTranstime">Transtime</label>
                    </td>
                    <td>
                        <input class="trshowonlyforapproved" type="text" id="txtTranstime" style="display: none;" value="" disabled="disabled" />
                    </td>
                </tr>
            </tbody>
            <tfoot style="border-top: 1px solid black;">
                <tr>
                    <td style="width: 120px;">
                        <input id="btnApprove" type="button" class="BloomButtonEnabled button-pad" value="Approve" style="background: darkgreen;" />
                        <input id="btnDeny" type="button" class="BloomButtonEnabled button-pad" value="Deny" style="background: darkred;" />
                    </td>
                    <td colspan="7" style="height: 40px;">
                        <input id="btnTop" type="button" class="BloomButtonEnabled button-pad" value="<< Top" style="background: darkslateblue;" />
                        <input id="btnPrev" type="button" class="BloomButtonEnabled button-pad" value="< Prev" style="background: darkcyan;" />
                        <input id="btnNext" type="button" class="BloomButtonEnabled button-pad" value="Next >" style="background: darkcyan;" />
                        <input id="btnBottom" type="button" class="BloomButtonEnabled button-pad" value="Bottom >>" style="background: darkslateblue;" />

                        <input id="btnClose" type="button" class="BloomButtonEnabled button-pad" value="Close" style="background: darkblue; float: right;" />
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <div id="OldRecNo" style="display: none"></div>
    <div id="CurrentRecNo" style="display: none"></div>
    <div id="ClosedManually" style="display: none">0</div>
</div>


<script type="text/javascript">

    $(document).ready(function () {

        $("#hdnApproved").change(function () {
            var Approved = $("#hdnApproved").val();
            if (Approved == "")
                Approved = "Pending";
            else if (Approved == "Y")
                Approved = "Approved";
            else if (Approved == "N")
                Approved = "Denied";
            else if (Approved == "All")
                Approved = "All";

            $("#spanApproved").html(Approved);
        });
        $("#hdnFilter").change(function () {
            var Filter = $("#hdnFilter").val();
            if (Filter == "Today")
                Filter = "Today";
            else if (Filter == "Yesterday")
                Filter = "Yesterday";
            else if (Filter == "ThisMonth")
                Filter = "This Month";

            $("#spanFilter").html(Filter);
        });

        $("#dvPriceApprovalDialog").dialog({
            autoOpen: false,
            resizable: false,
            title: "Aprovals",
            width: 1290, // 1225, 
            height: $(window).height() - 10,
            modal: true,
            focus: function () {
                $('#dvPriceApprovalDialog').focus();
            },
            open: function () {

            },

            beforeClose: function () {


            },
            close: function () {

            }
        });

        $("#DivApprovalsDetails").dialog({
            autoOpen: false,
            resizable: false,
            title: "Aproval Details",
            width: 890, // 1225, 
            height: 375,
            modal: true,
            focus: function () {
                $('#DivApprovalsDetails').focus();
            },
            open: function () {

            },

            beforeClose: function () {


            },
            close: function () {

            }
        });

        $("#fgrdApprovalList").flexigrid({
            url: 'BloomService.asmx/GetApprovedRecords',
            dataType: 'xml',
            colModel: [
                //{ display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                //{ display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'Customer', name: 'CUSTOMER', width: 30, sortable: true, align: 'left' },
                { display: 'Name', name: 'NAME', width: 150, sortable: true, align: 'left', process: GridRowClick },
                { display: 'AWB', name: 'AWB', width: 50, sortable: true, align: 'left', process: GridRowClick },
                { display: 'Days rec.', name: 'DATEREC', width: 30, sortable: true, align: 'left', process: GridRowClick },
                { display: 'Flower', name: 'FLOWER', width: 80, sortable: false, align: 'left', hide: true, process: GridRowClick },
                { display: 'Farm', name: 'FARM', width: 30, sortable: false, align: 'left', process: GridRowClick },
                { display: 'Description', name: 'DESC', width: 150, sortable: false, align: 'left', process: GridRowClick },
                { display: 'Color Code', name: 'COLORCODE', width: 50, sortable: false, align: 'left', hide: true, process: GridRowClick },
                { display: 'Price', name: 'PRICE', width: 30, sortable: false, align: 'right', process: GridRowClick },
                { display: 'Market Price', name: 'MARKET', width: 30, sortable: false, align: 'right', process: GridRowClick },
                { display: 'Cost', name: 'COST', width: 30, sortable: true, align: 'right', process: GridRowClick },
                { display: 'Boxes', name: 'BOXES', width: 30, sortable: true, align: 'right', process: GridRowClick },
                { display: 'CSHAND', name: 'CSHAND', width: 40, sortable: true, align: 'right', process: GridRowClick },
                { display: 'Units', name: 'UNITS', width: 30, sortable: true, align: 'left', process: GridRowClick },
                { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left', process: GridRowClick },
                { display: 'Asked By', name: 'ASKEDBY', width: 80, sortable: true, align: 'left', process: GridRowClick },
                { display: 'Asked Date', name: 'ASKEDDATE', width: 100, sortable: true, align: 'left', process: GridRowClick },
                { display: 'Status', name: 'APPROVED', width: 50, sortable: false, align: 'left', process: GridRowClick },
                { display: 'By', name: 'APPROVEDBY', width: 80, sortable: false, align: 'left', hide: true, process: GridRowClick },
                { display: 'Date', name: 'TRANSDATE', width: 90, sortable: false, align: 'left', hide: true, process: GridRowClick },
                { display: '', name: 'APPROVED', width: 20, sortable: false, align: 'left' },
                { display: '', name: 'APPROVED', width: 20, sortable: false, align: 'left' },
                { display: 'ID', name: 'ID', width: 60, sortable: false, align: 'left', hide: true },
            ],
            searchitems: [
                { display: 'Customer', name: 'CUSTOMER' },
                { display: 'Name', name: 'NAME' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Date', name: 'DATEREC' },
                { display: 'Flower', name: 'FLOWER' },
                { display: 'Farm', name: 'FARM' },
                { display: 'Description', name: 'DESC' },
                { display: 'Asked By', name: 'ASKEDBY' }
            ],
            showTableToggleBtn: true,
            sortname: "ID asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: false,
            showTableToggleBtn: false,
            width: 1275,
            height: $(window).height() - 200,
            striped: true,
            onSuccess: function () {

            },
            params: [
                { name: 'Filter', value: 'Today' },
                { name: 'Approved', value: '' }
            ],

            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#btnClose").click(function () {
            $("#DivApprovalsDetails").dialog("close");
        });

        $("#btnApprove").click(function () {
            UpdateApprovalStatus($("#txtRecNo").val(), "Y");
        });

        $("#btnDeny").click(function () {
            UpdateApprovalStatus($("#txtRecNo").val(), "N");
        });


        // Next Previous Record
        $("#btnNext").click(function () {
            var currentID = $("#txtRecNo").val();
            var NextID = currentID;
            var isSet = 0;
            $('#fgrdApprovalList > tbody > tr').each(function () {
                var rowID = this.id.substring(3);
                if (rowID < currentID && isSet == 0) {
                    currentID = rowID;
                    isSet = 1;
                }
            });

            PopulateApprovalDetails(currentID);
        });

        $("#btnPrev").click(function () {
            var currentID = $("#txtRecNo").val();
            var lastIDCheck = currentID;
            var NextID = currentID;
            $('#fgrdApprovalList > tbody > tr').each(function () {
                debugger;
                var rowID = this.id.substring(3);
                if (rowID > lastIDCheck) {
                    currentID = rowID;
                }
            });

            PopulateApprovalDetails(currentID);
        });

        // Top/Bottom Record
        $("#btnTop").click(function () {
            var currentID = $("#txtRecNo").val();
            var isSet = 0;
            $('#fgrdApprovalList > tbody > tr').each(function () {
                var rowID = this.id.substring(3);
                if (isSet == 0) {
                    currentID = rowID;
                    isSet = 1;
                }
            });

            PopulateApprovalDetails(currentID);
        });

        $("#btnBottom").click(function () {
            var currentID = $("#txtRecNo").val();
            $('#fgrdApprovalList > tbody > tr').each(function () {
                var rowID = this.id.substring(3);
                currentID = rowID;
            });
            PopulateApprovalDetails(currentID);
        });


        // Tab buttons
        $("#btnShowApprovedToday").click(function () {
            $("#hdnFilter").val("Today").trigger('change');

            ReloadGrid();
        });
        $("#btnShowApprovedYesterday").click(function () {
            $("#hdnFilter").val("Yesterday").trigger('change');

            ReloadGrid();
        });
        $("#btnShowApprovedThisMonth").click(function () {
            $("#hdnFilter").val("ThisMonth").trigger('change');

            ReloadGrid();
        });


        $("#btnShowPending").click(function () {
            $("#hdnApproved").val("").trigger('change');

            ReloadGrid();
        });
        $("#btnShowApproved").click(function () {
            $("#hdnApproved").val("Y").trigger('change');

            ReloadGrid();
        });
        $("#btnShowDenied").click(function () {
            $("#hdnApproved").val("N").trigger('change');

            ReloadGrid();
        });
        $("#btnShowAll").click(function () {
            $("#hdnApproved").val("All").trigger('change');

            ReloadGrid();
        });

        document.addEventListener("visibilitychange", function (event) {
            if (!document.hidden) {
                ReloadGrid();
            }
        });


        function ReloadGrid() {
            var Approved = $("#hdnApproved").val();
            var Filter = $("#hdnFilter").val();

            $("#fgrdApprovalList").empty();
            $("#fgrdApprovalList").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'Approved', value: Approved }] }).flexReload();
        }
    });

    function GridRowClick(celDiv, id) {
        $(celDiv).click(function () {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPendingToApproveDetailsByRecNo',
                data: '{ "ID":"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output, status) {
                    var approvalDetails = output.d;


                    $("#DivApprovalsDetails").dialog('option', 'title', 'Approval Details');
                    $("#DivApprovalsDetails").dialog("open");

                    $("#DivApprovalsDetails #txtRecNo").val(approvalDetails[0].ID);
                    $("#DivApprovalsDetails #txtCustomerNo").val(approvalDetails[0].CUSTOMER);
                    $("#DivApprovalsDetails #txtCustomerName").val(approvalDetails[0].NAME);
                    $("#DivApprovalsDetails #txtAwb").val(approvalDetails[0].AWB);
                    $("#DivApprovalsDetails #txtDaterec").val(approvalDetails[0].DATEREC);
                    $("#DivApprovalsDetails #txtFlower").val(approvalDetails[0].FLOWER);
                    $("#DivApprovalsDetails #txtFarm").val(approvalDetails[0].FARM);
                    $("#DivApprovalsDetails #txtDesc").val(approvalDetails[0].DESC);
                    $("#DivApprovalsDetails #txtPrice").val(approvalDetails[0].PRICE);
                    $("#DivApprovalsDetails #txtMarket").val(approvalDetails[0].MARKET);
                    $("#DivApprovalsDetails #txtCost").val(approvalDetails[0].COST);
                    $("#DivApprovalsDetails #txtBoxes").val(approvalDetails[0].BOXES);
                    $("#DivApprovalsDetails #txtCshand").val(approvalDetails[0].CSHAND);
                    $("#DivApprovalsDetails #txtUnits").val(approvalDetails[0].UNITS);
                    $("#DivApprovalsDetails #txtUOM").val(approvalDetails[0].UOM);
                    $("#DivApprovalsDetails #txtAskedby").val(approvalDetails[0].ASKEDBY);
                    $("#DivApprovalsDetails #txtAskedDate").val(approvalDetails[0].ASKEDDATE);
                    $("#DivApprovalsDetails #txtAskedTime").val(approvalDetails[0].ASKEDTIME);
                    $("#DivApprovalsDetails #txtApproved").val(approvalDetails[0].APPROVED);
                    $("#DivApprovalsDetails #txtApprovedby").val(approvalDetails[0].APPROVEDBY);
                    $("#DivApprovalsDetails #txtTransdate").val(approvalDetails[0].TRANSDATE);
                    $("#DivApprovalsDetails #txtTranstime").val(approvalDetails[0].TRANSTIME);
                    $("#DivApprovalsDetails #txtRejectReason").val(approvalDetails[0].REJECTREASON);

                    if (approvalDetails[0].APPROVED == "Y") {
                        $("#DivApprovalsDetails #lblApprovedby").show();
                        $("#DivApprovalsDetails #lblTransdate").show();
                        $("#DivApprovalsDetails #lblRejectReason").hide();

                        $("#DivApprovalsDetails #txtApprovedby").show();
                        $("#DivApprovalsDetails #txtTransdate").show();
                        $("#DivApprovalsDetails #txtRejectReason").hide();

                        $("#DivApprovalsDetails #txtApproved").val("Approved");
                        $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkgreen; color: white;");

                        $("#btnApprove").hide();
                        $("#btnDeny").hide();
                    }
                    else if (approvalDetails[0].APPROVED == "N") {
                        $("#DivApprovalsDetails #lblApprovedby").show();
                        $("#DivApprovalsDetails #lblTransdate").show();
                        $("#DivApprovalsDetails #lblRejectReason").show();

                        $("#DivApprovalsDetails #txtApprovedby").show();
                        $("#DivApprovalsDetails #txtTransdate").show();
                        $("#DivApprovalsDetails #txtRejectReason").show();

                        $("#DivApprovalsDetails #txtApproved").val("Denied");
                        $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkred; color: white;");

                        $("#btnApprove").hide();
                        $("#btnDeny").hide();
                    }
                    else {
                        $("#DivApprovalsDetails #lblApprovedby").hide();
                        $("#DivApprovalsDetails #lblTransdate").hide();
                        $("#DivApprovalsDetails #lblRejectReason").hide();

                        $("#DivApprovalsDetails #txtApprovedby").hide();
                        $("#DivApprovalsDetails #txtTransdate").hide();
                        $("#DivApprovalsDetails #txtRejectReason").hide();

                        // Modified By: Subhajit On: 06-17-2022
                        // Approval Expires after an Hour
                        var today = new Date();
                        var beforeOneHour = today.addHours(-1);
                        //var todayDate = (today.getMonth() + 1) + '-' + today.getDate() + '-' + today.getFullYear();

                        var askedDay = new Date($("#DivApprovalsDetails #txtAskedDate").val());
                        //var askedDate = (askedDay.getMonth() + 1) + '-' + askedDay.getDate() + '-' + askedDay.getFullYear();

                        if (askedDay < beforeOneHour) {
                            $("#DivApprovalsDetails #txtApproved").val("Expired");
                            $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkgrey; color: white;");
                            $("#btnApprove").hide();
                            $("#btnDeny").hide();
                        }
                        else {
                            $("#DivApprovalsDetails #txtApproved").val("Pending");
                            $("#DivApprovalsDetails #txtApproved").attr("style", "background: fuchsia; color: white;");
                            $("#btnApprove").show();
                            $("#btnDeny").show();
                        }
                    }
                }
            });
        });
    }

    function PopulateApprovalDetails(currentID) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPendingToApproveDetailsByRecNo',
            data: '{ "ID":"' + currentID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                var approvalDetails = output.d;

                $("#DivApprovalsDetails #txtRecNo").val(approvalDetails[0].ID);
                $("#DivApprovalsDetails #txtCustomerNo").val(approvalDetails[0].CUSTOMER);
                $("#DivApprovalsDetails #txtCustomerName").val(approvalDetails[0].NAME);
                $("#DivApprovalsDetails #txtAwb").val(approvalDetails[0].AWB);
                $("#DivApprovalsDetails #txtDaterec").val(approvalDetails[0].DATEREC);
                $("#DivApprovalsDetails #txtFlower").val(approvalDetails[0].FLOWER);
                $("#DivApprovalsDetails #txtFarm").val(approvalDetails[0].FARM);
                $("#DivApprovalsDetails #txtDesc").val(approvalDetails[0].DESC);
                $("#DivApprovalsDetails #txtPrice").val(approvalDetails[0].PRICE);
                $("#DivApprovalsDetails #txtMarket").val(approvalDetails[0].MARKET);
                $("#DivApprovalsDetails #txtCost").val(approvalDetails[0].COST);
                $("#DivApprovalsDetails #txtBoxes").val(approvalDetails[0].BOXES);
                $("#DivApprovalsDetails #txtCshand").val(approvalDetails[0].CSHAND);
                $("#DivApprovalsDetails #txtUnits").val(approvalDetails[0].UNITS);
                $("#DivApprovalsDetails #txtUOM").val(approvalDetails[0].UOM);
                $("#DivApprovalsDetails #txtAskedby").val(approvalDetails[0].ASKEDBY);
                $("#DivApprovalsDetails #txtAskedDate").val(approvalDetails[0].ASKEDDATE);
                $("#DivApprovalsDetails #txtAskedTime").val(approvalDetails[0].ASKEDTIME);
                $("#DivApprovalsDetails #txtApproved").val(approvalDetails[0].APPROVED);
                $("#DivApprovalsDetails #txtApprovedby").val(approvalDetails[0].APPROVEDBY);
                $("#DivApprovalsDetails #txtTransdate").val(approvalDetails[0].TRANSDATE);
                $("#DivApprovalsDetails #txtTranstime").val(approvalDetails[0].TRANSTIME);
                $("#DivApprovalsDetails #txtRejectReason").val(approvalDetails[0].REJECTREASON);

                if (approvalDetails[0].APPROVED == "Y") {
                    $("#DivApprovalsDetails #lblApprovedby").show();
                    $("#DivApprovalsDetails #lblTransdate").show();
                    $("#DivApprovalsDetails #lblRejectReason").hide();

                    $("#DivApprovalsDetails #txtApprovedby").show();
                    $("#DivApprovalsDetails #txtTransdate").show();
                    $("#DivApprovalsDetails #txtRejectReason").hide();

                    $("#DivApprovalsDetails #txtApproved").val("Approved");
                    $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkgreen; color: white;");

                    $("#btnApprove").hide();
                    $("#btnDeny").hide();
                }
                else if (approvalDetails[0].APPROVED == "N") {
                    $("#DivApprovalsDetails #lblApprovedby").show();
                    $("#DivApprovalsDetails #lblTransdate").show();
                    $("#DivApprovalsDetails #lblRejectReason").show();

                    $("#DivApprovalsDetails #txtApprovedby").show();
                    $("#DivApprovalsDetails #txtTransdate").show();
                    $("#DivApprovalsDetails #txtRejectReason").show();

                    $("#DivApprovalsDetails #txtApproved").val("Denied");
                    $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkred; color: white;");

                    $("#btnApprove").hide();
                    $("#btnDeny").hide();
                }
                else {
                    $("#DivApprovalsDetails #lblApprovedby").hide();
                    $("#DivApprovalsDetails #lblTransdate").hide();
                    $("#DivApprovalsDetails #lblRejectReason").hide();

                    $("#DivApprovalsDetails #txtApprovedby").hide();
                    $("#DivApprovalsDetails #txtTransdate").hide();
                    $("#DivApprovalsDetails #txtRejectReason").hide();

                    // Modified By: Subhajit On: 06-17-2022
                    // Approval Expires after an Hour
                    var today = new Date();
                    var beforeOneHour = today.addHours(-1);
                    //var todayDate = (today.getMonth() + 1) + '-' + today.getDate() + '-' + today.getFullYear();

                    var askedDay = new Date($("#DivApprovalsDetails #txtAskedDate").val());
                    //var askedDate = (askedDay.getMonth() + 1) + '-' + askedDay.getDate() + '-' + askedDay.getFullYear();

                    if (askedDay < beforeOneHour) {
                        $("#DivApprovalsDetails #txtApproved").val("Expired");
                        $("#DivApprovalsDetails #txtApproved").attr("style", "background: darkgrey; color: white;");
                        $("#btnApprove").hide();
                        $("#btnDeny").hide();
                    }
                    else {
                        $("#DivApprovalsDetails #txtApproved").val("Pending");
                        $("#DivApprovalsDetails #txtApproved").attr("style", "background: fuchsia; color: white;");
                        $("#btnApprove").show();
                        $("#btnDeny").show();
                    }
                }
            }
        });
    }

    function UpdateApprovalStatus(ID, Status) {
        var username = '<%=Session("LoginUserDetails").UserName.ToString() %>';
        if (Status == "N") {
            $.MessageBox({
                input: true,
                message: "Please provide a reason for Denying"
            }).done(function (data, button) {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateApprovalStatus',
                    data: '{ "ID":"' + ID + '", "ApprovalStatus":"N", "ApprovedBy":"' + username + '", "Reason":"' + data + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (output, status) {
                        var Result = output.d;
                        if (Result == "Success") {
                            $("#DivApprovalsDetails").dialog("close");
                            $("#fgrdApprovalList").flexReload();
                        }
                    }
                });
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateApprovalStatus',
                data: '{ "ID":"' + ID + '", "ApprovalStatus":"' + Status + '", "ApprovedBy":"' + username + '", "Reason":""}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output, status) {
                    var Result = output.d;
                    if (Result == "Success") {
                        $("#DivApprovalsDetails").dialog("close");
                        $("#fgrdApprovalList").flexReload();
                    }
                }
            });
        }
    }

    Date.prototype.addHours = function (h) {
        this.setTime(this.getTime() + (h * 60 * 60 * 1000));
        return this;
    }

</script>
