<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ApprovalMaster.aspx.vb" Inherits="ApprovalMaster" %>

<!DOCTYPE html>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approval Dashboard</title>
    <link rel="shortcut icon" href="images/dflower2.ico" type="image/x-icon" style="padding-top: 8px;" />
    <link rel="icon" href="images/dflower2.ico" type="image/x-icon" />
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)" />
    <meta name="google" content="notranslate" />
    <meta http-equiv="Content-Language" content="en_US" />
</head>
<body>
    <form id="form1" runat="server">
        <div></div>
        <div>
            <table style="margin: 5px;">
                <tr>
                    <td>
                        <input type="button" id="btnPrice" value="Price" class="btnOff" style="cursor:pointer" />
                    </td>
                    <td>
                        <input type="button" id="btnCreditLimits" value="Credit Limits" class="btnOff" />
                    </td>
                    <td>
                        <input type="button" id="btnClose" value="Close" class="btnOff" style="cursor:pointer"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>


</body>

<style type="text/css">
    .btnOff {
        border-radius: 3px;
        -webkit-box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        -moz-box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        font-size: 17px;
        color: #ff0000;
        padding: 1px 17px;
        background: #96c300;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#96c300), color-stop(100%,#648c00));
        background: -moz-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: -webkit-linear-gradient(top, #a9a9a9 0%, #ffffff 100%);
        background: -o-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: -ms-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: linear-gradient(top, #96c300 0%, #648c00 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#96c300', endColorstr='#648c00',GradientType=0 );
    }

    .btnOn {
        border-radius: 3px;
        -webkit-box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        -moz-box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        box-shadow: 0px 2px 2px rgba(0,0,0,0.4);
        font-size: 17px;
        color: #ffffff;
        padding: 1px 17px;
        background: #96c300;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#96c300), color-stop(100%,#648c00));
        background: -moz-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: -webkit-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: -o-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: -ms-linear-gradient(top, #96c300 0%, #648c00 100%);
        background: linear-gradient(top, #96c300 0%, #648c00 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#96c300', endColorstr='#648c00',GradientType=0 );
    }
</style>
</html>

<script type="text/javascript">
    var isbtnPrice;
    var timer;
    //var audioElement;
    $(document).ready(function () {
        //audioElement = document.createElement('audio');
        //audioElement.setAttribute('src', 'Pling.wav');        
    });

    $("#btnPrice").live("click", function () {
        var btnclassname = $('#btnPrice').attr('class');
        if (btnclassname == 'btnOff') {
            $("#btnPrice").removeClass("btnOff");
            $("#btnPrice").addClass("btnOn");
            timer = setInterval(function () { GetPendingRecordsToApprove() }, 25000);
        }
        else {
            clearInterval(timer)
            $("#btnPrice").removeClass("btnOn");
            $("#btnPrice").addClass("btnOff");
        }
    });

    function GetPendingRecordsToApprove() {
        
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetPendingRecordsToApprove",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                debugger;
              
                var PendingRecNoToApprove = result.d;
                if (PendingRecNoToApprove != null) {                    
                    for (i = 0; i <= PendingRecNoToApprove.length; i++) {
                        debugger;
                        //audioElement.play();
                        window.open("Approvals.aspx?RecNo=" + PendingRecNoToApprove[i].RecNo + "");                        
                    }
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }
    $("#btnClose").live("click", function () {
        window.close();
    });

</script>

