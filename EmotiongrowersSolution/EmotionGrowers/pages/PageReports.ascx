<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageReports.ascx.vb" Inherits="pages_PageReports" %>
<style type="text/css">
    .trSelectedHeader {
        background-color: red !important;
        color: white !important;
    }

    .button-group:after {
        content: '';
        display: block;
        clear: both;
    }

    .button-group .button {
        float: left;
        width: 135px;
        height: 48px;
        font-size: 12px;
        font-weight: bold;
    }

    #divSPReports .button {
        float: left;
        width: 178px;
        height: 48px;
        font-size: 12px;
        font-weight: bold;
    }

    .InvoiceListtd {
        border-width: 1px;
        padding: 7px;
        border-style: solid;
        border-color: #666666;
        text-align: center;
    }

    #DivCustomerDetails .flexigrid div.bDiv tr:hover td {
        background-color: inherit;
        color: inherit;
    }

        #DivCustomerDetails .flexigrid div.bDiv tr:hover td a {
            color: black;
        }
</style>
<table>
    <tr>
        <td>
            <div class="button-group">
                <input id="btnSalesReport" type="button" class="tabs tab-3 button" value="Sales Reports" />

            </div>
        </td>
        <td>
            <div id="divSPReports" class="button-group">
                <input id="btnSPReports" type="button" class="tabs tab-3 button" value="Standing/Pre-Book Reports" />

            </div>
        </td>
    </tr>
</table>
<div class="tabcontent" id="tab-3">
    <div id="DialogSalesSummaryReports" style="display: none;" class="FileHover">
        <fieldset id="fsARReports" style="font-size: 14px; font-weight: bold; height: 383px; border-width: 1px; margin-top: 3px; border-radius: 5px;">
            <legend style="background: white; margin-left: 2px;"></legend>
            <table>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryReport" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports" checked="checked">
                        <label for="rdoSalesSummaryReport">Sales Summary Report</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByCustomer" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByCustomer">Monthly Sales Summary By Customer</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByCustomerGroup" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByCustomerGroup">Monthly Sales Summary By Customer Group</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesbyAwbBySalesInvoice" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesbyAwbBySalesInvoice">Sales by Awb by Sales Invoice</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSummaryByInvoice" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSummaryByInvoice">Sales Summary By Invoice</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByFarm" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByFarm">Sales Summary By Farm</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByCategory" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByCategory">Sales Summary By Category</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryBySalesManByMonth" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryBySalesManByMonth">Sales Summary By Sales Person (By Month)</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryBySalesPerson" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryBySalesPerson">Sales Summary By Sales Person</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByDay" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByDay">Sales Summary By Day</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSalesSummaryByState" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoSalesSummaryByState">Sales Summary By State</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoGrossProfit" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoGrossProfit">Gross Profit Report</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoGrossProfitBouq" class="rbARReports" type="radio" style="margin-top: 8px;" name="SalesSummaryReports">
                        <label for="rdoGrossProfitBouq">Gross Profit Report (Bouquet only)</label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>


    <div id="DialogStandingPreBooksReports" style="display: none;">
        <fieldset id="fsSPReports" style="font-size: 14px; font-weight: bold; height: 390px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
            <legend style="background: white; margin-left: 2px;"></legend>
            <table>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPValidStandingOdrRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPValidStandingOdrRpt">1.- Print all Valid Standing Orders</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPUnfilStandingOdrRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPUnfilStandingOdrRpt">2.- Print unfilled Valid Standing Orders</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPAllStandingOdrRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPAllStandingOdrRpt">3.- Print all Standing Orders on file</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPAllPreBooksRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPAllPreBooksRpt">4.- Print all Pre-Books for Today </label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPUnfilPreBooksRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPUnfilPreBooksRpt">5.- Print unfilled Pre-Books</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPOdrByCustRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPOdrByCustRpt">6.- Orders by Customer</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPOdrSummaryRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPOdrSummaryRpt">7.- Orders Summary</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPDailyByCustRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPDailyByCustRpt">8.- Daily by Customer</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPTotBySLSManRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPTotBySLSManRpt">9.- Totals by Sales Person</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPOdrByProdRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPOdrByProdRpt">0.- Orders by Product</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPSummaryByContRegnRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPSummaryByContRegnRpt">A.- Summary by Country/Origin</label>
                    </td>
                </tr>
                <tr style="height: 13px;">
                    <td>
                        <input id="rdoSPSummaryByProdDayFrmRpt" class="rbARReports" type="radio" style="margin-top: 8px;" name="SPReports">
                        <label for="rdoSPSummaryByProdDayFrmRpt">B.- Summary by Day/Product/Farm</label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</div>

<div id="DialogSalesSummary" style="display: none;">
    <fieldset id="fsDepositSummary" style="font-size: 12px; font-weight: bold; height: 340px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtDepositSummaryHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDateFrom">From </label>
                </td>
                <td>
                    <input id="txtDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDateTo">To </label>
                </td>
                <td>
                    <input id="txtDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                    <input type="checkbox" id="chkReportFromSalesDates">
                    <label id="lblReportFromSalesDates" for="chkReportFromSalesDates"><span id="spnReportFromSalesDates" style=" margin-top:-2px;"></span>Select by <b>RECEIVING DATES</b>?</label>
                </td>
            </tr>
            <tr style="height: 33px;" id="trReportFromSalesDates">
            </tr>

            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblFarm">Farm </label>
                </td>
                <td>
                    <input style="width: 100px" id="txtFarmFilter" maxlength="3" class="rbARReports AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCategory">Category </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstCategoryFilter" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblVariety">Variety </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstVarietyFilter" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblGrade">Grade </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstGradeFilter" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblColor">Color </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstColorFilter" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblFlower">Flower </label>
                </td>
                <td>
                    <input maxlength="40" class="AllUpperCaseTextBox" style="width: 300px" id="txtFlowerFilter" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogSalesSummaryBySalesPerson" style="display: none;">
    <fieldset id="fsSaleSummary" style="font-size: 14px; font-weight: bold; height: 270px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSummaryHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateFrom">From </label>
                </td>
                <td>
                    <input id="txtSPDateFrom" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateTo">To </label>
                </td>
                <td>
                    <input id="txtSPDateTo" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPFarm">Farm </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstFarm" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesPerson">Sales Person </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstSalesPerson" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td colspan="2">
                    <input id="rdoSPWhoMadeSale" class="rbARReports" type="radio" style="margin-top: 8px;" name="ReportType" checked="checked">
                    <label for="rdoSPWhoMadeSale">Who Made the Sale</label>
                    <input id="rdoSPCustomerBelong" class="rbARReports" type="radio" style="margin-top: 8px;" name="ReportType">
                    <label for="rdoSPCustomerBelong">Who the Customer belong's to</label>
                </td>
            </tr>
           <tr style="height: 33px;">

               <td style="padding-right: 10px;"> 
               </td>

               <td>
                    <input type="checkbox" id="chkWeeklySales" name="chkWeeklySales" >
                    <label for="chkWeeklySales">Include weekly sales?</label>
               </td>

                



 
            </tr>

        </table>
    </fieldset>
</div>

<div id="DialogGrossProfit" style="display: none;">
    <fieldset id="fsSaleSummary" style="font-size: 14px; font-weight: bold; height: 270px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateFrom">From </label>
                </td>
                <td>
                    <input id="txtgpmDateFrom" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateTo">To </label>
                </td>
                <td>
                    <input id="txtgpmDateTo" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesPerson">Sales Person </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstgpmSalesPerson" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogGrossProfitBouq" style="display: none;">
    <fieldset id="fsSaleSummary" style="font-size: 14px; font-weight: bold; height: 270px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateFrom">From </label>
                </td>
                <td>
                    <input id="txtgpmBouqDateFrom" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPDateTo">To </label>
                </td>
                <td>
                    <input id="txtgpmBouqDateTo" class="rbSPARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesPerson">Sales Person </label>
                </td>
                <td>
                    <select style="width: 280px" id="lstgpmBouqSalesPerson" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%--Region Standing/Prebooks Reports ( Reports for F8 )--%>
<%--1.- Print all Valid Standing Orders--%>
<div id="DialogSPValidSOrders" style="display: none;">
    <fieldset id="fsSPValidSOrders" style="font-size: 14px; font-weight: bold; height: 100px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtValidSOdrFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblValidSOdrFromDateHidden" style="margin-right: 42px;">ShipDate </label>
                    <input id="txtValidSOdrFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <%--<tr id="trValidSOdrToDatelbl">
                <td colspan="2" id="tdValidSOdrToDatelblhdn">
                    <input type="text" id="txtValidSOdrToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trValidSOdrToDatetxt">
                <td style="padding-right: 10px;" id="tdValidSOdrToDatelbl">
                    <label id="lblValidSOdrToDate" style="margin-right: 90px;">To </label>
                    <input id="txtValidSOdrToDate" class="rbARReports" type="text" style="width: 120px;" />
                </td>
            </tr>--%>
            <tr style="height: 33px; font-size: 14px;" id="trValidSOdrSLSMan">
                <td style="padding-top: 6px;">
                    <label id="lblValidSOdrSLSMan" style="margin-right: 5px;">SalesPerson# </label>
                    <select id="lstSalesPersonSPORD" style="width: 200px"></select>
                    <%--<input type="text" style="width: 300px; margin-left: -1px; margin-top: -4px;" id="txtValidSOdrSLSMan" class="AllUpperCaseTextBox" />--%>
                    <%--<input type="hidden" id="hfValidSOdrSLSMan" />--%>
                    <input type="hidden" id="hfValidSalesPerson" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trValidSOdrStatus">
                <td style="padding-top: 6px;">
                    <input type="checkbox" id="chkValidSOdrStatus" checked="checked">
                    <label id="lblValidSOdrStatus" for="chkValidSOdrStatus"><span id="spnValidSOdrStatus" style="padding: 1px; float: left; margin-top: -1px;"></span>Print everything except <b>DENIED(DE)</b> product?</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%--2.- Print all Valid Standing Orders--%>
<div id="DialogSPUnfilledOrders" style="display: none;">
    <fieldset id="fsSPUnfilledOrders" style="font-size: 14px; font-weight: bold; height: 100px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtUnfilledFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblUnfilledFromDateHidden" style="margin-right: 42px;">ShipDate </label>
                    <input id="txtUnfilledFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>          
            <tr style="height: 33px; font-size: 14px;" id="trUnfilledSLSMan">
                <td style="padding-top: 6px;">
                    <label id="lblUnfilledSLSMan" style="margin-right: 5px;">SalesPerson# </label>
                    <select id="lstSalesPersonUnfilledSPORD" style="width: 200px"></select>                 
                    <input type="hidden" id="hfValidSalesPersonUnfilled" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trUnfilledStatus">
                <td style="padding-top: 6px;">
                    <input type="checkbox" id="chkUnfilledStatus" checked="checked">
                    <label id="lblUnfilledStatus" for="chkUnfilledStatus"><span id="spnUnfilledStatus" style="padding: 1px; float: left; margin-top: -1px;"></span>Print everything except <b>DENIED(DE)</b> product?</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%--3.- Print all Standing Orders on File--%>
<div id="DialogSPAllSOrders" style="display: none;">
    <fieldset id="fsSPAllSOrders" style="font-size: 14px; font-weight: bold; height: 100px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtAllSOdrFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAllOdrFromDateHidden" style="margin-right: 42px;">ShipDate </label>
                    <input id="txtAllSOdrFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px; font-size: 14px;" id="trAllSOdrSLSMan">
                <td style="padding-top: 6px;">
                    <label id="lblAllSOdrSLSMan" style="margin-right: 5px;">SalesPerson# </label>
                    <%--<input type="text" style="width: 300px; margin-left: -1px; margin-top: -4px;" id="txtAllSOdrSLSMan" class="AllUpperCaseTextBox" />--%>
                    <select id="lstSalesPersonAllSPORD" style="width: 200px"></select>
                    <input type="hidden" id="hfAllSOdrSLSMan" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trAllSOdrStatus">
                <td style="padding-top: 6px;">
                    <input type="checkbox" id="chkAllSOdrStatus" checked="checked">
                    <label id="lblAllSOdrStatus" for="chkAllSOdrStatus"><span id="spnAllSOdrStatus" style="padding: 1px; float: left; margin-top: -1px;"></span>Print everything except <b>DENIED(DE)</b> product?</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%--4.- Print all Pre-Books for Today --%>
<div id="DialogSPPreBooksByAllCust" style="display: none;">
    <fieldset id="fsSPDateRange" style="font-size: 18px; font-weight: bold; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSPFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPFromDateHidden">From </label>
                </td>
                <td>
                    <input id="txtSPFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr id="trSPToDatelbl">
                <td colspan="2" id="tdSPToDatelblhdn">
                    <input type="text" id="txtSPToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trSPToDatetxt">
                <td style="padding-right: 10px;" id="tdSPToDatelbl">
                    <label id="lblSPToDate">To </label>
                </td>
                <td id="tdSPToDatetxt">
                    <input id="txtSPToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="DialogSalesSummaryReportByInvoice" style="display: none;">
    <fieldset id="fsSalesSummaryReport" style="font-size: 18px; font-weight: bold; height: 135px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSalesSummaryReportHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryFromDate">From </label>
                </td>
                <td>
                    <input id="txtSalesSummaryFromDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryToDate">To </label>
                </td>
                <td>
                    <input id="txtSalesSummaryToDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryByCarrier">By Carrier </label>
                </td>
                <td>
                    <input id="txtSalesSummaryByCarrier" type="text" style="margin-top: 8px; width: 20px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummarySelectCarrier">Select Carrier </label>
                </td>
                <td>
                    <input id="txtSalesSummarySelectCarrier" class="AllUpperCaseTextBox" type="text" style="margin-top: 8px; width: 40px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="DialogSalesSummaryByDay" style="display: none;">
    <fieldset id="fsSDDateRange" style="font-size: 18px; font-weight: bold; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSDFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSDFromDateHidden">From </label>
                </td>
                <td>
                    <input id="txtByDayDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr id="trSDToDatelbl">
                <td colspan="2" id="tdSDToDatelblhdn">
                    <input type="text" id="txtSDToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trSDToDatetxt">
                <td style="padding-right: 10px;" id="tdSDToDatelbl">
                    <label id="lblSDToDate">To </label>
                </td>
                <td id="tdSDToDatetxt">
                    <input id="txtByDayDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="DialogSalesSummaryByState" style="display: none;">
    <fieldset id="fsStateDateRange" style="font-size: 18px; font-weight: bold; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtStateFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblStateFromDateHidden">From </label>
                </td>
                <td>
                    <input id="txtByStateDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr id="trStateToDatelbl">
                <td colspan="2" id="tdStateToDatelblhdn">
                    <input type="text" id="txtStateToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trStateToDatetxt">
                <td style="padding-right: 10px;" id="tdStateToDatelbl">
                    <label id="lblStateToDate">To </label>
                </td>
                <td id="tdStateToDatetxt">
                    <input id="txtByStateDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="LoggedInUserType_PageSPORD" runat="server" style="display: none"></div>
<div id="LoggedInUserIsAdmin_PageSPORD" runat="server" style="display: none"></div>
<div id="LoggedInUserID" runat="server" style="display: none"></div>


<%--End Region--%>

<script type="text/javascript">

    $(document).ready(new function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date().getFullYear() - 1, 11, 31));

        $("#txtDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        //Region Standing/Prebooks Reports ( Reports for F8 )
        $("#txtValidSOdrFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtUnfilledFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtValidSOdrToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtSPFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtSPToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtAllSOdrFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));
      
        $("#txtSPDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtSPDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtByDayDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtByDayDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtByStateDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtByStateDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

         $("#txtSalesSummaryFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtSalesSummaryToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtgpmDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtgpmDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtgpmBouqDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtgpmBouqDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        LoadTypes();
        LoadVariety("");
        LoadGrades("")
        LoadColors();
    });

    // code removed by Nivetha on 12-12-2019
    //$(".tab-3").die('click').live("click", function (e) {
    //    $(".tabcontent").css('display', 'none');
    //    $("#tab-3").css("display", 'block');
    //    $("#DialogSalesSummaryReports").dialog("open");
    //});

    $("#DialogSalesSummaryReports").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Reports",
        width: 550,
        height: 495,
        modal: true,
        buttons: {
            Next: function () {
                debugger;
                var CheckedID = $("input[name='SalesSummaryReports']:checked").attr("id");
                if (CheckedID == "rdoSalesSummaryReport") {
                    $("#DialogSalesSummary").dialog("open");
                }
                else if (CheckedID == "rdoSalesSummaryByCustomer") {
                    PrintSalesSummaryByCustomerToExcel();
                }
                else if (CheckedID == "rdoSalesSummaryByCustomerGroup") {
                    PrintSalesSummaryByCustomerGroupToExcel();
                }
                else if (CheckedID == "rdoSalesSummaryByFarm") {

                    PrintSalesSummaryByFarmToExcel();
                }
                else if (CheckedID == "rdoSalesSummaryByCategory") {
                    PrintSalesSummaryByCategoryToExcel();
                }
                else if (CheckedID == "rdoSalesSummaryBySalesManByMonth") {
                    PrintSalesSummaryBySalesManByMonthToExcel();
                }
                else if (CheckedID == "rdoSalesSummaryBySalesPerson") {
                    LoadFarmCode();
                    LoadSalesPerson();
                    $("#DialogSalesSummaryBySalesPerson").dialog("open");
                }
                else if (CheckedID == "rdoSalesSummaryByDay") {
                     $("#DialogSalesSummaryByDay").dialog("open");
                }
                else if (CheckedID == "rdoSalesSummaryByState") {
                    $("#DialogSalesSummaryByState").dialog("open");
                }
                else if (CheckedID == "rdoGrossProfit") {
                    LoadSalesPerson();
                    $("#DialogGrossProfit").dialog("open");
                }
                else if (CheckedID == "rdoGrossProfitBouq") {
                    LoadSalesPerson();
                    $("#DialogGrossProfitBouq").dialog("open");
                }

                else if (CheckedID == "rdoSummaryByInvoice") {                    
                    var SalesSessionFromDt = new Date();
                    var SalesSessionToDt = new Date();
                    $("#txtSalesSummaryFromDate").datepicker('setDate', SalesSessionFromDt);
                    $("#txtSalesSummaryToDate").datepicker('setDate', SalesSessionToDt);
                    $("#txtSalesSummaryByCarrier").val("");
                    $("#txtSalesSummaryByCarrier").attr('placeholder', 'Y');
                    $("#txtSalesSummarySelectCarrier").val("");
                    $("#DialogSalesSummaryReportByInvoice").dialog("open");
                }
                else if (CheckedID == "rbDocs") {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/PrintDocsToExcel',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            if (output.d == "LogOut") {
                                window.location.href = "Login.aspx";
                            }
                            else if (output.d.indexOf("error") >= 0) {
                                $("#msgbox-select").dialog("close");
                                $.MessageBox(output.d.substring(5, output.d.length));
                            }
                            else if (output.d == "No Data") {
                                $.MessageBox("No data selected!");
                                w.close();
                            }
                            else {

                                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                                window.open(path);
                            }

                        }
                    });
                }
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogSalesSummary").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary",
        width: 500,
        height: 450,
        modal: true,
        buttons: {
            Print: function () {
                ARSessionFromDt = $("#txtDateFrom").val();
                ARSessionToDt = $("#txtDateTo").val();
                if (ARSessionFromDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (ARSessionToDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                var ReportType = "1"

                var CheckedID = $("input[name='ReportType']:checked").attr("id");
                if (CheckedID == "rdoSPWhoMadeSale") {
                    ReportType = "1"
                }
                else {
                    ReportType = "2"
                }

                var Flower = $("#txtFlowerFilter").val();
                var Farm = $("#txtFarmFilter").val();
                var Category = $("#lstCategoryFilter").val();
                var Grade = $("#lstGradeFilter").val();
                var Variety = $("#lstVarietyFilter").val();
                var Color = $("#lstColorFilter").val();

                //PrintSalesSummaryReports(ARSessionFromDt, ARSessionToDt, Farm, Flower, Category, Grade, Variety, Color);
                PrintSalesSummaryToExcel(ARSessionFromDt, ARSessionToDt, Farm, Flower, Category, Grade, Variety, Color);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogSalesSummaryBySalesPerson").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary By Sales Person",
        width: 500,
        height: 400,
        modal: true,
        buttons: {
            Print: function () {
                ARSessionFromDt = $("#txtSPDateFrom").val();
                ARSessionToDt = $("#txtSPDateTo").val();
                if (ARSessionFromDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (ARSessionToDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                var Farm = $("#lstFarm").val();
                var SalesPerson = $("#lstSalesPerson").val();

                var ReportType = "1"

                var CheckedID = $("input[name='ReportType']:checked").attr("id");
                if (CheckedID == "rdoSPWhoMadeSale") {
                    ReportType = "1"
                }
                else {
                    ReportType = "2"
                }
                var WeeklySales = true
                //PrintSalesSummaryReports(ARSessionFromDt, ARSessionToDt, Farm, Flower, Category, Grade, Variety, Color);                
                PrintSalesSummaryBySalesPersonToExcel(ARSessionFromDt, ARSessionToDt, Farm, SalesPerson, ReportType,WeeklySales);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtSPDateFrom").blur();
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogSalesSummaryByDay").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary By Day",
        width: 500,
        height: 200,
        modal: true,
        buttons: {
            Print: function () {
                debugger;
                ARSessionFromDt = $("#txtByDayDateFrom").val();
                ARSessionToDt = $("#txtByDayDateTo").val();
                if (ARSessionFromDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (ARSessionToDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                //PrintSalesSummaryReports(ARSessionFromDt, ARSessionToDt, Farm, Flower, Category, Grade, Variety, Color);                
                PrintSalesSummaryByDay(ARSessionFromDt, ARSessionToDt);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtByDayDateFrom").blur();
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogSalesSummaryByState").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary By State",
        width: 500,
        height: 200,
        modal: true,
        buttons: {
            Print: function () {
                ARSessionFromDt = $("#txtByStateDateFrom").val();
                ARSessionToDt = $("#txtByStateDateTo").val();
                if (ARSessionFromDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (ARSessionToDt == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                //PrintSalesSummaryReports(ARSessionFromDt, ARSessionToDt, Farm, Flower, Category, Grade, Variety, Color);                
                PrintSalesSummaryByState(ARSessionFromDt, ARSessionToDt);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtByDayDateFrom").blur();
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogGrossProfit").dialog({
        autoOpen: false,
        resizable: false,
        title: "Gross Profit Report",
        width: 500,
        height: 200,
        modal: true,
        buttons: {
            Print: function () {
                debugger;
                let gpmDateFrom = $("#txtgpmDateFrom").val();
                let gpmDateTo = $("#txtgpmDateTo").val();
                if (gpmDateFrom == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (gpmDateTo == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }

                let gpmSalesPerson = $("#lstgpmSalesPerson").val();

                PrintGrossProfitReport(gpmDateFrom, gpmDateTo,gpmSalesPerson);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtgpmDateFrom").blur();
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogGrossProfitBouq").dialog({
        autoOpen: false,
        resizable: false,
        title: "Gross Profit Report",
        width: 500,
        height: 200,
        modal: true,
        buttons: {
            Print: function () {
                debugger;
                let gpmDateFrom = $("#txtgpmBouqDateFrom").val();
                let gpmDateTo = $("#txtgpmBouqDateTo").val();
                if (gpmDateFrom == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }
                else if (gpmDateTo == "") {
                    $.MessageBox("Please select Date");
                    return false;
                }

                let gpmSalesPerson = $("#lstgpmBouqSalesPerson").val();

                PrintGrossProfitBouqReport(gpmDateFrom, gpmDateTo, gpmSalesPerson);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtgpmDateFrom").blur();
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#txtFlowerFilterForInventoryList").autocomplete({
        source: function (request, response) {
            var farmcode = $("#txtFarmFilterForInventoryList").val();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteFarmWise',
                data: "{'Searchtext': '" + request.term + "','FarmCode':'" + farmcode.toUpperCase() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name
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
            $("#txtFlowerFilterForInventoryList").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtFlowerFilterForInventoryList").val("");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function LoadTypes() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadTypes',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstCategoryFilter').empty();
                var TYPEdata = output.d;
                $('#lstCategoryFilter').append('<option value="">Select</option>');
                for (var i in TYPEdata) {
                    var TYPE = TYPEdata[i];
                    $('#lstCategoryFilter').append('<option value="' + TYPE.TYPE + '">[' + TYPE.TYPE + '] ' + TYPE.NAME + '</option>');
                }
            }
        });
    }

    function LoadColors() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadColors',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstColorFilter').empty();
                var TYPEdata = output.d;
                $('#lstColorFilter').append('<option value="">Select</option>');
                for (var i in TYPEdata) {
                    var Code = TYPEdata[i];
                    $('#lstColorFilter').append('<option value="' + Code.ColorCode + '">' + Code.ColorCode + '</option>');
                }
                $("#lstFlowerColor").val("");
            }
        });
    }

    function LoadGrades(Category) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadGrades',
            data: "{'Category':'" + Category + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstGradeFilter').empty();
                var CODEdata = output.d;
                $('#lstGradeFilter').append('<option value="">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstGradeFilter').append('<option value="' + CODE.Grade + '">' + CODE.Grade + '</option>');
                }
            }
        });
    }

    function LoadVariety(Category) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadVariety',
            data: "{'Category':'" + Category + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstVarietyFilter').empty();
                $('#lstVarietyFilter').append('<option value="">Select</option>');
                var CODEdata = output.d;
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstVarietyFilter').append('<option value="' + CODE.Variety + '">' + CODE.Variety + '</option>');
                }
            }
        });
    }

    $("#DialogSalesSummaryReportByInvoice").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary Report",
        width: 390,
        height: 410,
        modal: true,
        buttons: {
            Print: function () {
                var SalesSummaryFromDate = $("#txtSalesSummaryFromDate").val();
                var SalesSummaryToDate = $("#txtSalesSummaryToDate").val();
                var SalesSummaryByCarrier = $("#txtSalesSummaryByCarrier").val() == "" ? $("#txtSalesSummaryByCarrier").attr('placeholder') : $("#txtSalesSummaryByCarrier").val();
                var SalesSummarySelectCarrier = $("#txtSalesSummarySelectCarrier").val();
                PrintSalesSummaryReportsByInvoice(SalesSummaryFromDate, SalesSummaryToDate, SalesSummaryByCarrier, SalesSummarySelectCarrier);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function PrintSalesSummaryReportsByInvoice(SalesSummaryFromDate, SalesSummaryToDate, SalesSummaryByCarrier, SalesSummarySelectCarrier) {
        debugger;
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReport',
            data: "{'SalesSummaryFromDate':'" + SalesSummaryFromDate + "','SalesSummaryToDate':'" + SalesSummaryToDate + "','SalesSummaryByCarrier':'" + SalesSummaryByCarrier
                + "','SalesSummarySelectCarrier':'" + SalesSummarySelectCarrier + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data for the selected date!");
                    w.close();
                }
                else {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtSalesSummaryFromDate").datepicker('setDate', SalesSessionFromDt);
                    $("#txtSalesSummaryToDate").datepicker('setDate', SalesSessionToDt);
                }
                $("#DialogSalesSummaryReportByInvoice").dialog("close");
            }
        });
    }

    function PrintSalesSummaryToExcel(FromDate, ToDate, Farm, Flower, Category, Grade, Variety, Color) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReportToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','Flower':'" + Flower + "','Category':'" + Category + "','Grade':'" + Grade + "','Variety':'" + Variety + "', 'Color':'" + Color + "', 'Farm':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByDay(FromDate, ToDate) {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReportByDayToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate+ "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByState(FromDate, ToDate) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReportByStateToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryBySalesPersonToExcel(FromDate, ToDate, Farm, SalesPerson, ReportType,SalesbyWeek) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReportBySalesPersonToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','Farm':'" + Farm + "','SalesPerson':'" + SalesPerson + "','ReportType':'" + ReportType + "','WeeklySales':'"+ SalesbyWeek + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByCustomerToExcel() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryByCustomerToExcel',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryBySalesManByMonthToExcel() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryBySalesManByMonthToExcel',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByCustomerGroupToExcel() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryByCustomerGroupToExcel',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByFarmToExcel() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryByFarmToExcel',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryByCategoryToExcel() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryByCategoryToExcel',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintSalesSummaryReports(FromDate, ToDate, Farm, Flower, Category, Grade, Variety, Color) {

        var w = window.open('GeneratingPDF.html');

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesReports',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','Flower':'" + Flower + "','Category':'" + Category + "','Grade':'" + Grade + "','Variety':'" + Variety + "', 'Color':'" + Color + "', 'Farm':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtDepositFrom").val("");
                    $("#txtDepositTo").val("");
                    $("#txtCustomerNo").val("");
                    $("#txtDateFrom").datepicker('setDate', ARSessionFromDt);
                    $("#txtDateTo").datepicker('setDate', ARSessionToDt);
                }
                $("#DialogByDeposit").dialog("close");
                $("#DialogByCustomer").dialog("close");
                $("#DialogADeposit").dialog("close");
                $("#DialogDepositSummary").dialog("close");
            }
        });
    }

    function PrintGrossProfitReport(FromDate, ToDate, SalesPerson) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintGPMCalcToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','SalesPerson':'" + SalesPerson  + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }

    function PrintGrossProfitBouqReport(FromDate, ToDate, SalesPerson) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintGPMBouqCalcToExcel',
            data: "{'FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','SalesPerson':'" + SalesPerson + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
        });
    }
    $("#btnSalesReport").die("click").live("click", function () {
        $(".tabcontent").css('display', 'none');
        $("#tab-3").css("display", 'block');
        $("#DialogSalesSummaryReports").dialog("open");
    });

    //Region Standing/Prebooks Reports ( Reports for F8 )
    $("#btnSPReports").die("click").live("click", function () {
        debugger;
        $(".tabcontent").css('display', 'none');
        $("#tab-3").css("display", 'block');
        $("#DialogStandingPreBooksReports").dialog("open");
    });

    $("#DialogStandingPreBooksReports").dialog({
        autoOpen: false,
        resizable: false,
        title: "Standing Orders/Pre-Book Menu",
        width: 550,
        height: 505,
        modal: true,
        buttons: {
            Next: function () {
                debugger;
                var CheckedID = $("input[name='SPReports']:checked").attr("id");
                var dialogtitle = '';
                switch (CheckedID) {
                    case "rdoSPValidStandingOdrRpt":
                        dialogtitle = 'Valid Standing Orders';
                        $("#DialogSPValidSOrders").data('inData', { 'SelectedReport': CheckedID }).dialog('option', 'title', dialogtitle).dialog('open');
                        break;
                    case "rdoSPUnfilStandingOdrRpt":
                        dialogtitle = 'Unfilled Valid Standing Orders';
                        $("#DialogSPUnfilledOrders").data('inData', { 'SelectedReport': CheckedID }).dialog('option', 'title', dialogtitle).dialog('open');
                        break;
                    case "rdoSPAllStandingOdrRpt":
                        dialogtitle = 'All Standing Orders On File';
                        $("#DialogSPAllSOrders").data('inData', { 'SelectedReport': CheckedID }).dialog('option', 'title', dialogtitle).dialog('open');
                        break;
                    case "rdoSPAllPreBooksRpt":
                        dialogtitle = 'Print All Pre-Book';
                        $("#DialogSPPreBooksByAllCust").data('inData', { 'SelectedReport': CheckedID }).dialog('option', 'title', dialogtitle).dialog('open');
                        break;
                }
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#DialogStandingPreBooksReports").css('height', '432px')
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#DialogSPValidSOrders").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 480,
        height: 220,
        modal: true,
        buttons: {
            Ok: function () {
                //debugger
                //var SLSManSOrders = $("#lstSalesPersonSPORD").val()
                //if (lstSalesPersonSPORD.trim() == "") {
                //    $("#lstSalesPersonSPORD").focus()
                //    return false;
                //}
                var getselectedrpt = $("#DialogSPValidSOrders").data("inData")["SelectedReport"];
                var shipdate = new Date();
                shipdate = $("#txtValidSOdrFromDate").val();
                var slsman = "0";
                slsman = $("#lstSalesPersonSPORD").val();
                var isCO = false;
                isCO = $("#chkValidSOdrStatus").is(":checked") == false ? true : false;
                GenerateReport(getselectedrpt, shipdate, "", slsman, isCO);
            },
            Cancel: function () {
                $("#DialogSPValidSOrders").dialog("close");
            },
        },
        open: function () {
            BindSalesPerson();
            //$("#txtValidSOdrSLSMan").val("")
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });    

    $("#DialogSPPreBooksByAllCust").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 190,
        modal: true,
        buttons: {
            Ok: function () {
                var getselectedrpt = $("#DialogSPPreBooksByAllCust").data("inData")["SelectedReport"];
                var fromdate = new Date();
                var todate = new Date();
                fromdate = $("#txtSPFromDate").val();
                todate = $("#txtSPToDate").val();
                if (!validateDates(fromdate, todate)) {
                    $.MessageBox("From-Date cannot be greater than To-Date");
                    return;
                }
                else {
                    GenerateReport(getselectedrpt, fromdate, todate, "0", false);
                }
            },
            Cancel: function () {
                $("#DialogSPPreBooksByAllCust").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#chkValidSOdrStatus").change(function () {
        if (this.checked) {
            $("#lblValidSOdrStatus").html("<span id='spnValidSOdrStatus' style='padding: 1px; float: left; margin-top: -1px;'></span>Print everything except <b>DENIED(DE)</b> product?");
        }
        else {
            $("#lblValidSOdrStatus").html("<span id='spnValidSOdrStatus' style='padding: 1px; float: left; margin-top: -1px;'></span>Confirmed<b>[CO]</b> Only?");
        }
    });

    function BindSalesPerson() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstSalesPersonSPORD').empty();
                //$('#lstSalesPersonSPORD').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
                //$('#lstSalesPersonSPORD').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');
                $('#lstSalesPersonSPORD').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
                $('#lstSalesPersonSPORD').append('<option selected="selected" value="0">All Sales persons</option>');
                if (data.length == 0) {
                    $('#lstSalesPersonSPORD').val("");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        var lstValue = "";
                        if (res.SlsName.trim() == "")
                            lstValue = "" + res.Salesman + "";
                        else
                            lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                        $('#lstSalesPersonSPORD').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');                        

                    }
                }
            }
        });
    }
    //$("#txtValidSOdrSLSMan").autocomplete({
    //    source: function (request, response) {
    //        debugger;
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetSalesManListAutoComplete',
    //            data: "{'Slsman':'" + request.term + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (data) {
    //                debugger
    //                response($.map(data.d, function (sls) {
    //                    return {
    //                        label: "[" + sls.SalesMan.trim() + "] " + sls.Name,
    //                        SalesMan: sls.SalesMan,
    //                        Name: sls.Name,
    //                        ColorCode: sls.ColorCode,
    //                    }
    //                }))
    //            },
    //            error: function (response) {
    //                alert(response.responseText);
    //            },
    //            failure: function (response) {
    //                alert(response.responseText);
    //            }
    //        });
    //    },
    //    open: function (event, ui) {

    //    },
    //    select: function (e, i) {
    //        debugger;
    //        $("#txtValidSOdrSLSMan").attr("placeholder", "");
    //        $("#txtValidSOdrSLSMan").val("[" + i.item.SalesMan.trim() + "] " + i.item.Name);
    //        $("#hfValidSOdrSLSMan").val(i.item.SalesMan.trim());
    //    },
    //    change: function (e, i) {
    //        debugger;
    //        if (i.item == null || i.item == undefined) {
    //            $("#txtValidSOdrSLSMan").val("");
    //            $("#hfValidSOdrSLSMan").val("");
    //            $(".ui-menu").css("display", "none");
    //        }
    //    },
    //    minLength: 1,
    //    autoFocus: true
    //});

    $("#DialogSPAllSOrders").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 480,
        height: 220,
        modal: true,
        buttons: {
            Ok: function () {
                //var SLSManAllSOrders = $("#txtAllSOdrSLSMan").val()
                //if (SLSManAllSOrders.trim() == "") {
                //    $("#txtAllSOdrSLSMan").focus()
                //    return false;
                //}
                var getselectedrpt = $("#DialogSPAllSOrders").data("inData")["SelectedReport"];
                var shipdate = new Date();
                shipdate = $("#txtAllSOdrFromDate").val();
                var slsman = "0";
                slsman = $("#lstSalesPersonAllSPORD").val() == null ? "0" : $("#lstSalesPersonAllSPORD").val();
                var isCO = false;
                isCO = $("#chkAllSOdrStatus").is(":checked") == false ? true : false;
                GenerateReport(getselectedrpt, shipdate, "", slsman, isCO);
            },
            Cancel: function () {
                $("#DialogSPAllSOrders").dialog("close");
            },
        },
        open: function () {            
            BinSalesPersonAllSPORD();
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function BinSalesPersonAllSPORD() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstSalesPersonAllSPORD').empty();
                $('#lstSalesPersonAllSPORD').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
                $('#lstSalesPersonAllSPORD').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');

                if (data.length == 0) {
                    $('#lstSalesPersonAllSPORD').val("");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        var lstValue = "";
                        if (res.SlsName.trim() == "")
                            lstValue = "" + res.Salesman + "";
                        else
                            lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                        $('#lstSalesPersonAllSPORD').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                    }
                }
            }
        });
    }

    $("#DialogSPUnfilledOrders").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 480,
        height: 220,
        modal: true,
        buttons: {
            Ok: function () {               
                var getselectedrpt = $("#DialogSPUnfilledOrders").data("inData")["SelectedReport"];
                var shipdate = new Date();
                shipdate = $("#txtUnfilledFromDate").val();
                var slsman = "0";                
                slsman = $("#lstSalesPersonUnfilledSPORD").val() == null ? "0" : $("#lstSalesPersonUnfilledSPORD").val();
                var isCO = false;
                isCO = $("#chkUnfilledStatus").is(":checked") == false ? true : false;
                GenerateReport(getselectedrpt, shipdate, "", slsman, isCO);
            },
            Cancel: function () {
                $("#DialogSPUnfilledOrders").dialog("close");
            },
        },
        open: function () {
            BinSalesPersonUnfilledSPORD();           
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function BinSalesPersonUnfilledSPORD() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                $('#lstSalesPersonUnfilledSPORD').empty();
                $('#lstSalesPersonUnfilledSPORD').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
                $('#lstSalesPersonUnfilledSPORD').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');

                if (data.length == 0) {
                    $('#lstSalesPersonUnfilledSPORD').val("");
                }
                else {
                    for (var i in data) {
                        var res = data[i];
                        var lstValue = "";
                        if (res.SlsName.trim() == "")
                            lstValue = "" + res.Salesman + "";
                        else
                            lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                        $('#lstSalesPersonUnfilledSPORD').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                    }
                }
            }
        });
    }
    //Commentd By Prashant For Putting dropdown instead of the Autocomplete on 13 Apr 2020
    //$("#txtAllSOdrSLSMan").autocomplete({
    //    source: function (request, response) {
    //        debugger;
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetSalesManListAutoComplete',
    //            data: "{'Slsman':'" + request.term + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (data) {
    //                debugger
    //                response($.map(data.d, function (sls) {
    //                    return {
    //                        label: "[" + sls.SalesMan.trim() + "] " + sls.Name,
    //                        SalesMan: sls.SalesMan,
    //                        Name: sls.Name,
    //                        ColorCode: sls.ColorCode,
    //                    }
    //                }))
    //            },
    //            error: function (response) {
    //                alert(response.responseText);
    //            },
    //            failure: function (response) {
    //                alert(response.responseText);
    //            }
    //        });
    //    },
    //    open: function (event, ui) {

    //    },
    //    select: function (e, i) {
    //        debugger;
    //        $("#txtAllSOdrSLSMan").attr("placeholder", "");
    //        $("#txtAllSOdrSLSMan").val("[" + i.item.SalesMan.trim() + "] " + i.item.Name);
    //        $("#hfAllSOdrSLSMan").val(i.item.SalesMan.trim());
    //    },
    //    change: function (e, i) {
    //        debugger;
    //        if (i.item == null || i.item == undefined) {
    //            $("#txtAllSOdrSLSMan").val("");
    //            $("#hfAllSOdrSLSMan").val("");
    //            $(".ui-menu").css("display", "none");
    //        }
    //    },
    //    minLength: 1,
    //    autoFocus: true
    //});
    $("#chkAllSOdrStatus").change(function () {
        debugger
        if (this.checked) {
            $("#lblAllSOdrStatus").html("<span id='spnAllSOdrStatus' style='padding: 1px; float: left; margin-top: -1px;'></span>Print everything except <b>DENIED(DE)</b> product?");
        }
        else {
            $("#lblAllSOdrStatus").html("<span id='spnAllSOdrStatus' style='padding: 1px; float: left; margin-top: -1px;'></span>Confirmed<b>[CO]</b> Only?");
        }
    });

    function GenerateReport(report, fromdate, todate, slsman, isCO) {
        debugger;
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSPReports',
            data: "{'SelectedReport':'" + report + "','FromDate':'" + fromdate + "','ToDate': '" + todate + "','Slsman': '" + slsman + "','isCO': " + isCO + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtSPFromDate").datepicker('setDate', new Date());
                    $("#txtSPToDate").datepicker('setDate', new Date());
                }
                $("#DialogSPPreBooksByAllCust").dialog("close");
                $("#DialogSPValidSOrders").dialog("close");
                $("#DialogStandingPreBooksReports").dialog("close");
                $("#DialogSPAllSOrders").dialog("close");
                $("#DialogSPUnfilledOrders").dialog("close");
            }
        });
    }

    function validateDates(fromdate, todate) {
        var isvalid = false;
        if (new Date(fromdate) > new Date(todate)) {
            isvalid = false;
        }
        else isvalid = true;
        return isvalid;
    }

    function LoadFarmCode() {
        var length = $('#lstFarm > option').length;
        var LoginUserID = $("#ctl00_LoggedInUserID").html();
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUserFarmCode',
                data: "{'UserID':'" + LoginUserID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstFarm').empty();
                    var data = output.d;
                    $('#lstFarm').append('<option value="0">All</option>');
                    for (var i in data) {
                        var farm = data[i];
                        if (farm.Farm != "") {
                            $('#lstFarm').append('<option value="' + farm.Farm + '">[' + farm.Farm + '] ' + farm.Name + '</option>');
                        }
                    }
                },
            });
        }
    }

    function LoadSalesPerson() {
        var length = $('#lstSalesPerson > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadSalesPersonDetails',
                data: "",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSalesPerson').empty();
                    $('#lstgpmSalesPerson').empty();
                    $('#lstgpmBouqSalesPerson').empty();
                    var data = output.d;
                    $('#lstSalesPerson').append('<option value="0">All</option>');
                    $('#lstgpmSalesPerson').append('<option value="0">All</option>');
                    $('#lstgpmBouqSalesPerson').append('<option value="0">All</option>');
                    for (var i in data) {
                        var SalesPerson = data[i];
                        if (SalesPerson.Salesman != "") {
                            $('#lstSalesPerson').append('<option value="' + SalesPerson.Salesman + '">' + SalesPerson.SlsName + '</option>');
                            $('#lstgpmSalesPerson').append('<option value="' + SalesPerson.Salesman + '">' + SalesPerson.SlsName + '</option>');
                            $('#lstgpmBouqSalesPerson').append('<option value="' + SalesPerson.Salesman + '">' + SalesPerson.SlsName + '</option>');
                        }
                    }
                },
            });
        }
    }

//End Region 
</script>
