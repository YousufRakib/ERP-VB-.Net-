<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustomerOrder.ascx.vb" Inherits="pages_PageCustomerOrder" %>
<script src="js/jquery.tabletojson.min.js"></script>
<style type="text/css">
    table.Main {
        border-collapse: separate;
        /*border-spacing: 5px;*/
    }

    table.Calendar {
        border-collapse: separate;
        border-spacing: 3px 3px;
    }

    table.SearchDropDown {
        border-collapse: separate;
        border-spacing: 5px 5px;
    }

    .control-label {
        color: dimgray;
        font-size: 12px;
        width: 150px;
    }

    .control-link {
        color: dimgray;
        font-size: 14px;
        font-weight: bold;
        width: 150px;
    }

    /*.selectize-dropdown-content {
        height: 100%;
        max-height: 140px;
    }*/
    #tdCarrier .selectize-input {
        width: 100%;
    }

    #tdCarrier .selectize-dropdown-content {
        min-width: 250px;
    }

    #tdShipto .selectize-input {
        width: 100%;
    }

    #tdShipto .selectize-dropdown-content {
        min-width: 250px;
    }

    #CartDetail {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: 1px solid #ddd;
        border: 1px solid #ddd;
        width: 98%;
    }

        #CartDetail td, #customers th {
            border: 1px solid #ddd;
            padding: 3px;
        }

        #CartDetail tr:nth-child(even) {
            /*background-color: #f2f2f2;*/
        }

        #CartDetail tr:hover {
            background-color: #7B7BFF;
            color: white;
        }

        #CartDetail th {
            padding-top: 5px;
            padding-bottom: 5px;
            text-align: center;
            /*background-color:aliceblue;*/
            background: #fafafa url(css/images/fhbg.gif);
            color: black;
        }
</style>

<div id="divBody">
    <div id="LoggedInUserType" runat="server" style="display: none"></div>
    <div id="LoggedInUserID" runat="server" style="display: none"></div>
    <div>
        <img alt="Loding..." id="imgOrderLoader" style="height: 100px; width: 100px; margin-left: 375px; margin-top: 220px;" src="images/ajax_loader_blue_512.gif" />
    </div>
    <div class="row">
        <table class="Main">
            <tr>
                <td style="width: 25%">
                    <table class="Main">
                        <tr>
                            <td>
                                <label class="control-label">Ship Date</label>
                            </td>
                            <td>
                                <input type="text" style="width: 250px;" maxlength="30" class="form-control" id="txtShipDate" placeholder="ShipDate" value="" required></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Carrier</label>
                            </td>
                            <td id="tdCarrier">
                                <select placeholder='Choose Carrier...' id="lstCarrier" value="" style="width: 250px;" />
                                <input type="hidden" id="hfCarrier" />

                            </td>
                        </tr>
                        <tr id="trShipto">
                            <td>
                                <label id="lblShipto" class="control-label">Shipto</label>
                            </td>
                            <td id="tdShipto">

                                <select placeholder='Choose Shipto...' id="lstShipto" value="" style="width: 250px;" />
                                <input type="hidden" id="hfShipto" />
                        </tr>
                        <%-- <tr>
                            <td>
                                <label class="control-label">PO#</label>
                            </td>
                            <td>
                              
                        </tr>--%>
                    </table>
                </td>
                <td style="width: 25%">

                    <table class="Calendar">
                        <thead class="blue-grey lighten-4">
                            <tr class="table-active">
                                <th>
                                    <label class="control-link">Mon</label>
                                </th>
                                <th>
                                    <label class="control-link">Tue</label>
                                </th>
                                <th>
                                    <label class="control-link">Wed</label>
                                </th>
                                <th>
                                    <label class="control-link">Thu</label>
                                </th>
                                <th>
                                    <label class="control-link">Fri</label>
                                </th>
                                <th>
                                    <label class="control-link">Sat</label>
                                </th>
                                <th>
                                    <label class="control-link">Sun</label>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a class="control-link" id="lnkMon" href="javascript:void(0)">Mon 
                                </a>
                                    <input type="hidden" id="hfMon" value="" />
                                </td>
                                <td><a class="control-link" id="lnkTue" href="javascript:void(0)">Tue
                                </a>
                                    <input type="hidden" id="hfTue" value="" />
                                </td>
                                <td><a class="control-link" id="lnkWed" href="javascript:void(0)">Wed
                                </a>
                                    <input type="hidden" id="hfWed" value="" />
                                </td>
                                <td><a class="control-link" id="lnkThu" href="javascript:void(0)">Thu
                                </a>
                                    <input type="hidden" id="hfThu" value="" /></td>
                                <td><a class="control-link" id="lnkFri" href="javascript:void(0)">Fri
                                </a>
                                    <input type="hidden" id="hfFri" value="" /></td>
                                <td><a class="control-link" id="lnkSat" href="javascript:void(0)">Sat
                                </a>
                                    <input type="hidden" id="hfSat" value="" />
                                </td>
                                <td><a class="control-link" id="lnkSun" href="javascript:void(0)">Sun
                                </a>
                                    <input type="hidden" id="hfSun" value="" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <br />
                    <br />

                    <br />
                    <div></div>
                </td>
                <td style="width: 30%">
                    <table class="Main" style="height: 100%">
                        <tr>
                            <td></td>
                            <td>
                                <input type="text" style="width: 100px;" maxlength="30" class="form-control" id="txtPO" placeholder="PO#" value="" required></td>
                            <td style="text-align: right">
                                <input type="button" id="btnSave" style="display: none; width: 100px;" class="BloomButtonEnabled" value="Save">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align: right">
                                <input type="button" id="btnCheckOut" class="BloomButtonEnabled" style="width: 100px;" value="CheckOut">
                            </td>
                        </tr>
                        <tr>

                            <td style="text-align: right; width: 100%;" colspan="2">
                                <label class="control-label" style="width: 200px;">Available Credit :</label>
                            </td>
                            <td style="text-align: right">
                                <label class="control-label" id="lblCredit">$0</label>
                            </td>

                        </tr>
                        <tr>

                            <td style="text-align: right; width: 100%;" colspan="2">
                                <label class="control-label" style="width: 200px;">Cart Total :</label>
                            </td>
                            <td style="text-align: right">
                                <label class="control-label" id="lblCartTotal">$0.00</label>
                            </td>

                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="row">
        <table class="SearchDropDown" style="width: 100%;">
            <tr>
                <%--   <td style="width: 100px;">
                    <label class="control-label">Category</label></td>--%>
                <td style="width: 200px;">
                    <select placeholder='Choose Category...' id="lstCategory" value="" />
                    <input type="hidden" id="hfCategory" />
                </td>
                <%--    <td style="width: 100px;">
                    <label class="control-label">Variety</label></td>--%>
                <td style="width: 200px;">
                    <select placeholder='Choose Variety...' id="lstVariety" value="" />
                    <input type="hidden" id="hfVariety" />
                </td>
                <%--       <td style="width: 100px;">
                    <label class="control-label">Grade</label></td>--%>
                <td style="width: 200px;" id="tdGrade">
                    <select placeholder='Choose Grade...' id="lstGrade" value="" />
                    <input type="hidden" id="hfGrade" />

                </td>
                <%--     <td style="width: 100px;">
                    <label class="control-label">Color</label></td>--%>
                <td style="width: 200px;" id="tdColor">
                    <select placeholder='Choose Color...' id="lstColor" value="" />
                    <input type="hidden" id="hfColor" />

                </td>
            </tr>
        </table>
    </div>
    <div>

        <table id="tblInven">
            <tr>
                <td>
                    <table id="fgrdInventory" style="display: none;"></table>
                    <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                </td>
            </tr>

        </table>

    </div>
    <br />
    <div>
        <table id="CartDetail">
            <thead>
                <tr>
                    <th style='width: 260px;'>Product</th>
                    <th style='width: 35px; display: none;'>ProductCode</th>
                    <th style='width: 35px; display: none;'>IDINVEN</th>
                    <th style='width: 35px;'>InCart</th>
                    <th style='width: 35px;'>UOM</th>
                    <th style='width: 35px;'>Units</th>
                    <th style='width: 35px;'>Bunch</th>
                    <th style='width: 35px;'>Price</th>
                    <th style='width: 35px;'>ExtPrice</th>
                    <th style='width: 35px;'>Remove</th>
                    <th style='width: 100px;'>BoxCode</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <br />
    <br />
    <br />

</div>

<script type="text/javascript">
    var Customer = $("#ctl00_LoggedInCustomerNo").html();
    var FirstTimeLoad = false;

    $(document).ready(new function () {
        $("#imgUserLoader").hide();
        $('.SearchDropDown').hide();
        $('.Main').hide();
        $('#tblInven').hide();
        $("#imgOrderLoader").show();
        $("#txtPO").hide();
        $('#CartDetail').hide();
        FirstTimeLoad = true;
        $('#txtShipDate').attr('disabled', true)
        $("#txtShipDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (dateText) {

                InvenFilter();
            }
        }).datepicker("setDate", new Date());
        //$('#txtShipDate').val('');
        LoadCalendar();
        GetCustDetailsPage();

        $('.Main').show();
        $('#tblInven').show();
        $("#imgOrderLoader").hide();

        $("#fgrdInventory").flexigrid({
            url: 'BloomService.asmx/GetInventoryForCustomerOrderFgrdNew',
            dataType: 'xml',
            colModel: [
                { display: 'InvenIDs', name: 'IDs', width: 80, sortable: true, hide: true, align: 'left' },
                { display: 'Code', name: 'Code', width: 50, sortable: true, align: 'left' },
                { display: 'Country', name: 'City', width: 50, sortable: true, align: 'left' },
                { display: 'Cat', name: 'Cat', width: 50, sortable: true, hide: false, align: 'left' },
                { display: 'Product', name: 'ProductName', width: 250, sortable: true, align: 'left' },
                { display: 'ProductCode', name: 'ProductCode', width: 180, sortable: true, hide: true, align: 'left' },
                { display: 'Avail.', name: 'Qty', width: 25, sortable: false, align: 'right' },
                { display: 'BoxCode', name: 'BoxCode', width: 180, sortable: true, hide: true, align: 'left' },
                { display: 'UOM', name: 'UOM', width: 25, sortable: false, align: 'right' },
                { display: 'Units', name: 'Units', width: 25, sortable: false, align: 'right' },
                { display: 'Type', name: 'Soldas', width: 25, sortable: false, align: 'right' },
                { display: 'Bunch', name: 'UnitesBunch', width: 25, sortable: false, align: 'right' },
                { display: 'Price', name: 'Price', width: 35, sortable: false, align: 'right' },
                { display: 'FOB', name: 'FBE', width: 35, sortable: false, align: 'right' },
                { display: 'FOB Box$', name: 'FOBBOX', width: 35, sortable: false, align: 'right' },
                { display: 'NextIn', name: 'NextIn', width: 30, sortable: false, align: 'right' },
                { display: ' ', name: 'Add', width: 20, sortable: false, align: 'right', process: AddQty },
                { display: 'InCart', name: 'InCart', width: 30, sortable: false, align: 'left' },
                { display: ' ', name: 'Less', width: 20, sortable: false, align: 'right', process: LessQty },
                { display: 'Update', name: 'Update', width: 50, sortable: false, align: 'left', process: AddToCart }
            ],
            showTableToggleBtn: false,
            sortname: "ProductName",
            sortorder: "asc",
            usepager: false,
            title: false,
            useRp: false,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: false,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: 370,
            width: 1010,
            striped: true,
            onSuccess: function () {
                //alert('s');
                //$('.Main').show();
                //$('#tblInven').show();
                //$("#imgOrderLoader").hide();
            },
            params: [
                { name: 'ShipDate', value: $("#txtShipDate").val() },
                { name: 'Category', value: '' },
                { name: 'Variety', value: '' },
                { name: 'Grade', value: '' },
                { name: 'Color', value: '' }
            ],
        });
    });

    $(function () {
        $(function () {
            //it will load after document.ready
            //$("#txtPO").focus();
            //$('#txtShipDate').val('')
            //  FirstTimeLoad = false;
            //$('.SearchDropDown').show();          
            //$(".PleaseWaitOverlay").dialog("close");
        });
    });

    $("#btnSave").click(function () {
        debugger;
        if ($('#txtShipDate').val() == "") {
            alert('Must select valid date..!');
            return;
        }
        //if ($('#txtPO').val() == "") {
        //    alert('Must Enter valid PO#');
        //    $('#txtPO').focus();
        //    return;
        //}
        if (CartTotal <= 0) {
            alert('Your order is empty');
            return;
        }
        var Detail = $('#CartDetail').tableToJSON();
        debugger;
        var SDate = "";
        SDate = $('#txtShipDate').val();
        var PONo = "";
        PONo = $('#txtPO').val();
        var CarrierID = $("#lstCarrier")[0].value;
        var ShipTo = $("#lstShipto")[0].value;
        var TotalAmt = $('#lblCartTotal').html();
        var Invoice = { ShipDate: SDate, PONo: PONo, Customer: Customer, CarrierID: CarrierID, ShipTo: ShipTo, TotalAmt: TotalAmt };
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CreateCustomerOrder',
            data: "{Header:" + JSON.stringify(Invoice) + ",Detail:" + JSON.stringify(Detail) + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res, status) {
                debugger;
                var data = res.d;
                if (data.indexOf("Success")>=0) {
                    alert('Invoice# ' + data.split("~")[1] +' created successfully...');
                    $('#DivNewOrderDialog').dialog("close");
                    //ResetControls();

                }

            }
        });
    });

    $("#btnCheckOut").click(function () {

        if ($('#btnCheckOut').val() == 'CheckOut') {
            if ($('#txtShipDate').val() == '') {
                $('#txtShipDate').focus();
                return;
            }
            if (CartTotal <= 0) {
                alert('Your order is empty');
                return;
            }

            var CarrierID = $("#lstCarrier")[0].value;
            var ShipTo = $("#lstShipto")[0].value;
            debugger;
            if (CarrierID <= 0 || CarrierID == null) {
                alert('Must Select Carrier');
                return;
            }

            if ($("#trShipto").is(":visible"))
                if (ShipTo <= 0 || ShipTo == null) {
                    alert('Must Select ShipTo');
                    return;
                }
            $('#btnCheckOut').val('ShowInven');
            $("#tblInven").hide();
            $("#btnSave").show();
            $("#txtPO").show();
        }
        else {
            $('#btnCheckOut').val('CheckOut');
            $("#tblInven").show();
            $("#btnSave").hide();
            $("#txtPO").hide();
        }


    });
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [month, day, year].join('/');
    }

    $("#lnkMon").click(function () {
        $('#txtShipDate').val(formatDate($("#hfMon").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkMon").html());
        ChangeDaysLinkColor()
        $("#lnkMon").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkTue").click(function () {
        debugger;
        $('#txtShipDate').val(formatDate($("#hfTue").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkTue").html());
        ChangeDaysLinkColor()
        $("#lnkTue").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkWed").click(function () {
        $('#txtShipDate').val(formatDate($("#hfWed").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkWed").html());
        ChangeDaysLinkColor()
        $("#lnkWed").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkThu").click(function () {
        $('#txtShipDate').val(formatDate($("#hfThu").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkThu").html());
        ChangeDaysLinkColor()
        $("#lnkThu").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkFri").click(function () {
        $('#txtShipDate').val(formatDate($("#hfFri").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkFri").html());
        ChangeDaysLinkColor()
        $("#lnkFri").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkSat").click(function () {
        $('#txtShipDate').val(formatDate($("#hfSat").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkSat").html());
        ChangeDaysLinkColor()
        $("#lnkSat").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    $("#lnkSun").click(function () {
        $('#txtShipDate').val(formatDate($("#hfSun").val()));
        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#lnkSun").html());
        ChangeDaysLinkColor()
        $("#lnkSun").css({ 'color': '#0cff41' });
        InvenFilter();
    });
    function ChangeDaysLinkColor() {
        $("#lnkMon").css({ 'color': 'dimgray' });
        $("#lnkTue").css({ 'color': 'dimgray' });
        $("#lnkWed").css({ 'color': 'dimgray' });
        $("#lnkThu").css({ 'color': 'dimgray' });
        $("#lnkFri").css({ 'color': 'dimgray' });
        $("#lnkSat").css({ 'color': 'dimgray' });
        $("#lnkSun").css({ 'color': 'dimgray' });
    }
    function InvenFilter() {
        if (FirstTimeLoad == true)
            return;
        //$('.Main').hide();
        //$('#tblInven').hide();
        //$("#imgOrderLoader").show();

        var ShipDate = $('#txtShipDate').val();

        var Category = $("#lstCategory")[0].value;
        var Variety = $("#lstVariety")[0].value;
        var Grade = $("#lstGrade")[0].value;
        var Color = $("#lstColor")[0].value;
        debugger;
        $("#fgrdInventory").flexOptions({ params: [{ name: 'ShipDate', value: ShipDate }, { name: 'Category', value: Category }, { name: 'Variety', value: Variety }, { name: 'Grade', value: Grade }, { name: 'Color', value: Color }], query: "", newp: 1 }).flexReload();
        //if (Category != '') {
        //    LoadVarietyByCat(Category);
        //    $("#tdGrade").hide();
        //    $("#tdColor").hide();
        //}
        //else {
        //    LoadVarietyByCat('');
        //    $("#tdGrade").show();
        //    $("#tdColor").show();
        //}
    }
    function ResetControls() {
        debugger;
        $("#CartDetail > tbody").empty();
        $('#CartDetail').hide();
        $('#btnCheckOut').val('CheckOut');
        $("#tblInven").show();
        $("#btnSave").hide();
        //$('#txtShipDate').val('');
        $('#txtPO').val('');
        $('#txtPO').hide();
        $('#lblCartTotal').html('0.00');
        //J1_10($("#lstCarrier")).selectize()[0].selectize.setValue("0");
        CartTotal = 0;
        $('#txtShipDate').val(formatDate(new Date()));
        //var ShipDate = $('#txtShipDate').val();
        //var Category = $("#lstCategory")[0].value;
        //var Variety = $("#lstVariety")[0].value;
        //var Grade = $("#lstGrade")[0].value;
        //var Color = $("#lstColor")[0].value;
        //$("#fgrdInventory").flexOptions({ params: [{ name: 'ShipDate', value: ShipDate }, { name: 'Category', value: Category }, { name: 'Variety', value: Variety }, { name: 'Grade', value: Grade }, { name: 'Color', value: Color }], query: "", newp: 1 }).flexReload();
        GetCustDetailsPage();
    }
    function GetCustDetailsPage() {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustDetails',
            data: '{ "Customer":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                var res = output.d;
                $("#lblCredit").text("$" + res.Available.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
            }
        });

    }

    function AddQty(celDiv, id) {
        $(celDiv).click(function () {
            debugger;
            var shipdate = $("#txtShipDate").val();
            var NextInId = '#txtNextIn_' + id;
            var NexInDate = $(NextInId).html() + "/" + (new Date()).getFullYear()
            var idname = '#editQty_' + id;
            var AvailQtyIdName = '#hfQty_' + id;
            var AvailQty = parseInt($(AvailQtyIdName).val())
            var old = parseInt($(idname).val());
            if ($(NextInId).html() != "")
                if (Date.parse(shipdate) < Date.parse(NexInDate)) {
                    return;
                }
            if (AvailQty > old) {
                old++;
            }

            $(idname).val(old);
            AppendRow(id);
        });
    }
    function AddToCart(celDiv, id) {
        $(celDiv).click(function () {
            debugger;
            AppendRow(id);
        });
    }
    var CartTotal = 0;
    function AppendRow(id) {
        var ProductIdName = '#divProduct_' + id;
        var Product = $('#hfProduct_' + id).val();
        var ProductCode = $('#hfProductCode_' + id).val();
        var UOM = $('#hfUOM_' + id).val();
        var Units = $('#hfUnits_' + id).val();
        var UnitesBunch = $('#hfUnitesBunch_' + id).val();
        var FOB = $('#hfFOB_' + id).val();
        var BoxCode = "";//$('#hfBoxCode_' + id).val();
        var FOBBOX = $('#hfFOBBOX_' + id).val();
        var InCart = $('#editQty_' + id).val();
        var FobPrice = parseFloat($('#hfFOB_' + id).val());
        debugger;
        var ExtPrice = ((parseFloat(InCart) * parseFloat(Units)) * parseFloat(FobPrice)).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        var AvailQty = parseInt($('#hfQty_' + id).val())
        if (parseInt(InCart) > parseInt(AvailQty)) {
            InCart = AvailQty;
            $('#editQty_' + id).val(AvailQty);
        }

        var IDINVEN = $('#invenids_' + id).html();

        var markup = "<tr id='cr_" + id + "'  ><td style='width:180px;'><div style='margin:3px;'>" + $(ProductIdName).parent().html() + "</div></td><td style='display:none;'>" + ProductCode + "</td><td style='display:none;'>" + IDINVEN + "</td><td style='width:35px;text-align:right;'>" + InCart + "</td><td style='width:35px;text-align:right;'>" + UOM + "</td><td style='width:35px;text-align:right;'>" + Units + "</td><td style='width:35px;text-align:right;'>" + UnitesBunch + "</td><td style='width:35px;text-align:right;'>" + FobPrice.toString() + "</td><td style='width:35px;text-align:right;'><input type='hidden' class='extprice' id='hfExtPrice_" + id + "' value=" + ExtPrice + "> " + ExtPrice + "</td><td><input type='button' style='width:100%;height:100%;margin-top:-5px;'  id='Remove_" + id + "' value='Remove' onClick='RemoveRow(" + id + ");' ></input></td><td style='width:100px;'><input type='text' style='width:100%;height:100%;margin-top:-5px;'  id='BoxCode_" + id + "' value='" + BoxCode + "'></input></td></tr>";
        var RowID = '#cr_' + id;
        if (parseInt(InCart) == 0) {

            $(RowID).remove();
        }
        if (parseInt(InCart) > 0) {


            $(RowID).remove();
            $("#CartDetail tbody").append(markup);
        }
        debugger;
        var OgQtyIdName = '#txtQty_' + id;
        var NewQty = AvailQty - parseInt(InCart);
        $(OgQtyIdName).html(NewQty);
        GetCartTotal();
    }
    function GetCartTotal() {
        debugger;
        CartTotal = 0;
        $('table#CartDetail > tbody > tr').each(function () {
            var price = $(this).find('input.extprice').val(); // nope         
            CartTotal = parseFloat(CartTotal) + parseFloat(price);
        }) //END .each
        $("#lblCartTotal").html(CartTotal.toFixed(2));
        if (CartTotal > 0)
            $('#CartDetail').show();
        else
            $('#CartDetail').hide();

    }
    function RemoveRow(id) {
        $('#Remove_' + id).parent().parent().remove()
        $('#editQty_' + id).val('0');
        AppendRow(id);
    }
    function LessQty(celDiv, id) {
        $(celDiv).click(function () {
            debugger;
            var idname = '#editQty_' + id;
            var old = parseInt($(idname).val())
            if (old != 0) {
                old--;
            }
            $(idname).val(old);
            AppendRow(id);
        });
    }
    function LoadCalendar() {
        debugger;
        $("#lnkMon").text("")
        $("#lnkTue").text("")
        $("#lnkWed").text("")
        $("#lnkThu").text("")
        $("#lnkFri").text("")
        $("#lnkSat").text("")
        $("#lnkSun").text("")
        $.ajax({
            type: "POST",
            async: false,
            url: 'BloomService.asmx/GetCustomerTruckDays',
            data: '{"CustomerNo":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                var TruckDays = output.d;
                //alert(TruckDays.length);
                if (TruckDays == '')
                    return;
                var Mon = TruckDays.substr(0, 3);
                var Tue = TruckDays.substr(3, 3);
                var Wed = TruckDays.substr(6, 3);
                var Thu = TruckDays.substr(9, 3);
                var Fri = TruckDays.substr(12, 3);
                var Sat = TruckDays.substr(15, 3);
                var Sun = TruckDays.substr(18, 3);
                $("#lnkMon").text(Mon);
                $("#lnkTue").text(Tue);
                $("#lnkWed").text(Wed);
                $("#lnkThu").text(Thu);
                $("#lnkFri").text(Fri);
                $("#lnkSat").text(Sat);
                $("#lnkSun").text(Sun);
                LoadCarrierFilterDropdown();
            }

        });
        debugger;
        var today = new Date();
        var day1 = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        var day2 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1);
        var day3 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 2);
        var day4 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 3);
        var day5 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 4);
        var day6 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 5);
        var day7 = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 6);

        var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var DayName, IdDayName, DayCarrier;
        var isShipdateAssigned = false;
        DayName = weekdays[day1.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day1);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day1));
                isShipdateAssigned = true;
            }

        DayName = weekdays[day2.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day2);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day2));
                isShipdateAssigned = true;
            }

        DayName = weekdays[day3.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day3);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day3));
                isShipdateAssigned = true;
            }

        DayName = weekdays[day4.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day4);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day4));
                isShipdateAssigned = true;
            }


        DayName = weekdays[day5.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day5);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day5));
                isShipdateAssigned = true;
            }

        DayName = weekdays[day6.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day6);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day6));
                isShipdateAssigned = true;
            }

        DayName = weekdays[day7.getDay()];
        IdDayName = "#hf" + DayName;
        $(IdDayName).val(day7);
        IdDayCarrier = "#lnk" + DayName;
        DayCarrier = $(IdDayCarrier).html().trim();
        if (isShipdateAssigned == false)
            if (DayCarrier != "") {
                $('#txtShipDate').val(formatDate(day7));
                isShipdateAssigned = true;
            }


        var date = Date.parse($('#txtShipDate').val());
        var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var weekday = weekdays[date.getDay()];
        var idname = "#lnk" + weekday;
        $(idname).css({ 'color': '#0cff41' });
        $('#lstCarrier').val($(idname).val());


    }
    function LoadCarrierFilterDropdown() {
        var length = $('#lstCarrier > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCarrierDetailsFromSPORD',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstCarrier').empty();
                    //$('#lstCarrier').append('<option value="All">All</option>');
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var DefCarrier = data[i];
                            $('#lstCarrier').append('<option value="' + DefCarrier.CarrierCode + '">' + "[" + DefCarrier.CarrierCode + "] " + DefCarrier.CarrierName + '</option>');
                        }
                    }

                    J1_10($("#lstCarrier")).selectize({
                        onChange: function () {
                            var Carrier = $("#lstCarrier")[0].value;
                            $("#hfCarrier").val(Carrier);
                        }
                    });
                    J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#hfCarrier").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();

                    var date = new Date();
                    var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                    var weekday = weekdays[date.getDay()];
                    var idname = "#lnk" + weekday;
                    if ($(idname).html() != '') {
                        $(idname).css({ 'color': '#0cff41' });
                        J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($(idname).html());
                    }

                    LoadShiptoFilterDropdown();
                },
            });
        }
        else {
            J1_10($("#lstCarrier")).selectize()[0].selectize.setValue($("#hfCarrier").val().trim());
        }
    }

    function LoadShiptoFilterDropdown() {
        debugger;

        var length = $('#lstShipto > option').length;
        if (length <= 0) {
            //$("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                async: false,
                url: 'BloomService.asmx/GetShiptoForSPORD',
                data: "{'Customer':'" + Customer + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, Shipto) {
                    $('#lstShipto').empty();
                    debugger;
                    var data = output.d;
                    var cnt = 0;
                    for (var i in data) {
                        cnt = cnt + 1;
                        var shipto = data[i];
                        if (shipto.Shipto != "") {
                            $('#lstShipto').append('<option value="' + shipto.Shipto + '">' + shipto.Shipto + ' [' + shipto.ShiptoName + ']</option>');
                        }
                    }


                    J1_10($("#lstShipto")).selectize({
                        onChange: function () {
                            var Shipto = $("#lstShipto")[0].value;
                            $("#hfShipto").val(Shipto);
                        }
                    });
                    J1_10($("#lstShipto")).selectize()[0].selectize.setValue($("#hfShipto").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    //LoadCategoryFilterDropdown();
                    FirstTimeLoad = false;
                    // $('.SearchDropDown').show();
                    //$('.Main').show();
                    //$('#tblInven').show();
                    //$("#imgOrderLoader").hide();
                    debugger;

                    if (cnt <= 0)
                        $('#trShipto').hide();
                    else
                        $('#trShipto').show();

                },
            });
        }
        else {
            J1_10($("#lstShipto")).selectize()[0].selectize.setValue($("#hfShipto").val().trim());
        }

    }
    function LoadCategoryFilterDropdown() {
        var length = $('#lstCategory > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCategories',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstCategory').empty();
                    //$('#lstCategory').append('<option value="All">All</option>');
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var Value = data[i];
                            $('#lstCategory').append('<option value="' + Value + '">' + Value + '</option>');
                        }
                    }

                    J1_10($("#lstCategory")).selectize({
                        onChange: function () {
                            debugger;
                            var Cat = $("#lstCategory")[0].value;
                            $("#hfCategory").val(Cat);
                            InvenFilter();
                        }
                    });
                    J1_10($("#lstCategory")).selectize()[0].selectize.setValue($("#hfCategory").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    if (FirstTimeLoad = true)
                        LoadVarietyFilterDropdown("");
                },
            });
        }
        else {
            J1_10($("#lstCategory")).selectize()[0].selectize.setValue($("#hfCategory").val().trim());
        }
    }

    function LoadVarietyByCat(CAT) {

        $("#imgFlowerAutocompleteLoader").css("display", "block");
        $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
        $(".YellowWarning").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetVarieties',
            data: '{"Category":"' + CAT + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                try {
                    J1_10($('#lstVariety')).selectize()[0].selectize.destroy();
                }
                catch (ex) {
                }
                $('#lstVariety').empty();
                var data = output.d;
                if (data != null) {
                    for (var i in data) {
                        debugger;
                        var Value = data[i];
                        $('#lstVariety').append('<option value="' + Value + '">' + Value + '</option>');
                    }
                }
                J1_10($("#lstVariety")).selectize()[0].selectize.setValue($("#hfVariety").val().trim());
                $("#imgFlowerAutocompleteLoader").css("display", "none");
                $(".YellowWarning").hide();
            },
        });
    }


    function LoadVarietyFilterDropdown(CAT) {
        var length = $('#lstVariety > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetVarieties',
                data: '{"Category":"' + CAT + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    try {
                        J1_10($('#lstVariety')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }
                    $('#lstVariety').empty();
                    //$('#lstVariety').append('<option value="All">All</option>');
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            debugger;
                            var Value = data[i];
                            $('#lstVariety').append('<option value="' + Value + '">' + Value + '</option>');
                        }
                    }
                    J1_10($("#lstVariety")).selectize({
                        onSelect: function () {
                            var Carrier = $("#lstVariety")[0].value;
                            $("#hfVariety").val(Carrier);
                            InvenFilter();
                        }
                    });
                    J1_10($("#lstVariety")).selectize()[0].selectize.setValue($("#hfVariety").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    LoadGradeFilterDropdown();
                },
            });
        }
        else {
            J1_10($("#lstVariety")).selectize()[0].selectize.setValue($("#hfVariety").val().trim());
        }
    }

    function LoadGradeFilterDropdown() {
        var length = $('#lstGrade > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetGrades',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstGrade').empty();
                    //$('#lstGrade').append('<option value="All">All</option>');                    
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var Value = data[i];
                            $('#lstGrade').append('<option value="' + Value + '">' + Value + '</option>');
                        }
                    }

                    J1_10($("#lstGrade")).selectize({
                        onChange: function () {
                            var Carrier = $("#lstGrade")[0].value;
                            $("#hfGrade").val(Carrier);
                            InvenFilter();
                        }
                    });
                    J1_10($("#lstGrade")).selectize()[0].selectize.setValue($("#hfGrade").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();

                    LoadColorFilterDropdown();
                },
            });
        }
        else {
            J1_10($("#lstGrade")).selectize()[0].selectize.setValue($("#hfGrade").val().trim());
        }
    }

    function LoadColorFilterDropdown() {
        var length = $('#lstColor > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetColors',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstColor').empty();
                    //$('#lstColor').append('<option value="All">All</option>');
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var Value = data[i];
                            $('#lstColor').append('<option value="' + Value + '">' + Value + '</option>');
                        }

                    }

                    J1_10($("#lstColor")).selectize({
                        onChange: function () {
                            var Carrier = $("#lstColor")[0].value;
                            $("#hfColor").val(Carrier);
                            InvenFilter();
                        }
                    });
                    J1_10($("#lstColor")).selectize()[0].selectize.setValue($("#hfColor").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    debugger;

                    $(".YellowWarning").hide();

                },
            });
        }
        else {
            J1_10($("#lstColor")).selectize()[0].selectize.setValue($("#hfColor").val().trim());
        }
    }
</script>
