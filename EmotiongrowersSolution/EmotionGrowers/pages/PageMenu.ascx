<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageMenu.ascx.vb" Inherits="pages_PageMenu" %>

<link rel="stylesheet" href="css/Head.css">



<div id='cssmenu'>
<ul>
   <li class='active'><a href='#'><span>Pending</span></a></li>
    <li><a href='#'><span>Confirmed</span></a></li>
   <li><a href='#'><span>Users</span></a></li>
   <li><a href='#'><span>Availability</span></a></li>
    <li><a href='#'><span>Credits</span></a></li>
   <li class='last'><a href='#'><span>Logout</span></a></li>
</ul>

</div>

<script type="text/javascript">

    $("#cssmenu a").live("click", function (event) {
        
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).show();
        event.preventDefault();
    });

</script>