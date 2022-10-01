<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageShipto.ascx.vb" Inherits="pages_PageShipto" %>

<script src="../js/validation.js" type="text/javascript"></script>
<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .close {
        background: url(images/Filter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .trSelectedHeader {
        background-color: red !important;
    }
    #EditShipto
    {
        height:340px !important;
    }
</style>

<table>
    <tr>
        <td>
            <div id="DialogCustomerShipto">
                <table id="fgrdCustShipto"></table>
                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldShiptoId" style="display: none;"></div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <input id="btnShiptoCarrier" type="button" class="BloomButtonEnabled" value="Carriers" style="margin-left: 5px; width: 65px;">
        </td>
    </tr>
</table>

<div id="EditShipto" style="display: none">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr style="min-height: 25px;">
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
                <td style="width: 105px;"><label style="font-size:12px;">Shipto #</label></td>
                <td>
                    <input type="text" id="txtShiptoStore" style="width: 35px;background: cornsilk;"   class="ClsNumbersOnly"; maxlength="4"; placeholder="0";>
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">Name</label></td>
                <td>
                    <input type="text" id="txtShiptoName" style="width: 350px;text-transform: uppercase;background: cornsilk;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">Address</label></td>
                <td>
                    <input type="text" id="txtShiptoAddress1" style="width: 350px;text-transform: uppercase;background: cornsilk;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" id="txtShiptoAddress2" style="width: 350px;text-transform: uppercase;background: cornsilk;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">City</label></td>
                <td>
                    <input type="text" id="txtShiptoCity" style="width: 250px;text-transform: uppercase;background: cornsilk;" maxlength="20">
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">State</label></td>
                <td>
                    <input type="text" id="txtShiptoState" style="width: 30px;text-transform: uppercase;background: cornsilk;" maxlength="2">
                    <label>Zip code</label>
                    <input type="text" id="txtShiptoZip" style="width: 100px;text-transform: uppercase;background: cornsilk;" maxlength="9">
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">Country</label></td>
                <td>
                   <%-- <input type="text" id="txtShiptoCountry" style="width: 250px;" maxlength="20">--%>
                      <select id="txtShiptoCountry" style="width: 155px;background: cornsilk;"></select>
                </td>
            </tr>
            <tr>
                <td><label style="font-size:12px;">Phone</label></td>
                <td>
                    <input type="text" id="txtShiptoPhone" style="width: 150px;background: cornsilk;" maxlength="15">
             <%--       <label>Fax</label>
                    <input type="text" id="txtShiptoFax" style="width: 150px;background: cornsilk;" maxlength="15">--%>
                </td>
            </tr>
<%--            <tr>
                <td><label style="font-size:12px;">Contact</label></td>
                <td>
                    <input type="text" id="txtShiptoContact" style="width: 350px;background: cornsilk;" maxlength="30">
                </td>
            </tr>--%>
            <tr>
                <td><label style="font-size:12px;">Call Days</label></td>
                <td>
                    <label>M</label>
                    <input type="text" id="txtShiptoCallDaysMon" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>T</label>
                    <input type="text" id="txtShiptoCallDaysTue" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>W</label>
                    <input type="text" id="txtShiptoCallDaysWed" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>T</label>
                    <input type="text" id="txtShiptoCallDaysThu" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>F</label>
                    <input type="text" id="txtShiptoCallDaysFri" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>S</label>
                    <input type="text" id="txtShiptoCallDaysSat" style="width: 30px;background: cornsilk;" maxlength="1" />
                    <label>S</label>
                    <input type="text" id="txtShiptoCallDaysSun" style="width: 30px;background: cornsilk;" maxlength="1" />
                </td>
            </tr>
            <tr>
                <td>
                    <label style="font-size:12px;">Time to call</label>
                </td>
                <td>
                    <input type="text" id="txtShiptoCallTime" style="width: 60px;background: cornsilk;" maxlength="4" />
                    <label style="font-size:12px;">Caller ID#</label>
                    <input type="text" id="txtShiptoCallerID" style="width: 40px;background: cornsilk;" maxlength="3" />
                </td>
            </tr>
            <tr>
                <td>
                    <label style="font-size:12px;">Preferred Carrier</label>
                </td>
                <td>
                    <input type="text" id="txtShiptoCarrier" style="width: 60px;background: cornsilk;" maxlength="3" />
                </td>
            </tr>
            <tr>
                <td>
                    <label style="font-size:12px;">Comment</label>
                </td>
                <td>
                    <input type="text" id="txtShiptoComment" style="width: 600px;background: cornsilk;" maxlength="65" />
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DivCustomerNo" style="display: none;" runat="server"></div>
<div id="DivShiptoID" style="display: none;"></div>

<script>

    var Customer = $("#ctl00_DivCustomerNo").html();
    $(document).ready(new function () {
        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";

        $("#txtShiptoCallTime").mask("99:99");
        $("#txtShiptoPhone").mask("(999)-999-9999");
        //$("#txtShiptoFax").mask("(999)-999-9999");

        /*Load Shipto grid details by Abi :: 16May2018*/
        $("#fgrdCustShipto").flexigrid({
            url: 'BloomService.asmx/GetShiptoDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '#', name: 'Shipto', width: 30, sortable: true, align: 'right', process: HeaderRowClick },
                { display: 'NAME', name: 'Name', width: 200, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'ADDRESS1', name: 'ADDRESS1', width: 200, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'CITY', name: 'CITY', width: 100, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'STATE', name: 'STATE', width: 40, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'PHONE', name: 'PHONE', width: 100, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'COMMENT', name: 'Comment', width: 230, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'NAME', name: 'Name' },
                { display: 'CITY', name: 'City' },
            ],
            showTableToggleBtn: true,
            sortname: "Shipto",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 250,
            width: 1270,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'Customer', value: Customer }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewShipto },
            ],
            onSuccess: function () {
                
                if ($("#DivShiptoID").html() != "0" && $("#fgrdCustShipto #row" + $("#DivShiptoID").html()).css('display') == "table-row") {
                    var id = $("#DivShiptoID").html();
                    $("#fgrdCustShipto [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCustShipto td.unsorted").addClass("sorted");
                    $("#fgrdCustShipto td.sorted").removeClass("unsorted");
                    $("#fgrdCustShipto #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCustShipto #row" + id).removeClass("trSelected");
                    $("#fgrdCustShipto #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCustShipto #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#DivShiptoID").html($("#fgrdCustShipto tr:first").attr("id").replace("row",""));
                    $("#fgrdCustShipto tr:first").addClass("trSelectedHeader trSelected");
                }

                var sel = jQuery("#fgrdCustShipto tbody tr");
                var len = sel.length;

                if (len > 1) {
                    $("#DialogCustomerShipto #ExportCSV").show();
                }

                var wtf = $("#fgrdCustShipto").closest('div');
                var height = wtf[0].scrollHeight;
                wtf.scrollTop(height);
            },
            onError: function (xhr, status, errorThrown) {
                
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DialogCustomerShipto .sDiv").css('float', 'left').css('width', '490px');
        $('#DialogCustomerShipto .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DialogCustomerShipto .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DialogCustomerShipto .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DialogCustomerShipto .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -29px').show();
        LoadCountry();
        
});
     function LoadCountry(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCountryCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#txtShiptoCountry').empty();
                var CountryData = output.d;
                for (var i in CountryData) {
                    var Country = CountryData[i];
                    $('#txtShiptoCountry').append('<option value="' + Country.COUNTRY + '">' + Country.COUNTRY + ' - ' + Country.NAME + '</option>');                    
                }
                //2021/08/20
                //callback(true);
                if (callback) {
                    callback(true);
                } 
            }
        });
    }
    //$('#DialogCustomerShipto').dialog({
    //    title: 'Shipto Maintenance :: ' + Customer,
    //    autoOpen: false,
    //    resizable: false,
    //    modal: true,
    //    close: function (event, ui) {
    //        $(this).dialog('destroy').remove();
    //    },
    //    open: function () {
    //    }
    //});

    /*Selected row higlighted with red color by Abi :: 16May2018*/
    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#DivShiptoID").html(id.toString());

                $("#fgrdCustShipto [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCustShipto #row" + id).addClass("trSelectedHeader");
                $("#fgrdCustShipto td.unsorted").addClass("sorted");
                $("#fgrdCustShipto td.sorted").removeClass("unsorted");
                $("#fgrdCustShipto #row" + id).removeClass("trSelected");
                $("#fgrdCustShipto #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCustShipto #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    /*Dialog for Add/Edit screen to Save by Abi :: 17May2018*/
    $("#EditShipto").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 750,
        height: 480,
        title: 'Shipto Maintenance',
        buttons: {
            Save: function () {
                
                validation(function(callback1)
                {
                    
                    if (callback1 == true) {
                        
                        var ShiptoID = $("#DivShiptoID").html();
                        var Shipto = $("#txtShiptoStore").val();
                        var ShiptoName = $("#txtShiptoName").val();
                        var Address1 = $("#txtShiptoAddress1").val();
                        var Address2 = $("#txtShiptoAddress2").val();
                        var City = $("#txtShiptoCity").val();
                        var State = $("#txtShiptoState").val();
                        var Zip = $("#txtShiptoZip").val();
                        var Country = $("#txtShiptoCountry").val();
                        var Phone = $("#txtShiptoPhone").val().replace(/[()-]/g, '');
                        //var Fax = $("#txtShiptoFax").val().replace(/[()-]/g, '');
                        var Fax = "";
                        var Contact = $("#txtShiptoContact").val();

                        var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        var Calls = '';
                        for (var i = 0; i < days.length; i++) {
                            Calls += $("#txtShiptoCallDays" + days[i]).val() == "" ? " " : $("#txtShiptoCallDays" + days[i]).val();
                        }

                        var CallTime = $("#txtShiptoCallTime").val().replace(":", "");
                        var Caller = $("#txtShiptoCallerID").val();
                        var Carrier = $("#txtShiptoCarrier").val();
                        var Comment = $("#txtShiptoComment").val();

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveShiptoDetails',
                            data: '{"ID":"' + ShiptoID + '","Shipto":"' + Shipto.toUpperCase() + '","ShiptoName":"' + ShiptoName.toUpperCase() + '","Address1":"' + Address1.toUpperCase() + '","Address2":"' + Address2.toUpperCase() + '","City":"' + City.toUpperCase() + '","State":"' + State.toUpperCase() + '","Zip":"' + Zip + '","Country":"' + Country + '","Phone":"' + Phone + '","Fax":"' + Fax + '","Contact":"' + Contact + '","Calls":"' + Calls + '","CallTime":"' + CallTime + '","Caller":"' + Caller + '","Carrier":"' + Carrier.toUpperCase() + '","Comment":"' + Comment.toUpperCase() + '","Customer":"' + Customer.toUpperCase() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                
                                if (output.d == "Success") {
                                    $("#EditShipto").dialog("close");
                                    $("#fgrdCustShipto").flexReload({ url: 'url/for/refresh' });

                                }
                                else {
                                    $(".Warning").show();
                                }
                            }
                        });
                    }
                })
               
                
            },
            Cancel: function () {
                
                $(this).dialog("close");
            },
        },
        open: function () {
            $("#txtShiptoStore").focus();
            $(".YellowWarning").html("");
            $(".YellowWarning").hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function validation(callback)
    {
        if($("#txtShiptoStore").val()=="" || $("#txtShiptoStore").val()=="0" || $("#txtShiptoStore").val()==0 )
        {
            $(".YellowWarning").html("Store# cannot be Empty Or 0. Please assign a VALID Store#")
            $(".YellowWarning").show();
            $("#txtShiptoStore").focus();
            callback(false);
        }
        else if ($("#txtShiptoStore").val() != "" || $("#txtShiptoStore").val() != "0" || $("#txtShiptoStore").val() != 0) {
            
            var shipto = $("#txtShiptoStore").val();
            $.ajax({
                type: "POST",
                url: "BloomService.asmx/isExistShipToForCustomer",
                data: "{'Customer':'" + Customer + "','ShipTo':'" + shipto + "','ShipToId':'" + $("#DivShiptoID").html() + "'}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (output) {
                    
                    var res = output.d;
                    if (parseInt(res) > 0) {
                        $(".YellowWarning").html("Store#(" + $("#txtShiptoStore").val() + ") already exist for this Customer(" + Customer + ")!.")
                        $(".YellowWarning").show();
                        $("#txtShiptoStore").focus();
                        callback(false);
                    } else { callback(true); }
                }
            });
        }
        else {
            $(".YellowWarning").hide();
            callback(true);
        }
    }

    function AddNewShipto() {
        
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#DivShiptoID").html("0");
        $('#txtShiptoCountry').val('US');
        var Shipto, ShiptoName = '';

        GetNextShiptoValue(function (callback1, Shipto) {
            if (callback1 == true) {

                GetCustomerNameForShipto(function (callback2, ShiptoName) {
                    if (callback2 == true) {


                        $("#txtShiptoStore").val(Shipto);
                        $("#txtShiptoName").val(ShiptoName);
                        $("#txtShiptoAddress1").val("");
                        $("#txtShiptoAddress2").val("");
                        $("#txtShiptoCity").val("");
                        $("#txtShiptoState").val("");
                        $("#txtShiptoZip").val("");
                        $("#txtShiptoCountry").val("");
                        $("#txtShiptoPhone").val("");
                        //$("#txtShiptoFax").val("");
                        $("#txtShiptoContact").val("");

                        var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

                        for (var i = 0; i < days.length; i++) {
                            $("#txtShiptoCallDays" + days[i]).val("");
                        }

                        $("#txtShiptoCallTime").val("");
                        $("#txtShiptoCallerID").val("");
                        $("#txtShiptoCarrier").val("");
                        $("#txtShiptoComment").val("");

                        $("#EditShipto").dialog('option', 'title', "Shipto Maintenance");
                        $("#EditShipto").dialog("open");
                    }
                })
            }
        })
    }

    function GetNextShiptoValue(callback) {
        
        var Shipto = 0;
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetNextShiptoValue",
            data: "{'Customer':'" + Customer + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (output) {
                
                var res = output.d;
                if (res.toString() != "") {
                    
                    Shipto = parseInt(res);
                    callback(true, Shipto);
                }
              

            }
        });
      
    }

    function GetCustomerNameForShipto(callback) {
        var ShiptoName = '';
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetCustomerNameForShipto",
            data: "{'Customer':'" + Customer + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (output) {
                var res = output.d;
                if (res != "") {
                    
                    ShiptoName = res;
                    callback(true, ShiptoName)
                }
            }
        });
       
    }

    /*Edit the shipto values on Edit screen by Abi :: 17May2018*/
    $("[id^=EditShipto_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ShiptoID = ID.replace("EditShipto_", "");
        $("#EditShipto").dialog('option', 'title', "Shipto Maintenance");
        $("#EditShipto").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetShiptoDetailsByID',
            data: '{"ID":"' + ShiptoID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var ShiptoDet = output.d;
                    $("#DivShiptoID").html(ShiptoDet[0].ID);
                    $("#txtShiptoStore").val(ShiptoDet[0].Shipto);
                    $("#txtShiptoName").val(ShiptoDet[0].Name);
                    $("#txtShiptoAddress1").val(ShiptoDet[0].ADDRESS1);
                    $("#txtShiptoAddress2").val(ShiptoDet[0].ADDRESS2);
                    $("#txtShiptoCity").val(ShiptoDet[0].CITY);
                    $("#txtShiptoState").val(ShiptoDet[0].STATE);
                    $("#txtShiptoZip").val(ShiptoDet[0].ZIP);
                    $("#txtShiptoCountry").val(ShiptoDet[0].COUNTRY);
                    $("#txtShiptoPhone").val(ShiptoDet[0].PHONE);
                    //$("#txtShiptoFax").val(ShiptoDet[0].Fax);
                    $("#txtShiptoContact").val(ShiptoDet[0].Contact);

                    var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

                    var CallDays = ShiptoDet[0].Calls;
                    var CDays = "";
                    if (CallDays != "") {
                        var splitCDays = CallDays.split('');
                        for (var i = 0; i < splitCDays.length; i++) {
                            switch (i) {
                                case i:
                                    if (splitCDays[i] != " ") {
                                        (splitCDays.length == 1) ? CDays = days[i] : CDays += "&nbsp;&nbsp;" + days[i];
                                    }
                                    $("#txtShiptoCallDays" + days[i]).val(splitCDays[i].trim());
                                    break;
                            }
                        }
                    }

                    $("#txtShiptoCallTime").val(ShiptoDet[0].CallTime);
                    $("#txtShiptoCallerID").val(ShiptoDet[0].Caller);
                    $("#txtShiptoCarrier").val(ShiptoDet[0].Carrier);
                    $("#txtShiptoComment").val(ShiptoDet[0].Comment);

                    $("#fgrdCustShipto [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCustShipto #row" + ShiptoID).addClass("trSelectedHeader");
                    $("#fgrdCustShipto td.unsorted").addClass("sorted");
                    $("#fgrdCustShipto td.sorted").removeClass("unsorted");
                    $("#fgrdCustShipto #row" + ShiptoID).removeClass("trSelected");
                    $("#fgrdCustShipto #row" + ShiptoID + " td.sorted").addClass("unsorted");
                    $("#fgrdCustShipto #row" + ShiptoID + " td.unsorted").removeClass("sorted");

                    $("#EditShipto").dialog('option', 'title', "Shipto Maintenance");
                    $("#EditShipto").dialog("open");
                }
            }
        });
    });

    /*Confirmation dialog to Delete the shipto by Abi::17May2018*/
    $("[id^=DeleteShipto_]").die("click").live("click", function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteShipto_', '');
        $('#OldShiptoId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetShiptoDetailsByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + res[0].Shipto + " - " + res[0].Name + "</b> ?</p>");
                $("#Deleteconfirm").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    /*Delete shipto details from table by Abi :: 17May2018*/
    $("#Deleteconfirm").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteShipto_" + $("#OldShiptoId").html());
                var ID = $("#OldShiptoId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteShiptoDetails',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdCustShipto").flexReload({ url: '/url/for/refresh' });
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

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoStore") {
                    $("#txtShiptoName").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoName") {
                    $("#txtShiptoAddress1").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoAddress1") {
                    $("#txtShiptoAddress2").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoAddress2") {
                    $("#txtShiptoCity").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCity") {
                    $("#txtShiptoState").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoState") {
                    $("#txtShiptoZip").focus();
                    return false;
                }

                else if ($(this).attr('id') == "txtShiptoZip") {
                    $("#txtShiptoCountry").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCountry") {
                    $("#txtShiptoPhone").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoPhone") {
                    //$("#txtShiptoFax").focus();
                    $("#txtShiptoContact").focus();
                    return false;
                }
                //else if ($(this).attr('id') == "txtShiptoFax") {
                //    $("#txtShiptoContact").focus();
                //}
                else if ($(this).attr('id') == "txtShiptoContact") {
                    $("#txtShiptoCallDaysMon").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysMon") {
                    $("#txtShiptoCallDaysTue").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysTue") {
                    $("#txtShiptoCallDaysWed").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysWed") {
                    $("#txtShiptoCallDaysThu").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysThu") {
                    $("#txtShiptoCallDaysFri").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysFri") {
                    $("#txtShiptoCallDaysSat").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysSat") {
                    $("#txtShiptoCallDaysSun").focus();
                }
                else if ($(this).attr('id') == "txtShiptoCallDaysSun") {
                    $("#txtShiptoCallTime").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallTime") {
                    $("#txtShiptoCallerID").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCallerID") {
                    $("#txtShiptoCarrier").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoCarrier") {
                    $("#txtShiptoComment").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShiptoComment") {
                    $("#EditShipto").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
        }
    });

    $("#btnShiptoCarrier").die("click").live("click", function () {
        
        $(".imgLoaderForUser").show();
        var Customer = $("#ctl00_DivCustomerNo").html();
        var Shipto = $("#fgrdCustShipto #row" + $("#DivShiptoID").html() + "").find("td div").eq(2)[0].innerText;
        var para = 'Customer=' + Customer + '&Shipto=' + Shipto;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCarrierCode.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DialogShiptoCarriers">/div>').dialog({
                    title: 'Carrier code Maintenance :: ' + Customer,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 760,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DialogShiptoCarriers").html(output.d).dialog("open");
            }
        });
    });


</script>
