<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageARXML.ascx.vb" Inherits="pages_PageARXML" %>

<div>
    <table id="fgrdARXML" style="display: none;"></table>
</div>



<div id="XMLDetails" style="display: none;">
    <table>
        <tr>
            <td><div>REQUESTXML</div>                
                <textarea rows="25" cols="40" id="DivRequestXML" style="width: 300px; height: 420px; border: none;" disabled>
                    <%--<iframe id="IfrmXMLFile" width="665" height="440"></iframe>--%>
                </textarea>
            </td>
            <td><div id="lblResponseXML">RESPONSEXML</div>                
                  <textarea rows="25" cols="40" id="DivResponseXML" style="width: 665px; height: 420px; border: none;" disabled>
                    <%--<iframe id="IfrmXMLFile" width="665" height="440"></iframe>--%>
                </textarea>
            </td>
        </tr>
    </table>
</div>



<script type="text/javascript">

    $(document).ready(new function () {
        $("#fgrdARXML").flexigrid({
            url: 'BloomService.asmx/GetARXMLListForFgrd',
            dataType: 'xml',
            colModel: [
                { display: 'DateTime', name: 'CreatedDateTime', width: 120, sortable: true, align: 'left' },
                { display: 'User', name: 'CreatedUserName', width: 50, sortable: false, align: 'left' },
                { display: 'OrderNo', name: 'OrderNo', width: 50, sortable: false, align: 'left' },                
                { display: 'ResponseXML', name: 'ResponseXML', width: 100, sortable: false, align: 'left' },
                { display: 'Status', name: 'IsSent', width: 50, sortable: false, align: 'left' },
            ],
            searchitems: [
                { display: 'User', name: 'User' },
                { display: 'Name', name: 'Name' },                
            ],
            showTableToggleBtn: true,
            sortname: "CreatedDateTime",
            sortorder: "desc",
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
            height: $(window).height() - 240,
            striped: true
        });

     
    });


    $("[id^=Req_]").die("click").live("click", function () {     
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace("Req_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetArmelliniXMLByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d.IsSent == 0) {
                    $("#lblResponseXML").css("color", "red");
                    $("#lblResponseXML").css("font-weight", "bold");
                    $("#lblResponseXML").html("ERROR")
                }
                else {
                    $("#lblResponseXML").css("color", "black");
                    $("#lblResponseXML").css("font-weight", "normal");
                    $("#lblResponseXML").html("RESPONSEXML")
                }
                $("#DivRequestXML").html("");
                $("#DivResponseXML").html("");
                var xmlReq = $.parseXML('<root>' + output.d.RequestXML + '</root>');
                var $xmlReq = $(xmlReq);
                $("#DivRequestXML").text($xmlReq.find('root').html());
                var xmlRes = $.parseXML('<root>' + output.d.ResponseXML + '</root>');
                var $xmlRes = $(xmlRes);
                $("#DivResponseXML").text($xmlRes.find('root').html());
                $("#XMLDetails").dialog("open");
            }
        });
    });

    $("[id^=Res_]").die("click").live("click", function () {        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace("Res_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetArmelliniXMLByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != null) {
                    if (output.d.IsSent == 0) {
                        $("#lblResponseXML").css("color", "red");
                        $("#lblResponseXML").css("font-weight", "bold");
                        $("#lblResponseXML").html("ERROR")
                    }
                    else {
                        $("#lblResponseXML").css("color", "black");
                        $("#lblResponseXML").css("font-weight", "normal");
                        $("#lblResponseXML").html("RESPONSEXML")
                    }
                    $("#DivRequestXML").html("");
                    $("#DivResponseXML").html("");
                    var xmlReq = $.parseXML('<root>' + output.d.RequestXML + '</root>');
                    var $xmlReq = $(xmlReq);
                    $("#DivRequestXML").text($xmlReq.find('root').html());
                    var xmlRes = $.parseXML('<root>' + output.d.ResponseXML + '</root>');
                    var $xmlRes = $(xmlRes);
                    $("#DivResponseXML").text($xmlRes.find('root').html());
                    $("#XMLDetails").dialog("open");
                }
              
            }
        });
    });


    $("#XMLDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "XML Response",
        width: 1000,
        height: 540,
        modal: true,
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


</script>
