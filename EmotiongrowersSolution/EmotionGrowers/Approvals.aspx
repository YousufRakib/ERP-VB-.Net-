<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Approvals.aspx.vb" Inherits="pages_pageApprovals" %>

<!DOCTYPE html>

<title>Approvals</title>
<link rel="shortcut icon" href="images/dflower2.ico" type="image/x-icon" style="padding-top: 8px;" />
<link rel="icon" href="images/dflower2.ico" type="image/x-icon" />
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)" />
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)" />
<meta name="google" content="notranslate" />
<meta http-equiv="Content-Language" content="en_US" />

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
    }

    table td input {
        margin: 3px;
    }

    table tr input {
        height: 30px;
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

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
</head>
<body>
    <form>
        <div id="DivApprovalsDetails" style="margin: auto; width: 849px; left: 50%; top: 50%; border: 3px solid green; padding: 10px;">

            <table id="tblApprovalsDetails" style="background-color: #f0f0f0;">
                
                <tr style="height: 50px;">
                    <td colspan="8" style="height: 50px;">
                        <label id="lblApprovalHead">Approvals</label>
                        <input type="text" id="txtRecNo" style="display:block;width: 150px; height: 20px; float: right; text-align: right;" value="">
                        
                    </td>
                    
                </tr>
                
                <tbody>
                     
                    <tr>
                        
                        <td colspan="6">
                            <hr>
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblCustomer">Customer</label></td>
                                    <td colspan="4">
                                        <input type="text" id="txtCustomerNo" style="margin-left: 19px;width: 50px; height: 20px; float: left; text-align: right;" value="">
                                        <input type="text" id="txtCustomerName" style="width: 413px; height: 20px; float: left" value=""></td>
                                </tr>
                            </table>
                        </td>

                        <%--<td colspan="3">    
                          
                        </td>--%>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblAwb">Awb</label>
                                    </td>

                                    <td>
                                        <input type="text" id="txtAwb" style="width: 120px; height: 20px; float: left; text-align: right; margin-left: 52px;" value="">
                                    </td>
                                    <td>
                                        <label id="lblDaterec">Daterec</label></td>
                                    <td>
                                        <input type="text" id="txtDaterec" style="width: 75px; height: 20px; float: left" value=""></td>
                                    <td>
                                        <label id="lblDays">Days</label></td>
                                    <td>
                                        <input type="text" id="txtDays" style="width: 50px; height: 20px; float: left;" value=""></td>
                                    <td>
                                        <label id="lblFarm" style="">Farm</label></td>
                                    <td>
                                        <input type="text" id="txtFarm" style="width: 50px; height: 20px; float: left" value=""></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblFlower">Flower</label></td>
                                    <td>
                                        <input type="text" id="txtFlower" style="margin-left: 38px; width: 120px; height: 20px; float: left" value="">
                                    </td>
                                    <td>
                                        <input type="text" id="txtDesc" style="width: 340px; height: 20px; float: left" value=""></td>
                                </tr>
                            </table>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblPrice">Price</label></td>
                                    <td>
                                        <input type="text" id="txtPrice" style="width: 80px; height: 20px; float: left; text-align: right; margin-left: 49px;" value="">

                                    <td>
                                        <input type="text" id="txtGPM" style="width: 50px; height: 20px; float: left; text-align: right;" value="">
                                        <td>
                                            <label id="lblPer">%</label>
                                        </td>
                                    </td>


                                    <td>
                                        <input type="text" id="txtLandedCost" style="width: 55px; height: 20px; float: left; text-align: right;" value=""></td>
                                    <td>
                                        <label id="lblMarket" style="">Market</label>


                                    </td>
                                    <td>
                                        <input type="text" id="txtMarket" style="margin-left:28px;width: 60px; height: 20px; float: left; text-align: right;" value=""></td>
                                </tr>
                            </table>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblBoxes" style="">Boxes</label></td>
                                    <td>
                                        <input type="text" id="txtBoxes" style="margin-left: 42px; width: 50px; height: 20px; float: left; text-align: right;" value="">
                                    </td>
                                    <td>
                                        <label style="margin-left: 178px;" id="lblCshand">On Hand</label></td>
                                    <td>
                                        <input type="text" id="txtCshand" style="margin-left: 20px;width: 60px; height: 20px; float: left; text-align: right;" value=""></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblUnits">Units</label></td>
                                    <td>
                                        <input type="text" id="txtUnits" style="margin-left: 45px; width: 50px; height: 20px; float: left; text-align: right;" value="">
                                    </td>
                                    <td>
                                        <label id="lblUOM" style="margin-left: 180px;">UOM</label></td>
                                    <td>
                                        <input type="text" id="txtUOM" style="margin-left: 43px;width: 40px; height: 20px; float: left" value=""></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label id="lblAskedby">Asked by</label></td>
                                    <td>
                                        <input type="text" id="txtAskedby" style="width: 80px; height: 20px; float: left; margin-left: 22px;" value="" />
                                    </td>
                                    <td>
                                        <label style="margin-left: 149px;" id="lblAskedDate">Asked Date</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtAskedDate" style="margin-left: 7px;width: 75px; height: 20px; float: left" value="" />
                                    </td>
                                    <td>
                                        <input type="text" id="txtAskedTime" style="width: 55px; height: 20px; float: left" value="" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>


                    <tr style="height: 40px">
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label class="trshowonlyforapproved" style="display: none;" id="lblApproved">Approved</label></td>
                                    <td>
                                        <input class="trshowonlyforapproved" type="text" id="txtApproved" style="margin-left: 20px; display: none; width: 30px; height: 20px; float: left" value="" /></td>
                                    <td>
                                        <label class="trshowonlyforapproved" style="display: none;margin-left: 197px;" id="lblApprovedby">Approved by</label>
                                    </td>
                                    <td>
                                        <input class="trshowonlyforapproved" type="text" id="txtApprovedby" style="display: none; width: 164px; height: 20px; float: left" value="" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr style="height: 40px">
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        <label class="trshowonlyforapproved" style="display: none;" id="lblTransdate">Transdate</label></td>
                                    <td>
                                        <input class="trshowonlyforapproved" type="text" id="txtTransdate" style="margin-left: 17px; display: none; width: 75px; height: 20px; float: left" value="" />
                                    </td>
                                    <td>
                                        <label class="trshowonlyforapproved" style="margin-left: 152px;display: none;" id="lblTranstime">Transtime</label></td>
                                    <td>
                                        <input class="trshowonlyforapproved" type="text" id="txtTranstime" style="margin-left:17px;display: none; width: 50px; height: 20px; float: left" value="" /></td>
                                </tr>
                            </table>
                        </td>
                </tbody>
            
                <tr>
                       
                    <td colspan="8" style="height: 80px;"> <hr>
                        <input id="btnTop" type="button" class="Menubutton" value="Top" />
                        <input id="btnPrev" type="button" class="Menubutton" value="Prev" />
                        <input id="btnNext" type="button" class="Menubutton" value="Next" />
                        <input id="btnBottom" type="button" class="Menubutton" value="Bottom" />
                        <input id="btnApprove" type="button" class="Menubutton" value="Approve" />
                        <input id="btnDeny" type="button" class="Menubutton" value="Deny" />
                        <input id="btnClose" type="button" class="Menubutton" value="Close" />
                    </td>
                </tr>



            </table>
        </div>
        <div id="OldRecNo" style="display: none"></div>
        <div id="CurrentRecNo" style="display: none"></div>
        <div id="ClosedManually" style="display: none">0</div>

        <%--<embed src="Pling.wav" width="0" height="0" id="snd" />--%>
    </form>
</body>
</html>

<script type="text/javascript">
    //var audioElement = document.createElement('audio');
    //window.onbeforeunload = function (event) {
    //    if ($("#ClosedManually").html() == "0") {
    //        var message = 'Important: Please click on \'Save\' button to leave this page.';
    //        if (typeof event == 'undefined') {
    //            event = window.event;
    //        }

    //        if (event) {
    //            event.returnValue = message;
    //        }
    //        return message;
    //    }
    //};

    $(document).ready(new function () {
        debugger;
        //audioElement.setAttribute('src', 'Pling.wav');
        //audioElement.play()
        $("#OldRecNo").val(getParameterByName("RecNo"));
        $("#CurrentRecNo").val(getParameterByName("RecNo"));
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

    $.ajax({
        type: "POST",
        url: "BloomService.asmx/GetPendingToApproveDetailsByRecNo",
        data: "{'RecNo':'" + $("#CurrentRecNo").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            debugger;
            if (result != null) {
                LoadControlsByResult(result.d)
            }
            else {
                alert("No records found");
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    });

    

    function LoadControlsByResult(data) {
        $("#txtRecNo").val(data.RecNo);
        $("#txtCustomerNo").val(data.CustomerNo);
        $("#txtCustomerName").val(data.CustomerName);
        $("#txtAwb").val(data.AWB);
        $("#txtDaterec").val(data.DateRec);

        try {
            var startDay = new Date();
            var endDay = new Date(data.DateRec);
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var millisBetween = startDay.getTime() - endDay.getTime();
            var days = millisBetween / millisecondsPerDay;            
            // Round down.
            $("#txtDays").val(Math.floor(days));            
        }
        catch (err) {           
        }

        //$("#txtDays").val();            
        $("#txtFlower").val(data.Flower);
        $("#txtFarm").val(data.Farm);
        $("#txtDesc").val(data.FlowerName);
        $("#txtPrice").val(parseFloat(data.Price).toFixed(3));
        $("#txtMarket").val(parseFloat(data.Market).toFixed(3));
        $("#txtLandedCost").val(parseFloat(data.Cost).toFixed(3));
        $("#txtGPM").val(parseFloat(data.gpm).toFixed(2));
        $("#txtBoxes").val(data.Boxes);
        $("#txtCshand").val(data.CSHAND);
        $("#txtUnits").val(data.Units);
        $("#txtUOM").val(data.Uom);
        $("#txtAskedby").val(data.AskedBy);
        
        if (data.AskedBy != null) {
            document.title = "Approvals (" + data.AskedBy + ")"
        }
        else {
            document.title = "Approvals"
        }
        
        $("#txtAskedDate").val(data.AskedDate);
        $("#txtAskedTime").val(data.AskedTime);   
        $(".trshowonlyforapproved").hide();
        if (data.Approved == "Y" || data.Approved == "N") { //show the fields based on approved
            $(".trshowonlyforapproved").show();
            $("#txtApproved").val(data.Approved);
            $("#txtApprovedby").val(data.ApprovedBy);
            $("#txtTransdate").val(data.TransDate);
            $("#txtTranstime").val(data.TransTime);
        }
    }

    $("#btnApprove").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/ApproveRecordByRecNo",
            data: "{'RecNo':'" + $("#CurrentRecNo").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d = "success") {
                    $("#ClosedManually").html("1")
                    alert("Record successfully approved")
                    window.close();
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });

    $("#btnDeny").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/DenyRecordByRecNo",
            data: "{'RecNo':'" + $("#CurrentRecNo").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d = "success") {
                    $("#ClosedManually").html("1");
                    alert("Record successfully denied")
                    window.close();
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });

    $("#btnPrev").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetDetailsByRecNo",
            data: "{'RecNo':'" + $("#CurrentRecNo").val() + "','GotoTop':" + false + ",'GotoBottom':" + false
                + ",'GotoPrev':" + true + ",'GotoNext':" + false + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d != null) {
                    $("#CurrentRecNo").val(result.d.RecNo)
                    LoadControlsByResult(result.d)
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });


    $("#btnNext").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetDetailsByRecNo",
            data: "{'RecNo':'" + $("#CurrentRecNo").val() + "','GotoTop':" + false + ",'GotoBottom':" + false
                + ",'GotoPrev':" + false + ",'GotoNext':" + true + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                debugger;
                if (result.d != null) {
                    $("#CurrentRecNo").val(result.d.RecNo)
                    LoadControlsByResult(result.d)
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });

    $("#btnBottom").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetDetailsByRecNo",
            data: "{'RecNo':'','GotoTop':" + false + ",'GotoBottom':" + true
                + ",'GotoPrev':" + false + ",'GotoNext':" + false + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d != null) {
                    $("#CurrentRecNo").val(result.d.RecNo)
                    LoadControlsByResult(result.d)
                }

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });


    $("#btnTop").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetDetailsByRecNo",
            data: "{'RecNo':'','GotoTop':" + true + ",'GotoBottom':" + false
                + ",'GotoPrev':" + false + ",'GotoNext':" + false + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.d != null) {
                    $("#CurrentRecNo").val(result.d.RecNo)
                    LoadControlsByResult(result.d)
                }

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });
    $("#btnClose").live("click", function () {
        window.close();
    });


</script>
