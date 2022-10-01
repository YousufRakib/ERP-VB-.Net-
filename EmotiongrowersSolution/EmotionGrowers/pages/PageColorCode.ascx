<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageColorCode.ascx.vb" Inherits="pages_PageColorCode" %>
<style>
    .codelist {        
        display: inline-block;        
        position: relative;
        width: 100px;
        border: 1px solid Black;
        border-radius: 1px;
        padding-left: 40px;
        padding-right: 5px;
        line-height: 31px;
        cursor: pointer;
        white-space: nowrap;
        overflow: hidden !important;
        text-overflow: ellipsis;
        font-size: small;
        margin:3px;
        font-weight:bold;
    }
</style>
<div id="divColorCode" style="padding:5px;overflow:auto;"></div>

<script type="text/javascript">

    $(document).ready(new function () {
        $("#divColorCode").css("height", $(window).height()-120);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetColorCodeList',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "")
                    $("#divColorCode").html(output.d);
            }
        });
    });

</script>
