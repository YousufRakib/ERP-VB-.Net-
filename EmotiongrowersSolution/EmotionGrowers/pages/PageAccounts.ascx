<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageAccounts.ascx.vb" Inherits="pages_PageAccounts" %>
<style type="text/css">
    /*.TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }*/

    /*#row0 {
        /*position: absolute;
    margin-top: -63px;*
        color: red;
        text-decoration: none;
    }

        #row0 td {
            /*background-color: #f3f3f3;*
            border: 0px;
        }

            #row0 td.sorted {
                /*background-color: #708090;*
                background-color: #72C97D;
                border: 0px;
            }



            /*css color and alignment for row above the grid*
            #row0 td:nth-child(12) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; *
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; *
                /* line-height: 30px; *
                padding-bottom: 3px;
                font-size: 12px;
            }

            #row0 td:nth-child(13) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; *
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; *
                /* line-height: 30px; *
                padding-bottom: 3px;
                font-size: 12px;
            }*/

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
        /*padding: 5px 5px;
        margin-left: 1px;
        margin-right: 2px;*/
        width: 135px;
        /*border-right: 1px solid gray;
        border-bottom: 1px solid gray;*/
        height: 48px;
        font-size: 12px;
        /*margin-top: 2px;*/
        font-weight: bold;
    }

    .InvoiceListtd {
        border-width: 1px;
        padding: 7px;
        border-style: solid;
        border-color: #666666;
        text-align: center;
    }

   #DivCustomerDetails .flexigrid div.bDiv tr:hover td{
    background-color: inherit;
    color:inherit;
}

     #DivCustomerDetails .flexigrid div.bDiv tr:hover td a{
          color:black;
      }

     #DateTotalARBalanceStart{
         font-size:20px;
         width:115px;

     }
    #DateForTotalARBalance{
         font-size:20px;
         width:115px;
    }


     
</style>

<table style="">
    <tr>
        <td>
            <div class="button-group">
                <input id="btnCustomerARInquiry" type="button" class="tabs tab-1 button" value="A/R Inquiry" style="">
                <input id="btnPostPayments" type="button" class="tabs tab-2 button" value="Post Payments" style="">
                <input id="btnListingMenu" type="button" class="tabs tab-3 button" value="Listing Menu" style="">
                <input id="btnTotalARBalance" type="button" class="tabs tab-4 button" value="Control Total " style="">
                <input id="btnClosing" type="button" class="tabs tab-5 button" value="Closing" style="">
            </div>
        </td>
        <td>
            <fieldset id="fsSearch" style="float: right; width: 155px; height: 35px; border-width: 1px;">
                <legend style="background: white; margin-left: 2px; font-size: 10px;">
                    <input id="rbcust" class="rbsearch" type="radio" name="search" checked="checked">
                    <label for="rbcust">Customer</label>
                    <input id="rbinv" class="rbsearch" type="radio" name="search">
                    <label for="rbinv">Invoice</label>
                    <input id="rbPO" class="rbsearch" type="radio" name="search">
                    <label for="rbPO">PO</label>
                </legend>
                <input type="text" id="txtCustSearch" placeholder="Customer Search" style="width: 155px; float: left; margin-top: -1px;background-color:wheat" value="" class="AllUpperCaseTextBox searchplaceholder" />
                <input type="text" id="txtInvSearch" placeholder="Invoice Search" style="width: 155px; float: left; margin-top: -1px; display: none;background-color:wheat" value="" class="AllUpperCaseTextBox searchplaceholder" />
                <input type="text" id="txtPOSearch" placeholder="PO Search" style="width: 155px; float: left; margin-top: -1px; display: none;background-color:wheat" value="" class="AllUpperCaseTextBox searchplaceholder" />
            </fieldset>
        </td>
    </tr>

</table>
<div class="tabcontent" id="tab-1" style="display: none">
    <table id="tblCustomerARInquiry" style="display: block;">
        <tr>
            <td>
                <div id="DivCustomerDetails">
                    <table id="fgrdCustomerDetails" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="margin-top: 6px; display: block;" id="">
                    <input id="btnCustomerStatementAsEmail" type="button" class="BloomButtonEnabled" value="Statements" style="margin-left: 5px; width: 80px;">
                    <input id="btnAgeingReport" type="button" class="BloomButtonEnabled" value="Summary Ageing" style="margin-left: 5px; width: 120px;background:#77c1ff;">
                    <input id="btnDetailedAgeingReport" type="button" class="BloomButtonEnabled" value="Detailed Ageing" style="margin-left: 5px; width: 110px;background:purple;">
                    <input id="btnARCollectionReport" type="button" class="BloomButtonEnabled" value="Collection Report" style="margin-left: 5px; width: 120px;background:#ff00e0;">
                    <input id="btnNacmReport" type="button" class="BloomButtonEnabled" value="Nacm Report" style="margin-left: 5px; width: 90px;background:teal;">
                    <input id="btnSalesMaintenanceJournal" type="button" class="BloomButtonEnabled" value="Sales Maintenance Journal" style="margin-left: 5px; width: 168px;background:#7cd26c;">                                    
                    <input id="btnSalesReturnd" type="button" class="BloomButtonEnabled" value="Sales Returns" style="margin-left: 5px; width: 108px;background:mediumorchid;">                                    
               </div>
            </td>
        </tr>
    </table>
</div>


<div class="tabcontent" id="tab-2"></div>

<div class="tabcontent" id="tab-3">
    <div id="DialogARReports" style="display: none;">
        <fieldset id="fsARReports" style="font-size: 18px; font-weight: bold; height: 383px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
            <legend style="background: white; margin-left: 2px;"></legend>
            <table>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbDepositList" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports" checked="checked">
                        <label for="rbDepositList">Deposits</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbAdjustment" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbAdjustment">Adjustment Report</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbReturnedCheck" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbReturnedCheck">Returned Checks Report</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbInvoiceListing" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbInvoiceListing">Invoice Listing</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbCreditsByCustomer" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbCreditsByCustomer">Credits by Customer</label>
                    </td>
                </tr>
                <%--<tr style="height: 33px;">
                    <td>
                        <input id="rbDebitMemos" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbDebitMemos">Print Debit Memos</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbStoppedPayments" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbStoppedPayments">Print Stopped Payments</label>
                    </td>
                </tr>--%>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbCreditPayments" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbCreditPayments">Credit card Payments</label>
                    </td>
                </tr>
                <%--<tr style="height: 33px;">
                    <td>
                        <input id="rbCreditDisputes" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbCreditDisputes">Print Credit card Disputes</label>
                    </td>
                </tr>--%>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbUnappliedPayments" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbUnappliedPayments">Un-applied Payments</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbDocs" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbDocs">Docs</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbCODReport" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbCODReport">COD Report</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbSalesMaintenancejournal" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbSalesMaintenancejournal">Sales Maintenance Journal</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbJournalSummary" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbJournalSummary">Journal Summary</label>
                    </td>
                </tr>
                <tr style="height: 33px;">
                    <td>
                        <input id="rbSalesByAWBNumber" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReports">
                        <label for="rbSalesByAWBNumber">Sales By AWBNumber</label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</div>


<div class="tabcontent" id="tab-4" style="display: none">
    <div style="text-align: center; font-size: 26px; margin-top: 16px;">A/R CONTROL TOTAL</div>
    <div style="text-align: center; margin-top: 10px;">
        Total A/R from:
        <input type="text" id="DateTotalARBalanceStart" style="font-size:20px" />
        Total A/R up-to:
        <input type="text" id="DateForTotalARBalance" style="font-size:20px" />
        <input id="btnGetTotalARBalance" type="button" class="BloomButtonEnabled" value="Get Totals" style="margin-left: 5px; width: 80px;">
    </div>
    <div style="text-align: center; font-size: 26px; margin-top: 16px;">
        <label id="lblTotalARBalance" style="font-weight: bold"></label>
    </div>

    <div style="width: 50%; margin: 0 auto; display: none; margin-top: 27px;" id="DivARSummary">
        <div style="text-align: center; text-align: center; background: #89b837; font-size: 20px; color: blue;">Monthly Sales</div>
        <div style="text-align: center; text-align: center; background: #89b837; font-size: 20px; color: blue; border-top: 1px solid;" id="MonthHeaderARSummary"></div>
        <div style="background: #0000ff; font-size: 17px; color: white;">
            <table style="width: 80%; margin: 0 auto;">

                <tr>
                    <td></td>
                    <td style="font-weight:bold; font-size:110% ; text-align: right; color:#f2e600">Totals</td>
                    <td style="font-weight:bold; font-size:110% ; text-align: right;  color:#f2e600">Calculated</td>
                    <td style="font-weight:bold; font-size:110% ; text-align: right;  color:#f2e600">Difference</td>
                </tr>


                <tr>
                    <td>Total Sales</td>
                    <td style="text-align: right;">
                        <label id="lblTotalSales">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedSales">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffCalculatedSales">0.00</label></td>
                </tr>
                <tr>
                    <td>Total Voids</td>
                    <td style="text-align: right;">
                        <label id="lblTotalVoids">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedVoids">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffVoids">0.00</label></td>
  
                </tr>
                <tr>
                    <td>Total Credits</td>
                    <td style="text-align: right;">
                        <label id="lblTotalCredits">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedCredits">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffCredits">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Adjustments</td>
                    <td style="text-align: right;">
                        <label id="lblTotalAdjustments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedAdjustments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffAdjustments">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Payments (Cash/Check)</td>
                    <td style="text-align: right;">
                        <label id="lblTotalPayments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedPayments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffPayments">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Unapplied</td>
                    <td style="text-align: right;">
                        <label id="lblTotalUnapplied">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedUnapplied">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffUnapplied">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Credit Card Payments</td>
                    <td style="text-align: right;">
                        <label id="lblTotalCreditCardPayments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedCreditCardPayments">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffCreditCardPayments">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Return Checks</td>
                    <td style="text-align: right;">
                        <label id="lblTotalReturnChecks">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedReturnedChecks">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffReturnedChecks">0.00</label></td>
 
                </tr>
                <tr>
                    <td>Total Late Charges</td>
                    <td style="text-align: right;">
                        <label id="lblTotalLateCharges">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalCalculatedLateCharges">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffLateCharges">0.00</label></td>
  
                    </tr>
                <tr>
                    <td>Total Debits</td>
                    <td style="text-align: right;">
                        <label id="lblTotalDebits">0.00</label></td>
                    <td style="text-align: right;">
                        <label id="lblTotalCalculatedDebits">0.00</label></td>
                   <td style="text-align: right;">
                        <label id="lblTotalDiffDebits">0.00</label></td>
 
                    </tr>
            </table>
        </div>
    </div>
</div>

<div class="tabcontent" id="tab-5">
    <div id="DialogARClosing" style="display: none;margin-left: 30px;">
        <table>
            <tr>
                <td colspan="2">
                    <fieldset id="fsARClosing" style="font-size: 18px; font-weight: bold; height: 100px; border-width: 5px; margin-top: 5px; border-radius: 20px;margin-bottom: 5px;width: 205px;">
                        <legend style="background: white; margin-left: 2px;"></legend>
                        <table>
                            <tr style="height: 33px;">
                                <td>
                                    <input id="rbClosingDayList" class="rbARClosing" type="radio" style="margin-top: 8px;" name="ARClosing">
                                    <label for="rbClosingDayList">Day</label>
                                </td>
                            </tr>
                            <tr style="height: 33px;">
                                <td>
                                    <input id="rbClosingMonthList" class="rbARClosing" type="radio" style="margin-top: 8px;" name="ARClosing">
                                    <label for="rbClosingMonthList">Month</label>
                                </td>
                            </tr>
                            <tr style="height: 33px;">
                                <td>
                                    <input id="rbClosingYearList" class="rbARClosing" type="radio" style="margin-top: 8px;" name="ARClosing" checked="checked">
                                    <label for="rbClosingYearList">Year</label>
                                </td>
                            </tr>  
                            <%-- <tr style="height: 33px;">
                                <td>
                                    <input id="rbJournalSummary" class="rbARClosing" type="radio" style="margin-top: 8px;" name="ARClosing">
                                    <label for="rbJournalSummary">Journal</label>
                                </td>
                            </tr> --%>               
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td style="width: 42px;">
                    As of
                </td>
                <td>
                    <input type="text" id="txtClosingDate" style="width: 75px;" />
                </td>
            </tr>
        </table>
        
    </div>
</div>
<%--<div id="DialogForEmailOrFaxtheStatement" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="float: left" title="Send Selected Invoices One By One">
                <input type="checkbox" id="chkSendStatementByOutlook">
                <label for="chkSendStatementByOutlook"><span style="padding: 1px; float: left;"></span>Outlook</label>
            </td>
        </tr>
        <tr class="EmailsectionForStatement">
            <td>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailIDsForSendStatement" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr class="FaxsectionForStatement">
            <td>
                <input type="text" id="txtFaxForSendStatement" style="width: 100px; height: 16px; float: left" />
                <label>@faxage.com</label>
                <input type="hidden" id="hfEmailorFaxForSendStatement" style="width: 350px; height: 16px; float: left" />
            </td>
        </tr>
    </table>
</div>--%>



<div id="SendStatementForMultipleCustomersDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="float: left" title="" colspan="2">
                <input type="checkbox" id="chkSendStatementByOutlook">
                <label for="chkSendStatementByOutlook"><span style="padding: 1px; float: left;"></span>Send Via Outlook</label>
            </td>
        </tr>
        <tr style="height: 15px">
            <td></td>
        </tr>
        <tr>
            <td>Statement as of
            </td>
            <td>
                <input type="text" id="txtStatementDate1" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>

    </table>
</div>




<div id="AgeingReportDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td>Transactions up to
            </td>
            <td>
                <input type="text" id="txtAgeingTransactionUpto" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr class="trSalesPerson">
            <td>Sales Person</td>
            <td>
                <select id="lstSalesPerson" style="width: 200px"></select>
        </tr>
        <tr>
            <td>Update Balances?</td>
            <td>
                <input type="checkbox" id="ChkUpdateBalances" /></td>
        </tr>
    </table>
</div>
<div id="CollectionReportDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr style="height: 25px;">
            <td>Payment From
            </td>
            <td>
                <input type="text" id="txtLostfocus" style="width: 100px; height: 16px; float: left;display:none;" />
                <input type="text" id="txtPaymentFrom" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr style="height: 25px;">
            <td>Payment Up to
            </td>
            <td>
                <input type="text" id="txtPaymentto" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr style="height: 25px;">
            <td>Include Less than
            </td>
            <td>
                <input type="text" id="txtIncludeDays" style="width: 50px; height: 16px; float: left" class="ClsNumbersOnly" placeholder="0" /> &nbsp;Days
            </td>
        </tr>
        <tr style="height: 25px;">
            <td>Sales From
            </td>
            <td>
                <input type="text" id="txtSalesFrom" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr style="height: 25px;">
            <td>Sales Up to
            </td>
            <td>
                <input type="text" id="txtSalesto" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>    
        <tr style="height: 25px;">
                <td colspan="2">
                    <input id="rdoSPWhoMadeSale" class="rbARReports" type="radio" name="ReportType" checked="checked">
                    <label for="rdoSPWhoMadeSale">Who Made the Sale</label>
                    <input id="rdoSPCustomerBelong" class="rbARReports" type="radio" name="ReportType">
                    <label for="rdoSPCustomerBelong">Who the Customer belong's to</label>
                </td>
            </tr>
    </table>
</div>

<div id="NacmReportDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td>Transactions up to
            </td>
            <td>
                <input type="text" id="txtNacmTransactionUpto" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
    </table>
</div>

<div id="DetailedAgeingReportDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td>Transactions up to
            </td>
            <td>
                <input type="text" id="txtDetailedAgeingTransactionUpto" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr class="trSalesPerson">
            <td>Sales Person</td>
            <td>
                <select id="lstSalesPersonForDetailedAgeing" style="width: 200px"></select>
        </tr>
        <tr class="trCustomer">
            <td>Customer</td>
            <td>                
                <input type="text" id="txtCustomerForDetailedAgeing" style="width:200px;" />
                <input type="hidden" id="hdnCustomerForDetailedAgeing" value="0" style="display:none;" />
                </td>
        </tr>

    </table>
</div>


<div id="DialogDepositListing" style="display: none;">
    <fieldset id="fsDepositListing" style="font-size: 18px; font-weight: bold; height: 170px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <table>
           <%-- <tr style="height: 33px;display:none;">
                <td>
                    <input id="rbNewDeposit" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList">
                    <label for="rbNewDeposit">New Deposits Only</label>
                </td>
            </tr>--%>
            <tr style="height: 33px;">
                <td>
                    <input id="rbDeposit" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList" checked="checked">
                    <label for="rbDeposit">A Deposit</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbAllDeposits" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList">
                    <label for="rbAllDeposits">All Deposits</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbDepositSummary" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList">
                    <label for="rbDepositSummary">Deposits Summary</label>
                </td>
            </tr>
            <tr style="height: 33px; display: none;">
                <td>
                    <input id="rbDepositSlip" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList">
                    <label for="rbDepositSlip">Deposit Slip</label>
                </td>
            </tr>
            <tr style="height: 33px; display: none;">
                <td>
                    <input id="rbGeneralLedger" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARDepositsList">
                    <label for="rbGeneralLedger">Post to General Ledger</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>


<div id="DialogADeposit" style="display: none;">
    <fieldset id="fsADeposit" style="font-size: 18px; font-weight: bold; height: 120px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDepositNo">Deposit# </label>
                </td>
                <td>
                    <input id="txtDepositNo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <label id="lblCheckNo">Check# </label>
                </td>
                <td>
                    <input id="txtCheckNo" class="rbARReports" type="text" style="margin-top: 8px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <label id="lblBankNo">Bank# </label>
                </td>
                <td>
                    <input id="txtBankNo" class="rbARReports" type="text" style="margin-top: 8px; width: 25px;" />

                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogDepositSummary" style="display: none;">
    <fieldset id="fsDepositSummary" style="font-size: 18px; font-weight: bold; height: 120px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
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
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCustomerNoByEntered">Customer# </label>
                </td>
                <td>
                    <input id="txtCustomerNoByEntered" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogAllDeposits" style="display: none;">
    <fieldset id="fsAllDeposits" style="font-size: 18px; font-weight: bold; height: 115px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByDeposit" class="rbARReports" type="radio" value="ByDeposit" style="margin-top: 8px;" name="AllDeposits" checked="checked">
                    <label for="rbByDeposit">By Deposit Date</label>
                </td>
            </tr>
<%--            <tr style="height: 33px;">
                <td>
                    <input id="rbByCustomer" class="rbARReports" type="radio" value="ByCustomer" style="margin-top: 8px;" name="AllDeposits">
                    <label for="rbByCustomer">By Customer</label>
                </td>
            </tr>--%>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByDate" class="rbARReports" type="radio" value="ByDate" style="margin-top: 8px;" name="AllDeposits">
                    <label for="rbByDate">By Date Entered</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogByDeposit" style="display: none;">
    <fieldset id="fsByDeposit" style="font-size: 18px; font-weight: bold; height: 120px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDepositFrom">From</label>
                </td>
                <td>
                    <input id="txtDepositFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <label id="lblDepositTo">To</label>
                </td>
                <td>
                    <input id="txtDepositTo" class="rbARReports" type="text" style="margin-top: 8px;width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCustomerNo">Customer# </label>
                </td>
                <td>
                    <input id="txtCustomerNo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogByEnteredDate" style="display: none;">
    <fieldset id="fsByDeposit" style="font-size: 18px; font-weight: bold; height: 120px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDepositFromED">From</label>
                </td>
                <td>
                    <input id="txtDepositFromED" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <label id="lblDepositToED">To</label>
                </td>
                <td>
                    <input id="txtDepositToED" class="rbARReports" type="text" style="margin-top: 8px;width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCustomerNoED">Customer# </label>
                </td>
                <td>
                    <input id="txtCustomerNoED" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%--<div id="DialogByCustomer" style="display: none;">
    <fieldset id="fsByCustomer" style="font-size: 18px; font-weight: bold; height: 55px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCustomerNo">Enter Customer# </label>
                </td>
                <td>
                    <input id="txtCustomerNo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>--%>

<div id="DialogReturnedChecksList" style="display: none;">
    <fieldset id="fsReturnedChecksList" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbReturnedDate" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReturnChecksList" checked="checked">
                    <label for="rbReturnedDate">By Returned Date</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbAppliedDate" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARReturnChecksList">
                    <label for="rbAppliedDate">By Applied Date</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogReturnedChecksDate" style="display: none;">
    <fieldset id="fsReturnedChecksDate" style="font-size: 18px; font-weight: bold; height: 100px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtReturnedChecksDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblReturnedChecksDateFrom">From </label>
                </td>
                <td>
                    <input id="txtReturnedChecksDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblReturnedChecksDateTo">To </label>
                </td>
                <td>
                    <input id="txtReturnedChecksDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblReturnedChecksCustomerNo">Enter Customer# </label>
                </td>
                <td>
                    <input id="txtReturnedChecksCustomerNo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogInvoiceListing" style="display: none;">
    <fieldset id="fsInvoiceListing" style="font-size: 18px; font-weight: bold; height: 210px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbAllInvoices" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList" checked="checked">
                    <label for="rbAllInvoices">All Invoices</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbInvWitDiff" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList">
                    <label for="rbInvWitDiff">Invoices with differences</label>
                </td>
            </tr>
            <%--<tr style="height: 33px;">
                <td>
                    <input id="rbInvRecalc" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList" checked="checked">
                    <label for="rbInvRecalc">Recalculated Fuel Surcharge for a period</label>
                </td>
            </tr>--%>
            <tr style="height: 33px;">
                <td>
                    <input id="rbInvMissing" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList">
                    <label for="rbInvMissing">Missing Invoices</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByTerms" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList" checked="checked">
                    <label for="rbByTerms">Invoice Listing by Terms</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbInvZeroPrice" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARInvoiceList">
                    <label for="rbInvZeroPrice">Invoices with zero priced items</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogAllInvoices" style="display: none;">
    <fieldset id="fsAllInvoices" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtAllInvoicesHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAllInvDateFrom">From </label>
                </td>
                <td>
                    <input id="txtAllInvDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAllInvDateTo">To </label>
                </td>
                <td>
                    <input id="txtAllInvDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogCredits" style="display: none;">
    <fieldset id="fsCredits" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByCreditDate" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARCredits" checked="checked">
                    <label for="rbByCreditDate">By Credit Date</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByCreditDateEntered" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARCredits">
                    <label for="rbByCreditDateEntered">By Date Entered</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogCreditsDate" style="display: none;">
    <fieldset id="fsCreditsDate" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtCreditsHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCreditsDateFrom">From </label>
                </td>
                <td>
                    <input id="txtCreditsDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCreditsDateTo">To </label>
                </td>
                <td>
                    <input id="txtCreditsDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogCardPayments" style="display: none;">
    <fieldset id="fsCardPayments" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbPayDetailed" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARCardPayments" checked="checked">
                    <label for="rbPayDetailed">Detailed</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbPaySummary" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARCardPayments">
                    <label for="rbPaySummary">Summary</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogPayDateType" style="display: none;">
    <fieldset id="fsPayDateType" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbPayDate" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARPayDateType" checked="checked">
                    <label for="rbPayDate">By Date</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbPayDateEntered" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARPayDateType">
                    <label for="rbPayEntered">By Date Entered</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogPaymentsDate" style="display: none;">
    <fieldset id="fsPayments" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtPaymentsHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblPaymentsDateFrom">From </label>
                </td>
                <td>
                    <input id="txtPaymentsDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblPaymentsDateTo">To </label>
                </td>
                <td>
                    <input id="txtPaymentsDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogAdjustment" style="display: none;">
    <fieldset id="fsAdjustment" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByAdjustmentDate" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARAdjustment" checked="checked">
                    <label for="rbByAdjustmentDate">By Adjustment Date</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <input id="rbByAdjustmentDateEntered" class="rbARReports" type="radio" style="margin-top: 8px;" name="ARAdjustment">
                    <label for="rbByAdjustmentDateEntered">By Date Entered</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogAdjustmentDate" style="display: none;">
    <fieldset id="fsAdjustmentDate" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtAdjustmentHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAdjustmentDateFrom">From </label>
                </td>
                <td>
                    <input id="txtAdjustmentDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAdjustmentDateTo">To </label>
                </td>
                <td>
                    <input id="txtAdjustmentDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>


<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="DivPageARINVS" style="display: none;"></div>

<div id="CurrentCustomerNo" style="display: none;"></div>
<div id="CurrentCustomerName" style="display: none;"></div>
<div id="DivAccountsPageOrderNew" style="display: none;"></div>

<div id="msg-YearClose" style="display: none; max-height: 500px; max-width: 600px;" title="Alert">
    <p id="msgYearClose" style="font-weight:bold;font-size: 17px;"></p>
</div>

<div id="msgbox-CustDetailsWarning" style="display:none;">
    <p id="msghtml-CustDetailsWarning" style="font-size:12.5px;font-weight:bold;"></p>
</div>

<div id="DivEODCASHDetailsDialog" style="display:none;">
    <table>
        <tr>
            <td>
                <label style="margin-right:30px;">PREVIOUSBA</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHPreviousBA" style="text-align: right; width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>TOTALAREOD</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHTotalAREod" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>TOTALDEP</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHTotalDep" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>TOTALADJ</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHTotalAdj" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>TOTALRET</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHTotalRet" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
           <td>
               <label>TOTALMISC</label>
           </td>
            <td>
                <input type="text" id="txtEODCASHTotalMisc" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>TOTALDISC</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHTotalDisc" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>
                <label>CREDITCARD</label>
            </td>
            <td>
                <input type="text" id="txtEODCASHCreditCard" style="text-align: right;width:170px;" disabled="disabled" />
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-DayClosingWarning" style="display:none;">
    <p id="msghtml-DayClosingWarning" style="font-size:12.5px;font-weight:bold;text-align:center;"></p>
</div>

<div style="display: none" id="DivHeaderCustDetailsID">0</div>

<div id="LoggedInUserType_Accounts" runat="server" style="display: none"></div>

<div id="msgbox-CODWarning" style="display:none;">
    <p id="msghtml-CODWarning" style="font-size:12.5px;font-weight:bold;text-align:center;"></p>
</div>
<div id="DialogCODReport" style="display: none;">
    <fieldset id="fsCODReport" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtCODReportHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCODFromDate">From </label>
                </td>
                <td>
                    <input id="txtCODFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblCODToDate">To </label>
                </td>
                <td>
                    <input id="txtCODToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogSalesMaintenanceJournal" style="display: none;">
    <fieldset id="fsSalesMaintenanceJournal" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSalesMaintenanceJournalHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesMaintenanceJournalFromDate">From </label>
                </td>
                <td>
                    <input id="txtSalesMaintenanceJournalFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesMaintenanceJournalToDate">To </label>
                </td>
                <td>
                    <input id="txtSalesMaintenanceJournalToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogJournalSummary" style="display: none;">
    <fieldset id="fsJournalSummary" style="font-size: 18px; font-weight: bold; height: 37px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtJournalSummaryDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblJournalSummayDate">As of </label>
                </td>
                <td>
                    <input id="txtJournalSummaryDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>           
        </table>
    </fieldset>
</div>

<div id="DialogSalesByAWBNumber" style="display: none;">
    <fieldset id="fsSalesByAWBNumber" style="font-size: 18px; font-weight: bold; height: 65px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSalesByAWBReceivedDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesByAWBFromDate">From </label>
                </td>
                <td>
                    <input id="txtSalesByAWBFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr> 
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesByAWBToDate">To </label>
                </td>
                <td>
                    <input id="txtSalesByAWBToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>              
        </table>
    </fieldset>
</div>

<div id="DivTotalInvoiceSales" style="display:none;"></div>

<div id="DialogInvoiceDifference" style="display: none;">
    <fieldset id="fsInvoiceDifference" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtInvoiceDifference" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblInvDiffDateFrom">From </label>
                </td>
                <td>
                    <input id="txtInvDiffDateFrom" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblInvDiffDateTo">To </label>
                </td>
                <td>
                    <input id="txtInvDiffDateTo" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogPostReturnByCustomerSearch" style="display: none; margin-top: 20px;">
    <table>
        <tr>
            <td>
                <label>Customer# / Name : </label>
            </td>

            <td>
                <input type="text" id="txtReturnsByCustSearch" style="width: 300px;" />
            </td>
        </tr>
    </table>
</div>

<div id="DivPostReturnByCustDialogContainer" style="display: none">
</div>

<script type="text/javascript">

    var CustomerGridIntialize = false;
    var DlgOverlayCount = 0;
    var DlgNameWitCount = "";
    var ARSessionFromDt = new Date();
    var ARSessionToDt = new Date();
    var IsPostPaymentsTabClicked = false;

    $(document).ready(new function () {

        // $("#DivCustomerDetails .flexigrid .bDiv tr:hover").css('backgroud-color', 'white').css('color', 'black')
        //$("#DivCustomerDetails .flexigrid  .bDiv").hover(function () {
        //    alert('s');

        //});
        var IsVoidedInvoice = "";

        $("#ChkUpdateBalances").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageARINVS.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivPageARINVS").html(output.d);

            },
           
       
        });


        $("#txtClosingDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date().getFullYear() - 1, 11, 31));

        $("#txtStatementDate1").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAgeingTransactionUpto").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtDetailedAgeingTransactionUpto").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());


        $("#DateForTotalARBalance").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());


        $("#DateTotalARBalanceStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate",  new Date( (new Date()).getFullYear()  , (new Date()).getMonth(), 1 ));




        $("#txtDateFrom,#txtDepositFrom,#txtDepositFromED").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtDateTo,#txtDepositTo,#txtDepositToED").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());
        
        $("#txtReturnedChecksDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtReturnedChecksDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAllInvDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAllInvDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtCreditsDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtCreditsDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtPaymentsDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtPaymentsDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAdjustmentDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAdjustmentDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtCODFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtCODToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtSalesMaintenanceJournalFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtSalesMaintenanceJournalToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtJournalSummaryDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtSalesByAWBFromDate,#txtSalesByAWBToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtInvDiffDateFrom,#txtInvDiffDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());
        $("#txtCustSearch").focus();
       
          $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PagePostReturnsByCustomer.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
              success: function (output, status) {
                  debugger;
                $("#DivPostReturnByCustDialogContainer").html(output.d);
            },
        });
    });
       
    $("#txtNacmTransactionUpto").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtPaymentFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtPaymentto").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtSalesFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtSalesto").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

    /*Load Customer# and name:: modified - autoFocus : true :: by Abinaya :: 10May2018*/
    $("#txtCustomerForDetailedAgeing").autocomplete({
        source: function (request, response) {
            debugger
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name
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
            $(".ui-menu").css("z-index", 100000);
        },
        select: function (e, i) {
            debugger
            //$("#DivUser").next('div').find('.msgui').hide();
            $("#txtCustomerForDetailedAgeing").val(i.item.label);
            $("#hdnCustomerForDetailedAgeing").val(i.item.Customer);
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtCustomerForDetailedAgeing").val("");
                $("#hdnCustomerForDetailedAgeing").val("0");
                $("#txtCustomerForDetailedAgeing").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function IntializeCustomerGrid() {
        var monthNames = ["January", "February", "March", "April", "May", "June",
           "July", "August", "September", "October", "November", "December"
        ];
        var now = new Date();
        var dupDate = new Date();
        var CurrentMonthName = monthNames[now.getMonth()];
        var OneMonthBack = monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 1))];
        var TwoMonthBack = monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 2))];
        var ThreeMonthBack = monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 3))];
        var FourMonthBack = monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 4))];

        $("#fgrdCustomerDetails").flexigrid({
            url: 'BloomService.asmx/GetCustomerDetailsForARInquiryFgrd',
            dataType: 'xml',
            colModel: [
                 { display: '<img style="Cursor:pointer;" id="Custselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                 { display: '', name: '', width: 15, sortable: true, align: 'left' },
                 { display: 'CUST#', name: 'Customer', width: 30, sortable: true, align: 'left' },
                 { display: 'Name', name: 'Name', width: 200, sortable: true, align: 'left' },
                 { display: 'APPHONE', name: 'APPHONE', width: 80, sortable: true, align: 'left' },
                 { display: 'APCONTACT', name: 'APCONTACT', width: 150, sortable: true, align: 'left' },
                 { display: 'City', name: 'City', width: 90, sortable: true, align: 'left' },
                 { display: 'State', name: 'ST', width: 20, sortable: true, align: 'left' },
                 { display: 'CO', name: 'CO', width: 20, sortable: true, align: 'left' },
                 { display: 'LastPayment', name: 'LastPayment', width: 40, sortable: true, align: 'left' },
                 { display: 'Days', name: 'Days', width: 20, sortable: true, align: 'left' },
                 { display: 'LastCall', name: 'LastCall', width: 40, sortable: true, align: 'left' },
                 { display: 'Balance', name: 'Balance', width: 70, sortable: true, align: 'right' },
                 { display: 'Orders', name: 'Orders', width: 70, sortable: true, align: 'right' },
 				 { display: 'Hold', name: '', width: 20, sortable: true, align: 'center' },
                 { display: CurrentMonthName, name: CurrentMonthName, width: 70, sortable: true, align: 'right' },
                 { display: OneMonthBack, name: OneMonthBack, width: 70, sortable: true, align: 'right' },
                 { display: TwoMonthBack, name: TwoMonthBack, width: 70, sortable: true, align: 'right' },
                 { display: ThreeMonthBack + "+", name: ThreeMonthBack + "+", width: 70, sortable: true, align: 'right' },
                 { display: "120 days", name: "120 days", width: 70, sortable: true, align: 'right' },
                 { display: 'Creditlimit', name: 'Creditlimit', width: 70, sortable: true, align: 'right' },
                 { display: 'Available', name: 'Available', width: 80, sortable: true, align: 'right' },
                 { display: 'Salesperson', name: 'SalesmanName', width: 100, sortable: true, align: 'left' },
                 { display: 'Opened', name: 'CustSince', width: 40, sortable: true, align: 'left' },
                 { display: 'Terms', name: 'TermsDesc', width: 100, sortable: true, align: 'left' },
            ],
            searchitems: [
                 { display: 'CUST#', name: 'Customer' },
                 { display: 'Name', name: 'Name' },
                 { display: 'APPHONE', name: 'APPHONE' },
                 { display: 'APCONTACT', name: 'APCONTACT' },
                 { display: 'City', name: 'City' },
                 { display: 'State', name: 'ST' },
                 { display: 'Country', name: 'CO' },
                 { display: 'Last Payment', name: 'LastPayment' },
                 { display: 'Days to Pay', name: 'Days' },
                 { display: 'Last Call', name: 'LastCall' },
                 { display: 'Balance', name: 'Balance' },
                 { display: 'Creditlimit', name: 'Creditlimit' },
                 { display: 'Available', name: 'Available' },
                 { display: 'Hold', name: 'Credithold' },
                 { display: 'Sales Person', name: 'SalesmanName' },
                 { display: 'Opened Date', name: 'CustSince' },
                 { display: 'Credit Terms', name: 'TermsDesc' },
            ],
            showTableToggleBtn: true,
            sortname: "NAME Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 280,
            width: $(window).width() - 10,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                //debugger;
                var sel = jQuery("#fgrdCustomerDetails tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCustomerDetails #ExportCSV").show();
                }

                $('#fgrdCustomerDetails #row0').addClass("TotalRows");
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(16)').css({ "background-color": '#FFFF00' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(17)').css({ "background-color": '#FFFF99' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(18)').css({ "background-color": '#FFFF00' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(19)').css({ "background-color": '#FFFF99' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(20)').css({ "background-color": '#FFFF00' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(21)').css({ "background-color": '#DCE6F1', "color": '#1E80CD' });
                $('#fgrdCustomerDetails tr:not(.TotalRows) td:nth-child(22)').css({ "background-color": '#DCE6F1', "color": '#1E80CD' });

                //$('#fgrdCustomerDetails #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(14) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(15) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(16) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(17) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                //$('#fgrdCustomerDetails #row0 td:nth-child(18) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(19) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(20) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                //$('#fgrdCustomerDetails #row0 td:nth-child(21) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                

            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivCustomerDetails .sDiv").css('float', 'left').css('width', '545px');
        $('#DivCustomerDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivCustomerDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivCustomerDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivCustomerDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }

    $("[id^=aCustomer_").die('click').live('click', function () {
       
        var Value = $(this).attr('id').substring(10);
        var Customer = Value.split(',')[0];
        var Date = Value.split(',')[1];
        var para = 'Customer=' + Customer + '&Date=' + Date + '&Page=CallHS';
        $(".imgLoaderForUser").show();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageHistory.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'none');
                $("#DivOrderCallHSDialog").css('display', 'block');
                $('<div id="DivOrderCallHSDialog">/div>').dialog({
                    title: 'Activity Log :: ' + Customer,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivOrderCallHSDialog").html(output.d).dialog("open");
            }
        });
    });


    $("[id^=CustSelect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("CustSelect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'Orderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unOrderselected');
        }


    });

    $("#Custselectall").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdCustomerDetails tr:visible').addClass("trChecked");
            $('#fgrdCustomerDetails tr#row0').removeClass("trChecked");
            $("[id^=CustSelect_]:visible").prop("src", "images/check-on.png");
            $("[id^=CustSelect_]:visible").attr('class', 'Orderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdCustomerDetails tr').removeClass("trChecked");
            $("[id^=CustSelect_]:visible").removeClass('Orderselected');
            $("[id^=CustSelect_]").prop("src", "images/check-off.png");
        }
    });

    $(".tabs").die('click').live("click", function (e) {
        $(".tabs").css('background', '#dddddd')
        $(".tabs").css('color', 'black');
        $(this).css('background', '#0000ff')
        $(this).css('color', 'white');
    });

    $(".tab-1").die('click').live("click", function (e) {
        IsPostPaymentsTabClicked = false;
        $(".tabcontent").css('display', 'none');
        $("#tab-1").css("display", 'block');
        if (CustomerGridIntialize == false) {
            IntializeCustomerGrid();
            CustomerGridIntialize = true;
        }

        //else {
        //    $(this).css('background', '#dddddd')
        //    $(this).css('color', 'black');
        //   
        //}
    });

    $(".tab-2").die('click').live("click", function (e) {
        debugger
        
        IsPostPaymentsTabClicked = true;
        $(".tabcontent").css('display', 'none');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PagePostPayments.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $("#tab-2").css("display", 'block');
                $("#tab-2").html(output.d);
            }
        });
    });

    $(".tab-4").die('click').live("click", function (e) {
        IsPostPaymentsTabClicked = false;
        $(".tabcontent").css('display', 'none');
        $("#lblTotalARBalance").css("display", "none");
        $("#DivARSummary").css("display", "none");        
        $("#tab-4").css("display", 'block');
    });

    $("#btnCustomerStatementAsEmail").die("click").live("click", function () {
        if ($("#fgrdCustomerDetails .trChecked").length == 0) {
            $.MessageBox("Please select a customer to send statement");
            return 0;
        }
        else {
            $("#hfEmailorFaxForSendStatement").text("Email");

            $("#txtStatementDate1").attr('disabled', true);
            $("#SendStatementForMultipleCustomersDialog").dialog('option', 'title', 'Statement');
            $("#SendStatementForMultipleCustomersDialog").next('div').find('.msgui').remove();
            $("#SendStatementForMultipleCustomersDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
            $("#SendStatementForMultipleCustomersDialog").dialog("open");
        }
    });

    $("#SendStatementForMultipleCustomersDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 424,
        modal: true,
        title: 'Email To',
        buttons: {
            PDF: function () {
                var w = window.open('GeneratingPDF.html');
                var CustomerNos = [];
                $('#fgrdCustomerDetails tr:visible').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            CustomerNos.push($(this).attr("id").replace("row", ""));
                        }
                    }
                });

                if (CustomerNos.length == 0) {
                    $.MessageBox("Please select a customer to send email");
                    return 0;
                }
                else {
                    CustomerNos.join(',');
                }
                $("#SendStatementForMultipleCustomersDialog").next('div').find('.msgui').html('Generating...<img src="images/ajax-loader.gif"/>');
                $("#SendStatementForMultipleCustomersDialog").next('div').find('.msgui').show();
                var SendByOutlook = 0;
                if ($('#chkSendStatementByOutlook').is(':checked')) {
                    SendByOutlook = 1;
                }
                var StatementDate = $("#txtStatementDate1").val();

                //PrintAndSendStatementReportForCustomer(CustomerNos, StatementDate, SendByOutlook);

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendStatementReportForCustomer',
                    data: "{'Customers':'" + CustomerNos + "','StatementDate':'" + StatementDate
                        + "','EmailToIDs':'','SendEmailByOutlook':'" + SendByOutlook + "','EmailOrPDF':'PDF'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        window.repOutput = output;
                        $("#SendStatementForMultipleCustomersDialog").dialog("close");
                        if (output.d == null) {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            var ReportsResult = "";
                            if (output.d.Result) {
                                ReportsResult = output.d.Result;
                            } else {
                                ReportsResult = output.d;
                            }
                            // var ReportsResult = output.d.Result; // if using ASYNC
                            
                            if (ReportsResult.length == 0) {
                                $("#ARINVSStatementDialog").dialog("close");
                                w.close();
                            }
                            else {
                                $("#ARINVSStatementDialog").dialog("close");
                                //w.location = ReportsResult[0];//Report Path 
                                //2020/09/12
                                //w.location = ReportsResult.Result;//Report Path 
                                w.location = ReportsResult; //Report Path 
                            }
                        }

                    }
                });
            },
            Send: function () {


                var CustomerNos = [];
                $('#fgrdCustomerDetails tr:visible').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            CustomerNos.push($(this).attr("id").replace("row", ""));
                        }
                    }
                });

                if (CustomerNos.length == 0) {
                    $.MessageBox("Please select a customer to send email");
                    return 0;
                }
                else {
                    CustomerNos.join(',');
                }
                $("#SendStatementForMultipleCustomersDialog").next('div').find('.msgui').html('Sending...<img src="images/ajax-loader.gif"/>');
                $("#SendStatementForMultipleCustomersDialog").next('div').find('.msgui').show();
                var SendByOutlook = 0;
                if ($('#chkSendStatementByOutlook').is(':checked')) {
                    SendByOutlook = 1;
                }
                var StatementDate = $("#txtStatementDate1").val();

                //PrintAndSendStatementReportForCustomer(CustomerNos, StatementDate, SendByOutlook);

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendStatementReportForCustomer',
                    data: "{'Customers':'" + CustomerNos + "','StatementDate':'" + StatementDate
                        + "','EmailToIDs':'','SendEmailByOutlook':'" + SendByOutlook + "','EmailOrPDF':'Email'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                       
                        if (output.d == null) {
                            $("#SendStatementForMultipleCustomersDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            $("#SendStatementForMultipleCustomersDialog").dialog("close");
                            var ReportsResult = output.d;
                            $('#fgrdCustomerDetails tr:visible').each(function () {
                                debugger;
                                if ($(this).attr("id") != "row0") {
                                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                        var id = $(this).attr("id").replace("row", "");
                                        for (var i = 0; i < ReportsResult.length; i++) {
                                            if (id == ReportsResult[i][0]) {
                                                $(this).find("td div").eq(0)[0].childNodes[0].src = "images/check-off.png";
                                            }
                                        }
                                    }
                                }
                            });
                            var CompanyName = '<%=ConfigurationManager.AppSettings("CompanyName")%>';
                            for (var i = 0; i < ReportsResult.length; i++) {
                                var Customer = ReportsResult[i][0]; //Customer
                                var Tomail = ReportsResult[i][1]; //EmailIDs
                                var CustomerName = ReportsResult[i][2]; //CustomerName   
                                var PDFPath = ReportsResult[i][3]; //PDFPath   
                                var PrintPDFOnWindow = ReportsResult[i][4];  //Pdf Need to Print on the window For Customer(True/False)
                                //var Content = contres[0].GrowerMailContent;
                               
                                if (SendByOutlook == "1") {
                                    var subject = CompanyName + " Statement For " + CustomerName + " as of " + StatementDate
                                    var msg = "";
                                    var emailBody = "";
                                    emailBody = ' %0D%0A ' + PDFPath;
                                    if (Tomail != "") {
                                        window.location.href = "mailto:" + Tomail + "?subject=" + subject + "&body=" + msg + emailBody;
                                    }
                                }
                                if (PrintPDFOnWindow == "True") {
                                    window.open(PDFPath);
                                }
                            }
                        }
                      <%--  else if (SendByOutlook == "1") {
                            $("#SendStatementForMultipleCustomersDialog").dialog("close");
                            var ReportsResult = output.d;
                            var CompanyName = '<%=ConfigurationManager.AppSettings("CompanyName")%>';
                            for (var i = 0; i < ReportsResult.length; i++) {
                                var Customer = ReportsResult[i][0]; //Customer
                                var Tomail = ReportsResult[i][1]; //EmailIDs
                                var CustomerName = ReportsResult[i][2]; //CustomerName                        
                                //var Content = contres[0].GrowerMailContent;
                                var subject = CompanyName + " Statement For " + CustomerName + " as of " + StatementDate
                                var msg = "";
                                var emailBody = "";
                                emailBody = ' %0D%0A ' + ReportsResult[i][3];
                                if (Tomail != "") {
                                    window.location.href = "mailto:" + Tomail + "?subject=" + subject + "&body=" + msg + emailBody;
                                }
                            }
                        }
                        else {
                            $("#SendStatementForMultipleCustomersDialog").dialog("close");
                        }--%>

                    }
                });
            },

            Close: function () {
                $("#SendStatementForMultipleCustomersDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtStatementDate1").attr('disabled', false);
            //$("#txtEmailIDsForSendStatement").val($("#hf_CustEmail").text());
            //$("#txtFaxForInvoice").val($("#hf_CustFax").text());
        },
    });


    $("#MsgWarning").dialog({
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


 

    /*Load Customer# and name:: modified - autoFocus : true :: by Abinaya :: 10May2018*/
    //27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Starts
    //$("#txtCustSearch").autocomplete({
    //    source: function (request, response) {
    //        debugger
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetCustForAutocompleteAR',
    //            data: "{'Searchtext': '" + request.term + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (data) {
    //                debugger
    //                response($.map(data.d, function (item) {
    //                    return {
    //                        label: "[" + item.Customer + "] " + item.Name,
    //                        Customer: item.Customer,
    //                        Name: item.Name
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

    //        //$(".ui-menu").css("width", 250);
    //        $(".ui-menu").css("z-index", 1000);
    //        //if ($("#imgToggle").css('display') == 'none')
    //        //    $(".ui-menu").css("left", 1085);
    //        //else
    //        //    $(".ui-menu").css("left", 1095);
    //    },
    //    select: function (e, i) {
    //        debugger
    //        //$("#DivUser").next('div').find('.msgui').hide();
    //        $("#txtCustSearch").val(i.item.Customer);

    //        autocomplteSelect(i.item.Customer, i.item.Name);
    //    },
    //    change: function (e, i) {

    //        if (i.item == null || i.item == undefined) {
    //            $("#txtCustSearch").val("");
    //            $("#txtCustSearch").focus();
    //            $(".ui-menu").css("display", "none");
    //        }
    //    },
    //    minLength: 1,
    //    autoFocus: true
    //});

    
    $("#txtCustSearch").autocomplete({
        source: function (request, response) {
            debugger
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + "[" + item.SalesMan + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name,
                            SalesMan: item.SalesMan
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

            //$(".ui-menu").css("width", 250);
            $(".ui-menu").css("z-index", 1000);
            //if ($("#imgToggle").css('display') == 'none')
            //    $(".ui-menu").css("left", 1085);
            //else
            //    $(".ui-menu").css("left", 1095);
        },
        select: function (e, i) {
            debugger
            //$("#DivUser").next('div').find('.msgui').hide();
            $("#txtCustSearch").val(i.item.Customer);

            autocomplteSelect(i.item.Customer, i.item.Name,
                i.item.SalesMan);
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtCustSearch").val("");
                $("#txtCustSearch").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });
    //27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Ends

    //$.ajax({
    //    type: "POST",
    //    url: 'BloomService.asmx/GetPage',
    //    data: '{ "controlName":"pages/PageOrderNew.ascx","controlPara":"" }',
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (output, status) {
    //        $("#DivAccountsPageOrderNew").html(output.d);
    //    }
    //});

    function autocomplteSelect(Customer, Name) {
        LoadCustomerDetailsByCustNo(Customer);
        $("#CurrentCustomerNo").html(Customer);
        $("#CurrentCustomerName").html(Name);
        $("#fgrdARINVCustomer").empty();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: "0" }], query: "", newp: 1 }).flexReload();
        $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        $("#DivARINVCustomerGridDialog").data("Customer", Customer).dialog("open");
    }

    $(".rbsearch").change(function () {
        $("#txtCustSearch").val("");
        $("#txtInvSearch").val("");
        $('#txtPOSearch').val("");
        $(".ui-menu").css("display", "none");

        if ($("#rbinv").attr("checked")) {
            $('#txtPOSearch').hide();
            $('#txtCustSearch').hide();
            $('#txtInvSearch').show();
        }
        else if ($("#rbcust").attr("checked")) {
            $('#txtPOSearch').hide();
            $('#txtInvSearch').hide();
            $('#txtCustSearch').show();
        }
        else {
            $('#txtInvSearch').hide();
            $('#txtCustSearch').hide();
            $('#txtPOSearch').show();
        }
    });




    function editorder(OrderNo, CustomerNo) {
        //Muthu Nivetha M :: 12 Mar 19 :: Add VOID when showing a voided invoice 
        //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
        var para = "Page=CustDetails&OrderNo=" + OrderNo + "&Customer=" + CustomerNo + "&IsVoidedOrder=" + IsVoidedInvoice;
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageOrderDetails.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'block');
                $("#DivOrderCallHSDialog").css('display', 'none');
                $('<div id="DivOrderDetailsDialog">/div>').dialog({
                    title: '<div> ORDER UPDATE :: ' + OrderNo + '</div><div>' + IsVoidedInvoice + '</div>',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1256,
                    //height: 650,
                    //closeOnEscape:false,
                    beforeClose: function () {
                        FuelUpdate(OrderNo)
                    },
                    close: function (event, ui) {

                        $(this).dialog('destroy').remove();
                        $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                        $("#txtInvSearch").val("");
                        $("#ctl00_DivOrderNo_OrderSave").html("");
                        $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivOrderDetailsDialog").data("Order", OrderNo).html(output.d).dialog("open");
            }
        });
    }

    function FuelUpdate(OrderNo) {
        debugger
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/FuelUpdate',
            data: "{ 'OrderNumber': '" + OrderNo + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var data = output.d;
                if (data == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    $("#txtInvSearch").keypress(function (e) {
        //debugger;
        //Muthu Nivetha M :: 12 Mar 19 :: Add VOID when showing a voided invoice 
        //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
        if (e.which == 13) {
            IsVoidedInvoice = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderDateByrderNo',
                data: '{"OrderNo":"' + $("#txtInvSearch").val().toString() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    var data = output.d.VOID;
                    IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/CheckInvoice',
                        data: "{'Searchtext': '" + $("#txtInvSearch").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            var customer = output.d;
                            if (customer.trim().toLowerCase() != "error" && customer.trim().toLowerCase() != "") {
                                //debugger;
                                editorder($("#txtInvSearch").val().toString(), customer)
                            }
                            else {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/CheckVETInvoice',
                                    data: "{'Searchtext': '" + $("#txtInvSearch").val() + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (result) {

                                        var out = result.d;
                                        if (result.d.length >= 1) {
                                            LoadVETCustomerDetailsByCustNo(out[0].Customer, out[0].RecDate, "DivVETInvoiceGridDialog");
                                            $("#DivVETInvoiceNo").html(out[0].Invoice);
                                            //loadVETInvoiceGrid(splitstr[0]);
                                            $("#fgrdVETINVCustomer").empty();
                                            $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: out[0].Invoice }], query: "", newp: 1 }).flexReload();

                                            $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + out[0].Invoice + '</div><div>' + IsVoidedInvoice + '</div>');
                                            //$("#DivVETInvoiceGridDialog").data('Invoice', out[0].Invoice).dialog("open");
                                            $("#DivVETInvoiceGridDialog").data("inData", { Invoice: out[0].Invoice, Customer: out[0].Customer }).dialog("open");
                                        }
                                        else {
                                            $("#msgbox-warn").dialog("open");
                                            $("#msghtml").html("Invoice not found");
                                            $("#txtInvSearch").val("");
                                        }
                                    }
                                });
                            }

                        },
                        onError: function (xhr, status, errorThrown) {
                            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                window.location.href = "Login.aspx";
                            }
                        }
                    });
                }
            });

            
        }
    });

    $("#txtPOSearch").autocomplete({
        source: function (request, response) {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPONumberFromVETForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (VET) {
                        return {
                            label: VET.PO,
                            PO: VET.PO
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
            $(".ui-menu").css("z-index", 1000);
        },
        select: function (e, i) {

            PONumberAutocompleteSelect(i.item.PO);
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtPOSearch").val("");
                $("#txtPOSearch").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function PONumberAutocompleteSelect(PONumber) {
        $("#txtPOSearch").val("");
       
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInvoiceNoListFromVETByPONumber',
            data: "{'PONumber': '" + PONumber + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
               
                var VETData = output.d;
                var InvoiceList = ""
                InvoiceList += "<table style='margin: 0 auto;'>"
                InvoiceList += "<tr><td><b>PONumber :: " + PONumber + " </b></td></tr>"
                InvoiceList += "<tr><td class='InvoiceListtd' style='background-color: #dedede;text-align: center'>Invoice</td></tr>"

                for (var i in VETData) {
                    InvoiceList += '<tr><td class="InvoiceListtd">' + VETData[i].Invoice + '</td></tr>';
                }
                InvoiceList += "</table>"
                $.MessageBox(InvoiceList);
            }
        });
    }



    $("#btnGetTotalARBalance").die('click').live("click", function (e) {



        $("#lblTotalSales").html("0.00");
        $("#lblTotalVoids").html("0.00");
        $("#lblTotalCredits").html("0.00");
        $("#lblTotalAdjustments").html("0.00");
        $("#lblTotalPayments").html("0.00");
        $("#lblTotalUnapplied").html("0.00");
        $("#lblTotalCreditCardPayments").html("0.00");
        $("#lblTotalReturnChecks").html("0.00");
        $("#lblTotalLateCharges").html("0.00");
        $("#lblTotalDebits").html("0.00");

        $("#lblTotalCalculatedSales").html("0.00");
        $("#lblTotalCalculatedVoids").html("0.00");
        $("#lblTotalCalculatedCredits").html("0.00");
        $("#lblTotalCalculatedAdjustments").html("0.00");
        $("#lblTotalCalculatedPayments").html("0.00");
        $("#lblTotalCalculatedUnapplied").html("0.00");
        $("#lblTotalCalculatedCreditCardPayments").html("0.00");
        $("#lblTotalCalculatedReturnChecks").html("0.00");
        $("#lblTotalCalculatedLateCharges").html("0.00");
        $("#lblTotalCalculatedDebits").html("0.00");

        $("#lblTotalDiffSales").html("0.00");
        $("#lblTotalDiffVoids").html("0.00");
        $("#lblTotalDiffCredits").html("0.00");
        $("#lblTotalDiffAdjustments").html("0.00");
        $("#lblTotalDiffPayments").html("0.00");
        $("#lblTotalDiffUnapplied").html("0.00");
        $("#lblTotalDiffCreditCardPayments").html("0.00");
        $("#lblTotalDiffReturnChecks").html("0.00");
        $("#lblTotalDiffLateCharges").html("0.00");
        $("#lblTotalDiffDebits").html("0.00")

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTotalBalanceOfAR',
            data: "{'AsOfDate':'" + $("#DateForTotalARBalance").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
               

                //.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") this for formatting number with commas
                $("#lblTotalARBalance").html("Total A/R............." + result.d.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
            },
        });

        $("#DateForTotalARBalance").val();

        GetStartDate = $("#DateForTotalARBalance").val().replace("-", "/").split("/");
        GetStartDate[1] = "01";
        StartDate = $("#DateTotalARBalanceStart").val();
        EndDate = $("#DateForTotalARBalance").val();
        $("#MonthHeaderARSummary").html("From " + StartDate + " To " + EndDate + "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetARSummaryDetails',
            data: "{'StartDate':'" + StartDate + "','EndDate':'" + EndDate + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
               

                if (result.d != null) {

                    console.log(result.d);
                    /*Totals*/
                    $("#lblTotalSales").html(result.d.TotalSales.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalVoids").html(result.d.TotalVoids.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCredits").html(result.d.TotalCredits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalAdjustments").html(result.d.TotalAdjustments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalPayments").html(result.d.TotalPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalUnapplied").html(result.d.TotalUnapplied.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCreditCardPayments").html(result.d.TotalCreditCardPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalReturnChecks").html(result.d.TotalReturnChecks.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalLateCharges").html(result.d.TotalLateCharges.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDebits").html(result.d.TotalDebits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));

                    /*Calculated*/
                    $("#lblTotalCalculatedSales").html(result.d.TotalCalcSales.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedVoids").html(result.d.TotalCalcVoids.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedCredits").html(result.d.TotalCalcCredits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedAdjustments").html(result.d.TotalCalcAdjustments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedPayments").html(result.d.TotalCalcPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedUnapplied").html(result.d.TotalCalcUnapplied.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedCreditCardPayments").html(result.d.TotalCalcCreditCardPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedReturnChecks").html(result.d.TotalCalcReturnChecks.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedLateCharges").html(result.d.TotalCalcLateCharges.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalCalculatedDebits").html(result.d.TotalCalcDebits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));



                    /*Difference*/
                    $("#lblTotalDiffCalculatedSales").html(result.d.TotalDiffSales.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffVoids").html(result.d.TotalVoids.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffCredits").html(result.d.TotalDiffCredits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffAdjustments").html(result.d.TotalDiffAdjustments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffPayments").html(result.d.TotalDiffPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffUnapplied").html(result.d.TotalDiffUnapplied.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffCreditCardPayments").html(result.d.TotalDiffCreditCardPayments.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffReturnChecks").html(result.d.TotalDiffReturnChecks.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffLateCharges").html(result.d.TotalDiffLateCharges.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    $("#lblTotalDiffDebits").html(result.d.TotalDiffDebits.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));




                }
                $("#lblTotalARBalance").css("display", "block");
                $("#DivARSummary").css("display", "block");                
            },
        });

    });

    $("#btnAgeingReport").die("click").live("click", function () {
        $("#txtAgeingTransactionUpto").attr('disabled', true);
        $("#AgeingReportDialog").dialog('option', 'title', 'Summary Ageing');
        $("#AgeingReportDialog").next('div').find('.msgui').remove();
        $("#AgeingReportDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Generating...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
        $("#AgeingReportDialog").dialog("open");
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            var data = output.d;
            $('#lstSalesPerson').empty();
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');

            $('#lstSalesPersonForDetailedAgeing').append('<option selected="selected" value="">All Sales persons</option>');
            
            if (data.length == 0) {
                $('#lstSalesPerson').val("");
            }
            else {
                for (var i in data) {
                    var res = data[i];
                    var lstValue = "";
                    if (res.SlsName.trim() == "")
                        lstValue = "" + res.Salesman + "";
                    else
                        lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                    $('#lstSalesPerson').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                    $('#lstSalesPersonForDetailedAgeing').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                    
                }
            }
        }
    });

    $("#AgeingReportDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 424,
        modal: true,
        title: 'Ageing Report',
        buttons: {
            Excel: function () {
                PrintAgeingReport("Excel")
            },
            PDF: function () {
                PrintAgeingReport("PDF")
            },

            Close: function () {
                $("#AgeingReportDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');

            $("#txtAgeingTransactionUpto").attr('disabled', false);
        },
    });



    function PrintAgeingReport(ExportType) {
        //	    if (ExportType) == "PDF"
        //			{
        var w = window.open('GeneratingPDF.html');
        //			}
        //	    else
        //			{
        //				var w = window.open('GeneratingExcel.html');
        //			}

        var SalesPerson = $('#lstSalesPerson').val();
        var TransactionDateUpto = $("#txtAgeingTransactionUpto").val();
        var UpdateCustomerBalances = $('#ChkUpdateBalances').is(":checked") ? "1" : "0";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintAgeingReport',
            data: "{'SalesPerson':'" + SalesPerson + "','TransactionUpto':'" +
            TransactionDateUpto + "','ExportType':'" + ExportType + "','ExportType':'" + ExportType
            + "','UpdateCustomerBalances':'" + UpdateCustomerBalances + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#AgeingReportDialog").dialog("close");
                if (output.d.indexOf("error") >= 0) {
                    w.close()
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d == null) {
                    w.close()
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else {
                    var ReportsResult = output.d;
                    if (ExportType == "PDF") {
                        w.location = ReportsResult;//Report Path
                    }
                    else {
                        w.close()
                        window.open(ReportsResult)
                    }
                }
            }
        });
    }

    /* updated by Jose Diaz 08/01/2018   Detailed Ageing ( taken from Summary ageing code)*/


    $("#btnDetailedAgeingReport").die("click").live("click", function () {
        $("#txtDetailedAgeingTransactionUpto").attr('disabled', true);
        $("#DetailedAgeingReportDialog").dialog('option', 'title', 'Detailed Ageing');
        $("#DetailedAgeingReportDialog").next('div').find('.msgui').remove();
        $("#DetailedAgeingReportDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Generating...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
        $("#txtCustomerForDetailedAgeing").val("");
        $("#DetailedAgeingReportDialog").dialog("open");
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            var data = output.d;
            $('#lstSalesPerson').empty();
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');
            if (data.length == 0) {
                $('#lstSalesPerson').val("");
            }
            else {
                for (var i in data) {
                    var res = data[i];
                    var lstValue = "";
                    if (res.SlsName.trim() == "")
                        lstValue = "" + res.Salesman + "";
                    else
                        lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                    $('#lstSalesPerson').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                }
            }
        }
    });

    $("#DetailedAgeingReportDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 424,
        modal: true,
        title: 'Ageing Report',
        buttons: {
            PDF: function () {
                PrintDetailedAgeingReport("PDF")
            },
            Excel: function () {
                PrintDetailedAgeingReport("Excel")
            },                       
            Close: function () {
                $("#DetailedAgeingReportDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');

            $("#txtDetailedAgeingTransactionUpto").attr('disabled', false);
        },
    });

    function PrintDetailedAgeingReport(ExportType) {

        //var w = window.open('GeneratingPDF.html');
        var SalesPerson = $('#lstSalesPersonForDetailedAgeing').val();
        var TransactionDateUpto = $("#txtDetailedAgeingTransactionUpto").val();
        var Customer = $("#hdnCustomerForDetailedAgeing").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintDetailedAgeingReport',
            data: "{'SalesPerson':'" + SalesPerson + "','TransactionUpto':'" + TransactionDateUpto + "','ExportType':'" + ExportType + "','Customer':'" + Customer + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#DetailedAgeingReportDialog").dialog("close");
                if (output.d.indexOf("error") >= 0) {
					w.close()    
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d == null) {
					w.close() 
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else {
                    var ReportsResult = output.d;

                    window.open(ReportsResult);

                }
            }
        });
    }
    /* Added by Jose Diaz 24JAN2018   Collection Report ( taken from Summary ageing code)*/
    $("#btnARCollectionReport").die("click").live("click", function () {        
        $("#txtPaymentFrom").attr('disabled', true);
        $("#txtPaymentto").attr('disabled', true);
        $("#txtIncludeDays").attr('disabled', true);
        $("#txtSalesFrom").attr('disabled', true);
        $("#txtSalesto").attr('disabled', true);

        $("#CollectionReportDialog").dialog('option', 'title', 'Collection Report');
        $("#CollectionReportDialog").next('div').find('.msgui').remove();
        $("#CollectionReportDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Generating...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
        $("#CollectionReportDialog").dialog("open");
        
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            var data = output.d;
            $('#lstSalesPerson').empty();
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');
            if (data.length == 0) {
                $('#lstSalesPerson').val("");
            }
            else {
                for (var i in data) {
                    var res = data[i];
                    var lstValue = "";
                    if (res.SlsName.trim() == "")
                        lstValue = "" + res.Salesman + "";
                    else
                        lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                    $('#lstSalesPerson').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                }
            }
        }
    });    

    $("#CollectionReportDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 424,
        modal: true,
        title: 'Collection Report',
        buttons: {
            Excel: function () {
                PrintARCollectionReport("Excel")
            },
            PDF: function () {
                PrintARCollectionReport("PDF")
            },

            Close: function () {
                $("#CollectionReportDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtPaymentFrom").attr('disabled', false);
            $("#txtPaymentto").attr('disabled', false);
            $("#txtIncludeDays").attr('disabled', false);
            $("#txtSalesFrom").attr('disabled', false);
            $("#txtSalesto").attr('disabled', false);
        },
    });

    function PrintARCollectionReport(ExportType) {

        var w = window.open('GeneratingPDF.html');
        var PaymentFrom = $('#txtPaymentFrom').val();
        var PaymentTo = $('#txtPaymentto').val();
        var IncludeDays = $('#txtIncludeDays').val();
        if (IncludeDays == "")
            IncludeDays= $('#txtIncludeDays').attr("placeholder");
        var SalesFrom = $('#txtSalesFrom').val();
        var SalesTo = $('#txtSalesto').val();
        var ReportType = "0"
        var CheckedID = $("input[name='ReportType']:checked").attr("id");
        if (CheckedID == "rdoSPWhoMadeSale") {
            ReportType = "0"
        }
        else {
            ReportType = "1"
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintCollectionReport',
            data: "{'PaymentFrom':'" + PaymentFrom + "','PaymentTo':'" + PaymentTo + "','IncludeDays':'" + IncludeDays + "','SalesFrom':'" + SalesFrom + "','SalesTo':'" + SalesTo + "','ReportType':'" + ReportType + "','ExportType':'" + ExportType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#CollectionReportDialog").dialog("close");
                if (output.d.indexOf("error") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d == null) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else {
                    var ReportsResult = output.d;
                    if (ExportType == "PDF") {
                        w.location = ReportsResult;//Report Path
                    }
                    else {
                        w.close()
                        window.open(ReportsResult)
                    }
                }
            }
        });
    }



    /* Added by Jose Diaz 24JAN2018   Nacm Report ( taken from Summary ageing code)*/


    $("#btnNacmReport").die("click").live("click", function () {
        //$("#txtAgeingTransactionUpto").attr('disabled', true);
        //$("#AgeingReportDialog").dialog('option', 'title', 'Nacm Report');
        //$("#AgeingReportDialog").next('div').find('.msgui').remove();
        //$("#AgeingReportDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Generating...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
        //$("#AgeingReportDialog").dialog("open
        $("#txtNacmTransactionUpto").attr('disabled', true);
        $("#NacmReportDialog").dialog('option', 'title', 'Nacm Report');
        $("#NacmReportDialog").next('div').find('.msgui').remove();
        $("#NacmReportDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Generating...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
        $("#NacmReportDialog").dialog("open");
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/LoadSalesPersonOnlyinCustomertable',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            var data = output.d;
            $('#lstSalesPerson').empty();
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersWithoutGroupBySalesPerson">Alphabetically by customer</option>');
            $('#lstSalesPerson').append('<option selected="selected" value="AllCustomersGroupedBySalesPerson">All Sales persons</option>');


            if (data.length == 0) {
                $('#lstSalesPerson').val("");
            }
            else {
                for (var i in data) {
                    var res = data[i];
                    var lstValue = "";
                    if (res.SlsName.trim() == "")
                        lstValue = "" + res.Salesman + "";
                    else
                        lstValue = "" + res.Salesman + " - [" + res.SlsName + "]";
                    $('#lstSalesPerson').append('<option value="' + res.Salesman + '">' + lstValue + '</option>');
                }
            }
        }
    }); 

    //$("#NacmReportDialog").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    width: 424,
    //    modal: true,
    //    title: 'Nacm Report',
    //    buttons: {
    //        Excel: function () {
    //            PrintAgingReport("Excel")
    //        },
    //        PDF: function () {
    //            PrintAgingReport("PDF")
    //        },

    //        Close: function () {
    //            $("#NacmReportDialog").dialog("close");
    //        }
    //    },
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
    //        $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save');
    //        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');

    //        $("#txtAgeingTransactionUpto").attr('disabled', false);
    //    },
    //});

    //function PrintNacmReport(ExportType) {

    //    var w = window.open('GeneratingPDF.html');
    //    var SalesPerson = $('#lstSalesPerson').val();
    //    var TransactionDateUpto = $("#txtAgeingTransactionUpto").val();
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/PrintAgeingReport',
    //        data: "{'SalesPerson':'" + SalesPerson + "','TransactionUpto':'" + TransactionDateUpto + "','ExportType':'" + ExportType + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output) {
    //            $("#AgeingReportDialog").dialog("close");
    //            if (output.d.indexOf("error") >= 0) {
    //                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
    //            }
    //            else if (output.d == null) {
    //                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
    //            }
    //            else {
    //                var ReportsResult = output.d;
    //                if (ExportType == "PDF") {
    //                    w.location = ReportsResult;//Report Path
    //                }
    //                else {
    //                    w.close()
    //                    window.open(ReportsResult)
    //                }
    //            }
    //        }
    //    });
    //}

    $("#NacmReportDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 424,
        modal: true,
        title: 'Nacm Report',
        buttons: {
            Excel: function () {
                PrintNacmReport("Excel")
            },
            Close: function () {
                $("#NacmReportDialog").dialog("close");
            }
        },
        open: function () {

            $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');

            $("#txtNacmTransactionUpto").attr('disabled', false);
        },
    });

    function PrintNacmReport(ExportType) {
        debugger
        var w = window.open('GeneratingPDF.html');
        var TransactionDateUpto = $("#txtNacmTransactionUpto").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintNacmReport',
            data: "{'TransactionUpto':'" + TransactionDateUpto + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                $("#NacmReportDialog").dialog("close");
                if (output.d == null) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else {
                    var ReportsResult = output.d;
                    if (ExportType == "PDF") {
                        w.location = ReportsResult;//Report Path
                    }
                    else {
                        w.close()
                        window.open(ReportsResult)
                    }
                }
            }
        });
    }
    /*Listing Menu :: 19Dec2017 :: by ABI*/
    $(".tab-3").die('click').live("click", function (e) {
        IsPostPaymentsTabClicked = false;
        $(".tabcontent").css('display', 'none');
        $("#tab-3").css("display", 'block');
        $("#DialogARReports").dialog("open");
    });

    $("#DialogARReports").dialog({
        autoOpen: false,
        resizable: false,
        title: "A/R Reports",
        width: 550,
        height: 495,
        modal: true,
        buttons: {
            Next: function () {
                //debugger;
                var CheckedID = $("input[name='ARReports']:checked").attr("id");
                if (CheckedID == "rbDepositList") {
                    $("#DialogDepositListing").dialog("open");
                }
                else if (CheckedID == "rbReturnedCheck") {
                    $("#DialogReturnedChecksList").dialog("open");
                }
                else if (CheckedID == "rbInvoiceListing") {
                    $("#DialogInvoiceListing").dialog("open");
                }
                else if (CheckedID == "rbCreditsByCustomer") {
                    $("#DialogCredits").dialog("open");
                }
                else if (CheckedID == "rbCreditPayments") {
                    $("#DialogCardPayments").dialog("open");
                }
                else if (CheckedID == "rbAdjustment") {
                    $("#DialogAdjustment").dialog("open");
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
                else if (CheckedID == "rbCODReport") {
                    $("#txtCODFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtCODToDate").datepicker('setDate', ARSessionToDt);
                    $("#DialogCODReport").dialog("open");
                }
                else if (CheckedID == "rbSalesMaintenancejournal") {                    
                    $("#txtSalesMaintenanceJournalFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtSalesMaintenanceJournalToDate").datepicker('setDate', ARSessionToDt);
                    $("#DialogSalesMaintenanceJournal").dialog("open");
                }
                else if (CheckedID == "rbJournalSummary") {
                    //PrintJournalSummary();
                    $("#DialogJournalSummary").dialog("open");
                }
                else if (CheckedID == "rbSalesByAWBNumber") {
                    $("#DialogSalesByAWBNumber").dialog("open");
                }
                
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogARReports";
            $("#rbDepositList").attr("checked", true);
            $("#DialogARReports").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    /*Focus next button when users change the reports options*/
    $("input[name=ARReports]").on("click", function () {
        $("#DialogARReports").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

var DepositType = "";
$("#DialogDepositListing").dialog({
    autoOpen: false,
    resizable: false,
    title: "Deposit Listing",
    width: 370,
    height: 300,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedDepositID = $("input[name='ARDepositsList']:checked").attr("id");
            if (CheckedDepositID == "rbDeposit") {
                DepositType = "A Deposit"
                $("#DialogADeposit").dialog("open").data("DepositType", DepositType);
            }
            else if (CheckedDepositID == "rbAllDeposits") {
                DepositType = "All Deposits"
                $("#DialogAllDeposits").dialog("open").data("DepositType", DepositType);;
            }
            else if (CheckedDepositID == "rbDepositSummary") {
                DepositType = "Deposit Summary";
                $("#DialogDepositSummary").dialog("open").data("DepositType", DepositType);;
            }
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogDepositListing";
        $("#rbNewDeposit").attr("checked", true);
        $("#DialogDepositListing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the deposit listing options*/
$("input[name=ARDepositsList]").on("click", function () {
    $("#DialogDepositListing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogADeposit").dialog({
    autoOpen: false,
    resizable: false,
    title: "A Deposit",
    width: 390,
    height: 250,
    modal: true,
    buttons: {
        Print: function () {
            var DepositNo = $("#txtDepositNo").val();
            var CheckNo = ($("#txtCheckNo").val() == "") ? "0" : $("#txtCheckNo").val();
            var BankNo = $("#txtBankNo").val();
            var whereClause = "Check='" + CheckNo + "' and Bank='" + BankNo + "'";
           
            if (DepositNo == "") {
                $.MessageBox("Enter Deposit number");
                $("#txtDepositNo").focus();
                return false;
            }
            else if (BankNo == "") {
                $.MessageBox("Enter Bank number");
                $("#txtBankNo").focus();
                return false;
            }
            var DepositType = $("#DialogADeposit").data("DepositType");
            alert('not activated')
            //PrintDepositReports(DepositNo, '0', CheckNo, BankNo, '0', DepositType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogADeposit";

        $("#txtDepositNo").val("");
        $("#txtCheckNo").val("");
        $("#txtBankNo").val("");
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

    function PrintDepositReports(FromDate, ToDate,CheckNo, BankNo, CustomerNo, DepositType) {
    //debugger;
    var w = window.open('GeneratingPDF.html');

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARDepositReports',
        data: "{'CheckNo':'" + CheckNo + "','BankNo':'" + BankNo + "', 'CustomerNo':'" + CustomerNo + "','FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','DepositType':'" + DepositType + "','DepositNumber':0}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            //debugger;
            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                w.close();
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
            $("#DialogByEnteredDate").dialog("close");
            $("#DialogADeposit").dialog("close");
            $("#DialogDepositSummary").dialog("close");
        }
    });
}

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
            else if ($(this).attr('id') == "txtDepositNo") {
                $("#txtCheckNo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtCheckNo") {
                $("#txtBankNo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtBankNo") {
                $("#DialogADeposit").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                //$("#DialogADeposit").siblings('.ui-dialog-buttonpane').find('button:eq(0)').focus();
                return false;
            }
            else if ($(this).attr('id') == "txtDepositFrom") {
                $("#txtDepositTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtDepositTo") {
                $("#DialogByDeposit").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustomerNo") {
                $("#DialogByCustomer").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtDateFrom") {
                $("#txtDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtDateTo") {
                $("#DialogDepositSummary").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtReturnedChecksDateFrom") {
                $("#txtReturnedChecksDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtReturnedChecksDateTo") {
                $("#txtReturnedChecksCustomerNo").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtReturnedChecksCustomerNo") {
                $("#DialogReturnedChecksDate").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAllInvDateFrom") {
                $("#txtAllInvDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtAllInvDateTo") {
                $("#DialogAllInvoices").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCreditsDateFrom") {
                $("#txtCreditsDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtCreditsDateTo") {
                $("#DialogCreditsDate").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtPaymentsDateFrom") {
                $("#txtPaymentsDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPaymentsDateTo") {
                $("#DialogPaymentsDate").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAdjustmentDateFrom") {
                $("#txtAdjustmentDateTo").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtAdjustmentDateTo") {
                $("#DialogAdjustmentDate").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
                return false;
            }
        }
    }
});


$("#DialogDepositSummary").dialog({
    autoOpen: false,
    resizable: false,
    title: "Deposit Summary",
    width: 320,
    height: 250,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtDateFrom").val();
            ARSessionToDt = $("#txtDateTo").val();
            var CustomerNo = ($("#txtCustomerNoByEntered").val().trim() == "") ? "0" : $("#txtCustomerNoByEntered").val().trim();
            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            var DepositType = $("#DialogDepositSummary").data("DepositType");
            var CheckedAllDepositValue = $("input[name='AllDeposits']:checked").val();

            //debugger;
            PrintDepositReports(ARSessionFromDt, ARSessionToDt, '0', '0', CustomerNo,  DepositType+"~"+CheckedAllDepositValue);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogDepositSummary";

        $("#txtDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*All Deposits options*/
$("#DialogAllDeposits").dialog({
    autoOpen: false,
    resizable: false,
    title: "All Deposits",
    width: 370,
    height: 250,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedAllDepositValue = $("input[name='AllDeposits']:checked").val();
            var DepositType = $("#DialogAllDeposits").data("DepositType");
            if (CheckedAllDepositValue == "ByDeposit") {
                $("#DialogByDeposit").dialog("open").data("DepositType", DepositType);
            }
            else if (CheckedAllDepositValue == "ByDate") {
                //debugger;
                $("#DialogByEnteredDate").dialog("open").data("DepositType", DepositType);
            }
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogAllDeposits";
        $("#rbByDeposit").attr("checked", true);
        $("#DialogAllDeposits").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the all deposit options*/
$("input[name=AllDeposits]").on("click", function () {
    $("#DialogAllDeposits").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogByDeposit").dialog({
    autoOpen: false,
    resizable: false,
    title: "List By Deposit Date",
    //width: 500,
    //height: 230,
    width: 300,
    height: 250,
    modal: true,
    buttons: {
        Print: function () {
           
            var DepositFrom = $("#txtDepositFrom").val();
            var DepositTo = $("#txtDepositTo").val();
            var DepositType = $("#DialogByDeposit").data("DepositType");
            var CustomerNo = ($("#txtCustomerNo").val().trim() == "") ? "0" : $("#txtCustomerNo").val().trim();
            if (DepositFrom == "") {
                $.MessageBox("Please select From Date");
                return false;
            }
            else if (DepositTo == "") {
                $.MessageBox("Please select To Date");
                return false;
            }
            PrintDepositReports(DepositFrom, DepositTo, '0', '0', CustomerNo,  DepositType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogByDeposit";
        //$("#txtDepositFrom").val("");
        //$("#txtDepositTo").val("");
        $("#txtDepositFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtDepositTo").datepicker('setDate', ARSessionToDt);

        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

$("#DialogByEnteredDate").dialog({
    autoOpen: false,
    resizable: false,
    title: "List By Entered Date",
    width: 400,
    height: 250,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtDepositFromED").val();
            ARSessionToDt = $("#txtDepositToED").val();
            var CustomerNo = ($("#txtCustomerNoED").val().trim() == "") ? "0" : $("#txtCustomerNoED").val().trim();
            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            var DepositType = $("#DialogByEnteredDate").data("DepositType");

            PrintDepositReports(ARSessionFromDt, ARSessionToDt,'0', '0', CustomerNo,  DepositType );
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogByCustomer";
        $("#txtCustomerNo").val("");

        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

$(document).on('keyup', function (evt) {
    if (evt.keyCode == 27) {
        $("#" + DlgNameWitCount).dialog("close");
        DlgOverlayCount = DlgOverlayCount - 1;
    }
});

/*Returned Checks Report :: ABI :: 03Jan2018*/

$("#DialogReturnedChecksList").dialog({
    autoOpen: false,
    resizable: false,
    title: "Returned Checks",
    width: 370,
    height: 215,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedReturnCheckByID = $("input[name='ARReturnChecksList']:checked").attr("id");
            var ReturnedChecksType = "";
            if (CheckedReturnCheckByID == "rbReturnedDate") {
                ReturnedChecksType = "ReturnDate"
            }
            else if (CheckedReturnCheckByID == "rbAppliedDate") {
                ReturnedChecksType = "AppliedDate"
            }
            $("#DialogReturnedChecksDate").dialog('option', 'title', 'By  ' + ReturnedChecksType + '');
            $("#DialogReturnedChecksDate").dialog("open").data("ReturnedChecksType", ReturnedChecksType);;
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogReturnedChecksList";
        $("#rbReturnedDate").attr("checked", true);
        $("#DialogReturnedChecksList").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the returned checks report options*/
$("input[name=ARReturnChecksList]").on("click", function () {
    $("#DialogReturnedChecksList").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogReturnedChecksDate").dialog({
    autoOpen: false,
    resizable: false,
    title: "Return Checks List",
    width: 400,
    height: 230,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtReturnedChecksDateFrom").val();
            ARSessionToDt = $("#txtReturnedChecksDateTo").val();
            var ReturnedChecksCustomerNo = ($("#txtReturnedChecksCustomerNo").val().trim() == "") ? "0" : $("#txtReturnedChecksCustomerNo").val().trim();
            var ReturnedChecksType = $("#DialogReturnedChecksDate").data("ReturnedChecksType");
            /* Don't force to enter Cust# :: ABI ::02Feb2018
            if (ReturnedChecksCustomerNo == "") {
                $.MessageBox("Please Enter customer number");
                return false;
            }*/
            PrintReturnedChecksReport(ARSessionFromDt, ARSessionToDt, ReturnedChecksCustomerNo, ReturnedChecksType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogReturnedChecksDate";
        $("#txtReturnedChecksCustomerNo").val("");
        $("#txtReturnedChecksDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtReturnedChecksDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintReturnedChecksReport(ReturnedChecksFromDate, ReturnedChecksToDate, ReturnedChecksCustomerNo, ReturnedChecksType) {
    var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARReturnedChecksReport',
        data: "{'ReturnedChecksFromDate':'" + ReturnedChecksFromDate + "','ReturnedChecksToDate':'" + ReturnedChecksToDate + "','ReturnedChecksCustomerNo':'" + ReturnedChecksCustomerNo + "','ReturnedChecksType':'" + ReturnedChecksType + "'}",
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
               
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtReturnedChecksFromDate").val("");
                    $("#txtReturnedChecksToDate").val("");
                    $("#txtReturnedChecksCustomerNo").val("");
                    $("#txtReturnedChecksFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtReturnedChecksToDate").datepicker('setDate', ARSessionToDt);
                }
                $("#DialogReturnedChecksDate").dialog("close");
            }
        });

}

/*Invoices Listing Report :: ABI :: 08Jan2018*/
$("#DialogInvoiceListing").dialog({
    autoOpen: false,
    resizable: false,
    title: "Invoice Listing",
    width: 500,
    height: 350,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedInvoiceID = $("input[name='ARInvoiceList']:checked").attr("id");
            if (CheckedInvoiceID == "rbAllInvoices") {
                $("#DialogAllInvoices").dialog("open");
            }
            else if (CheckedInvoiceID == "rbInvWitDiff") {
                $("#DialogInvoiceDifference").dialog("open");
            }
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogInvoiceListing";
        $("#rbAllInvoices").attr("checked", true);
        $("#DialogInvoiceListing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the returned checks report options*/
$("input[name=ARInvoiceList]").on("click", function () {
    $("#DialogInvoiceListing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogAllInvoices").dialog({
    autoOpen: false,
    resizable: false,
    title: "Invoice Listing",
    width: 300,
    height: 220,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtAllInvDateFrom").val();
            ARSessionToDt = $("#txtAllInvDateTo").val();

            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            PrintAllInvoicesReport(ARSessionFromDt, ARSessionToDt);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogAllInvoices";

        $("#txtAllInvDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtAllInvDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintAllInvoicesReport(InvoicesFromDate, InvoicesToDate) {
    //var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARAllInvoicesReport',
        data: "{'InvoicesFromDate':'" + InvoicesFromDate + "','InvoicesToDate':'" + InvoicesToDate + "'}",
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

    $("#DialogInvoiceDifference").dialog({
    autoOpen: false,
    resizable: false,
    title: "Invoices with differences",
    width: 300,
    height: 220,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtInvDiffDateFrom").val();
            ARSessionToDt = $("#txtInvDiffDateTo").val();

            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            PrintInvoicesWithDifferences(ARSessionFromDt, ARSessionToDt);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogInvoiceDifference";

        $("#txtInvDiffDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtInvDiffDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

    function PrintInvoicesWithDifferences(InvoicesFromDate, InvoicesToDate) {
    //var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintInvoiceDifferenceToExcel',
        data: "{'FromDate':'" + InvoicesFromDate + "','ToDate':'" + InvoicesToDate + "'}",
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

/*Credits By Customer Report :: ABI :: 08Jan2018*/
$("#DialogCredits").dialog({
    autoOpen: false,
    resizable: false,
    title: "Credits By Customer",
    width: 350,
    height: 210,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedCreditsID = $("input[name='ARCredits']:checked").attr("id");
            var CreditsDateType = "";
            if (CheckedCreditsID == "rbByCreditDate") {
                CreditsDateType = "CreditDate";
            }
            else if (CheckedCreditsID == "rbByCreditDateEntered") {
                CreditsDateType = "AppliedDate";
            }
            $("#DialogCreditsDate").dialog("open").data("CreditsDateType", CreditsDateType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogCredits";
        $("#rbByCreditDate").attr("checked", true);
        $("#DialogCredits").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the credits report options*/
$("input[name=ARCredits]").on("click", function () {
    $("#DialogCredits").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogCreditsDate").dialog({
    autoOpen: false,
    resizable: false,
    title: "Credits",
    width: 300,
    height: 220,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtCreditsDateFrom").val();
            ARSessionToDt = $("#txtCreditsDateTo").val();
            var CreditsDateType = $("#DialogCreditsDate").data("CreditsDateType");
            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            PrintCreditsByCustReport(ARSessionFromDt, ARSessionToDt, CreditsDateType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogCreditsDate";

        $("#txtCreditsDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtCreditsDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintCreditsByCustReport(CreditsFromDate, CreditsToDate, CreditsDateType) {
    var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARCreditsByCustReport',
        data: "{'CreditsFromDate':'" + CreditsFromDate + "','CreditsToDate':'" + CreditsToDate + "','CreditsDateType':'" + CreditsDateType + "'}",
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
               
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtCreditsFromDate").val("");
                    $("#txtCreditsToDate").val("");
                    $("#txtCreditsFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtCreditsToDate").datepicker('setDate', ARSessionToDt);
                }
                $("#DialogCreditsDate").dialog("close");
            }
        });
}

/*Credit Card Payments Report :: ABI :: 08Jan2018
Both Detailed and Summary reports have "Applied(By date)" on screen process & database functionality. "By date Entered -AddDate" will be added later in database.
*/

$("#DialogCardPayments").dialog({
    autoOpen: false,
    resizable: false,
    title: "Credits Card Payments",
    width: 350,
    height: 210,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedPaymentsID = $("input[name='ARCardPayments']:checked").attr("id");
            var PaymentsType = "";
            if (CheckedPaymentsID == "rbPayDetailed") {
                PaymentsType = "Detailed";
                $("#DialogPayDateType").dialog('option', 'title', 'Payments Detailed');
            }
            else if (CheckedPaymentsID == "rbPaySummary") {
                PaymentsType = "Summary";
                $("#DialogPayDateType").dialog('option', 'title', 'Payments Summary');
            }
            $("#DialogPayDateType").dialog("open").data("PaymentsType", PaymentsType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogCardPayments";
        $("#rbPayDetailed").attr("checked", true);
        $("#DialogCardPayments").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the credit card payment options*/
$("input[name=ARCardPayments]").on("click", function () {
    $("#DialogCardPayments").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogPayDateType").dialog({
    autoOpen: false,
    resizable: false,
    title: "Credits Card Payments",
    width: 350,
    height: 210,
    modal: true,
    buttons: {
        Next: function () {
           
            var CheckedPaymentsDateID = $("input[name='ARPayDateType']:checked").attr("id");
            var PaymentsDateType = "";
            var PaymentsType = $("#DialogPayDateType").data("PaymentsType");
            if (CheckedPaymentsDateID == "rbPayDate") {
                PaymentsDateType = "ByDate";
                $("#DialogPayDateType").dialog('option', 'title', 'Payments By Date');
            }
            else if (CheckedPaymentsDateID == "rbPayDateEntered") {
                PaymentsDateType = "ByDateEntered";
                $("#DialogPayDateType").dialog('option', 'title', 'Payments By Date Entered');
            }
            $("#DialogPaymentsDate").data("PaymentsData", { PaymentsType: PaymentsType, PaymentsDateType: PaymentsDateType }).dialog("open");
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogPayDateType";
        $("#rbPayDate").attr("checked", true);
        $("#DialogPayDateType").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the credit card payment dete type options*/
$("input[name=ARPayDateType]").on("click", function () {
    $("#DialogPayDateType").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogPaymentsDate").dialog({
    autoOpen: false,
    resizable: false,
    title: "Credits",
    width: 300,
    height: 220,
    modal: true,
    buttons: {
        Print: function () {
            ARSessionFromDt = $("#txtPaymentsDateFrom").val();
            ARSessionToDt = $("#txtPaymentsDateTo").val();
            var PaymentsType = $("#DialogPaymentsDate").data("PaymentsData")["PaymentsType"];
            var PaymentsDateType = $("#DialogPaymentsDate").data("PaymentsData")["PaymentsDateType"];

            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            PrintCreditCardPaymentsReport(ARSessionFromDt, ARSessionToDt, PaymentsType, PaymentsDateType);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogPaymentsDate";

        $("#txtPaymentsDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtPaymentsDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintCreditCardPaymentsReport(PaymentsFromDate, PaymentsToDate, PaymentsType, PaymentsDateType) {
    var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARCreditCardPaymentsReport',
        data: "{'PaymentsFromDate':'" + PaymentsFromDate + "','PaymentsToDate':'" + PaymentsToDate + "','PaymentsType':'" + PaymentsType + "','PaymentsDateType':'" + PaymentsDateType + "'}",
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
               
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtPaymentsDateFrom").val("");
                    $("#txtPaymentsDateTo").val("");
                    $("#txtPaymentsDateFrom").datepicker('setDate', ARSessionFromDt);
                    $("#txtPaymentsDateTo").datepicker('setDate', ARSessionToDt);
                }
                $("#DialogPaymentsDate").dialog("close");
            }
        });
}

/*Adjustment Report :: ABI :: 10Jan2018*/
$("#DialogAdjustment").dialog({
    autoOpen: false,
    resizable: false,
    title: "Adjustment Listing",
    width: 350,
    height: 210,
    modal: true,
    buttons: {
        Next: function () {
            var CheckedAdjustmentID = $("input[name='ARAdjustment']:checked").attr("id");
            var AdjustmentDateType = "";
            if (CheckedAdjustmentID == "rbByAdjustmentDate") {
                AdjustmentDateType = "ByAdjustmentDate";
            }
            else if (CheckedAdjustmentID == "rbByAdjustmentDateEntered") {
                AdjustmentDateType = "ByDateEntered";
            }
           
            var GL = ($("#chkGL").attr('checked') == "checked") ? true : false;
            $("#DialogAdjustmentDate").data("AdjustmentData", { AdjustmentDateType: AdjustmentDateType, GL: GL }).dialog("open");
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogAdjustment";
        $("#rbByAdjustmentDate").attr("checked", true);
        $("#DialogAdjustment").next('div').find('.msgui').remove();
        $("#DialogAdjustment").next('div').append("<div class='msgui' style='margin-left: 5px;height: 17px;display:block;background:transparent;'><input type='checkbox' id='chkGL'><label for='chkGL' style='margin-left: -65px;font-weight: bold;'><span style='padding: 1px;'></span>GL</label> </div>").css('height', '35px');
        $("#DialogAdjustment").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        $("#chkGL").attr('checked', true);
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

/*Focus next button when users change the adjustment report options*/
$("input[name=ARAdjustment]").on("click", function () {
    $("#DialogAdjustment").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
});

$("#DialogAdjustmentDate").dialog({
    autoOpen: false,
    resizable: false,
    title: "Adjustment Report",
    width: 300,
    height: 220,
    modal: true,
    buttons: {
        Print: function () {
           
            ARSessionFromDt = $("#txtAdjustmentDateFrom").val();
            ARSessionToDt = $("#txtAdjustmentDateTo").val();
            var AdjustmentDateType = $("#DialogAdjustmentDate").data("AdjustmentData")["AdjustmentDateType"];
            var GL = $("#DialogAdjustmentDate").data("AdjustmentData")["GL"];
            if (ARSessionFromDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }
            else if (ARSessionToDt == "") {
                $.MessageBox("Please select Date");
                return false;
            }

            PrintAdjustmentReport(ARSessionFromDt, ARSessionToDt, AdjustmentDateType, GL);
        },
        Close: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
        DlgNameWitCount = "DialogAdjustmentDate";

        $("#txtAdjustmentDateFrom").datepicker('setDate', ARSessionFromDt);
        $("#txtAdjustmentDateTo").datepicker('setDate', ARSessionToDt);
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintAdjustmentReport(AdjustmentFromDate, AdjustmentToDate, AdjustmentDateType, GL) {
    var w = window.open('GeneratingPDF.html');
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARAdjustmentReport',
        data: "{'AdjustmentFromDate':'" + AdjustmentFromDate + "','AdjustmentToDate':'" + AdjustmentToDate + "','AdjustmentDateType':'" + AdjustmentDateType + "','GL':'" + GL + "'}",
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
               
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtAdjustmentFromDate").val("");
                    $("#txtAdjustmentToDate").val("");
                    $("#txtAdjustmentFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtAdjustmentToDate").datepicker('setDate', ARSessionToDt);
                }
                $("#DialogAdjustmentDate").dialog("close");
            }
        });
}


 /*Listing Menu :: 19Dec2017 :: by ABI*/
    $(".tab-5").die('click').live("click", function (e) {
       
        $(".tabcontent").css('display', 'none');
        $("#tab-5").css("display", 'block');
        $("#DialogARClosing").dialog("open");
    });

    $("#rbClosingYearList").click(function () {
        $("#txtClosingDate").datepicker("setDate", new Date(new Date().getFullYear() - 1, 11, 31));
    });

    $("#rbClosingMonthList").click(function () {
        var date = new Date(), y = date.getFullYear(), m = date.getMonth();
        var lastDay = new Date(y, m, 0);
        $("#txtClosingDate").datepicker("setDate", lastDay);
    });

    $("#rbClosingDayList").click(function () {
        $("#txtClosingDate").datepicker("setDate", new Date());
    });

    $("#DialogARClosing").dialog({
        autoOpen: false,
        resizable: false,
        title: "Closing",
        width: 330,
        height: 255,
        modal: true,
        buttons: {
            Next: function () {
                $("#DialogARClosing").next('div').find('.msgui').remove();
                $("#DialogARClosing").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Processing...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');

                var CheckedID = $("input[name='ARClosing']:checked").attr("id");
                if (CheckedID == "rbClosingDayList") {
                    //debugger;
                    $("#DialogARClosing").next('div').find('.msgui').show();
                    GetInvoiceTotalForDayClosing();
                }
                else if (CheckedID == "rbClosingMonthList") {
                    //$.MessageBox("Not available")
                    $("#DialogARClosing").next('div').find('.msgui').show();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/MonthWiselosing',
                        data: '{"dCloseDate":"' + $("#txtClosingDate").val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            //debugger;
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
                                //debugger;
                                $("#msg-YearClose").dialog("open");
                                $("#msgYearClose").html("Process completed");
                                $("#DialogARClosing").next('div').find('.msgui').hide();
                                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                                window.open(path);
                            }
                        },
                        onError: function (xhr, status, errorThrown) {
                            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                window.location.href = "Login.aspx";
                            }
                        }
                    });

                }
                else if (CheckedID == "rbClosingYearList") {
                   
                    $("#DialogARClosing").next('div').find('.msgui').show();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ar102',
                        data: '{"dCloseDate":"' + $("#txtClosingDate").val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            var res = output.d
                            if (res == "Success") {
                                $("#msg-YearClose").dialog("open");
                                $("#msgYearClose").html("Process completed");
                                $("#DialogARClosing").next('div').find('.msgui').hide();
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        },
                        onError: function (xhr, status, errorThrown) {
                            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                window.location.href = "Login.aspx";
                            }
                        }
                    });
                }
                    /*Print AR Journal summary report from year closing menu :: Created by Abinaya :: 31Jul2018*/
                <%--else if (CheckedID == "rbJournalSummary") {     
                    //debugger;
                    var w = window.open('GeneratingPDF.html');
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ARJournalSummary',
                        data: '{"EodDate":"' + $("#txtClosingDate").val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            var res = output.d
                            if (output.d != "LogOut") {
                                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                                 w.location = ExportedPath;
                             }
                             else if (output.d == "LogOut") {
                                 w.close();
                                 window.location.href = "Login.aspx"
                             }
                        },
                        onError: function (xhr, status, errorThrown) {
                            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        }
                    });
                }--%>
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogARClosing";
            $("#rbClosingYearList").attr("checked", true);
            $("#rbClosingYearList").trigger("click");
            $("#DialogARClosing").next('div').find('.msgui').hide();
            $("#DialogARClosing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function GetInvoiceTotalForDayClosing() {
        //debugger;
        var InvoiceTotal = 0.00;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInvoiceTotalForDayClosing',
            data: '{"dCloseDate":"' + $("#txtClosingDate").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                var resholdcheck = output.d;
                var res = resholdcheck.split("-")
                //var res = output.d;
                if (res[2] != "" && res[2] != "0")
                {
                    $("#DivTotalInvoiceSales").html(res[0]);
                    $("#DialogARClosing").next('div').find('.msgui').hide();
                    if (res[1] != "0")
                    {
                        $("#msgYearClose").html("" + res[1] + " ORDERS NOT PRINTED. DAY CLOSING CAN NOT PROCEED.");
                        $("#msg-YearClose").dialog("open");
                    }
                    else
                    {
                        $("#msgbox-DayClosingWarning").dialog("open");
                        $("#msghtml-DayClosingWarning").html("My total is $" + res[0] + " AND Total Invoice Count is " + res[2] + ", is this correct?");
                    }
                }
                else {
                    $("#DialogARClosing").next('div').find('.msgui').hide();
                    $("#msgYearClose").html("No Sales for Closing!");
                    $("#msg-YearClose").dialog("open");                    
                }
            }
        });
        return InvoiceTotal;
    }
    /*Check the total and Ask verification from user :: Created by Abinaya :: 09Aug2018 */
    $("#msgbox-DayClosingWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {               
                $("#msgbox-DayClosingWarning").next('div').find('.msgui').show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DayWiseClosing',
                    data: '{"dCloseDate":"' + $("#txtClosingDate").val() + '","TotalSales":"' + $("#DivTotalInvoiceSales").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        var res = output.d
                        if (res == "Success") {
                            $("#msg-YearClose").dialog("open");
                            $("#msgYearClose").html("Process completed");
                            $("#msgbox-DayClosingWarning").next('div').find('.msgui').hide();
                            $("#msgbox-DayClosingWarning").dialog("close");
                            $("#DialogARClosing").next('div').find('.msgui').hide();
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            window.location.href = "Login.aspx";
                        }
                    }
                });
            },
            No: function () {
                $(this).dialog("close");
            }
        },

        open: function () {
            $("#msgbox-DayClosingWarning").next('div').find('.msgui').remove();
            $("#msgbox-DayClosingWarning").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Processing...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');

            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    /*Focus next button when users change the reports options*/
    $("input[name=ARClosing]").on("click", function () {
        $("#DialogARClosing").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });


    $("#msg-YearClose").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    /*Warning for Controls loading on Customer Add/Edit screen*/
    $("#msgbox-CustDetailsWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        width: 350,
        closeOnEscape: false,
        open: function () {
            $("#msgbox-CustDetailsWarning").focus();
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
            //$(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    /*When HOLD icon click, open Customer edit screen*/
    $("[id^=aCustomerHoldARINVS_]").die("click").live("click", function () {
        //debugger;
        var Customer = $(this).attr('id').replace('aCustomerHoldARINVS_', '');
        $("#msghtml-CustDetailsWarning").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
        $("#msgbox-CustDetailsWarning").dialog("open");
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"' + Customer + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivCustomerPage">/div>').dialog({
                    title: 'Customer Details',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        if ($("#ctl00_LoggedInUserType_Accounts").html() != "sales person") {
                            $("#chkCreditHold").focus();
                            $("#txtCustNo").show();
                            $("#DivCustButtonList").hide();
                            $("#btnCustomerDetailsSave").show();
                            //$("#txtCustNo").attr("readonly", "readonly");
                            $('#tblCustomerDetails input[type="text"], textarea,select').not('#txtCustNo').css('background', "none");
                            $("#tblCustomerDetails").not("#txtCuxtNo").css("pointer-events", "auto");
                            //$("[id^=chk]").is(":enabled") == false ? $("[id^=chk]").iButton("enable") : $("[id^=chk]").iButton("enable");
                        }

                    }
                });
                $("#msgbox-CustDetailsWarning").dialog("close");
                $("#DivCustomerPage").html(output.d).dialog("open");
            }
        });
    });

    /*When AR Inquiry Customer name hyperlink click, open up the customer maintenance screen*/
    $("[id^=aCustNameARInquiry_]").die("click").live("click", function () {
        //debugger;
        var id = $(this).attr('id');
        var Customer = $(this).attr('id').replace('aCustNameARInquiry_', '');
        $("#msghtml-CustDetailsWarning").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
        $("#msgbox-CustDetailsWarning").dialog("open");
        $(".imgLoaderForUser").show();
      
        $("#DivHeaderCustDetailsID").html(Customer);

        $("#fgrdCustomerDetails [id^=row]").removeClass("trSelectedHeader");
        $("#fgrdCustomerDetails #row" + Customer).addClass("trSelectedHeader");
        $("#fgrdCustomerDetails td.unsorted").addClass("sorted");
        $("#fgrdCustomerDetails td.sorted").removeClass("unsorted");
        $("#fgrdCustomerDetails #row" + Customer).removeClass("trSelected");
        $("#fgrdCustomerDetails #row" + Customer + " td.sorted").addClass("unsorted");
        $("#fgrdCustomerDetails #row" + Customer + " td.unsorted").removeClass("sorted");

        $('#fgrdCustomerDetails tr td').removeClass("trSelectedHeader");
        $('#fgrdCustomerDetails #row' + Customer + ' td').addClass("trSelectedHeader");

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"' + Customer + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivCustomerPage">/div>').dialog({
                    title: 'Customer Details',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        //debugger;
                        if ($("#ctl00_LoggedInUserType_Accounts").html() != "sales person") {
                            $("#txtCustNo").show();
                            $("#DivCustButtonList").hide();
                            $("#btnCustomerDetailsSave").show();
                            //$("#txtCustNo").attr("readonly", "readonly");
                            $('#tblCustomerDetails input[type="text"], textarea,select').not('#txtCustNo').css('background', "none");
                            $("#tblCustomerDetails").not("#txtCuxtNo").css("pointer-events", "auto");
                            $("#txtCustomer").focus();
                        }
                    }
                });
                $("#msgbox-CustDetailsWarning").dialog("close");
                $("#DivCustomerPage").html(output.d).dialog("open");
            }
        });
    });

    /*EODCASH details screen view :: Created by Abinaya :: 27Jul2018*/
    $("#DivEODCASHDetailsDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 350,
        height: 280,
        title:'EODCASH Details',
        open: function () {
            //debugger;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ShowEODCASHDetails',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var res = output.d;
                    //debugger;
                    if (res.ErrorMessage == "") {
                        $("#txtEODCASHPreviousBA").val(parseFloat(res.PREVIOUSBA).toFixed(2));
                        $("#txtEODCASHTotalAREod").val(parseFloat(res.TOTALAREOD).toFixed(2));
                        $("#txtEODCASHTotalDep").val(parseFloat(res.TOTALDEP).toFixed(2));
                        $("#txtEODCASHTotalAdj").val(parseFloat(res.TOTALADJ).toFixed(2));
                        $("#txtEODCASHTotalRet").val(parseFloat(res.TOTALRET).toFixed(2));
                        $("#txtEODCASHTotalMisc").val(parseFloat(res.TOTALMISC).toFixed(2));
                        $("#txtEODCASHTotalDisc").val(parseFloat(res.TOTALDISC).toFixed(2));
                        $("#txtEODCASHCreditCard").val(parseFloat(res.CREDITCARD).toFixed(2));
                    }
                    else if (res.ErrorMessage == "NO DATA") {
                        $("#DivEODCASHDetailsDialog").dialog("close");
                        $.MessageBox("No Data found");
                    }
                    else if (output.d.indexOf("error") >= 0) {
                        $("#DivEODCASHDetailsDialog").dialog("close");
                        $.MessageBox(output.d.substring(5, output.d.length));
                    }
                    else {
                        $("#DivEODCASHDetailsDialog").dialog("close");
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                }
            });
        }
    });

    document.body.addEventListener('keydown', function (e) {
        var focused = document.activeElement;
        /*Open ENDCASH details dialog from year closing dialog by click on ctrl+f6 key :: Created by Abinaya :: 27Jul2018*/
        if (IsPostPaymentsTabClicked==true && focused.className != "qsbox") {
            if ((e.metaKey || e.ctrlKey) && e.which === 117) {      //Click ctrl+F6
                $("#DivEODCASHDetailsDialog").dialog("open");
            }
        }
    });

    $("#DialogCODReport").dialog({
        autoOpen: false,
        resizable: false,
        title: "COD Report",
        width: 390,
        height: 250,
        modal: true,
        buttons: {
            Print: function () {
                var CODFromDate = $("#txtCODFromDate").val();
                var CODToDate = $("#txtCODToDate").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CheckCntforCODReport',
                    data: "{'CODFromDate':'" + CODFromDate + "','CODToDate':'" + CODToDate + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "Valid") {
                            PrintCODReports(CODFromDate, CODToDate);
                        }
                        else if (output.d == "No Data") {
                            $.MessageBox("No data selected!");
                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });
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

    function PrintCODReports(CODFromDate, CODToDate) {
        //debugger;
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintCODReport',
            data: "{'CODFromDate':'" + CODFromDate + "','CODToDate':'" + CODToDate + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                //debugger;
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
                    $("#txtCODFromDate").datepicker('setDate', ARSessionFromDt);
                    $("#txtCODToDate").datepicker('setDate', ARSessionToDt);
                }
            $("#DialogCODReport").dialog("close");
        }
    });
}

    //DialogSalesMaintenanceJournal
    $("#DialogSalesMaintenanceJournal").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Maintenance Journal",
        width: 310,
        height: 210,
        modal: true,
        buttons: {
            Print: function () {
                var SalesMaintenanceJournalFromDate = $("#txtSalesMaintenanceJournalFromDate").val();
                var SalesMaintenanceJournalToDate = $("#txtSalesMaintenanceJournalToDate").val();
                
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CheckCntforPrintSalesMaintenanceJournal',
                    data: "{'SalesMaintenanceJournalFromDate':'" + SalesMaintenanceJournalFromDate + "','SalesMaintenanceJournalToDate':'" + SalesMaintenanceJournalToDate + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "Valid") {
                            PrintSalesMaintenanceJournal(SalesMaintenanceJournalFromDate, SalesMaintenanceJournalToDate);
                        }
                        else if (output.d == "No Data") {
                            $.MessageBox("No data selected!");
                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });
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

    function PrintSalesMaintenanceJournal(SalesMaintenanceJournalFromDate, SalesMaintenanceJournalToDate) {
    //debugger;
    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintSalesMaintenanceJournal',
        data: "{'SalesMaintenanceJournalFromDate':'" + SalesMaintenanceJournalFromDate + "','SalesMaintenanceJournalToDate':'" + SalesMaintenanceJournalToDate + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            //debugger;
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
                $("#txtSalesMaintenanceJournalFromDate").datepicker('setDate', ARSessionFromDt);
                $("#txtSalesMaintenanceJournalToDate").datepicker('setDate', ARSessionToDt);
            }
            $("#DialogSalesMaintenanceJournal").dialog("close");
        }
    });
    }

    $("#btnSalesMaintenanceJournal").die("click").live("click", function () {
        $("#txtSalesMaintenanceJournalFromDate").datepicker('setDate', ARSessionFromDt);
        $("#txtSalesMaintenanceJournalToDate").datepicker('setDate', ARSessionToDt);
        $("#DialogSalesMaintenanceJournal").dialog("open");
    });

    $("#DialogJournalSummary").dialog({
        autoOpen: false,
        resizable: false,
        title: "Journal Summary",
        width: 310,
        height: 170,
        modal: true,
        buttons: {
            Print: function () {
                var EodDate = $("#txtJournalSummaryDate").val();
             
                PrintJournalSummary(EodDate);
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

    function PrintJournalSummary(EodDate) {
    //debugger;
    var w = window.open('GeneratingPDF.html');
 
    //var today = new Date();
    //var lastYear = today.getFullYear() - 1;
   
    ////var EodDate = ("0000" + lastYear.toString()).slice(-4) + "-" + ("0012".toString()).slice(-2) + "-" + ("00" + "31".toString()).slice(-2);
    //var EodDate = ("0012".toString()).slice(-2) + "-" + ("00" + "31".toString()).slice(-2) + "-" + ("0000" + lastYear.toString()).slice(-4);
  
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/ARJournalSummary',
        data: '{"EodDate":"' + EodDate + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            var res = output.d
            if (output.d != "LogOut") {
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                w.location = ExportedPath;
            }
            else if (output.d == "LogOut") {
                w.close();
                window.location.href = "Login.aspx"
            }
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }
        }
    });
    }

    
    $("#DialogSalesByAWBNumber").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales By AWBNumber",
        width: 347,
        height: 190,
        modal: true,
        buttons: {
            Print: function () {                
                var FromDate = $("#txtSalesByAWBFromDate").val();
                var ToDate = $("#txtSalesByAWBToDate").val();
                PrintSalesByAWBNumber(FromDate, ToDate);
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

    function PrintSalesByAWBNumber(FromDate, ToDate) {
    //debugger;
    var w = window.open('GeneratingPDF.html'); 
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/ARSalesByAWBNumber',
        data: '{"FromDate":"' + FromDate + '","ToDate":"' + ToDate + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            var res = output.d
            if (output.d != "LogOut") {
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                w.location = ExportedPath;
            }
            else if (output.d == "LogOut") {
                w.close();
                window.location.href = "Login.aspx"
            }
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }
        }
    });
    }

     /*Start Post Returns By Customer Search :: Anand[07/20/2021]*/
    $("#DialogPostReturnByCustomerSearch").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Post Returns by Customer",
        width: 550,
        buttons: {
            Cancel: function () {
                $(this).dialog("close");
                $("#txtReturnsByCustSearch").val("");
            },
        },
        open: function () {
            $("#txtReturnsByCustSearch").focus();
            $("#txtReturnsByCustSearch").val("");
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#btnSalesReturnd").die('click').live('click', function () {
        $("#DialogPostReturnByCustomerSearch").dialog("open");
    });

    $("#txtReturnsByCustSearch").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name
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
           
            $("#txtReturnsByCustSearch").val(i.item.Customer);
            //$.ajax({
            //    type: "POST",
            //    url: 'BloomService.asmx/GetInvoiceNumber',
            //    data: "{'Customer': '" + i.item.Customer + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (output, status) {
            //        var InvoiceNumber = output.d

                    var InvoiceNumber = i.item.Customer


                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#DivPostReturnByCustPage").html(output.d);
                            LoadVETCustomerDetailsByCustNo(i.item.Customer, "", "DivPostReturnByCustDialog");
                            $("#DivPostReturnByCustDialog").dialog('option', 'title', '<div> Credits Details :: ' + InvoiceNumber + '</div>');
                            $("#DivPostReturnByCustDialog").data("inData", { Invoice: InvoiceNumber, Customer: i.item.Customer }).dialog("open");
                            $("#DialogPostReturnByCustomerSearch").dialog("close");
                        }
                    });
            //    }
            //});
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtReturnsByCustSearch").val("");
                $("#txtReturnsByCustSearch").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });
  /*End Post Returns By Customer Search :: Anand[07/20/2021]*/

</script>
