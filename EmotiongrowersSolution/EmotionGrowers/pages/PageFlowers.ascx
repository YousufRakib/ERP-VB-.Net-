<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageFlowers.ascx.vb" Inherits="pages_PageFlowers" %>

<script src="js/validation.js"></script>
<style>
    .codelist {
        display: inline-block;
        position: relative;
        width: 75px;
        border: 1px solid Black;
        border-radius: 1px;
        padding-left: 20px;
        padding-right: 4px;
        line-height: 25px;
        cursor: pointer;
        white-space: nowrap;
        overflow: hidden !important;
        text-overflow: ellipsis;
        font-size: small;
        margin: 3px;
        font-weight: bold;
    }

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .KometExport {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        /*/*font-size: 1.2em;*/ */ height: 16px;
    }

    .close {
        background: url(images/Filter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    #MsgHtml {
        font-weight: bold;
    }

    .import {
        background: none;
        text-indent: 8px;
        display: block;
        /* padding-right: 3px; */
        font-size: 1.2em;
        height: 18px;
    }

    .trSelectedHeader {
        background-color: red !important;
    }

    /*#EditFlowers input[type="text"] {
        height: 17px;
        background-color: cornsilk;
    }

    #EditFlowers select {
        background-color: cornsilk;
    }
          #DivFlowersForFgrd select {
        background-color:cornsilk;
    }

    #DivFlowersForFgrd select {
        background-color: cornsilk;
    }*/

    .BloomButtonEnabled2{
        margin-right: 5px !important;
    }
     #tblLoadPurchasesByProductForPageFlowers td div{
        padding:5px;
    }
      .leftButtonDuplicatebtn {
        margin-right: 140px !important;
    }
</style>
<div id="DivFlowersForFgrd">


    <div class="flexigrid">
        <div class="tDiv">
            <div class="tDiv2" style="height: 20px;">
                <div class="link"><a class="links"><span class="add" onclick="addFlowerclicked()">Add</span></a></div>
                <div class="link" style="display: none;"><a class="links"><span class="KometExport" onclick="exportFlowerclicked()">Request ID</span></a></div>
                <div style="float:right;">
                    Category<select id="lstFlowerCatForFilter" style="width: 120px;"></select>
                    Color:<select id="lstFlowerColorForFilter" style="width: 120px;"></select>
                    Variety:<select id="lstFlowerVareityForFilter" style="width: 120px;"></select>
                    Grade:<select id="lstFlowerGradeForFilter" style="width: 120px;"></select>
                </div>
            </div>
            <div style="clear: both">
            </div>

        </div>
    </div>

    <table id="fgrdFlowers" style="display: none;"></table>
    <div id="DeleteConfirmFlowerDetails" style="display: none;" title="Alert"></div>
    <div id="OldId" style="display: none;"></div>
</div>

<div id="EditFlowers" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px;">        
        <tr>
            <td style="padding-right: 50px;">Product Code</td>
            <td>
                <input type="text" id="txtFlowerCode" style="width: 210px" maxlength="20" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td>Category</td>
            <td>
                <select id="lstFlowerCat" style="width: 304px;"></select>
                <input type="hidden" id="hfFlowerCat">
            </td>
        </tr>
        <tr>
            <td>Description</td>
            <td>
                <input type="text" id="txtFlowerDesc" style="width: 300px;" maxlength="50" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td>Grade</td>
            <td>
                <select id="lstFlowerGrade" style="width: 260px;"></select>
                <input type="hidden" id="hfFlowerGrade">
             
            </td>
        </tr>
       <tr>
             <td>Color</td>
              <td>

               <select id="lstFlowerColor" style="width: 260px;"></select>
                <input type="hidden" id="hfFlowerColor">
            </td>
        </tr>


        <tr>
            <td>Variety</td>
            <td>
                <select id="lstFlowerVariety" style="width: 260px;"></select>
                <input type="hidden" id="hfFlowerVariety">
            </td>
        </tr>
        <tr>
            <td>Units per Box</td>
            <td>
                <input type="text" id="txtFlowerUnitsPerBox" style="width: 80px; text-align: right;" class="ClsNumbersOnly" placeholder="0" />
            </td>
        </tr>
        <tr>
            <td>Packed by the</td>
            <td>
                <input type="text" id="txtFlowerPackedBy" style="width: 30px;" class="AllUpperCaseTextBox" maxlength="2" />
            </td>
        </tr>
        <tr>
            <td>Sold as</td>
            <td>
                <input type="text" id="txtFlowerUOMSOLD" style="width: 30px;" class="AllUpperCaseTextBox" maxlength="2" />
            </td>
        </tr>
        <tr>
            <td>Weight</td>
            <td>
                <input type="text" id="txtFlowerWeight" style="width: 30px;"  />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Units per Bunch</td>
            <td>
                <input type="text" id="txtFlowerUnitsPerBunch" style="width: 40px; text-align: right;" placeholder="0" class="ClsNumbersOnly" />
            </td>
        </tr>
        <tr>
            <td>Screen Color</td>
            <td>
                <select id="lstFlowerScreenColor"></select>
                <input type="hidden" id="hfFlowerScreenColor">
            </td>
        </tr>
        <tr>
            <td>Days in cooler</td>
            <td>
                <input type="text" id="txtFlowerDaysInCooler" style="width: 40px; text-align: right;" placeholder="0" class="ClsNumbersOnly" />
            </td>
        </tr>
        <tr>
            <td>Sales Price</td>
            <td>
                <input type="text" id="txtFlowerSalesPrice" style="width: 100px; text-align: right;" class="ClsDecimalsOnly" placeholder="0.000" />
            </td>
        </tr>
        <tr>
            <td>G/L #</td>
            <td>
                <input type="text" id="txtFlowerGL" style="width: 120px;" class="AllUpperCaseTextBox" maxlength="10" />
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <table>
                    <tr>
                        <td> <input type="checkbox" id="txtFlowerStatus" style="width: 45px !important;" /></td>
                        <td><label style="margin-left: 10px;">User Code</label></td>
                        <td><input type="text" id="txtFlowerUserCode" style="width: 120px;" class="AllUpperCaseTextBox" maxlength="15" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="DivViewRecipeForFgrd" style="display: none;">
    <table>
        <tr>
            <td>
               <div id="DivRecipeForFgrd">

    <div class="flexigrid">
        <div class="tDiv">
            <div class="tDiv2" style="height: 20px;">
                <div class="link"><a class="links"><span class="add" onclick="addRecipeclicked()">Add</span></a></div>
               <div>
                    <table>
                     <tr>
                         <td style="font-weight: bold; font-size: small;">
                        <label style="margin-left: 435px;">Total Cost:</label>
                    </td>
                          <td style="font-weight: bold; font-size: small;">
                                    <input type="text" id="txtRecipetotcost" style="width: 80px; height: 19px; float: left; text-align: left; font-weight: bold;"
                                         readonly="readonly" />
                                </td>
                    <%-- <td style="font-weight: bold; font-size: small;">
                        <label id="lblRecipetotcost" style="margin-left: 10px;"></label>
                    </td>--%>
                     </tr>
                  </table>
               </div>
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
 
    <table id="fgrdRecipe" style="display: none;"></table>
    <div id="DeleteConfirmRecipeDetails" style="display: none;" title="Alert"></div>
    <div id="RecipeOldId" style="display: none;"></div>
</div>
            </td>
        </tr>
        
    </table>
</div>
<div id="ProductRecipeDialog" style="display: none;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    
                    <tr style="width:50px">
           <td>
                <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">PRODUCT</label>
                        </td>
            <td colspan="10" id="tdRecProduct">
                <input type="hidden" id="hfRecipeProductID"" />
                 <input type="hidden" id="hfRecipeProduct" />
                 <input type="hidden" id="hfRecipeFlower" />
                
                <input type="text" style="width: 377px;" id="txtRecipeProduct"  class="AllUpperCaseTextBox"/>
            </td>
          
        </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">QTY</label>
                        </td>
                        <td>
                            <input type="text" id="txtRecipeQTY" class="ClsNumbersOnly" style="width: 65px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">UOM</label>
                        </td>
                        <td>
                            <%--<select id="lstRecipeUOM" style="width: 68px; height: 23px; margin-bottom: 2px;"></select>--%>
                            <input type="text" style="width: 30px;" id="txtRecipeUOM"  class="AllUpperCaseTextBox" maxlength="5" placeholder="ST"/>
                            <input type="hidden" id="hfRecipeUOM" />
                        </td>
                    </tr>
                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">COST</label>
                        </td>
                        <td>
                            <input type="text" id="txtRecipeCost" class="DecimalsOnly" style="width: 65px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>


                    <tr  style="width:50px">
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">TYPE</label>
                        </td>
                        <td>
                           <%-- <input type="text" id="txtRecipeType" style="width: 21px; margin-bottom: 2px;" class="AllUpperCaseTextBox">--%>
                             <select id="lstRecipeType" style="width: 100px; height: 25px; margin-bottom: 2px;"> </select>
                            <input type="hidden" id="hfRecipeType" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="MsgFlowerWarning" style="display: none;">
    <p id="MsgFlowerHtml"></p>
</div>
<div id="msgbox-RECIPEDel" style="display: none;" title="Alert">
    <p id="msgRECIPEDelhtml"></p>
</div>

<div id="divFlowerID" style="display: none;"></div>
<div id="DivLoadPurchasesByProductForPageFlowers" style="display: none;" class="FileHover">
    <table id="tblLoadPurchasesByProductForPageFlowers" style="display: none;"></table>
</div>
<script type="text/javascript">
    debugger;
    var isDuplicateBoxMaintance = false;
    function KometVisibility() {
        var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'
        if (IsKometSales.toUpperCase() != 'YES') {
            $('.KometExport').parent().parent().hide();
        }
        else {
            $('.KometExport').parent().parent().show();
        }
    }
    $(document).ready(new function () {
        debugger;
        LoadTypes();
        LoadColors();
        LoadColorCode();
        LoadGrades("", '0');
        LoadVariety("", '0');
        var RecipeID = "0"
        var IsEditFlowersClick = false

        /*Load Flower details grid :: Modified on 19April2018 by Abi*/
        $("#fgrdFlowers").flexigrid({
            url: 'BloomService.asmx/GetFlowersForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Flower', name: 'Flower', width: 100, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Name', name: 'Name', width: 260, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'UOM', name: 'UOM', width: 40, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'UNITS', name: 'UNITS', width: 40, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'Sold as', name: 'UOMSOLD', width: 40, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'UNITS/BUNCH', name: 'BUNCH', width: 70, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'Category', name: 'CAT', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                //{ display: 'ColorCode', name: 'ColorCode', width: 100, sortable: true, align: 'center' },
                //{ display: 'Charge', name: 'Charge', width: 100, sortable: true, align: 'center' },
                //{ display: 'BOXES', name: 'BOXES', width: 100, sortable: true, align: 'center' },
                //{ display: 'BUNCHES', name: 'BUNCHES', width: 100, sortable: true, align: 'center' },
                //{ display: 'PRICE', name: 'PRICE', width: 100, sortable: true, align: 'center' },
                { display: 'VARIETY', name: 'VARIETY', width: 130, sortable: true, align: 'center', process: HeaderRowClick },
                //{ display: 'BUNCH', name: 'BUNCH', width: 100, sortable: true, align: 'center' },
                //{ display: 'WEIGHT', name: 'WEIGHT', width: 100, sortable: true, align: 'center' },
                //{ display: 'GROWER', name: 'GROWER', width: 100, sortable: true, align: 'center' },
                //{ display: 'GL', name: 'GL', width: 100, sortable: true, align: 'center' },
                //{ display: 'DUTY', name: 'DUTY', width: 100, sortable: true, align: 'center' },
                { display: 'GRADE', name: 'GRADE', width: 100, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'Color', name: 'Color', width: 100, sortable: true, align: 'center', process: HeaderRowClick },
                //{ display: 'FLORALSTAT', name: 'FLORALSTAT', width: 100, sortable: true, align: 'center' },
                //{ display: 'STATUS', name: 'STATUS', width: 100, sortable: true, align: 'center' },
                //{ display: 'DAYS', name: 'DAYS', width: 100, sortable: true, align: 'center' },
                //{ display: 'BILLCODE', name: 'BILLCODE', width: 100, sortable: true, align: 'center' },
                //{ display: 'ADDUSER', name: 'ADDUSER', width: 100, sortable: true, align: 'center' },
                //{ display: 'ADDDATE', name: 'ADDDATE', width: 100, sortable: true, align: 'center' },
                //{ display: 'ADDTIME', name: 'ADDTIME', width: 100, sortable: true, align: 'center' },
                //{ display: 'ADDAPP', name: 'ADDAPP', width: 100, sortable: true, align: 'center' },
                //{ display: 'UPDUSER', name: 'UPDUSER', width: 100, sortable: true, align: 'center' },
                //{ display: 'UPDDATE', name: 'UPDDATE', width: 100, sortable: true, align: 'center' },
                //{ display: 'UPDTIME', name: 'UPDTIME', width: 100, sortable: true, align: 'center' },
                //{ display: 'UPDAPP', name: 'UPDAPP', width: 100, sortable: true, align: 'center' },
                //{ display: 'DELUSER', name: 'DELUSER', width: 100, sortable: true, align: 'center' },
                //{ display: 'DELDATE', name: 'DELDATE', width: 100, sortable: true, align: 'center' },
                //{ display: 'DELTIME', name: 'DELTIME', width: 100, sortable: true, align: 'center' },
                //{ display: 'DELAPP', name: 'DELAPP', width: 100, sortable: true, align: 'center' },
                //{ display: 'LOCKUSER', name: 'LOCKUSER', width: 100, sortable: true, align: 'center' },
                //{ display: 'LOCKDATE', name: 'LOCKDATE', width: 100, sortable: true, align: 'center' },
                //{ display: 'LOCKTIME', name: 'LOCKTIME', width: 100, sortable: true, align: 'center' },
                //{ display: 'LOCKAPP', name: 'LOCKAPP', width: 100, sortable: true, align: 'center' },
                //{ display: 'MST_ID', name: 'MST_ID', width: 100, sortable: true, align: 'center' },
            ],
            searchitems: [
                { display: 'Flower', name: 'Flower' },
                { display: 'Category', name: 'CAT' },
                { display: 'Name', name: 'Name' },
                { display: 'VARIETY', name: 'VARIETY' },
                { display: 'GRADE', name: 'GRADE' },
                { display: 'Color', name: 'Color' },
            ],
            //buttons: [
            //    { name: 'Add', bclass: 'add', onpress: addclicked },
            //    { name: 'Request ID', bclass: 'KometExport', onpress: exportclicked },

            //    /*{ name: 'ARCOMM', bclass: 'import', onpress: importF_ARCOMMclicked,hide:true },
            //    { name: 'ARINVS', bclass: 'import', onpress: importF_ARINVSclicked,hide:true },
            //    { name: 'CARRIE', bclass: 'import', onpress: importF_CARRIEclicked,hide:true },
            //    { name: 'CRCODE', bclass: 'import', onpress: importF_CRCODEclicked,hide:true },
            //    { name: 'CREREQ', bclass: 'import', onpress: importF_CREREQclicked,hide:true },                 
            //    { name: 'CUSTDO', bclass: 'import', onpress: importF_CUSTDOclicked,hide:true },                 
            //    { name: 'CUST', bclass: 'import', onpress: importF_CUSTclicked,hide:true },
            //    { name: 'COUNTRY', bclass: 'import', onpress: importF_Countryclicked,hide:true },
            //    { name: 'FARMPR', bclass: 'import', onpress: importF_FARMPRclicked,hide:true },
            //    { name: 'FLOWER', bclass: 'import', onpress: importFlowerclicked,hide:true },
            //    { name: 'Inven', bclass: 'import', onpress: importInvenclicked,hide:true },
            //    { name: 'InvenHist', bclass: 'import', onpress: importInvenHistclicked,hide:true },
            //    { name: 'POSTATUS', bclass: 'import', onpress: importF_POSTATUSclicked,hide:true },
            //    { name: 'PROD', bclass: 'import', onpress: importF_PRODclicked,hide:true },                 
            //    { name: 'SLSMAN', bclass: 'import', onpress: importF_SLSMANSclicked,hide:true },
            //    { name: 'SPORD', bclass: 'import', onpress: importF_SPORDclicked,hide:true },
            //    { name: 'STATUS', bclass: 'import', onpress: importF_STATUSclicked,hide:true },
            //    { name: 'SHIPTO', bclass: 'import', onpress: importF_SHIPTOclicked,hide:true },
            //    { name: 'SLSMAN', bclass: 'import', onpress: importF_SLSMANclicked,hide:true },
            //    { name: 'TYPES', bclass: 'import', onpress: importcategoryclicked,hide:true },
            //    { name: 'TERMS', bclass: 'import', onpress: importF_TERMSSclicked,hide:true },
            //    { name: 'VET_', bclass: 'import', onpress: importvetclicked,hide:true },
            //    { name: 'VET1_', bclass: 'import', onpress: importvet1clicked,hide:true },

            //    { name: 'CALLHS', bclass: 'import', onpress: importF_CALLHSclicked,hide:true },
            //   { name: 'CASH', bclass: 'import', onpress: importF_CASHclicked,hide:true },
            //   { name: 'ORDER1', bclass: 'import', onpress: importF_ORDER1clicked,hide:true },
            //   { name: 'ORDER2', bclass: 'import', onpress: importF_ORDER2clicked,hide:true },
            //   { name: 'ARHIST', bclass: 'import', onpress: importARHISTclicked,hide:true },
            //   { name: 'ARADJ', bclass: 'import', onpress: importF_ARADJclicked,hide:true },
            //   { name: 'NSF', bclass: 'import', onpress: importF_NSFclicked,hide:true },
            //   { name: 'ARCARD', bclass: 'import', onpress: importF_ARCARDclicked,hide:true },
            //   { name: 'RACKS', bclass: 'import', onpress: importF_RACKSclicked,hide:true },
            //   { name: 'INVGRID', bclass: 'import', onpress: ImportINVGRIDfromDBF },
            //   { name: 'WINVNW', bclass: 'import', onpress: ImportWINVNWfromDBF },
            //   { name: 'INVTRANS', bclass: 'import', onpress: ImportInvTransfromDBF },
            //   { name: 'CTYPES', bclass: 'import', onpress: ImportF_CTYPESfromDBF },
            //   { name: 'FARMBR', bclass: 'import', onpress: ImportF_FARMBRfromDBF },*/
            //],
            showTableToggleBtn: true,
            sortname: "Flower",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 250,
            width: 1085,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                //For to show the error

                if ($("#fgrdFlowers tr#row-2").length > 0) {
                    $("#fgrdFlowers tr#row-2").hide();
                    $.MessageBox($("#fgrdFlowers tr#row-2")[0].innerText);
                    return false;
                }

                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdFlowers tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivFlowersForFgrd #ExportCSV").show();
                }

                if ($("#divFlowerID").html() != "0" && $("#fgrdFlowers #row" + $("#divFlowerID").html()).css('display') == "table-row") {
                    var id = $("#divFlowerID").html();
                    $("#fgrdFlowers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFlowers td.unsorted").addClass("sorted");
                    $("#fgrdFlowers td.sorted").removeClass("unsorted");
                    $("#fgrdFlowers #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFlowers #row" + id).removeClass("trSelected");
                    $("#fgrdFlowers #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFlowers #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divFlowerID").html($("#fgrdFlowers tr:first td:nth-child(3) div").text());
                    $("#fgrdFlowers tr:first").addClass("trSelectedHeader trSelected");
                }
            }
        });

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divFlowerID").html(id.toString());

                    $("#fgrdFlowers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFlowers #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFlowers td.unsorted").addClass("sorted");
                    $("#fgrdFlowers td.sorted").removeClass("unsorted");
                    $("#fgrdFlowers #row" + id).removeClass("trSelected");
                    $("#fgrdFlowers #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFlowers #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        $("#DivFlowersForFgrd .tDiv2").css("height", "20px");

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

        KometVisibility();


        function importFlowerclicked(com, grid) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ImportF_FLOWERfromDBF',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d != "error")
                        $("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
                    else {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                }
            });
        }




    });


    function addFlowerclicked() {
        $("#txtFlowerCode").prop("disabled", false);
        $("#divFlowerID").html("0");
        $("#txtFlowerCode").val("");
        $("#lstFlowerCat").val("");
        $("#txtFlowerDesc").val("");
        $("#lstFlowerGrade").val("00");
        $("#lstFlowerColor").val("0");
        $("#hfFlowerCat").val("");
        $("#hfFlowerGrade").val("");
        $("#hfFlowerColor").val("");
        $("#hfFlowerVariety").val("");
        $("#txtFlowerBoxCharge").val("");
        $("#txtFlowerBoxCharge").attr("placeholder", "0.00");
        $("#lstFlowerVariety").val("00");
        $("#txtFlowerUnitsPerBox").val("");
        $("#txtFlowerUnitsPerBox").attr("placeholder", "0");
        $("#txtFlowerPackedBy").val("");
        $("#txtFlowerUOMSOLD").val("");
        $("#txtFlowerWeight").val("0");
        $("#txtFlowerUnitsPerBunch").val("");
        $("#txtFlowerUnitsPerBunch").attr("placeholder", "0");
        $("#lstFlowerScreenColor").val("");
        $("#txtFlowerDaysInCooler").val("");
        $("#txtFlowerDaysInCooler").attr("placeholder", "0");
        $("#txtFlowerSalesPrice").val("");
        $("#txtFlowerSalesPrice").attr("placeholder", "0.000");
        $("#txtFlowerGL").val("");
        $('#txtFlowerStatus').iButton("toggle", true);
        //$("#txtFlowerStatus").val("A");
        $("#txtFlowerUserCode").val("");
        IsEditFlowersClick = false
        var Duplicatebtn = $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save')
        var Purchasebtn = $(".ui-dialog-buttonpane button:contains('Purchases')")
        $(Duplicatebtn).hide();
        $(Purchasebtn).attr('style','margin-right:360px !important');
        $("#EditFlowers").dialog('option', 'title', "Product Maintenance");
        $("#EditFlowers").dialog("open");
    }


    function exportFlowerclicked(com, grid) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ExportProductsToKomet',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "Inserted")
                    $("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
            }
        });
    }

    $("#MsgFlowerWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            OK: function () {
                $(this).dialog("close");
                //$("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save')
        }
    });

    $("#EditFlowers").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 650,
        height: 500,
        title: 'Edit Flower::',
        buttons: {
            Recipe: function () {
                debugger;
                Recipefgrd();
                //$("#DivRecipeForFgrd").show()
            },
            Purchases: function () {
                debugger;
                $("#tblLoadPurchasesByProductForPageFlowers").flexOptions({ params: [{ name: 'FARMCODE', value: "" }, { name: 'Product', value: $("#txtFlowerCode").val() }] }).flexReload();
                $("#DivLoadPurchasesByProductForPageFlowers").dialog("open");
            },
            Duplicate: {
                class: 'leftButtonDuplicatebtn',
                text: 'Duplicate',
                click: function () {
                    debugger;
                    isDuplicateBoxMaintance = true;
                    saveFlowerDetails();
                }
            },
            Save: function () {
                isDuplicateBoxMaintance = false;
                saveFlowerDetails();
            },

            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            if ($("#divFlowerID").html() != "0") {
                var el = $("#txtFlowerDesc").get(0);
                el.selectionStart = 0;
                el.selectionEnd = 0;
                $("#txtFlowerDesc").focus();
            }
            else {
                $("#txtFlowerCode").focus();
            }

            $("#EditFlowers").next('div').find('.msgui').remove();
            $("#EditFlowers").next('div').append("<div class='msgui' style='margin-left: 120px;height: 17px;position:fixed'></div>").css('height', '35px');
            $("#EditFlowers").next('div').find(".msgui").css("width", '300px');
            $("#EditFlowers").next('div').find('.msgui').hide();
            var Recipebtn = $(".ui-dialog-buttonpane button:contains('Recipe')").addClass('dialogbuttonstyle icon-save')
            var Duplicatebtn = $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save')
             var Purchasebtn = $(".ui-dialog-buttonpane button:contains('Purchases')")
            if (IsEditFlowersClick) {
                $(Recipebtn).show();
                $(Recipebtn).css("margin-right", "5px")
                $(Duplicatebtn).show();
                $(Duplicatebtn).css("margin-right", "5px")
                 $(Purchasebtn).attr('style','margin-right:5px !important');
            }
            else {
                $(Recipebtn).hide();
            }            
            $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Purchases')").addClass('BloomButtonEnabled')
            $(".ui-dialog-buttonpane button:contains('Purchases')").addClass('BloomButtonEnabled2')
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });
    function saveFlowerDetails() {
        var FlowerID = $("#divFlowerID").html();
                var FlowerCode = $("#txtFlowerCode").val();
                if (FlowerCode == "") {
                    $("#EditFlowers").next('div').find(".msgui").html("Please enter Flower Code..");
                    $("#EditFlowers").next('div').find('.msgui').show();
                    ctrlFocus($("#txtFlowerCode"));
                    return false;
                }
                var Cat = $("#lstFlowerCat").val();
                var FlowerName = $("#txtFlowerDesc").val();
                if (FlowerName == "") {
                    $("#EditFlowers").next('div').find(".msgui").html("Please enter Flower Name..");
                    $("#EditFlowers").next('div').find('.msgui').show();
                    ctrlFocus($("#txtFlowerDesc"));
                    return false;
                }
                var FlowerPackedBy = $("#txtFlowerPackedBy").val();
                if (FlowerPackedBy == "") {
                    $("#EditFlowers").next('div').find(".msgui").html("Please enter Flower Packed By..");
                    $("#EditFlowers").next('div').find('.msgui').show();
                    ctrlFocus($("#txtFlowerPackedBy"));
                    return false;
                }
                debugger;
                var UOMSOLD = $("#txtFlowerUOMSOLD").val().toUpperCase();
                var WEIGHT = $("#txtFlowerWeight").val().toUpperCase();
                var Grade = $("#lstFlowerGrade").val() == "00" ? "" : $("#lstFlowerGrade").val(); 
                var Color = $("#lstFlowerColor").val() == "0" ? "" : $("#lstFlowerColor").val(); 
                var BoxCharge = $("#txtFlowerBoxCharge").val() == "" ? $("#txtFlowerBoxCharge").attr('placeholder') : $("#txtFlowerBoxCharge").val();
                var Variety = $("#lstFlowerVariety").val() == "00" ? "" : $("#lstFlowerVariety").val();  
                var UnitsPerBox = $("#txtFlowerUnitsPerBox").val() == "" ? $("#txtFlowerUnitsPerBox").attr('placeholder') : $("#txtFlowerUnitsPerBox").val();
                var PackedBy = $("#txtFlowerPackedBy").val();
                var UnitsPerBunch = $("#txtFlowerUnitsPerBunch").val() == "" ? $("#txtFlowerUnitsPerBunch").attr('placeholder') : $("#txtFlowerUnitsPerBunch").val();
                if (UnitsPerBunch == "") {
                    UnitsPerBunch = 0;
                }

                var ScreenColor = $("#lstFlowerScreenColor").val();
                var DaysInCooler = $("#txtFlowerDaysInCooler").val() == "" ? $("#txtFlowerDaysInCooler").attr('placeholder') : $("#txtFlowerDaysInCooler").val();
                var SalesPrice = $("#txtFlowerSalesPrice").val() == "" ? $("#txtFlowerSalesPrice").attr('placeholder') : $("#txtFlowerSalesPrice").val();
                //var Status = $("#txtFlowerStatus").val();
                var Status = $('#txtFlowerStatus').is(":checked") ? "A" : "I";
                var GL = $("#txtFlowerGL").val();
                var UserCode = $("#txtFlowerUserCode").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveFlowers',
                    data: '{"ID":"' + FlowerID + '","FlowerCode":"' + FlowerCode.toUpperCase() + '","Cat":"' + Cat.toUpperCase() + '","FlowerName":"' + FlowerName.toUpperCase() + '","Grade":"' + Grade.toUpperCase() + '","Color":"' + Color.toUpperCase() + '","Variety":"' + Variety.toUpperCase() + '","UnitsPerBox":"' + UnitsPerBox + '","PackedBy":"' + PackedBy.toUpperCase() + '","UOMSOLD":"' + UOMSOLD.toUpperCase() + '","WEIGHT":"' + WEIGHT + '","UnitsPerBunch":"' + UnitsPerBunch + '","ScreenColor":"' + ScreenColor + '","DaysInCooler":"' + DaysInCooler + '","SalesPrice":"' + SalesPrice + '","Status":"' + Status.toUpperCase() + '","GL":"' + GL.toUpperCase() + '","UserCode":"' + UserCode.toUpperCase() + '","isDuplicateBoxMaintance":"' + isDuplicateBoxMaintance + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            debugger;
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditFlowers").next('div').find(".msgui").html("Flower Code (<b>" + FlowerCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditFlowers").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditFlowers").dialog("close");
                                $("#divFlowerID").html(output.d);
                                $("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditFlowers").next('div').find(".msgui").html(output.d);
                            $("#EditFlowers").next('div').find('.msgui').show();
                        }
                    }
                });
    }
    $("[id^=EditFlowers_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var FlowerID = ID.replace("EditFlowers_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFlowerByID',
            data: '{"ID":"' + FlowerID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != null) {
                    debugger;
                    var FlowerDet = output.d;
                    $("#divFlowerID").html(FlowerDet.ID);
                    debugger;
                    $("#txtFlowerCode").val(FlowerDet.Flower);
                    if (FlowerDet.AlreadyExist == "1") {
                        $("#txtFlowerCode").prop("disabled", true);
                    }
                    //$("#lstFlowerCat").val(FlowerDet.CAT);
                    $("#hfFlowerCat").val(FlowerDet.CAT);
                    LoadTypes();
                    $("#hfFlowerColor").val(FlowerDet.Color);
                    LoadColors();
                    //LoadColorCode();
                    LoadGrades(FlowerDet.CAT, FlowerDet.GRADE);
                    LoadVariety(FlowerDet.CAT, FlowerDet.VARIETY);
                    //$("#lstFlowerCat").val(FlowerDet.CAT);
                    $("#txtFlowerDesc").val(FlowerDet.Name == "" ? "00" : FlowerDet.Name);
                    $("#lstFlowerGrade").val(FlowerDet.GRADE);
                    //$("#lstFlowerColor").val(FlowerDet.Color);
                    $("#lstFlowerColor").val(FlowerDet.Color == "" ? "0" : FlowerDet.Color);
                    $("#txtFlowerBoxCharge").val("");
                    $("#txtFlowerBoxCharge").attr("placeholder", FlowerDet.Charge);
                    $("#lstFlowerVariety").val(FlowerDet.VARIETY == "" ? "00" : FlowerDet.VARIETY);
                    $("#txtFlowerUnitsPerBox").val("");
                    $("#txtFlowerUnitsPerBox").attr("placeholder", FlowerDet.UNITS);
                    $("#txtFlowerPackedBy").val(FlowerDet.UOM);
                    $("#txtFlowerUOMSOLD").val(FlowerDet.UOMSOLD);
                    $("#txtFlowerWeight").val(FlowerDet.WEIGHT);
                    $("#txtFlowerUnitsPerBunch").val("");
                    $("#txtFlowerUnitsPerBunch").attr("placeholder", FlowerDet.UnitsPerBunch);
                    $("#lstFlowerScreenColor").val(FlowerDet.ColorCode);
                    $("#txtFlowerDaysInCooler").val("");
                    $("#txtFlowerDaysInCooler").attr("placeholder", FlowerDet.DAYS);
                    $("#txtFlowerSalesPrice").val("");
                    $("#txtFlowerSalesPrice").attr("placeholder", FlowerDet.PRICE);
                    $("#txtFlowerGL").val(FlowerDet.GL);
                    //$("#txtFlowerStatus").val(FlowerDet.STATUS);
                      $('#txtFlowerStatus').iButton("toggle", FlowerDet.STATUS == 'I' ? false : true);
                    $("#txtFlowerUserCode").val(FlowerDet.UserCode);

                    $("#fgrdFlowers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFlowers #row" + FlowerID).addClass("trSelectedHeader");
                    $("#fgrdFlowers td.unsorted").addClass("sorted");
                    $("#fgrdFlowers td.sorted").removeClass("unsorted");
                    $("#fgrdFlowers #row" + FlowerID).removeClass("trSelected");
                    $("#fgrdFlowers #row" + FlowerID + " td.sorted").addClass("unsorted");
                    $("#fgrdFlowers #row" + FlowerID + " td.unsorted").removeClass("sorted");
                    $("#hfRecipeFlower").val(FlowerDet.Flower)
                    IsEditFlowersClick = true
                    $("#EditFlowers").dialog('option', 'title', "Edit Flower:: " + FlowerDet.Flower);
                    $("#EditFlowers").dialog("open");

                }
            }
        });
    });

    $("[id^=code_]").die('click').live("click", function (e) {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        $("#divSelectedColorCode").html($(this).html());
    });

    // added by Belal on 28 Nov 2020
    function LoadPurchasesByProduct(Farmcode, Product) {

        $("#tblLoadPurchasesByProductForPageFlowers").flexigrid({
            url: 'BloomService.asmx/LoadPurchasesByProduct',
            dataType: 'xml',
            colModel: [
                { display: 'WH', name: 'WH', width: 30, padding: 5, sortable: true, align: 'left' },
                { display: 'FARM', name: 'FARM', width: 30, padding: 5, sortable: true, align: 'left' },
                { display: 'AWB', name: 'LOT', width: 40, padding: 5, sortable: true, align: 'left' },
                { display: 'Date Received', name: 'DATEREC', width: 60, sortable: true, align: 'left' },
                { display: 'Description', name: 'Description', width: 250, sortable: true, align: 'left' },
                { display: 'Pieces', name: 'BOXES', width: 40, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                { display: 'U/B', name: 'UNITSBUNCH', width: 40, sortable: false, align: 'right' },
                { display: 'PACK', name: 'UNITS', width: 40, sortable: false, align: 'right' },
                { display: 'Total Units', name: 'TotalUnits', width: 70, sortable: false, align: 'right' },
                { display: 'COST', name: 'COST', width: 70, sortable: false, align: 'right' },
                { display: 'TYPE', name: 'TYPE', width: 40, sortable: false, align: 'right' },
                { display: 'FLAG', name: 'FLAG', width: 30, sortable: false, align: 'right' },
                { display: 'CUST', name: 'CUST', width: 40, sortable: false, align: 'right' },
                { display: 'PO', name: 'PO', width: 120, sortable: false, align: 'center' },
                { display: 'INVOICE', name: 'INVOICE', width: 70, sortable: false, align: 'right' }
            ],

            showTableToggleBtn: true,
            sortname: "LOT",
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
            params: [
                { name: 'FARMCODE', value: Farmcode },
                { name: 'Product', value: Product }
            ],
            height: 400,
            width: 1200,
            striped: true,

            onSuccess: function () {
                //$("#DivLoadPurchasesByProductForPageFlowers").dialog("open");
            }
        });



    }
    //added By Belal on 28 Nov 2020
    $("#DivLoadPurchasesByProductForPageFlowers").dialog({
        autoOpen: false,
        resizable: false,
        width: 1250,
        modal: true,
        title: 'Purchases by Product',
        buttons: {
            Close: function () {

                $("#DivLoadPurchasesByProductForPageFlowers").dialog("close");
            }
        },
        open: function () {
            //$("#rbProdCodes").attr("checked", "checked");
            $("#DivLoadPurchasesByProductForPageFlowers").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
        beforeClose: function (event, ui) {
            if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                return false;
            }
        }
    });
    LoadPurchasesByProduct("","");
    /*Load Types from f_types table by Abi :: Created on 25April2018 */
    function LoadTypes() {
        debugger;
        //var length = $('#lstFlowerCat > option').length;
        //if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadTypes',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFlowerCat,#lstFlowerCatForFilter').empty();
                var TYPEdata = output.d;
                $('#lstFlowerCat,#lstFlowerCatForFilter').append('<option value="00">Select</option>');
                for (var i in TYPEdata) {
                    var TYPE = TYPEdata[i];
                    $('#lstFlowerCat,#lstFlowerCatForFilter').append('<option value="' + TYPE.TYPE + '">[' + TYPE.TYPE + '] ' + TYPE.NAME + '</option>');

                }

                if ($("#lstFlowerCat").val() != "" && $("#hfFlowerCat").val() != 0)
                    $('#lstFlowerCat').val($("#hfFlowerCat").val());
                else
                    $("#lstFlowerCat").val("QB");
            }
        });
        //}
        //else {
        //    $('#lstFlowerCat').val($("#hfFlowerCat").val());
        //    //callback(true);
        //}
    }

    /*Load Colors from f_colors table by Abi :: Created on 25April2018 */
    function LoadColors() {
        //var length = $('#lstFlowerColor > option').length;
        //if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadColors',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFlowerColor,#lstFlowerColorForFilter').empty();
                var TYPEdata = output.d;
                $('#lstFlowerColor,#lstFlowerColorForFilter').append('<option value="0">Select</option>');
                for (var i in TYPEdata) {
                    var Code = TYPEdata[i];
                    $('#lstFlowerColor,#lstFlowerColorForFilter').append('<option value="' + Code.ColorCode + '">' + Code.ColorCode + '</option>');
                }

                if ($("#lstFlowerColor").val() != "" && $("#hfFlowerColor").val() != 0)
                    $('#lstFlowerColor').val($("#hfFlowerColor").val());
                else
                    $("#lstFlowerColor").val("");
            }
        });
        //}
        //else {
        //    $('#lstFlowerColor').val($("#hfFlowerColor").val());
        //    //callback(true);
        //}
    }

    /*Load ColorCode from tblColorCode table by Abi :: Created on 25April2018 */
    function LoadColorCode() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadColorCode',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFlowerScreenColor').empty();
                var CODEdata = output.d;
                $('#lstFlowerScreenColor').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstFlowerScreenColor').append('<option style="color:' + CODE.Color + ';background:' + CODE.BgColor + '" value="' + CODE.Code + '">' + CODE.Code + '</option>');
                }

                if ($("#lstFlowerScreenColor").val() != "" && $("#hfFlowerScreenColor").val() != 0)
                    $('#lstFlowerScreenColor').val($("#hfFlowerScreenColor").val());
                else
                    $("#lstFlowerScreenColor").val("0");
            }
        });
    }

    $("#lstFlowerCat").on('change', function () {
        debugger;
        var Category = $("#lstFlowerCat").val();
        $("#txtFlowerDesc").focus();
        LoadGrades(Category, "");
        LoadVariety(Category, "");
    });

    /*Load Grade from f_Grades table by Abi :: Created on 25April2018 */
    function LoadGrades(Category, GRADE) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadGrades',
            data: "{'Category':'" + Category + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //if (Category == "") {
                $('#lstFlowerGradeForFilter').empty();
                $('#lstFlowerGradeForFilter').append('<option value="00">Select</option>');
                //}
                //else
                //{
                //    $('#lstFlowerGradeForFilter').empty();
                //    $('#lstFlowerGradeForFilter').append('<option value="0">Select</option>');
                //}
                $('#lstFlowerGrade').empty();
                var CODEdata = output.d;
                $('#lstFlowerGrade').append('<option value="00">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstFlowerGrade').append('<option value="' + CODE.Grade + '">' + CODE.Grade + '</option>');
                    //if (Category == "") {
                    $('#lstFlowerGradeForFilter').append('<option value="' + CODE.Grade + '">' + CODE.Grade + '</option>');
                    //}
                    //else
                    //{
                    //    $('#lstFlowerGradeForFilter').append('<option value="' + CODE.Grade + '">' + CODE.Grade + '</option>');
                    //}
                }
                $('#lstFlowerGrade').val(GRADE);

            }
        });
    }

    /*Load Variety from f_Variety table by Abi :: Created on 25April2018 */
    function LoadVariety(Category, VARIETY) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadVariety',
            data: "{'Category':'" + Category + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                //if (Category == "") {
                $('#lstFlowerVareityForFilter').empty();
                $('#lstFlowerVareityForFilter').append('<option value="00">Select</option>');
                //}
                //else
                //{
                //    $('#lstFlowerVareityForFilter').empty();
                //    $('#lstFlowerVareityForFilter').append('<option value="0">Select</option>');
                //}
                $('#lstFlowerVariety').empty();
                var CODEdata = output.d;
                $('#lstFlowerVariety').append('<option value="00">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstFlowerVariety').append('<option value="' + CODE.Variety + '">' + CODE.Variety + '</option>');
                    //if (Category == "") {
                    $('#lstFlowerVareityForFilter').append('<option value="' + CODE.Variety + '">' + CODE.Variety + '</option>');
                    //}
                    //else
                    //{
                    //    $('#lstFlowerVareityForFilter').append('<option value="' + CODE.Variety + '">' + CODE.Variety + '</option>');
                    //}
                }
                $("#lstFlowerVariety").val(VARIETY);
            }
        });
    }

    /*Move focus while an item selected from select control*/
    $("#lstFlowerGrade").change(function () {
        debugger;
        $("#lstFlowerColor").focus();
    });

    $("#lstFlowerColor").change(function () {
        debugger;
        $("#txtFlowerBoxCharge").focus();
    });

    $("#lstFlowerVariety").change(function () {
        debugger;
        $("#txtFlowerUnitsPerBox").focus();
    });

    $("#lstFlowerScreenColor").change(function () {
        $("#txtFlowerDaysInCooler").focus();
    });

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            debugger;
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;

                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                if ($(this).attr('id').indexOf("txtFlowerCode") > -1) {
                    $("#lstFlowerCat").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerDesc") > -1) {
                    $("#lstFlowerGrade").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerBoxCharge") > -1) {
                    $("#lstFlowerVariety").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerUnitsPerBox") > -1) {
                    $("#txtFlowerPackedBy").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerPackedBy") > -1) {
                    $("#txtFlowerUnitsPerBunch").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerUnitsPerBunch") > -1) {
                    $("#lstFlowerScreenColor").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerDaysInCooler") > -1) {
                    $("#txtFlowerSalesPrice").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerSalesPrice") > -1) {
                    $("#txtFlowerGL").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerGL") > -1) {
                    $("#txtFlowerStatus").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerStatus") > -1) {
                    $("#txtFlowerUserCode").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFlowerUserCode") > -1) {
                    $("#EditFlowers").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtRecipeProduct") > -1) {
                    $("#txtRecipeQTY").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtRecipeQTY") > -1) {
                    $("#txtRecipeUOM").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtRecipeUOM") > -1) {
                    $("#txtRecipeCost").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtRecipeCost") > -1) {
                    $("#ProductRecipeDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
        }
    });

    $("[id^=DeleteFlowers_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').substring(14);

        $('#OldId').html(ID);

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFlowerByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger

                $("#DeleteConfirmFlowerDetails").html("<p>Are you sure to delete<b> " + output.d.Flower + " - " + output.d.Name + "</b> ?</p>");
                $("#DeleteConfirmFlowerDetails").dialog("open");

            },
            error: function (err) {
                debugger
                alert(err)
            }

        });
    });


    $("#DeleteConfirmFlowerDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteFlowers_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteFlowerbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
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


    $('#lstFlowerColorForFilter').change(function () {
        framingfilters()
    });

    $('#lstFlowerGradeForFilter').change(function () {
        framingfilters()
    });

    $('#lstFlowerVareityForFilter').change(function () {
        framingfilters()
    });

    $('#lstFlowerCatForFilter').change(function () {
        framingfilters()
        var filteredflower = $("#lstFlowerCatForFilter").val();
        if (filteredflower == "00") {
            LoadVariety("", "");
            LoadGrades("", "")
        }
        else {
            LoadVariety(filteredflower, "");
            LoadGrades(filteredflower, "")
        }
    });

    //Muthu Nivetha M :: 08 Mar 19 :: the question is not what is not working, it is "what is" :: Modified
    function framingfilters() {
        debugger
        var condn = "";

        if ($('#lstFlowerCatForFilter').val() != "00" && $('#lstFlowerCatForFilter').val() != "0") {
            condn = condn + "CAT=" + "'" + $('#lstFlowerCatForFilter').val() + "'" + " And ";
        }

        if ($('#lstFlowerColorForFilter').val() != "00" && $('#lstFlowerColorForFilter').val() != "0") {
            condn = condn + "Color=" + "'" + $('#lstFlowerColorForFilter').val() + "'" + " And ";
        }

        if ($('#lstFlowerGradeForFilter').val() != "00" && $('#lstFlowerGradeForFilter').val() != "0") {
            var trimgrade = $.trim($('#lstFlowerGradeForFilter').val());
            condn = condn + "GRADE=" + "'" + trimgrade + "'" + " And ";
        }

        if ($('#lstFlowerVareityForFilter').val() != "00" && $('#lstFlowerVareityForFilter').val() != "0") {
            condn = condn + "VARIETY=" + "'" + $('#lstFlowerVareityForFilter').val() + "'" + " And ";
        }

        var lastIndex = condn.lastIndexOf("And")
        var str = condn.substring(0, lastIndex);

        $("#fgrdFlowers").flexOptions({ params: [{ name: 'Filter', value: str }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    }


    $("#lstFlowerCat").keydown(function (e) {
        var keycodevflowercat = e.which;
        if (keycodeflowercat == 13) {
            if ($("#lstFlowerCat").val() == 0) {
                $("#lstFlowerCat").focus();
            }
            else {
                $("#txtFlowerDesc").focus();
                return false;
            }
        }
    });
    $("#lstFlowerGrade").keydown(function (e) {
        var keycodevflowergrade = e.which;
        if (keycodeflowergrade == 13) {
            if ($("#lstFlowerGrade").val() == 0) {
                $("#lstFlowerGrade").focus();
            }
            else {
                $("#lstFlowerColor").focus();
                return false;
            }
        }
    });
    $("#lstFlowerColor").keydown(function (e) {
        var keycodevflowercolor = e.which;
        if (keycodeflowercolor == 13) {
            if ($("#lstFlowerColor").val() == 0) {
                $("#lstFlowerColor").focus();
            }
            else {
                $("#txtFlowerBoxCharge").focus();
                return false;
            }
        }
    });
    $("#lstFlowerVariety").keydown(function (e) {
        var keycodeflowervar = e.which;
        if (keycodeflowervar == 13) {
            if ($("#lstFlowerVariety").val() == 0) {
                $("#lstFlowerVariety").focus();
            }
            else {
                $("#txtFlowerUnitsPerBox").focus();
                return false;
            }
        }
    });
    $("#lstFlowerScreenColor").keydown(function (e) {
        debugger
        var keycodeflowersc = e.which;
        if (keycodeflowersc == 13) {
            if ($("#lstFlowerScreenColor").val() == 0) {
                $("#lstFlowerScreenColor").focus();
            }
            else {
                $("#txtFlowerDaysInCooler").focus();
                return false;
            }
        }
    });

    //Region - Recipe
    function Recipefgrd() {
        debugger
        $("#txtRecipetotcost").val("");
        $("#fgrdRecipe").flexigrid({
            url: 'BloomService.asmx/GetRecipeForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'PRODUCT', name: 'Flower', width: 110, sortable: true, align: 'left' },
                { display: 'DESCRIPTION', name: 'Name', width: 180, sortable: true, align: 'left' },
                { display: 'QTY', name: 'Qty', width: 80, sortable: true, align: 'left' },
                { display: 'UOM', name: 'UOM', width: 80, sortable: true, align: 'left' },
                { display: 'COST', name: 'Cost', width: 80, sortable: true, align: 'left' },
                { display: 'TYPE', name: 'Type', width: 80, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'Product', name: 'Flower' },
                { display: 'Description', name: 'Name' },
                { display: 'Qty', name: 'Units' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Cost', name: 'Cost' },
                { display: 'Type', name: 'Type' },
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "desc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: true,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 250,
            width: 755,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' },
                { name: 'RecipeProductID', value: $("#divFlowerID").html() }
            ],
            onSuccess: function () {
                debugger
                $("#DivRecipeForFgrd #ExportCSV").show();
                $('#fgrdRecipe #row0').addClass("TotalRows")
                var totcost = 0.000;
                var sel = jQuery("#DivRecipeForFgrd .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {

                            var tds = jQuery(sel[x]).children('td');
                            totcost += parseFloat($(tds[6]).find('div').text()) * parseFloat($(tds[4]).find('div').text());
                        }
                    }
                }
                totcost = totcost.toFixed(3);
                $("#txtRecipetotcost").val("$" + " " + totcost);
            }
        });
        $("#DivViewRecipeForFgrd").dialog("open");
    }
    $("#DivViewRecipeForFgrd").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Recipe",
        width: 770,
        open: function (e) {
            debugger
            $("#DivViewRecipeForFgrd").dialog('option', { 'title': "Recipe:: " + $("#hfRecipeFlower").val() });
            $("#fgrdRecipe").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }, { name: 'RecipeProductID', value: $("#divFlowerID").html() }], query: "", newp: 1 }).flexReload();
        },
        close: function () {

        }
    });
    $("#ProductRecipeDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Add Recipe",
        width: 500,
        height: 250,
        buttons: {
            Save: function () {
                debugger
                SaveUpdateRecipe();
            },
            Cancel: function () {
                $("#ProductRecipeDialog").dialog("close");
            },
        },
        open: function (e) {
            debugger
            $("#ProductRecipeDialog").next('div').find('.msgui').remove();
            $("#ProductRecipeDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;position:fixed'></div>").css('height', '35px');
            $("#ProductRecipeDialog").next('div').find(".msgui").css("width", '250px');
            $("#ProductRecipeDialog").next('div').find('.msgui').hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {

        }
    });
    function addRecipeclicked() {
        RecipeID = "0"
        $("#txtRecipeProduct").val("");
        $("#hfRecipeProduct").val("");
        $("#hfRecipeProductID").val("");
        $("#txtRecipeUOM").val("ST");
        $("#hfRecipeUOM").val("");
        $("#txtRecipeQTY").val("");
        $("#txtRecipeQTY").attr("placeholder", "0");
        $("#txtRecipeCost").val("");
        $("#txtRecipeCost").attr("placeholder", "0.000");
        $("#lstRecipeType").val("");
        $("#hfRecipeType").val("");
        LoadTypeForRecipe(function (callback) { });
        $("#ProductRecipeDialog").dialog('option', 'title', "Add Product");
        $("#ProductRecipeDialog").dialog("open");
    }

    $("#txtRecipeProduct").autocomplete({
        source: function (request, response) {
            debugger
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoComplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    response($.map(data.d, function (flr) {
                        debugger;
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Name: flr.Name,
                            ID: flr.ID,
                            Flower: flr.Flower,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            UNITS: flr.UNITS
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
        open: function (event, ui) {

        },
        select: function (e, i) {
            debugger;
            $("#txtRecipeProduct").attr("placeholder", "");
            $("#txtRecipeProduct").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfRecipeProductID").val(i.item.ID.trim());
            $("#hfRecipeProduct").val(i.item.Flower.trim());
        },
        change: function (e, i) {
            debugger;
            if (i.item == null || i.item == undefined) {
                $("#txtRecipeProduct").val("");
                $("#hfRecipeProductID").val("0");
                $("#txtRecipeProduct").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });
    function SaveUpdateRecipe() {
        debugger
        var ProductID = $("#divFlowerID").html();
        var Product = $("#hfRecipeProduct").val()
        if ($("#txtRecipeProduct").val() == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Product..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeProduct"));
            return false;
        }
        var QTY = (($("#txtRecipeQTY").val() == "") ? $("#txtRecipeQTY").attr('placeholder') : $("#txtRecipeQTY").val());
        if (QTY == "0" || QTY == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Qty..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeQTY"));
            return false;
        }
        var UOM = $('#txtRecipeUOM').val();
        if (UOM == "") {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Add UOM..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#txtRecipeUOM"));
            return false;
        }
        var Cost = (($("#txtRecipeCost").val() == "") ? $("#txtRecipeCost").attr('placeholder') : $("#txtRecipeCost").val());
         //SOFIA: 11/08/2021 REMOVE COST AS MANDATORY - ADD RECIPE 
        //if (parseFloat(Cost) == 0 || Cost == "") {
        //    $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Enter Cost..");
        //    $("#ProductRecipeDialog").next('div').find('.msgui').show();
        //    ctrlFocus($("#txtRecipeCost"));
        //    return false;
        //}
        var Type = $("#lstRecipeType").val();
        if (Type == 0) {
            $("#ProductRecipeDialog").next('div').find(".msgui").html("Please Select Type..");
            $("#ProductRecipeDialog").next('div').find('.msgui').show();
            ctrlFocus($("#lstRecipeType"));
            return false;
        }
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveRecipeDetails",
            data: "{'RecipeID':" + RecipeID + ",'ProductID':" + ProductID + ",'Product':'" + Product + "','QTY':" + QTY + ",'UOM':'" + UOM + "','Cost':" + Cost + ",'Type':'" + Type + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var res = output.d;
                if (output.d != "error") {
                    $("#ProductRecipeDialog").dialog("close");
                    $("#fgrdRecipe").flexReload({ url: '/url/for/refresh' });
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function LoadTypeForRecipe(callback) {
        //SOFIA: 11/08/2021 - ADD RECIPE FORM- REMOVE COST AS MANDATORY / FLOWER AS DEFAULT
        debugger;
        var length = $('#lstRecipeType > option').length;
        if (length <= 0) {
            $('#lstRecipeType').append('<option value="0">Select</option>');
            $('#lstRecipeType').append('<option selected="selected" value="F">[F]Flower</option>');
            $('#lstRecipeType').append('<option value="L">[L]Labour</option>');
            $('#lstRecipeType').append('<option value="M">[M]Material</option>');
            $('#lstRecipeType').append('<option value="O">[O]Other</option>');
            if ($("#lstRecipeType").val() != "" && $("#hfRecipeType").val() != 0)
                $('#lstRecipeType').val($("#hfRecipeType").val());
            else
                $("#lstRecipeType").val("F");
        }
        else {
            $('#lstRecipeType').val($("#hfRecipeType").val());
            callback(true);
        }
    }

    $("[id^=EditRecipe_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        RecipeID = ID.replace("EditRecipe_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetRecipeByID',
            data: '{"ID":"' + RecipeID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != null) {
                    debugger;
                    var RecipeDet = output.d;
                    $("#txtRecipeProduct").val("[" + RecipeDet.Flower.trim() + "] " + RecipeDet.Name.trim());
                    $("#hfRecipeProductID").val(RecipeDet.ProductID.trim())
                    $("#hfRecipeProduct").val(RecipeDet.CODE.trim())
                    $("#txtRecipeQTY").val("");
                    $("#txtRecipeQTY").attr("Placeholder", RecipeDet.UNITS);
                    $("#txtRecipeUOM").attr("Placeholder", RecipeDet.UOM);

                    $("#txtRecipeCost").val("");
                    $("#txtRecipeCost").attr("Placeholder", RecipeDet.Cost);
                    $("#hfRecipeType").val(RecipeDet.Type);
                    LoadTypeForRecipe(function (callback) { });
                    $("#ProductRecipeDialog").dialog('option', 'title', "Edit Recipe:: " + RecipeDet.Flower);
                    $("#ProductRecipeDialog").dialog("open");

                }
            }
        });
    });
    $("[id^=DeleteRecipe_]").die("click").live("click", function () {
        debugger
        var RecipeDelID = $(this).attr("id").replace("DeleteRecipe_", "").trim();
        $("#msgRECIPEDelhtml").html("Are you sure you want to delete?");
        $("#msgbox-RECIPEDel").data("inData", { RECIPEDELID: RecipeDelID }).dialog("open");

    });



    $("#msgbox-RECIPEDel").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                debugger
                $(this).dialog("close");
                var DelID = $("#msgbox-RECIPEDel").data("inData")["RECIPEDELID"]
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteRECIPEDetails",
                    data: "{'ID':'" + DelID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        debugger
                        res = output.d;
                        if (output.d == "success") {
                            $("#row" + DelID).remove();
                            $("#fgrdRecipe").flexReload({ url: '/url/for/refresh' });
                            $("#msgbox-RECIPEDel").dialog("close");
                        }
                    }
                });
            },
            No: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        }
    });

    $("#txtFlowerStatus").iButton({
            labelOn: "ACTIVE",
            labelOff: "INACTIVE"
        });
    //End Region-Recipe
</script>
