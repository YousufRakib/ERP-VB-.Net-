<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageImportDBFToSQL.ascx.vb" Inherits="pages_PageImportDBFToSQL" %>

<style>
    #MsgHtml {
        font-weight: bold;
    }

    .divlink {
        text-decoration: underline;
        font-size: .8em;
        color: #fff;
    }

    .alinks {
        color: #2D7929;
        font-weight: bold;
        text-decoration: none;
        float: left;
        cursor: pointer;
        margin-right: 20px;
        margin-top: 10px;
    }

        .alinks:hover {
            text-decoration: underline;
            color: #000000;
        }

    .spanimport {
        background: none;
        text-indent: 8px;
        display: block;
        /* padding-right: 3px; */
        font-size: 1.2em;
        height: 18px;
    }

    #DivImportOptionsDialog label:hover {
        color: #FF0000;
    }
    
    
</style>

<div id="DivImportOptionsDialog" style="float: left; font-size: 15px; font-weight: bold;">
    <table>
        <tr style="height: 30px;">
            <td>
                <input id="chkARCOMM" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_ARCOMMclicked" />
                <label for="chkARCOMM"><span style="padding: 1px;"></span>A/R Customer Comments (F_ARCOMM)</label>
            </td>
            <td>
                <input id="chkARINVS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_ARINVSclicked">
                <label for="chkARINVS"><span style="padding: 1px;"></span>Customer Statement Info (F_ARINVS)</label>
            </td>
            <td>
                <input id="chkARHIST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importARHISTclicked">
                <label for="chkARHIST"><span style="padding: 1px;"></span>History (ARHIST)</label>
            </td>
         </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkARADJ" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_ARADJclicked">
                <label for="chkARADJ"><span style="padding: 1px;"></span>A/R Adjustments (F_ARADJ)</label>
            </td>
            <td>
                <input id="chkNSF" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_NSFclicked">
                <label for="chkNSF"><span style="padding: 1px;"></span>A/R Returned Checks (F_NSF)</label>
            </td>
            <td>
                <input id="chkCASH" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CASHclicked">
                <label for="chkCASH"><span style="padding: 1px;"></span>Cash Payments (F_CASH)</label>
            </td>
         </tr>
  
         <tr style="height: 30px;">
             <td>
                <input id="chkARCARD" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_ARCARDclicked">
                <label for="chkARCARD"><span style="padding: 1px;"></span>A/R Credit Card Payments (F_ARCARD)</label>
            </td>
             <td>
                <input id="chkARCHKS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_ARCHKSclicked">
                <label for="chkARCHKS"><span style="padding: 1px;"></span>A/R Customer Checks(F_ARCHKS)</label>
            </td>
            <td>
                <input id="chkCSTCOM" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CSTCOMclicked">
                <label for="chkCSTCOM"><span style="padding: 1px;"></span>Customer Comments (F_CSTCOM)</label>
            </td>
          </tr>      
        
         <tr style="height: 30px;">
             <td>
                <input id="chkARCODE" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CRCODEclicked">
                <label for="chkARCODE"><span style="padding: 1px;"></span>Credit Codes (F_CRCODE)</label>
             </td>
              <td>
                <input id="chkCREREQ" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CREREQclicked">
                <label for="chkCREREQ"><span style="padding: 1px;"></span>Credit Requests (F_CREREQ)</label>
              </td>
              <td>
                <input id="chkCRE" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importCREclicked">
                <label for="chkCRE"><span style="padding: 1px;"></span>Approved Credits (CRE_)</label>
             </td>
 
         </tr>
         <tr style="height: 30px;">
            <td>
                <input id="chkCUST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CUSTclicked">
                <label for="chkCUST"><span style="padding: 1px;"></span>Customer Info (F_CUST)</label>
            </td>
           <td>
                <input id="chkCTYPES" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CTYPESclicked">
                <label for="chkCTYPES"><span style="padding: 1px;"></span>Customer Types (F_CTYPES)</label>
            </td>
           <td>
                <input id="chkCACODE" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CACODEclicked">
                <label for="chkCACODE"><span style="padding: 1px;"></span>Customer Carrier Accounts(F_CACODE)</label>
            </td>
        </tr>
    
        <tr style="height: 30px;">
            <td>
                <input id="chkSHIPTO" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_SHIPTOclicked">
                <label for="chkSHIPTO"><span style="padding: 1px;"></span>Shipto Info (F_SHIPTO)</label>
            </td>
             <td>
                <input id="chkCARRIE" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CARRIEclicked">
                <label for="chkCARRIE"><span style="padding: 1px;"></span>Carrier codes (F_CARRIE)</label>
            </td>
            <td>
                <input id="chkAIRPOT" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_AIRPOTclicked">
                <label for="chkAIRPOT"><span style="padding: 1px;"></span>Airport details(F_AIRPOT)</label>
            </td>
        </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkSLSMAN" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_SLSMANclicked">
                <label for="chkSLSMAN"><span style="padding: 1px;"></span>Sales Person Info (F_SLSMAN)</label>
            </td>
            <td>
                <input id="chkTERMS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_TERMSclicked">
                <label for="chkTERMS"><span style="padding: 1px;"></span>Customer Credit Terms (F_TERMS)</label>
            </td>
            <td>
                <input id="chkAIRHST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_AIRHSTclicked">
                <label for="chkAIRHST"><span style="padding: 1px;"></span>Airport History(F_AIRHST)</label>
            </td> 
        </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkSPORD" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_SPORDclicked">
                <label for="chkSPORD"><span style="padding: 1px;"></span>Standing Orders/Prebooks file (F_SPORD)</label>
            </td>
            <td>
                <input id="chkFLOWER" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importFlowerclicked">
                <label for="chkFLOWER"><span style="padding: 1px;"></span>Product Codes (F_FLOWER)</label>
            </td>
            <td>
                <input id="chkPROD" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_PRODclicked">
                <label for="chkPROD"><span style="padding: 1px;"></span>Box Size Table(F_PROD)</label>
            </td>
        </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkFARM" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FARMclicked">
                <label for="chkFARM"><span style="padding: 1px;"></span>Farm Codes (F_FARM)</label>
            </td>
            <td>
                <input id="chkFARMPR" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FARMPRclicked">
                <label for="chkFARMPR"><span style="padding: 1px;"></span>Farm Purchase worksheet (F_FARMPR)</label>
            </td>
            <td>
                <input id="chkFARMBR" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FARMBRclicked">
                <label for="chkFARMBR"><span style="padding: 1px;"></span>Farm Brands (F_FARMBR)</label>
            </td>
        </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkINVEN" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importInvenclicked">
                <label for="chkINVEN"><span style="padding: 1px;"></span>Inventory  (INVEN)</label>
            </td>
            <td>
                <input id="chkINVHIST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importInvenHistclicked">
                <label for="chkINVHIST"><span style="padding: 1px;"></span>Inventory History (INVHIST)</label>
            </td>
            <td>
                <input id="chkINVGRID" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importINVGRIDclicked">
                <label for="chkINVGRID"><span style="padding: 1px;"></span>Inventory Grid (INVGRID)</label>
            </td>
        </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkINVTRANS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="ImportInvTransclicked">
                <label for="chkINVTRANS"><span style="padding: 1px;"></span>Inventry Transaction Log (INVTRANS)</label>
            </td>
            <td>
                <input id="chkRACKS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_RACKSclicked">
                <label for="chkRACKS"><span style="padding: 1px;"></span>Racks (F_RACKS)</label>
            </td>
            <td>
                <input id="chkpwdx" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_pwdxclicked">
                <label for="chkpwdx"><span style="padding: 1px;"></span>Sales Person Permission (PWDX)</label>
            </td>
        </tr>
   
        <tr style="height: 30px;">
           <td>
                <input id="chkORDERS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importCurrentOrdersClicked">
                <label for="chkORDERS"><span style="padding: 1px;"></span>Current Orders (F_ORDER1+F_ORDER2)</label>
            </td>
             <td>
                <input id="chkOECHGS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_OECHGSclicked">
                <label for="chkOECHGS"><span style="padding: 1px;"></span>Order Entry Changes(F_OECHGS)</label>
            </td>
            <td>
                <input id="chkVET" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importVETclicked">
                <label for="chkVET"><span style="padding: 1px;"></span>Sales Invoice History (VET_ + VET1_)</label>
            </td>
        </tr>
    
   
        <tr style="height: 30px;">
            <td>
                <input id="chkPOSTATUS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_POSTATUSclicked">
                <label for="chkPOSTATUS"><span style="padding: 1px;"></span>POSTATUS (F_POSTATUS)</label>
            </td>
            <td>
                <input id="chkTYPES" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_TYPESclicked">
                <label for="chkTYPES"><span style="padding: 1px;"></span>TYPES (F_TYPES)</label>
            </td>
            <td>
                <input id="chkFUEL" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_Fuelclicked">
                <label for="chkFUEL"><span style="padding: 1px;"></span>Fuel Charge(F_FUEL)</label>
            </td> 
        </tr>
   
        <tr style="height: 30px;">
            <td>
                <input id="chkCOLORS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_COLORSclicked">
                <label for="chkCOLORS"><span style="padding: 1px;"></span>COLOR TABLE (F_COLORS)</label>
            </td>
            <td>
                <input id="chkGRADES" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_GRADESclicked">
                <label for="chkGRADES"><span style="padding: 1px;"></span>GRADE TABLE (F_GRADES)</label>
            </td> 
            <td>
                <input id="chkVARIET" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_VARIETclicked">
                <label for="chkVARIET"><span style="padding: 1px;"></span>VARIETY TABLE (F_VARIET)</label>
            </td>
        </tr>
      
        <tr style="height: 30px;">
            <td>
                <input id="chkCOUNTRY" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_COUNTRYclicked">
                <label for="chkCOUNTRY"><span style="padding: 1px;"></span>Country codes (F_COUNTY)</label>
            </td>
            <td>
                <input id="chkFLOTAX" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FLOTAXclicked">
                <label for="chkFLOTAX"><span style="padding: 1px;"></span>Import Duties(F_FLOTAX)</label>
            </td>
            <td>
                <input id="chkFLODUT" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FLODUTclicked">
                <label for="chkFLODUT"><span style="padding: 1px;"></span>Customer Duties(F_FLODUT)</label>
            </td>
        </tr>
  
        <tr style="height: 30px;">
            <td>
                <input id="chkCONSTANT" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importCONSTANTclicked">
                <label for="chkCONSTANT"><span style="padding: 1px;"></span>CONSTANT</label>
            </td>
            <td>
                <input id="chkSETEOD" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_SETEODclicked">
                <label for="chkSETEOD"><span style="padding: 1px;"></span>System Settings (F_SETEOD)</label>
            </td> 
            <td>
                <input id="chkEMAILS" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_EMAILSclicked">
                <label for="chkEMAILS"><span style="padding: 1px;"></span>System Emails (F_EMAILS)</label>
            </td>
         </tr>

         <tr style="display: 30px;">
            <td>
                <input id="chkF_ID" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_IDclicked">
                <label for="chkF_ID"><span style="padding: 1px;"></span>(F_ID)</label>
            </td>
            <td>
                 <input id="chkF_Voids" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_Voidsclicked">
                 <label for="chkF_Voids"><span style="padding: 1px;"></span>VOIDED INVOICES (F_Voids)</label>
             </td>
             <td>
                 <input id="chkF_EODHST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_EODHSTclicked">
                 <label for="chkF_EODHST"><span style="padding: 1px;"></span>END OF DAY HISTORY(F_EODHST)</label>
             </td>
          </tr>

        <tr style="height: 30px;">
            <td>
                <input id="chkF_callhs" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_CALLHSclicked">
                <label for="chkF_callhs"><span style="padding: 1px;"></span>CALL HS (F_CALLHS)</label>
            </td>
            <td>                
                <input id="chkF_SLSCHG" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_SLSCHGclicked">
                <label for="chkF_SLSCHG"><span style="padding: 1px;"></span>F_SLSCHG (F_SLSCHG)</label>
            </td>
            <td>                
                <input id="chkF_FFI" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FFIclicked">
                <label for="chkF_FFI"><span style="padding: 1px;"></span>F_FFI (F_FFI)</label>
            </td>

            <%--
            <td style="display:none;">
                <input id="chkARCHGHST" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importARCHGHSTclicked">
                <label for="chkARCHGHST"><span style="padding: 1px;"></span>ARCHGHST (ARCHGHST)</label>
            </td>--%>
          </tr>

        <tr>
            <td>                
                <input id="chkF_FGI" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_FGIclicked">
                <label for="chkF_FGI"><span style="padding: 1px;"></span>F_FGI (F_FGI)</label>
            </td>
           <td>                
                <input id="chkF_POH" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_POHclicked">
                <label for="chkF_POH"><span style="padding: 1px;"></span>F_POH</label>
            </td>
            <td>                
                <input id="chkF_POQ" class="importOptions" type="checkbox" style="margin-top: 8px;" name="SetupsImport" value="importF_POQclicked">
                <label for="chkF_POQ"><span style="padding: 1px;"></span>F_POQ</label>
            </td>

            <td colspan="2"></td>
        </tr>

    </table>
</div>

<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<script>
    $(document).ready(function () {
        debugger;
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

    //$("#btnImportDBFFiles").die("click").live("click", function () {
    //    debugger;
    //    var rbSelectedValue = $("input[name='ImportOptions']:checked").val();
    //    window[rbSelectedValue]();
    //});

    function ImportOptions() {
        debugger;
        var chkValue = [];
        // next three lines added by JAD to block import functions
        $("#MsgWarning").dialog("open");
        $("#MsgHtml").html("Sorry Import functions have been disabled...");
        return 0;
        $.each($("input[name='SetupsImport']:checked"), function () {
            chkValue.push($(this).val());
        });
        for (var i = 0; i < chkValue.length; i++) {
            window[chkValue[i]]();
        }
        if (chkValue.length == 0) {
            $.MessageBox("Please select any option to import");
            return 0;
        }
    }
    function importF_POQclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_POQfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#MsgWarning").dialog("open");
                    $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARM").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }
    function importF_POHclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_POHfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#MsgWarning").dialog("open");
                    $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARM").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }
    function importF_FARMclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FarmsfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#MsgWarning").dialog("open");
                    $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARM").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_ARCOMMclicked() {
        debugger;
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ARCOMMfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
   //                 $("#MsgWarning").dialog("open");
   //                 $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARCOMM").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_ARINVSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ARINVSfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARINVS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_CARRIEclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CARRIEfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCARRIE").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_CRCODEclicked() {
        debugger;
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CRCODEfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARCODE").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_CREREQclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CREREQfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCREREQ").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_CUSTDOclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CUSTDOfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCUSTDO").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_CUSTclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CUSTfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCUST").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_Countryclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CountryfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCOUNTRY").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_FARMPRclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FARMPRfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARMPR").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importFlowerclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FLOWERfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                   // $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
               $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFLOWER").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importInvenclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportInvenfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkINVEN").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importInvenHistclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportInvenHistfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkINVHIST").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_POSTATUSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_POSTATUSfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkPOSTATUS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_PRODclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_PRODfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkPROD").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_SPORDclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_SPORDfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkSPORD").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_STATUSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_STATUSfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkSTATUS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_SHIPTOclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_SHIPTOfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkSHIPTO").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_SLSMANclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_SLSMANfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkSLSMAN").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_TYPESclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_TypesfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkTYPES").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_TERMSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_TERMSfromDBF',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkTERMS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importVETclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportVET1fromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var vet = output.d;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ImportVETfromDBF',
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != "error") {
                            $("#MsgWarning").dialog("open");
                            $("#MsgHtml").html("VET_ " + vet + " Records and VET1_ " + output.d + " Records Imported Successfully...");
                            $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                            $("#chkVET").attr("checked", false);
                        }
                        else {
                            $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            }
        });
    }

    function importF_CASHclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CASHfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCASH").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importCurrentOrdersClicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ORDER1fromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                var Order1 = output.d;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ImportF_ORDER2fromDBF',
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != "error") {
     //                       $("#MsgWarning").dialog("open");
     //                       $("#MsgHtml").html("ORDER1 " + Order1 + " Records and Order2 " + output.d + " Records Imported Successfully...");
                            $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                            $("#chkORDERS").attr("checked", false);
                        }
                        else {
                            $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
                //if (output.d != "error") {
                //    $("#MsgWarning").dialog("open");
                //    $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                //}
                //else {
                //    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                //}
            }
        });
    }

    function importARHISTclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportARHISTfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARHIST").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_ARADJclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ARADJfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARADJ").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_NSFclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_NSFfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkNSF").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_ARCARDclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ARCARDfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARCARD").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_RACKSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_RACKSfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkRACKS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importF_pwdxclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_PWDXfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    //               $("#MsgWarning").dialog("open");
                    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkpwdx").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importINVGRIDclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportINVGRIDfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkINVGRID  ").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function importWINVNWclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportWINVNWfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html("Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkWINVNW").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    function ImportInvTransclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportInvTransfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html("Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkINVTRANS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import Customer Types dbf file :: By ABI :: 24Jan2018*/
    function importF_CTYPESclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_CTYPESfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkCTYPES").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import Customer Types dbf file :: By ABI :: 29Jan2018*/
    function importF_FARMBRclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FARMBRfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARMPR").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }
    /*Import Airpot dbf file :: By MANI :: 13Feb2018*/
    function importF_AIRPOTclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_AIRPOTfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkAIRPOT").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import Order Entry Changes dbf file :: By ABI :: 16Feb2018*/
    function importF_OECHGSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_OECHGSfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkOECHGS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import A/R checks dbf file :: By ABI :: 16Feb2018*/
    function importF_ARCHKSclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_ARCHKSfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkARCHKS").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import Price approval history dbf file :: By ABI :: 20Feb2018*/
    function importF_APPROVclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_APPROVfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkAPPROV").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import for Tax table :: By ABI :: 21Feb2018*/
    function importF_FLOTAXclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FLOTAXfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFLOTAX").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import for Duty table :: By ABI :: 23Feb2018*/
    function importF_FLODUTclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportF_FLODUTfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
     //               $("#MsgWarning").dialog("open");
     //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFLODUT").attr("checked", false);
                }
                else {
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Import for EODCASH table :: By ABI :: 26Feb2018
    function importEODCASHclicked() {
        $("#DivImportOptionsDialog").next('div').find('.msgui').show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportEODCASHfromDBF',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "error") {
                    $("#MsgWarning").dialog("open");
                    $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                    $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                    $("#chkFARM").attr("checked", false);
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }*/

    /*Import for CONSTANT table :: By MANI :: 01MAR2018*/
   function importCONSTANTclicked() {
       $("#DivImportOptionsDialog").next('div').find('.msgui').show();
       $.ajax({
           type: "POST",
           url: 'BloomService.asmx/ImportCONSTANTfromDBF',
           data: '{}',
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function (output) {
               if (output.d != "error") {
    //               $("#MsgWarning").dialog("open");
    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $("#chkCONSTANT").attr("checked", false);
               }
               else {
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
               }
           }
       });
   }

   /*Import for EODCASH table :: By ABI :: 01MAR2018*/
   function importF_CACODEclicked() {
       $("#DivImportOptionsDialog").next('div').find('.msgui').show();
       $.ajax({
           type: "POST",
           url: 'BloomService.asmx/ImportF_CACODEfromDBF',
           data: '{}',
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function (output) {
               if (output.d != "error") {
    //               $("#MsgWarning").dialog("open");
    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $("#chkCACODE").attr("checked", false);
               }
               else {
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
               }
           }
       });
   }

   /*Import for F_CSTCOM table :: By Murukesh :: 27MAR2018*/
   function importF_CSTCOMclicked() {
       $("#DivImportOptionsDialog").next('div').find('.msgui').show();
       $.ajax({
           type: "POST",
           url: 'BloomService.asmx/ImportF_CSTCOMFromDBF',
           data: '{}',
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function (output) {
               if (output.d != "error") {
    //               $("#MsgWarning").dialog("open");
    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $("#chkCSTCOM").attr("checked", false);
               }
               else {
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
               }
           }
       });
   }

   function importF_Fuelclicked() {
       $("#DivImportOptionsDialog").next('div').find('.msgui').show();
       $.ajax({
           type: "POST",
           url: 'BloomService.asmx/ImportF_FuelFromDBF',
           data: '{}',
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function (output) {
               if (output.d != "error") {
    //               $("#MsgWarning").dialog("open");
    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $("#chkFUEL").attr("checked", false);
               }
               else {
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
               }
           }
       });
   }

   /*Import for F_EMAILS table :: By Anitha :: 28MAR2018*/
   function importF_EMAILSclicked() {
       $("#DivImportOptionsDialog").next('div').find('.msgui').show();
       $.ajax({
           type: "POST",
           url: 'BloomService.asmx/ImportF_EMAILSFromDBF',
           data: '{}',
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: function (output) {
               if (output.d != "error") {
    //               $("#MsgWarning").dialog("open");
    //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $("#chkEMAILS").attr("checked", false);
               }
               else {
                   $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                   $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
               }
           }
       });
   }

       /*Import for F_AIRHST table :: By ABI :: 11April2018*/
       function importF_AIRHSTclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_AIRHSTFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
      //                 $("#MsgWarning").dialog("open");
      //                 $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkAIRHST").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_COLORS table :: By ABI :: 25April2018*/
       function importF_COLORSclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_COLORSFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkCOLORS").attr("checked", false); $("#chkFARM").attr("checked", false); $("#chkFARM").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_GRADES table :: By ABI :: 25April2018*/
       function importF_GRADESclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_GRADESFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkGRADES").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_VARIET table :: By ABI :: 25April2018*/
       function importF_VARIETclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_VARIETFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkVARIET").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_SETEOD table :: By MANI :: 16Jun2018*/
       function importF_SETEODclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_SETEODFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkSETEOD").attr("checked", false); $("#chkFARM").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_ID table :: By MANI :: 18Jun2018*/
       function importF_IDclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_IDFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_ID").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for CRE_ table :: Created by Abinaya :: 12Jul2018*/
       function importCREclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportCREFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkCRE").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }
   


       /*Import for F_VOIDS table :: Created by Mani :: 17July2018*/
       function importF_Voidsclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_VoidsFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_Voids").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       /*Import for F_EODHST table :: Created by Abinaya :: 30July2018*/
       function importF_EODHSTclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_EODHSTFromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
        //               $("#MsgWarning").dialog("open");
        //               $("#MsgHtml").html(output.d + " Records Imported Successfully...");
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_EODHST").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }


       function importF_CALLHSclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_CALLHSfromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_callhs").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       function importF_SLSCHGclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_SLSCHGfromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_SLSCHG").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }
           
       function importARCHGHSTclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportARCHGHSTfromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkARCHGHST").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

    /*Import F_FFI & F_FGI files :: by Abinaya :: 30Jan2019*/
       function importF_FFIclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_FFIfromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_FFI").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }

       function importF_FGIclicked() {
           $("#DivImportOptionsDialog").next('div').find('.msgui').show();
           $.ajax({
               type: "POST",
               url: 'BloomService.asmx/ImportF_FGIfromDBF',
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (output) {
                   if (output.d != "error") {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $("#chkF_FGI").attr("checked", false);
                   }
                   else {
                       $("#DivImportOptionsDialog").next('div').find('.msgui').hide();
                       $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                   }
               }
           });
       }
       
</script>
