<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageDynamicGrid.ascx.vb" Inherits="pages_PageDynamicGrid" %>
<script type="text/javascript" src="js/jquery.flexigrid_Dynamic.js"></script>

<table style="width:100%">
    <tr>
        <td>
            <select name="lstTableName" id="lstTableName"  style="display:none"></select>
        </td>
        
    </tr>
    
    <tr>
        <td>
            Select Query<textarea id="txtSearchtext" style="width:50%; margin-left:10px" rows="4" cols="50"></textarea><input id="btnClick" type="button" class="Acctionbuttons" style="width:90px; margin-left:15px" value="Click" />
        </td>
   </tr>
</table>

<div id="fgrdQry"><table id="fgrdCommon"></table></div> 

<script type="text/javascript">
    var Headerarray = [];
    $(document).ready(new function () {
        $.ajax({
            type: "POST",
            async: false,
            url: 'BloomService.asmx/GettableList',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var data = output.d;
                for (var i in data) {
                    var itemgroup = data[i];
                    $('#lstTableName').append('<option value="' + itemgroup.TableName + '">' + itemgroup.TableName + '</option>');

                }
            }
        });


        $("#txtpcontrol1").val("1");
        $("#divtotalrows").html("");
        $("#hfrpdefaultval").val(parseInt(($(window).height() - 150) / 28))
        $("#txtquery").val("");
        $("#lstqtype").val("");
        $("#txtquery").hide();
        $("#lstqtype").hide();
        $("#sortName").html("");
        $("#sortType").html("");
        //$("#txtSearchtext").val("select top " + parseInt(($(window).height() - 150) / 28));
    });


    $('#btnClick').click(function () {

        $("#divtotalrows").html("");
        $("#fgrdCommon").empty();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetRowsCount',
            data: '{"Qry":"' + $("#txtSearchtext").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#divtotalrows").html(output.d);
                
                if ((parseInt(parseInt($("#divtotalrows").html()) / parseInt(($(window).height() - 150) / 28)) + 1) < parseInt($("#txtpcontrol1").val())) {
                    $("#txtpcontrol1").val("1");
                }
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetDyamicFlexiGrid',
                    data: '{"tableName":"' + $("#txtSearchtext").val() + '","Page":"' + $("#txtpcontrol1").val() + '","rp":"' + $("#lstrp").val() + '","Query":"' + $("#txtquery").val() + '","qtype":"' + $("#lstqtype").val() + '","SortName":"' + $("#sortName").html() + '","SortOrder":"' + $("#sortType").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        var data = output.d;

                        if (data == "[]" || data == null) {
                            $("#lblNoRecord").show();
                            $("#txtquery").hide();
                            $("#lstqtype").hide();

                        }
                        else {
                            $("#lblNoRecord").hide();
                            $("#txtquery").show();
                            $("#lstqtype").show();
                        }

                        if (output.d == null) {
                            $("#lblNoRecord").hide();
                        }

                        $("#txtquery").val("");
                        var table = data;
                        var obj = $.parseJSON(data);
                        $("#fgrdQry").empty();
                        $("#fgrdQry").append("<table id='fgrdCommon'></table>")
                        $("#fgrdCommon").flexAddData(formatEmployeeResults(obj));
                        $("#fgrdQry.bDiv").css("height", $(window).height() - 255);
                        $("#txtquery").show();
                        $("#lstqtype").show();
                        $("#txtpcontrol1").show();
                        $("#lstrp").show();
                        $("#sortName").html("");
                        $("#sortType").html("");
                    }
                });
                //   $("#fgrdCommon").flexOptions({ params: [{ rp: '10', value: $("#MAWBId").html() }] }).flexReload();
            }
        });
    });



    function formatEmployeeResults(jsondata) {

        var rows = Array();
        Headerarray = [];
        SearchItem = [];
        var str = "";
        var str1 = "";
        var colmodel = "";
        var searchitems = "";
        var searchitems1 = "";
        var col = jsondata[0];
        $('#lstqtype').empty();

        //create dynamicheader
        for (var key in col) {
            if (key == "Row" || key == "ID") {
                str = "{display:'" + key + "',name:'" + key + "',width: 115, sortable: true, align: 'center',hide:true}"
                Headerarray.push(str)
                // SearchItem.push(str1)

            }
            else {
                $('#lstqtype').append('<option value=' + key + ' style="width:100px">' + key + '</option>');
                str = "{display:'" + key + "',name:'" + key + "N" + "',width: 110, sortable: true, align: 'center'}"
                str1 = "{display:'" + key + "',name:'" + key + "'}"
                Headerarray.push(str);
                SearchItem.push(str1);
            }


        }

        //to create dyanmic cell 
        for (i = 0; i < jsondata.length; i++) {
            var item = jsondata[i];
            rows.push({ cell: [] })
            for (var key in item) {



                if (rows[i].cell.length == "2") {
                    rows[i].cell.push('<a href="javascript:void(0);"  onclick="alert(' + item.ID + ')" >' + item[key] + '</a>')
                }
                else rows[i].cell.push(item[key])
            }
        }

        colmodel = Headerarray.join(',');
        searchitems = SearchItem.join(',');
        searchitems = "[" + searchitems + "]";
        colmodel = "[" + colmodel + "]";
        $("#fgrdCommon").flexOptions({ colModel: '' })
        var colmodel1 = eval("(" + colmodel + ")")
        var searchitems1 = eval("(" + searchitems + ")")

        $("#fgrdCommon").flexigrid({
            dataType: 'json',
            colModel: colmodel1,
            searchitems: searchitems1,
            showTableToggleBtn: true,
            sortname: "",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            rp: $("#lstrp").val(),
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: false,
            showTableToggleBtn: false,
            height: $(window).height() - 335,
            striped: true,
            onError: function (data) {
                alert(data.responseText);
            }
        });



        return { total: $("#divtotalrows").html(), page: $("#txtpcontrol1").val(), rows: rows }

    }

    $("#btnPrev").live("click", function () { changePages('prev'); });
    $("#btnNext").live("click", function () { changePages('next'); });
    $("#btnpLast").live("click", function () { changePages('last'); });
    $("#btnpfirst").live("click", function () { changePages('first'); });
    $("#lstrp").change(function () {
        $("#hfrpdefaultval").val($("#lstrp").val())
        $('#btnClick').click();
    });

    $("#btnfgrdSearch").live("click", function () {
        if ($("#txtSearchtext").val() == "") return;
        $('#btnClick').click();
    });

    $("#btnfgrdClear").live("click", function () {
        $("#txtquery").val("");
        $('#btnClick').click();
    });


    $("#fgrdReload").live("click", function () {
        changePages('first');
    });


    function changePages(ctype) { //change page
        if (this.loading) return true;
        
        switch (ctype) {
            case 'first': {
                $("#txtpcontrol1").val("1");
                $('#btnClick').click();
                break;
            }
            case 'prev': {
                if ($("#txtpcontrol1").val() == "1") return;
                $("#txtpcontrol1").val(parseInt($("#txtpcontrol1").val()) - 1);
                $('#btnClick').click();
                break;
            }
            case 'next': {
                if ((parseInt((parseInt($("#divtotalrows").html()) / parseInt(($(window).height() - 150) / 28))) + 1) <= $("#txtpcontrol1").val()) return
                $("#txtpcontrol1").val(parseInt($("#txtpcontrol1").val()) + 1);
                $('#btnClick').click();
                break;
            }
            case 'last': {
                if ((parseInt($("#divtotalrows").html()) / parseInt(($(window).height() - 350) / 28)) % 1 === 0) {
                    $("#txtpcontrol1").val(parseInt((parseInt($("#divtotalrows").html()) / parseInt(($(window).height() - 150) / 28))))
                } else {
                    $("#txtpcontrol1").val(parseInt((parseInt($("#divtotalrows").html()) / parseInt(($(window).height() - 150) / 28))) + 1);
                }

                $('#btnClick').click();
                break;
            }

        }
    }

    $('#txtpcontrol1').die("keypress").live("keypress", function (e) {
        if (e.keyCode == 13) {
            $('#btnClick').click();
        }
    });

    $("#fgrdQry > div > div.hDiv > div > table > thead > tr > th").live("click", function () {
        
        if ($("#hfsortType").html() == "asc") {
            $("#sortName").html($(this)[0].innerText)
            $("#sortType").html("desc")
            $("#hfsortType").html("desc")
        }
        else {
            $("#sortName").html($(this)[0].innerText)
            $("#sortType").html("asc")
            $("#hfsortType").html("asc")
        }
        $('#btnClick').click();

    });


    $("#fgrdQry > div > div.cDrag > div").live("click", function () {

        var id = $(this).parent().children().index(this) + 3;
        var colwidth = $("#fgrdQry > div > div.hDiv > div > table > thead > tr > th:nth-child(" + id + ") > div")[0].style.width
        var colName = $("#fgrdQry > div > div.hDiv > div > table > thead > tr > th:nth-child(" + id + ")")[0].abbr

    });

    $("lnkGetorder").live("click", function () {

    });

    $("#lnkGetOrder").live("click", function () {

        $("#fgrdQry > div > div.hDiv > div > table > thead > tr > th").each(function () {

            var rr = [];
            rr.push($(this)[0].innerText)
            alert($(this)[0].innerText)

        });

    });

</script>
<div id="hfrp" style="display: none"></div>
<div id="divtotalrows" style="display: none"></div>
<div id="sortName" style="display: none"></div>
<div id="sortType" style="display: none"></div>
<div id="hfsortType" style="display: none">asc</div>
<input type="text" hidden="hidden" id="txtpcontrol1" size="4" style="margin-top: -28px; margin-left: 192px; position: absolute" />
<select name="rp" id="lstrp" hidden="hidden" style="margin-top: -28px; position: fixed; margin-left: 40px;">
    <option value="10" selected="selected">10&nbsp;&nbsp;</option>
    <option value="15">15&nbsp;&nbsp;</option>
    <option value="20">20&nbsp;&nbsp;</option>
    <option value="25">25&nbsp;&nbsp;</option>
    <option value="40">40&nbsp;&nbsp;</option>
</select>
<input type="hidden" id="hfrpdefaultval" />


<input type="text" id="txtquery" size="30" style="position: fixed; margin-top: -60px; margin-left: 82px;">
<select name="lstqtype" id="lstqtype" style="margin-top: -58px; position: absolute; margin-left: 327px;"></select>
<label id="lblNoRecord" hidden="hidden" style="position: absolute; margin-top: -25px; margin-left: 386px; }">No Records Found</label>

<a href='#' id='lnkGetOrder' style="color: red; float: right; display: none">GetOrder</a>

<style type="text/css">
    .sdesc {
        background: Green;
    }

    .sasc {
        background: Grey;
    }
</style>