<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCredits.ascx.vb" Inherits="pages_PageCredits" %>

<style type="text/css">
    .trSelectedHeader {
        background-color: red !important;
    }

    .searchplaceholder::-webkit-input-placeholder {
        color: red;
    }

    ::-webkit-input-placeholder {
        color: red;
    }

    #DivCreditsReq ul, #DivCreditsOption ul, #DivReportsOption ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    #DivCreditsReq li {
        width: 130px;
    }

    #DivCreditsOption li {
        width: 120px;
    }

    #DivReportsOption li {
        width: 220px;
    }

    #DivCreditsReq li, #DivCreditsOption li, #DivReportsOption li {
        border-bottom: 2px solid #716b6b;
        font-size: 18px;
        background: #ccc;
        padding: 5px;
    }

        #DivCreditsReq li a, #DivCreditsOption li a, #DivReportsOption li a {
            color: #ff0000;
            text-decoration: none;
            -webkit-transition: font-size 0.3s ease, background-color 0.3s ease;
            sssss -moz-transition: font-size 0.3s ease, background-color 0.3s ease;
            -o-transition: font-size 0.3s ease, background-color 0.3s ease;
            -ms-transition: font-size 0.3s ease, background-color 0.3s ease;
            transition: font-size 0.3s ease, background-color 0.3s ease;
            display: block;
        }

        #DivCreditsReq li:last-child, #DivCreditsOption li:last-child, #DivReportsOption li:last-child {
            border: none;
        }

        #DivCreditsReq li a:hover, #DivCreditsOption li a:hover, #DivReportsOption li a:hover {
            font-size: 18px;
            background: #716b6b; /*#5050A7;*/
            border-radius: 5px;
        }

        #DivCreditsReq li.active > a, #DivCreditsOption li.active > a, #DivReportsOption li.active > a {
            color: #0000ff;
        }

    /* Style the tab */
    div.tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

        /* Style the buttons inside the tab */
        div.tab input[type=button] {
            background-color: inherit;
            float: left;
            border: 1px solid #ccc;
            outline: none;
            cursor: pointer;
            padding: 5px; /*14px 16px;*/
            transition: 0.3s;
            font-size: 15px;
            color: #ff0000;
            font-weight: bold;
        }

            /* Change background color of buttons on hover */
            div.tab input[type=button]:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            div.tab input[type=button].active {
                background-color: #ccc;
                color: #0000ff;
                font-weight: bold;
            }

    /* Style the tab content */
    .tabcontent {
        display: none;
        /*padding: 6px 12px;*/
        border: 1px solid #ccc;
        border-top: none;
    }

    #DivCreditsTabs input[type="text"] {
        height: 25px;
        background: #ece7e7;
        font-weight: bold;
    }

    .editableText {
        text-align: right;
        color: red;
    }

        .editableText:enabled {
            background-color: white;
        }

        .editableText:disabled {
            background: #ece7e7;
        }

    .statusbuttons {
        height: 35px;
        font-size: larger;
        padding-left: 13px;
        padding-right: 13px;
        background: #ccc;
    }

    .bottomButtons {
        height: 50px;
        font-size: large;
        padding-left: 25px;
        padding-right: 25px;
        margin-bottom: 25px;
        margin-top: 10px;
        margin-left: 10px;
        background: #ccc;
    }

        .bottomButtons:disabled {
            background: #ece7e7;
            color: #a9a5a5;
        }

    input[type="checkbox"] + label span {
        float: right;
    }

    fieldset {
        position: relative;
        border-radius: 8px;
        border-width: 2px;
        /*border-style:double;*/
        /*border-color: darkred;
        height: 100px;*/
        max-height: 130px;
        /*background-color:mediumblue;*/
    }

    .legend1 {
        font-size: large;
        position: absolute;
        top: -0.1em;
        right: 330px;
        background: #fff;
        line-height: 1.2em;
        color: red;
    }

    .fileuploader {
        padding-left: 15px;
        padding-top: 0px;
        padding-right: 0px;
        padding-bottom: 0px;
        margin-top: 5px;
        margin-right: 0px;
        margin-bottom: 5px;
        margin-left: 0px;
        height: 100px;
    }

    .fileuploader-item {
        padding-top: 0px;
        padding-right: 8px;
        padding-bottom: 8px;
        padding-left: 8px;
    }

        .fileuploader-item .fileuploader-item-image img {
            height: 50px;
            width: 50px;
        }


    .tomail::-webkit-input-placeholder {
        /* WebKit, Blink, Edge */
        color: #c3b7c3;
    }

    .tomail:-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        color: #c3b7c3;
        opacity: 1;
    }

    .tomail::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        color: #c3b7c3;
        opacity: 1;
    }

    .tomail:-ms-input-placeholder {
        /* Internet Explorer 10-11 */
        color: #c3b7c3;
    }
</style>

<table>
    <tr>
        <td id="tdCreditsReq" style="width: 146px; vertical-align: top">
            <div id="DivCreditsReq" style="top: 5px; border: 3px solid #ccc; position: absolute; border-radius: 5px">
                <ul>
                    <li id="liCreditsReq"><a href="#" id="aCreditsReq">Credit Requests</a></li>
                    <li id="liCreditsRpt" ><a href="#" style="color:rosybrown" id="aCreditsRpt">Reports</a></li>
                </ul>
            </div>
        </td>
        <td id="tdCreditsOption" style="display: none; width: 136px; text-align: center; vertical-align: top; ">
            <div id="DivCreditsOption" style="top: 5px; border: 3px solid #ccc; border-radius: 5px;position: absolute;">
                <ul>
                    <li id="liCredit_SalesMgr" data-value="SalesMgr" data-header="Pending For Approval By Sales Manager"><a href="#" id="aCredit_SalesMgr">SalesManager</a></li>
                    <li id="liCredit_CrMgr" data-value="CrMgr" data-header="Pending For Approval By Credit Manager"><a href="#" id="aCredit_CrMgr">CreditManager</a></li>
                    <li id="liCredit_Approved" data-value="Approved" data-header="APPROVED Credits"><a href="#" id="aCredit_Approved">Approved</a></li>
                    <li id="liCredit_Denied" data-value="Denied" data-header="DENIED Credits"><a href="#" id="aCredit_Denied">Denied</a></li>
                    <li id="liCredit_Every" data-value="Every" data-header="All Credit Requests"><a href="#" id="aCredit_Every">Everything</a></li>
                    <li id="liCredit_Limbo" data-value="Limbo" data-header="Pending Credits in LIMBO"><a href="#" id="aCredit_Limbo">Limbo</a></li>
                    <li id="liCredit_Applied" data-value="Applied" data-header="All APPLIED Credit Requests"><a href="#" id="aCredit_Applied">Applied</a></li>
                </ul>
            </div>
        </td>
        <td id="tdReportsOption" style="display: none; width: 136px; text-align: center; vertical-align: top; ">
            <div id="DivReportsOption" style="top: 5px; border: 3px solid #ccc; border-radius: 5px;position: absolute;">
                <ul>
                    <li id="liRpt_PendingReq" data-value="PendingRequest" ><a href="#" id="aRptPendingReq">Pending Requests</a></li>
                    <li id="liRpt_ApprovedReq" data-value="ApprovedRequest" ><a href="#" id="aRptApprovedReq">Approved Requests</a></li>
                    <li id="liRpt_DeniedReq" data-value="DeniedRequest" ><a href="#" id="aRptDeniedReq">Denied Requests</a></li>
                    <li id="liRpt_PendingReqByFarm" data-value="PendingRequestByFarm"><a href="#" id="aRptPendingReqByFarm">Pending Requests By Farm</a></li>
                    <li id="liRpt_ApprovedReqByFarm" data-value="ApprovedRequestByFarm"><a href="#" id="aRptApprovedReqByFarm">Approved Requests By Farm</a></li>
                    <li id="liRpt_DeniedReqByFarm" data-value="DeniedRequestByFarm"><a href="#" id="aRptDeniedReqByFarm">Denied Requests By Farm</a></li>
                </ul>
            </div>
        </td>
        <td id="tdCreditsTabs" style="display: none; width: 1050px; vertical-align: top; position: absolute; ">
            <div id="DivCreditsTabs" style="top: 5px; border: 3px solid #ccc; border-radius: 5px; width: 100%;position: absolute;">
                <div class="tab">
                    <input type="button" class="tablinks" style="width:305px;" id="btnPending" onclick="openTab(event, 'Pending');" value="Pending For Approval By Sales Manager" />
                    <input type="button" class="tablinks" style="width:233px" id="btnRequest" onclick="openTab(event, 'Request');" value="Request Info"/>
                    <input type="button" class="tablinks" style="width:233px" id="btnProduct" onclick="openTab(event, 'Product');" value="Product Info" />
                    <input type="button" class="tablinks" style="width:233px" id="btnRequestBy" onclick="openTab(event, 'RequestBy');" value="Request By" />
                </div>

                <div id="DivPendingTab" data-name="Pending" data-value="Pending" class="tabcontent">
                    <table id="fgrdPendingInfo"></table>
                </div>

                <div id="DivRequestTab" data-name="Request" data-value="Request" class="tabcontent">
                   <table>
                       <tr>
                           <td id="tdRequestInfoLeftPanel" style="vertical-align:top;">
                               <%--<div id="DivRequestInfoLeftPanel" style="float:left"></div>--%>
                           </td>
                           <td>
                               <div id="DivRequestInfoRightPanel" style="float:right;margin-left:70px;"></div>
                               <div id="DivRequestInfoStatusPanel" style="margin-left:70px;"></div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                               <fieldset id="fsCrPictures" style="width: 800px; height: 102px;padding-left:10px;margin-left:5px">
                                   <legend style="font-size: large; background: white;">Pictures</legend>
                                   <input type="file" id="fileuploader3" name="files">
                               </fieldset>
                           </td>
                       </tr>
                       <tr>
                           <td id="tdReqBottomBtns" colspan="2" style="padding-left: 220px;"></td>
                       </tr>
                   </table>
                </div>

                <div id="DivProductTab" data-name="Product" data-value="Product" class="tabcontent">
                    <table>
                        <tr style="vertical-align:top;">
                            <td id="tdProductInfoLeftPanel">
                                <%--<div id="DivProductInfoLeftPanel" style="float: left"></div>--%>
                            </td>
                            <td>
                                <div id="DivProductInfoRightPanel" style="float: right; margin-left: 30px;margin-bottom: 10px;"></div>
                                <div id="DivProductInfoStatusPanel" style=" margin-left: 30px;height:323px;"></div>
                            </td>
                        </tr>
                        <tr style="height:184px;vertical-align:bottom;">
                            <td  id="tdProdBottomBtns" colspan="2" style="padding-left:220px;"></td>
                        </tr>
                    </table>
                </div>

                <div id="DivRequestByTab" data-name="RequestBy" data-value="RequestBy" class="tabcontent">
                    <table>
                        <tr>
                            <td id="tdReqByInfoLeftPanel" style="vertical-align:top;">
                                <%--<div id="DivReqByInfoLeftPanel" style="float: left"></div>--%>
                            </td>
                            <td style="vertical-align: top;">
                                <div style="float: right; margin-left: 20px;height:238px;">
                                    <table cellpadding="5px" style="max-height: 280px;">
                                        <tr id="trReqBy">
                                            <td style="width: 100px">Requested By</td>
                                            <td>
                                                <input type="text" id="txtReqByName" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtReqByDate" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtReqByTime" style="width: 100px;" readonly />
                                            </td>
                                        </tr>
                                        <tr id="trSalesMgr" style="display: none;">
                                            <td>Sales Manager</td>
                                            <td>
                                                <input type="text" id="txtSalesMgrName" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtSalesMgrDate" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtSalesMgrTime" style="width: 100px;" readonly />
                                            </td>
                                        </tr>
                                        <tr id="trCreditMgr" style="display: none;">
                                            <td>Credit Manager</td>
                                            <td>
                                                <input type="text" id="txtCreditMgrName" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtCreditMgrDate" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtCreditMgrTime" style="width: 100px;" readonly />
                                            </td>
                                        </tr>
                                        <tr id="trDenBy" style="display: none;">
                                            <td>Denied By</td>
                                            <td>
                                                <input type="text" id="txtDenByName" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtDenByDate" style="width: 100px;" readonly />
                                            </td>
                                            <td>
                                                <input type="text" id="txtDenByTime" style="width: 100px;" readonly />
                                            </td>
                                        </tr>
                                        <tr id="trDeniedReas" style="display: none;">
                                            <td></td>
                                            <td colspan="3">
                                                <label>Reason Denied</label><br />
                                                <textarea id="txtDeniedReason" style="width: 300px;" rows="6" disabled="disabled" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="DivReqByInfoStatusPanel" style="margin-top:50px;margin-left: 20px;"></div>
                            </td>
                        </tr>
                        <tr  style="height:234px;vertical-align:bottom;">
                           <td id="tdReqByBottomBtns" colspan="2" style="padding-left:220px;">
                           </td>
                       </tr>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>

<div id="DivCreditDetailsLeft" style="display:none;">
    <table cellpadding="5px">
        <tr>
            <td>Customer</td>
            <td>
                <input type="text" id="txtCustomer" style="width:80px;" readonly />
            </td>
            <td colspan="5">
                <input type="text" id="txtCustName" style="width:300px;" readonly />
            </td>
        </tr>
      
        <tr>
            <td>Salesman</td>
            <td>
                <input type="text" id="txtSalesman" style="width:40px;" readonly />
            </td>
            <td colspan="4">
                <input type="text" id="txtSlsname" style="width:300px;" readonly />
            </td>
        </tr>
      
        <tr>
            <td>Invoice</td>
            <td>
                <input type="text" id="txtInvoice" style="width:80px;" readonly />
            </td>
            <td colspan="2">Invoice Date
                <input type="text" id="txtInvDate" style="width:80px;" readonly />
            </td>
        </tr>
      
        <tr>
            <td>Flower</td>
            <td>
                <input type="text" id="txtFlower" style="width:80px;" readonly />
            </td>
            <td colspan="4">
                <input type="text" id="txtFlowerName" style="width:300px;" readonly />
            </td>
        </tr>
      
        <tr>
            <td>Boxes</td>
            <td>
                <input type="text" id="txtBoxes" style="width:70px;text-align:right;" readonly />
                <input type="text" id="txtUOM" style="width:30px;text-align:right;" readonly />
            </td>
            <td colspan="3" style="width:150px;">Units/Box
                <input type="text" id="txtUnits" style="width:70px;text-align:right;" readonly />
                <label style="margin-left:5px;">Total Units</label>
                <input type="text" class="editableText NumbersOnly" id="txtTotalUnits" style="width: 100px; text-align: right; color: red" />
            </td>
        </tr>
        <tr>
            <td colspan="2">Total Credit Requested</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" style="text-align:right;color:red;" id="txtTotalCrReqAmt" />
            </td>
        </tr>
        <tr>
            <td colspan="2">Total To Apply To Grower</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" id="txtTotGrower" autocomplete='off'  />
                </td>
            <td>
                <input type="button" style="background:#ccc;" id="btnGrowerEdit" value="Change" />
            </td>
        </tr>
    </table>
</div>

<div id="DivPendingReqRight" style="display:none;">
    <table cellpadding="5px">
        <tr>
            <td>Control #</td>
            <td colspan="2">
                <input type="text" id="txtControl" readonly/>
            </td>
        </tr>
        <tr>
            <td>Credit Code</td>
            <td colspan="2">
                <input type="text" id="txtCrCode" style="width:50px;" readonly/>
            </td>
        </tr>
        <tr>
            <td>Credit Description</td>
            <td colspan="2">
                <input type="text" id="txtCrDesc" style="width:300px;" readonly />
            </td>
        </tr>
        <tr>
            <td>Reason</td>
            <td colspan="2">
                <textarea id="txtReason" style="width: 300px;color:red;" rows="6" readonly></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <input type="button" class="statusbuttons" style="color:darkcyan;;" id="btnReqApprove" value="Approve" />
                <input type="button" class="statusbuttons" style="color:blue;" id="btnReqDeny" value="Deny" />
                <input type="button" class="statusbuttons" id="btnReqPending" value="Pending" style="display:none;" />
                <input type="button" class="statusbuttons" style="color:rgb(123, 245, 5);" id="btnReqLimbo" value="Limbo" />
            </td>
        </tr>
        
    </table>
</div>

<div id="DivProductRight" style="display:none">
    <table cellpadding="5px">
        <tr>
            <td>Farm</td>
            <td style="padding-left:30px;" colspan="4">
                <input type="text" id="txtFarm" style="width:60px;" readonly />
           
                <input type="text" id="txtFarmName" style="width:300px;" readonly />
            </td>
        </tr>
        <tr>
            <td>Date Rec.</td>
            <td style="padding-left:30px;">
                <input type="text" id="txtDateRec" style="width:80px;" readonly />
            </td>
            <td>Days Old</td>
            <td>
                <input type="text" id="txtDaysOld" style="width:60px;" readonly />
            </td>
        </tr>
        <tr>
            <td>AWB</td>
            <td style="padding-left:30px;">
                <input type="text" id="txtAWB" style="width:120px;" readonly />
            </td>
            <td>Farm Invoice</td>
            <td>
                <input type="text" id="txtFarmInv" style="width:80px;" readonly />
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td style="padding-left:30px;">
                <input type="text" class="editableText DecimalsOnly " id="txtPrice" style="width:100px;"  autocomplete='off'/>
            </td>
            <td>Unit Cost</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" id="txtUnitCost" style="width:100px;"  autocomplete='off'/>
            </td>
        </tr>
        <tr>
            <td>Packing</td>
            <td style="padding-left:30px;">
                <input type="text" class="editableText DecimalsOnly" id="txtPacking" style="width:80px;" autocomplete='off'  />
            </td>
            <td>Import Cost/Box</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" id="txtImportCost" style="width:100px;" autocomplete='off' />
            </td>
        </tr>
        <tr>
            <td>Freight</td>
            <td style="padding-left:30px;">
                <input type="text" class="editableText DecimalsOnly" id="txtFreight" style="width:100px;" autocomplete='off' />
            </td>
            <td>Fumigation</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" id="txtFumigation" style="width:100px;" autocomplete='off' />
            </td>
        </tr>
        <tr>
            <td>Anti-Dumping</td>
            <td style="padding-left:30px;">
                <input type="text" class="editableText DecimalsOnly" id="txtAntiDump" style="width:80px;" autocomplete='off' />
            </td>
            <td>Fuel</td>
            <td>
                <input type="text" class="editableText DecimalsOnly" id="txtFuel" style="width:100px" autocomplete='off' />
            </td>
        </tr>
    </table>
</div>

<div id="DivReqByRight" style="display:none;">
    <%--<table cellpadding="5px">
        <tr id="trReqBy" style="vertical-align:top;height:60px;" rowspan="2">
            <td style="width:100px">Requested By</td>
            <td>
                <input type="text" id="txtReqByName" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtReqByDate" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtReqByTime"  style="width:100px;" readonly />
            </td>
        </tr>
        <tr id="trSalesMgr" style="display:none;">
            <td>Sales Manager</td>
            <td>
                <input type="text" id="txtSalesMgrName" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtSalesMgrDate" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtSalesMgrTime"  style="width:100px;" readonly />
            </td>
        </tr>
        <tr id="trCreditMgr" style="display:none;">
            <td>Credit Manager</td>
            <td>
                <input type="text" id="txtCreditMgrName" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtCreditMgrDate" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtCreditMgrTime"  style="width:100px;" readonly />
            </td>
        </tr>
        <tr id="trDenBy" style="display:none;">
            <td>Denied By</td>
            <td>
                <input type="text" id="txtDenByName" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtDenByDate" style="width:100px;" readonly />
            </td>
            <td>
                <input type="text" id="txtDenByTime"  style="width:100px;" readonly />
            </td>
        </tr>
        <tr id="trDeniedReas" style="display:none;">
            <td></td>
            <td colspan="3">
                <label>Reason Denied</label><br />
                <textarea id="txtDeniedReason" style="width:300px;" rows="6" />
            </td>
        </tr>
    </table>--%>
</div>

<div id="DivBottomButtons" style="display: none;">
    <input type="button" id="btnPrevious" class="bottomButtons" value="Prev." />
    <input type="button" id="btnNext" class="bottomButtons" value="Next" />
    <input type="button" id="btnEdit" class="bottomButtons" value="Edit" />
    <input type="button" id="btnVoid" class="bottomButtons" value="Void" />
    <input type="button" id="btnSave" class="bottomButtons" value="Save" disabled="disabled" />
    <input type="button" id="btnCancel" class="bottomButtons" value="Cancel" disabled="disabled" />
    <input type="button" id="btnEmail" class="bottomButtons" value="Email" />
</div>

<div id="DivStatusPanel" style="display:none;">
    <table>
        <tr>
            <td style="padding-right: 71px;padding-left: 7px;">Status</td>
            <td style="width:170px;">
                <input type="text" id="txtStatus" style="width:40px" readonly />
                <label id="lblStatus"></label>
            </td>
            <td colspan="2">
                <input type="checkbox" id="chkApplied" disabled="disabled" />
                <label for="chkApplied"><span style="padding: 1px; margin-left:15px;"></span>Applied</label>
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-CreditStatus" style="display: none;" title="Alert">
        <p id="msgCreditStatushtml"></p>
</div>

<div id="msgbox-CreditDelete" style="display: none;" title="Alert">
    <p id="msgCreditDeletehtml"></p>
</div>

<div id="msgbox-approval" style="display: none;">
    <p id="msg-approval"></p>
</div>


<div id="DivCrReqEmail" style="display:none;">
    <fieldset id="fsEmailRptType"  style="width:125px;height:90px;overflow:auto;position:absolute;margin-left:70px;font-size:medium;">
        <legend style="font-size:large;background:white;"></legend>
        <input type="radio" id="rbPreAdvice" name="rbRptType" value="Pre-Advice" style="margin-top:10px;" checked />
        <label for="rbPreAdvice"><span style="padding: 1px;"></span>Pre-Advice </label><br />
        <input type="radio" id="rbFarm" name="rbRptType" value="Farm" style="margin-top:10px;" />
        <label for="rbFarm"><span style="padding: 1px;"></span>Farm </label>
    </fieldset>
</div>

<div id="DivCrReqEmailSend" style="display:none;">
    <table>
        <tr>
            <td style="padding:5px;"><input type="text" id="txtEmailTo" placeholder="EmailTo" class="tomail" style="width:565px;height:30px" /></td>
        </tr>
        <tr>
            <td style="padding:5px;"><input type="text" id="txtEmailSub" style="width:565px;height:30px" /></td>
        </tr>
        <tr>
            <td style="padding:5px;"><textarea id="txtEmailBody" cols="35" rows="5" style="width:565px;height:150px"></textarea></td>
        </tr>
    </table>
</div>

<div id="DialogCreditsDate" style="display: none;">
    <fieldset id="fsCreditsDate" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtCreditsDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDateFrom">From </label>
                </td>
                <td>
                    <input id="txtDateFrom" class="rbCreditsDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblDateTo">To </label>
                </td>
                <td>
                    <input id="txtDateTo" class="rbCreditsDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<input type="hidden" id="hfCREREQID" value="" />
<input type="hidden" id="hfVETID" value="" />
<div style="display: none" id="DivHeaderID">0</div>

<script type="text/javascript">
    $(document).ready(new function () {
        $("#txtDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());
    });
    var CreditReqOpt = "";
    var CurrentRow = 0;
    var RequestList = [];
    var RequestList = [];
    var CreditFilenames = [];
    var CreditVETID = "";
    var GrowerEditFlag = 0;
    var EditFlag = 0;
    var PicEditFlag = 0;

    var CrSessionFromDate = new Date();
    var CrSessionToDate = new Date();

    $("#aCreditsReq").die('click').live("click", function () {

        $("#liCreditsReq").addClass('active');
        $("#liCreditsRpt").removeClass('active');
        $("#tdCreditsOption").show();
        $("#tdReportsOption").hide();
        $("#DivCreditsOption").find("li").removeClass('active');
        $(".editableText").attr("disabled", true);
    });

    $("#aCreditsRpt").die('click').live("click", function () {
        $("#liCreditsReq").removeClass('active');
        $("#liCreditsRpt").addClass('active');
        $("#tdReportsOption").show();
        $("#tdCreditsOption").hide();
        $("#tdCreditsTabs").hide();
        $("#DivReportsOption").find("li").removeClass('active');
    });

    $("[id^=liCredit_]").die("click").live("click", function () {

        var CreSplit = $(this)[0].id.replace("aCredit_", "");
        $("#DivCreditsOption").find("li").removeClass('active');
        $(this).addClass('active');
        $("#tdCreditsTabs").show();
        $(".tablinks").removeClass("active");
        $(".tabcontent").hide();
        $("#btnPending").addClass("active");
        $("#DivPendingTab").show();
        $("#btnPending").val($(this).attr("data-header"));

        $(".editableText").attr("disabled", true);

        CreditReqOpt = $(this).attr("data-value");

        CurrentRow = 0;
        RequestList = [];


        /*Credits Date range Selection for credit option Everything,Limbo and Applied :: ABI :: 01Feb2018*/
        if (CreditReqOpt == "Every" || CreditReqOpt == "Limbo" || CreditReqOpt == "Applied") {
            $("#fgrdPendingInfo").empty();
            $("#DialogCreditsDate").dialog("open").data("CreditReqOpt", CreditReqOpt);//.data("SessionDates", {CrSessionFromDate:CrSessionFromDate,CrSessionToDate:CrSessionToDate});

        }
        else {
            $("#fgrdPendingInfo").empty();
            $("#fgrdPendingInfo").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Filter', value: CreditReqOpt }], query: "", newp: 1 }).flexReload();
        }
        $("#DivHeaderID").html(0);

    });

    /*Credits Date range Selection dialog :: ABI :: 01Feb2018*/
    $("#DialogCreditsDate").dialog({
        autoOpen: false,
        resizable: false,
        title: "Credits Date",
        width: 300,
        height: 220,
        modal: true,
        buttons: {
            Ok: function () {
                debugger;
                CrSessionFromDate = $("#txtDateFrom").val();
                CrSessionToDate = $("#txtDateTo").val();
                CreditReqOpt = $("#DialogCreditsDate").data("CreditReqOpt");
                $("#fgrdPendingInfo").empty();
                $("#fgrdPendingInfo").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Filter', value: CreditReqOpt + "$" + CrSessionFromDate + "$" + CrSessionToDate }], query: "", newp: 1 }).flexReload();
                $(this).dialog("close");
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $("#txtDateFrom").datepicker('setDate', CrSessionFromDate);
            $("#txtDateTo").datepicker('setDate', CrSessionToDate);
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function openTab(evt, cityName) {
        debugger;
        var i, tabcontent, tablinks;
        $(".editableText").attr("disabled", true);

        var tabc = $("div[data-name='" + cityName + "']");
        tabcontent = $(".tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = $(".tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        $("div[data-name='" + cityName + "']").show();

        var api = $.fileuploader.getInstance(input);
        api.reset();
        clearScreen();

        if (cityName == "Pending") {
        }
        else if (cityName == "Request") {
            $("#tdRequestInfoLeftPanel").html($("#DivCreditDetailsLeft").html());
            $("#DivRequestInfoRightPanel").html($("#DivPendingReqRight").html());
            $("#DivRequestInfoStatusPanel").html($("#DivStatusPanel").html());
            $("#tdReqBottomBtns").html($("#DivBottomButtons").html());
            if (RequestList.length > 0)
                LoadRequest(RequestList, CurrentRow);

            if (CreditReqOpt == "SalesMgr" || CreditReqOpt == "CrMgr")
                $("#btnReqApprove").show();
            else
                $("#btnReqApprove").hide();
        }
        else if (cityName == "Product") {
            $("#tdProductInfoLeftPanel").html($("#DivCreditDetailsLeft").html());
            $("#DivProductInfoRightPanel").html($("#DivProductRight").html());
            $("#DivProductInfoStatusPanel").html($("#DivStatusPanel").html());
            $("#tdProdBottomBtns").html($("#DivBottomButtons").html());
            if (RequestList.length > 0)
                LoadProduct(RequestList, CurrentRow);
        }
        else if (cityName == "RequestBy") {
            $("#tdReqByInfoLeftPanel").html($("#DivCreditDetailsLeft").html());
            //$("#DivReqByInfoRightPanel").html($("#DivReqByRight").html());
            $("#DivReqByInfoStatusPanel").html($("#DivStatusPanel").html());
            $("#tdReqByBottomBtns").html($("#DivBottomButtons").html());
            if (RequestList.length > 0)
                LoadRequestBy(RequestList, CurrentRow);
            ReqByCondt(RequestList, CurrentRow);
        }

        $("#fgrdPendingInfo [id^=row]").removeClass("trSelectedHeader");
        $("#fgrdPendingInfo #row" + $("#DivHeaderID").html()).addClass("trSelectedHeader");
        $("#fgrdPendingInfo td.unsorted").addClass("sorted");
        $("#fgrdPendingInfo td.sorted").removeClass("unsorted");
        $("#fgrdPendingInfo #row" + $("#DivHeaderID").html()).removeClass("trSelected");
        $("#fgrdPendingInfo #row" + $("#DivHeaderID").html() + " td.sorted").addClass("unsorted");
        $("#fgrdPendingInfo #row" + $("#DivHeaderID").html() + " td.unsorted").removeClass("sorted");

        evt.currentTarget.className += " active";
    }

    function clearScreen() {
        $("#tdRequestInfoLeftPanel").html("");
        $("#tdProductInfoLeftPanel").html("");
        $("#tdReqByInfoLeftPanel").html("");
        $("#DivRequestInfoStatusPanel").html("");
        $("#DivProductInfoStatusPanel").html("");
        $("#DivReqByInfoStatusPanel").html("");
        $("#tdReqBottomBtns").html("");
        $("#tdProdBottomBtns").html("");
        $("#tdReqByBottomBtns").html("");
    }

    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    $("#fgrdPendingInfo").flexigrid({
        url: 'BloomService.asmx/GetPendingInfoDetails',
        dataType: 'xml',
        colModel: [
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center', hide: true },
            { display: '', name: 'Delete', width: 13, sortable: false, align: 'center', hide: true },
            { display: 'ID', name: 'ID', width: 35, sortable: true, align: 'left', hide: true },
            { display: 'Cust#', name: 'Customer', width: 35, sortable: true, align: 'right', process: HeaderRowClick },
            { display: 'Customer Name', name: 'Custname', width: 185, sortable: true, align: 'left', process: HeaderRowClick },
            { display: 'Invoice', name: 'Invoice', width: 50, sortable: true, align: 'right', process: HeaderRowClick },
            { display: 'Inv.Date', name: 'Invdate', width: 60, sortable: true, align: 'center', process: HeaderRowClick },
            { display: 'Trans.Date', name: 'Transdate', width: 60, sortable: true, align: 'center', process: HeaderRowClick },
            { display: 'Credit Code', name: 'CreditCode', width: 55, sortable: false, align: 'center', process: HeaderRowClick },
            { display: 'Sales Person', name: 'SalesPerson', width: 80, sortable: false, align: 'left', process: HeaderRowClick },
            { display: 'Farm', name: 'Farm', width: 40, sortable: false, align: 'left', process: HeaderRowClick },
            { display: 'Product Descrip.', name: 'Desc', width: 185, sortable: false, align: 'left', process: HeaderRowClick },
            { display: 'Awb', name: 'Awb', width: 80, sortable: false, align: 'left', process: HeaderRowClick },
            { display: 'GrowerTotal', name: 'GrowerAmt', width: 70, sortable: false, align: 'right', process: HeaderRowClick },
        ],
        searchitems: [
            { display: 'Farm', name: 'Farm' },
            { display: 'Cust#', name: 'Customer' },
            { display: 'Customer Name', name: 'CustName' },
            { display: 'Invoice', name: 'Invoice' },
            { display: 'Product Descrip.', name: 'Desc' },
            { display: 'Awb', name: 'Awb' },
        ],
        showTableToggleBtn: true,
        sortname: "Customer Asc",
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
        autoload: false,
        showTableToggleBtn: false,
        height: $(window).height() - 215,
        width: 1050,
        striped: true,
        params: [
            { name: 'Filter', value: '' },
            { name: 'ExportCSV', value: '' },
        ],
        onSuccess: function () {
            debugger;
            $('#fgrdPendingInfo #row0').addClass("TotalRows");
            $(".imgLoaderForUser").hide();
            var sel = jQuery("#fgrdPendingInfo tbody tr");
            var len = sel.length;
            if (len >= 1) {
                $("#DivPendingTab #ExportCSV").show();
            }

            var CrSessionFromDateDT = new Date(CrSessionFromDate)
            var CrSessionToDateDT = new Date(CrSessionToDate)

            // console

            RequestList = GetRequestList(CreditReqOpt + "$" + formatDate(CrSessionFromDateDT) + "$" + formatDate(CrSessionToDateDT), "");



            if (RequestList.length < 1) {
                $("#btnPending").css("width", "100%");
                $("#btnRequest").hide();
                $("#btnProduct").hide();
                $("#btnRequestBy").hide();
            }
            else {
                $("#btnPending").css("width", "350px");
                $("#btnRequest").show();
                $("#btnProduct").show();
                $("#btnRequestBy").show();
            }

            if ($("#DivHeaderID").html() != "0" && $("#fgrdPendingInfo #row" + $("#DivHeaderID").html()).css('display') == "table-row") {
                var id = $("#DivHeaderID").html();
                $("#fgrdPendingInfo [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdPendingInfo td.unsorted").addClass("sorted");
                $("#fgrdPendingInfo td.sorted").removeClass("unsorted");
                $("#fgrdPendingInfo #row" + id).addClass("trSelectedHeader");
                $("#fgrdPendingInfo #row" + id).removeClass("trSelected");
                $("#fgrdPendingInfo #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdPendingInfo #row" + id + " td.unsorted").removeClass("sorted");
            }
            else {
                $("#DivHeaderID").html($("#fgrdPendingInfo tr:first td:nth-child(3) div").text());
                $("#fgrdPendingInfo tr:first").addClass("trSelectedHeader trSelected");
            }
        },
        onError: function (xhr, status, errorThrown) {

            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#DivPendingTab .sDiv").css('float', 'left').css('width', '570px');
    $("#DivPendingTab .sDiv").find(".sDiv2").css('width', '570px');
    $('#DivPendingTab .pDiv').css('padding', '4px').css('border-left', '0px');
    $('#DivPendingTab .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivPendingTab .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivPendingTab .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()

    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";
                CREREQID = id;

                if (id.toString() != $("#DivHeaderID").html()) {
                    //LoadRequest(GetRequestList(CreditReqOpt, CREREQID),0);
                    for (var i = 0; i < RequestList.length; i++) {
                        if (RequestList[i]["ID"] == CREREQID) {
                            CurrentRow = i;
                        }
                    }
                }

                $("#DivHeaderID").html(id.toString());

                $("#fgrdPendingInfo [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdPendingInfo #row" + id).addClass("trSelectedHeader");
                $("#fgrdPendingInfo td.unsorted").addClass("sorted");
                $("#fgrdPendingInfo td.sorted").removeClass("unsorted");
                $("#fgrdPendingInfo #row" + id).removeClass("trSelected");
                $("#fgrdPendingInfo #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdPendingInfo #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    function GetRequestList(CreditReqOpt, CREREQID) {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditDetailsByOption',
            data: '{ "CreditOpt":"' + CreditReqOpt + '","CREREQID":"' + CREREQID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {

                RequestList = output.d;
            }
        });
        return RequestList;
    }

    function LoadRequest(RequestList, CurrentRow) {

        var startRow = 0;
        var endRow = RequestList.length - 1;
        //var actualRow = RequestList[CurrentRow].RowNo;

        //$("#btnEdit").attr("disabled", true);
        $("#btnGrowerEdit").hide();

        if (CurrentRow >= startRow || CurrentRow <= endRow) {

            CREREQID = RequestList[CurrentRow].ID;
            $("#hfCREREQID").val(RequestList[CurrentRow].ID);
            $("#hfVETID").val(RequestList[CurrentRow].VETID);
            LoadLeftPanelForTabs(RequestList, CurrentRow);
            $("#txtControl").val(RequestList[CurrentRow].ControlNum);
            $("#txtCrCode").val(RequestList[CurrentRow].CODE);

            //var reason = RequestList[CurrentRow].REASON.split("~");
            //$("#txtCrDesc").val(reason[0]);
            ////$("#txtReason").val("");
            ////$("#txtReason").attr('placeholder',reason.length > 1 ? reason[0] + "  " + reason[1] : (reason.length == 1) ? reason[0] : "");
            //$("#txtReason").val(reason.length > 1 ? reason[0] + "  " + reason[1] : (reason.length == 1) ? reason[0] : "");

            $("#txtCrDesc").val(RequestList[CurrentRow].CreditDesc);

            var ReqReason = RequestList[CurrentRow].REASON;
            //var reason = "";
            //for (var count = 1; count <= ReqReason.split("~").length; count++) {
            //    if (count == ReqReason.split("~").length)
            //        reason += ReqReason.split("~")[count - 1];
            //    else
            //        reason += ReqReason.split("~")[count - 1] + "\n";
            //}
            $("#txtReason").val(ReqReason);

            CreditFilenames = [];
            CreditFileNames = RequestList[CurrentRow].ImageName;
            var api = $.fileuploader.getInstance(input);
            api.reset();
            if (CreditFileNames != "") {
                var imgNameSplit = CreditFileNames.split(",");
                for (var i = 0; i < imgNameSplit.length; i++) {
                    var ext = imgNameSplit[i].split(".")[1];
                    CreditVETID = RequestList[CurrentRow].VETID;

                    var str1 = { name: imgNameSplit[i], type: 'image/' + ext, size: '', file: 'CreditRequestImages/CREREQ/' + RequestList[CurrentRow].ID + '/' + imgNameSplit[i] }
                    api = $.fileuploader.getInstance(input);
                    api.append(str1);
                }
            }
        }
    }

    function LoadProduct(RequestList, CurrentRow) {
        debugger
        var startRow = 0;
        var endRow = RequestList.length - 1;
        //var actualRow = RequestList[CurrentRow].RowNo;

        $("#btnEdit").attr("disabled", false);
        $("#btnCancel").attr("disabled", true);
        $("#btnGrowerEdit").show();

        if (CurrentRow >= startRow || CurrentRow <= endRow) {
            LoadLeftPanelForTabs(RequestList, CurrentRow);
            $("#hfCREREQID").val(RequestList[CurrentRow].ID);
            $("#hfVETID").val(RequestList[CurrentRow].VETID);
            $("#txtFarm").val(RequestList[CurrentRow].Farm);
            $("#txtFarmName").val(RequestList[CurrentRow].FarmName);
            $("#txtDateRec").val(RequestList[CurrentRow].DateRec);
            $("#txtDaysOld").val(RequestList[CurrentRow].DaysFresh);
            $("#txtAWB").val(RequestList[CurrentRow].AWB);
            $("#txtFarmInv").val(RequestList[CurrentRow].FarmInv);
            $("#txtPrice").val("");
            $("#txtPrice").attr('placeholder', RequestList[CurrentRow].FOB.toFixed(4));
            $("#txtUnitCost").val("");
            $("#txtUnitCost").attr('placeholder', RequestList[CurrentRow].UnitCost.toFixed(4));
            $("#txtPacking").val("");
            $("#txtPacking").attr('placeholder', RequestList[CurrentRow].Packing.toFixed(2));
            $("#txtImportCost").val("");
            $("#txtImportCost").attr('placeholder', RequestList[CurrentRow].ImpCost);
            $("#txtFreight").val("");
            $("#txtFreight").attr('placeholder', RequestList[CurrentRow].Freight.toFixed(2));
            $("#txtFuel").val("");
            $("#txtFuel").attr('placeholder', RequestList[CurrentRow].Fuel.toFixed(2));
            $("#txtFumigation").val("");
            $("#txtFumigation").attr('placeholder', RequestList[CurrentRow].Fumigation);
            $("#txtAntiDump").val("");
            $("#txtAntiDump").attr('placeholder', RequestList[CurrentRow].AntiDump);
        }
    }

    function LoadRequestBy(RequestList, CurrentRow) {

        var startRow = 0;
        var endRow = RequestList.length - 1;
        if (CreditReqOpt == "Denied")
            $("#btnEdit").attr("disabled", false);
        else {
            $("#btnEdit").attr("disabled", true);
            $("#btnGrowerEdit").hide();
        }
        if (CurrentRow >= startRow || CurrentRow <= endRow) {
            LoadLeftPanelForTabs(RequestList, CurrentRow);
            $("#hfCREREQID").val(RequestList[CurrentRow].ID);
            $("#hfVETID").val(RequestList[CurrentRow].VETID);
            $("#txtReqByName").val(RequestList[CurrentRow].ADDUSER);
            $("#txtReqByDate").val(RequestList[CurrentRow].ADDDATE);
            $("#txtReqByTime").val(RequestList[CurrentRow].ADDTIME);

            $("#txtSalesMgrName").val(RequestList[CurrentRow].Salesmang);
            $("#txtSalesMgrDate").val(RequestList[CurrentRow].SMDATE);
            $("#txtSalesMgrTime").val(RequestList[CurrentRow].SMTIME);

            $("#txtCreditMgrName").val(RequestList[CurrentRow].APPROVEDBY);
            $("#txtCreditMgrDate").val(RequestList[CurrentRow].APPROVEDDA);
            $("#txtCreditMgrTime").val(RequestList[CurrentRow].APPROVEDTI);

            $("#txtDenByName").val(RequestList[CurrentRow].DENIEDBY);
            $("#txtDenByDate").val(RequestList[CurrentRow].DENIEDDATE);
            $("#txtDenByTime").val(RequestList[CurrentRow].DENIEDTIME);
            $("#txtDeniedReason").val(RequestList[CurrentRow].DENIEDREAS);
        }
    }

    function LoadLeftPanelForTabs(RequestList, CurrentRow) {

        $("#txtCustomer").val(RequestList[CurrentRow].Customer);
        $("#txtCustName").val(RequestList[CurrentRow].CustName);
        $("#txtSalesman").val(RequestList[CurrentRow].Salesman);
        $("#txtSlsname").val(RequestList[CurrentRow].SlsName);
        $("#txtInvoice").val(RequestList[CurrentRow].ORDER);
        $("#txtInvDate").val(RequestList[CurrentRow].InvDate);
        $("#txtFlower").val(RequestList[CurrentRow].Flower);
        $("#txtFlowerName").val(RequestList[CurrentRow].FlowerName);
        $("#txtBoxes").val(RequestList[CurrentRow].Boxes);
        $("#txtUOM").val(RequestList[CurrentRow].UOM);
        $("#txtUnits").val(RequestList[CurrentRow].Units);
        $("#txtTotalUnits").val("");
        $("#txtTotalUnits").attr('placeholder', RequestList[CurrentRow].TotalUnits);
        $("#txtTotalCrReqAmt").val("");
        $("#txtTotalCrReqAmt").attr('placeholder', RequestList[CurrentRow].Price.toFixed(2));
        $("#txtTotGrower").val("");
        $("#txtTotGrower").attr('placeholder', RequestList[CurrentRow].GrowerAmt.toFixed(2));

        $("#txtStatus").val(RequestList[CurrentRow].Status);
        var StatusExp = "";
        if (RequestList[CurrentRow].Status == "P")
            StatusExp = "PENDING";
        else if (RequestList[CurrentRow].Status == "A")
            StatusExp = "APPROVED";
        else if (RequestList[CurrentRow].Status == "D")
            StatusExp = "DENIED";
        else if (RequestList[CurrentRow].Status == "L")
            StatusExp = "LIMBO";
        $("#lblStatus").text(StatusExp);
        RequestList[CurrentRow].Applied == "False" ? $('#chkApplied').attr('checked', false) : $('#chkApplied').attr('checked', true);
    }

    $("#btnNext").die("click").live("click", function (e) {

        $(".editableText").attr("disabled", true);
        $("#btnSave").attr("disabled", true);
        $(".fileuploader-thumbnails-input").attr("style", "border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px;display: none");

        var api = $.fileuploader.getInstance(input);
        api.reset();
        if (CurrentRow < RequestList.length - 1)
            CurrentRow = CurrentRow + 1;
        else {
            CurrentRow = RequestList.length - 1;
            $("#msg-approval").html("This is Last record...");
            $("#msgbox-approval").dialog("open");
        }

        if ($(".tab").find(".active").attr("id") == "btnRequest") {
            LoadRequest(RequestList, CurrentRow);
        }
        else if ($(".tab").find(".active").attr("id") == "btnProduct")
            LoadProduct(RequestList, CurrentRow);
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy")
            LoadRequestBy(RequestList, CurrentRow);
        ReqByCondt(RequestList, CurrentRow);
        $("#DivHeaderID").html(RequestList[CurrentRow]["ID"]);

    });

    $("#btnPrevious").die("click").live("click", function (e) {

        $(".editableText").attr("disabled", true);
        $("#btnSave").attr("disabled", true);
        $(".fileuploader-thumbnails-input").attr("style", "border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px;display: none");
        //e.preventDefault();
        var api = $.fileuploader.getInstance(input);
        api.reset();

        if (CurrentRow > 0) {
            CurrentRow = CurrentRow - 1;
        }
        else {
            CurrentRow = 0;
            $("#msg-approval").html("This is First record...");
            $("#msgbox-approval").dialog("open");
        }
        if ($(".tab").find(".active").attr("id") == "btnRequest")
            LoadRequest(RequestList, CurrentRow);
        else if ($(".tab").find(".active").attr("id") == "btnProduct")
            LoadProduct(RequestList, CurrentRow);
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy")
            LoadRequestBy(RequestList, CurrentRow);
        ReqByCondt(RequestList, CurrentRow);
        $("#DivHeaderID").html(RequestList[CurrentRow]["ID"]);
    });

    /* FileUploader control */
    var input = $('#fileuploader3').fileuploader({
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
        changeInput: ' ',
        theme: 'thumbnail',
        enableApi: true,
        addMore: true,
        limit: 10,
        thumbnails: {
            box: '<div class="fileuploader-items">\
                      <div class="fileuploader-items-list">\
                      <div class="fileuploader-thumbnails-input" style="border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px; display: none;"><div class="fileuploader-thumbnails-input-inner" style="margin-top:12px;">\
                      <div class="fileuploader-input-button">\
                      <span>Upload Pictures</span></div></div></div>\
                      </div>\
                      </div>',
            item: '<div class="fileuploader-item" style="display:table-cell;vertical-align:middle;">\
                       <div class="fileuploader-item-inner"><a id="${name.split(".")[0]}" onclick=ShowPreview("${name.split(".")[0]}")>\
                       <div class="thumbnail-holder" id="divThumbPreview" title="${name}" style="cursor:pointer;"">${image}</div></a>\
                       <div class="actions-holder">\
                       <a class="fileuploader-action fileuploader-action-remove" title="Remove"><i class="remove"></i></a>\
                       </div>\
                       </div>\
                       </div>',
            startImageRenderer: false,
            canvasImage: false,
            _selectors: {
                list: '.fileuploader-items-list',
                item: '.fileuploader-item',
                start: '.fileuploader-action-start',
                retry: '.fileuploader-action-retry',
                remove: '.fileuploader-action-remove'
            },
            onItemShow: function (item, listEl) {

                var plusInput = listEl.find('.fileuploader-thumbnails-input');

                plusInput.insertAfter(item.html);

                if (item.format == 'image') {
                    item.html.find('.fileuploader-item-icon').hide();
                    CreditFilenames.push(item.name);
                    //if (CreditFileNames.indexOf(item.name) != -1)
                    //    CreditFilenames.push(item.name);
                }
            }
        },
        onItemRemove: function (html) {

            html.children().animate({ 'opacity': 0 }, 200, function () {
                setTimeout(function () {
                    html.slideUp(200, function () {
                        html.remove();
                    });
                }, 100);
            });
        },
        afterRender: function (listEl, parentEl, newInputEl, inputEl) {

            var plusInput = listEl.find('.fileuploader-thumbnails-input'),
                api = $.fileuploader.getInstance(inputEl.get(0));

            plusInput.on('click', function () {
                api.open();
            });
        },
        onRemove: function (item, listEl, parentEl, newInputEl, inputEl) {
            PicEditFlag = 1;
            var CreditID, CreditFrom;
            CreditID = $("#hfCREREQID").val();
            CreditFrom = "CREREQ";
            /*Remove image from folder*/
            $.ajax({
                url: "DeleteCreditReq.aspx",
                type: 'post',
                data: { ID: CreditID, FileName: item.name, IDFrom: CreditFrom },
                success: function (response) {
                }
            });
            //$.ajax({
            //    url: "DeleteCreditReq.aspx",
            //    type: 'post',
            //    data: { VET_ID: $("#hfVETID").val(), FileName: item.name },
            //    success: function (response) {
            //    }
            //});
            /*Remove image from table*/
            if (CreditID != "0" || CreditID != "") {
                $.ajax({
                    type: 'POST',
                    url: 'BloomService.asmx/RemoveCreditRequestPic',
                    data: "{'ID':" + CREREQID + ",'VETID':" + CreditVETID + ",'FileName':'" + item.name + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        CreditFilenames.splice(CreditFilenames.indexOf(item.name), 1);

                        var CrSessionFromDateDT = new Date(CrSessionFromDate)
                        var CrSessionToDateDT = new Date(CrSessionToDate)

                        //RequestList = GetRequestList(CreditReqOpt + "$" + formatDate(CrSessionFromDateDT) + "$" + formatDate(CrSessionToDateDT), $("#hfCREREQID").val());
                        RequestList = GetRequestList(CreditReqOpt + "$" + formatDate(CrSessionFromDateDT) + "$" + formatDate(CrSessionToDateDT), '');
                        LoadRequest(RequestList, CurrentRow);
                    }
                });
            }
            //$.ajax({
            //    type: 'POST',
            //    url: 'BloomService.asmx/RemoveCreditRequestPic',
            //    data: "{'ID':" + $("#hfCREREQID").val() + ",'VETID':" + $("#hfVETID").val() + ",'FileName':'"+item.name+"'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (output, status) {

            //        CreditFilenames.splice(CreditFilenames.indexOf(item.name), 1)
            //        RequestList = GetRequestList(CreditReqOpt, $("#hfCREREQID").val());
            //        LoadRequest(RequestList,CurrentRow);
            //    }
            //});
            return true;
        },
        upload: {
            url: "UploadCreditReq.aspx",
            data: {},
            type: 'POST',
            enctype: "multipart/form-data",
            start: true,
            synchron: true,
            beforeSend: function (item, listEl, parentEl, newInputEl, inputEl) {
                if (CREREQID != "0" || CREREQID != "") {
                    item.upload.data.ID = CREREQID;
                    item.upload.data.IDFrom = "CREREQ"
                }
                else {
                    item.upload.data.ID = CreditVETID;
                    item.upload.data.IDFrom = "VET"
                }
                return true;
            },
            onSuccess: function (data, item) {

                $("#DivCreditGridDialog").next('div').find('.msgui').hide();
                setTimeout(function () {

                    if (data == "Nil") {
                        item.remove();
                    }
                    else {
                        item.html.find('.progress-holder').hide();
                        item.renderImage();
                    }

                }, 400);

            },
            onError: function (item) {
                item.html.find('.progress-holder').hide();
                item.html.find('.fileuploader-item-icon i').text('Failed!');

                setTimeout(function () {
                    item.remove();
                }, 1500);
            },
            onProgress: function (data, item) {
                var progressBar = item.html.find('.progress-holder');

                if (progressBar.length > 0) {
                    progressBar.show();
                    progressBar.find('.fileuploader-progressbar .bar').width(data.percentage + "%");
                }
            },
            onComplete: function (listEl, parentEl, newInputEl, inputEl, jqXHR, textStatus) {
            }
        }
    });

    $('.expand-pre').on('click', function () {
        $(this).prev('pre').css('max-height', 'none');
        $(this).remove();
    });

    function ShowPreview(imgName) {
        window.open($("#" + imgName + "").find("img").attr("src"), '_blank');
    }

    $("#btnReqApprove").die("click").live("click", function (e) {
        $("#msgCreditStatushtml").html("Are you sure you want to Approve this request?");
        var status = "";
        if (CreditReqOpt == "SalesMgr")
            status = "P";
        else
            status = "A";
        $("#msgbox-CreditStatus").data("inData", { CREREQID: $("#hfCREREQID").val(), Status: status }).dialog("open");
    });

    $("#btnReqDeny").die("click").live("click", function (e) {
        $("#msgCreditStatushtml").html("Are you sure you want to Deny this request?");
        $("#msgbox-CreditStatus").data("inData", { CREREQID: $("#hfCREREQID").val(), Status: "D" }).dialog("open");
    });

    $("#btnReqPending").die("click").live("click", function (e) {
        $("#msgCreditStatushtml").html("Are you sure you want to Pending this request?");
        $("#msgbox-CreditStatus").data("inData", { CREREQID: $("#hfCREREQID").val(), Status: "P" }).dialog("open");
    });

    $("#btnReqLimbo").die("click").live("click", function (e) {
        $("#msgCreditStatushtml").html("Send to Limbo?");
        $("#msgbox-CreditStatus").data("inData", { CREREQID: $("#hfCREREQID").val(), Status: "L" }).dialog("open");
    });

    /* Alert Box :: Yes/No options for credit status update. Default-No(if user pressed Enter Key) */
    $("#msgbox-CreditStatus").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                var CREREQID = $("#msgbox-CreditStatus").data("inData")["CREREQID"]
                var Status = $("#msgbox-CreditStatus").data("inData")["Status"];

                var Customer = $("#txtCustomer").val();
                var Invoice = $("#txtInvoice").val();
                var InvDate = $("#txtInvDate").val();
                var Amount = $("#txtTotalCrReqAmt").val() == "" ? $("#txtTotalCrReqAmt").attr('placeholder') : $("#txtTotalCrReqAmt").val();
                //var Reason = ($("#txtReason").val() == "") ? $("#txtCrDesc").val() : $("#txtCrDesc").val() + "~" + $("#txtReason").val();
                var Reason = ($("#txtReason").val() == "") ? $("#txtCrDesc").val() : $("#txtReason").val();

                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/UpdateCreditStatus",
                    data: "{'CREREQID':" + CREREQID + ",'Status':'" + Status + "','Customer':" + Customer + ",'Invoice':'" + Invoice + "','InvDate':'" + InvDate + "','Amount':'" + Amount + "','Reason':'" + Reason + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        var res = output.d;
                        if (output.d.toLowerCase() == "success") {
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#msgbox-CreditStatus").dialog("close");
                            //$("#msg-approval").html("Request Status Updated...");
                            //$("#msgbox-approval").dialog("open");
                            RequestList = GetRequestList(CreditReqOpt, "");
                            if (CurrentRow > RequestList.length - 1)
                                CurrentRow = RequestList.length - 1;

                            if (CurrentRow > -1) {
                                LoadRequest(RequestList, CurrentRow);
                                LoadProduct(RequestList, CurrentRow);
                                LoadRequestBy(RequestList, CurrentRow);
                                $("#DivHeaderID").html(RequestList[CurrentRow]["ID"]);
                                //$("#fgrdPendingInfo").flexReload({ url: '/url/for/refresh' });                                                        
                            }
                            else {
                                $("#imgUserLoader").hide();
                                $("#fgrdPendingInfo").flexReload({ url: '/url/for/refresh' });
                                $(".tablinks").removeClass("active");
                                $(".tabcontent").hide();
                                $("#btnPending").addClass("active");
                                $("#DivPendingTab").show();
                            }
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
        }
    });

    $("#btnEdit").die("click").live("click", function () {
        GrowerEditFlag = 0;
        $("#btnCancel").attr("disabled", false);

        if ($(".tab").find(".active").attr("id") == "btnRequest") {
            $("#txtReason").attr("readonly", false);
            $("#txtReason").focus();
        }
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy" && CreditReqOpt == "Denied") {
            $("#txtDeniedReason").attr("disabled", false);
            $("#txtDeniedReason").focus();
        }
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy" && CreditReqOpt == "Every") {
            $("#txtDeniedReason").attr("disabled", false);
            $("#txtDeniedReason").focus();
        }
        else {
            $(".editableText").attr("disabled", false);
            $("#txtTotalUnits").focus();
        }
        editDisabledButtons();
        //$(".editableText").css("background-color", "white");
    });

    $("#btnGrowerEdit").die("click").live("click", function () {
        GrowerEditFlag = 1;
        $("#txtTotGrower").attr("disabled", false);
        $("#txtTotGrower").focus();

        editDisabledButtons();
        //$("#txtTotGrower").css("background-color", "white");
    });

    $("#btnCancel").die("click").live("click", function () {
        GrowerEditFlag = 0;
        $("#btnCancel").attr("disabled", true);

        if ($(".tab").find(".active").attr("id") == "btnRequest") {
            $("#txtReason").attr("readonly", true);
            $("#txtReason").focus();
        }
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy" && CreditReqOpt == "Denied") {
            $("#txtDeniedReason").attr("disabled", true);
            $("#txtDeniedReason").focus();
        }
        else if ($(".tab").find(".active").attr("id") == "btnRequestBy" && CreditReqOpt == "Every") {
            $("#txtDeniedReason").attr("disabled", true);
            $("#txtDeniedReason").focus();
        }
        else {
            $(".editableText").attr("disabled", true);
            $("#txtTotalUnits").focus();
        }
        cancelDisabledButtons();
        //$(".editableText").css("background-color", "white");
    });

    function editDisabledButtons() {
        $("#btnSave").attr("disabled", false);
        $("#btnCancel").attr("disabled", false);
        $("#btnVoid").attr("disabled", true);
        $("#btnPrevious").attr("disabled", true);
        $("#btnNext").attr("disabled", true);
        $("#btnEdit").attr("disabled", true);
        $("#btnGrowerEdit").attr("disabled", true);
        $("#btnEmail").attr("disabled", true);
        $(".fileuploader-thumbnails-input").attr("style", "border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px;display: inline");
    }
    function cancelDisabledButtons() {
        $("#btnSave").attr("disabled", true);
        $("#btnCancel").attr("disabled", true);
        $("#btnVoid").attr("disabled", false);
        $("#btnPrevious").attr("disabled", false);
        $("#btnNext").attr("disabled", false);
        $("#btnEdit").attr("disabled", false);
        $("#btnGrowerEdit").attr("disabled", false);
        $("#btnEmail").attr("disabled", false);
        $(".fileuploader-thumbnails-input").attr("style", "border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px;display: none");
    }
    /*Delete credit request*/
    $("#btnVoid").die("click").live("click", function () {

        if (RequestList[CurrentRow].Status == "P") {
            $("#msgCreditDeletehtml").html("Do you want to delete this credit request?");
            $("#msgbox-CreditDelete").data("CREREQID", $("#hfCREREQID").val()).dialog("open");
        }
    });

    /* Alert Box :: Yes/No options for credit( pending) request delete. Default-No(if user pressed Enter Key) */
    $("#msgbox-CreditDelete").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                var CREREQID = $("#msgbox-CreditDelete").data("CREREQID");

                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteCreditRequest",
                    data: "{'CREREQID':" + CREREQID + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        var res = output.d;
                        if (output.d == "Success") {
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#msgbox-CreditDelete").dialog("close");
                            //$("#msg-approval").html("Request Deleted...");
                            //$("#msgbox-approval").dialog("open");
                            RequestList = GetRequestList(CreditReqOpt, "");
                            if (CurrentRow == 0 && RequestList.length == 0) {
                                $("#btnPending").css("width", "100%");
                                $("#btnRequest").hide();
                                $("#btnProduct").hide();
                                $("#btnRequestBy").hide();
                                $("#DivrequestTab").hide();
                                $("#DivProductTab").hide();
                                $("#DivrequestByTab").hide();
                            }
                            else if (CurrentRow == RequestList.length - 1 || CurrentRow < RequestList.length - 1) {
                                LoadRequest(RequestList, CurrentRow);
                                LoadProduct(RequestList, CurrentRow);
                                LoadRequestBy(RequestList, CurrentRow);
                                $("#DivHeaderID").html(RequestList[CurrentRow]["ID"]);
                            }
                            else if (CurrentRow > RequestList.length - 1) {
                                CurrentRow = RequestList.length - 1;
                                LoadRequest(RequestList, CurrentRow);
                                LoadProduct(RequestList, CurrentRow);
                                LoadRequestBy(RequestList, CurrentRow);
                                $("#DivHeaderID").html(RequestList[CurrentRow]["ID"]);
                            }
                            //$("#fgrdPendingInfo").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
        }
    });

    $("#msgbox-approval").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
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

    /*Save credit request*/
    $("#btnSave").die("click").live("click", function () {

        var data = "";
        if (GrowerEditFlag == 1) {
            data += "'GrowerAmt':" + $("#txtTotGrower").val();
        }
        if (PicEditFlag == 1) {
            data += "'CreditFilenames':" + CreditFilenames;
        }

        var TotalUnits = ($("#txtTotalUnits").val() == "") ? ($("#txtTotalUnits").attr('placeholder') == undefined) ? 0 : $("#txtTotalUnits").attr('placeholder') : $("#txtTotalUnits").val();
        var TotalCrReqAmt = ($("#txtTotalCrReqAmt").val() == "") ? ($("#txtTotalCrReqAmt").attr('placeholder') == undefined) ? 0.0 : $("#txtTotalCrReqAmt").attr('placeholder') : $("#txtTotalCrReqAmt").val();
        var TotGrowerAmt = ($("#txtTotGrower").val() == "") ? ($("#txtTotGrower").attr('placeholder') == undefined) ? 0.0 : $("#txtTotGrower").attr('placeholder') : $("#txtTotGrower").val();
        var Price = ($("#txtPrice").val() == "") ? ($("#txtPrice").attr('placeholder') == undefined) ? 0.0 : $("#txtPrice").attr('placeholder') : $("#txtPrice").val();
        var UnitCost = ($("#txtUnitCost").val() == "") ? ($("#txtUnitCost").attr('placeholder') == undefined) ? 0.0 : $("#txtUnitCost").attr('placeholder') : $("#txtUnitCost").val();
        var Packing = ($("#txtPacking").val() == "") ? ($("#txtPacking").attr('placeholder') == undefined) ? 0.0 : $("#txtPacking").attr('placeholder') : $("#txtPacking").val();
        var ImportCost = ($("#txtImportCost").val() == "") ? ($("#txtImportCost").attr('placeholder') == undefined) ? 0.0 : $("#txtImportCost").attr('placeholder') : $("#txtImportCost").val();
        var Freight = ($("#txtFreight").val() == "") ? ($("#txtFreight").attr('placeholder') == undefined) ? 0.0 : $("#txtFreight").attr('placeholder') : $("#txtFreight").val();
        var Fumigation = ($("#txtFumigation").val() == "") ? ($("#txtFumigation").attr('placeholder') == undefined) ? 0.0 : $("#txtFumigation").attr('placeholder') : $("#txtFumigation").val();
        var AntiDump = ($("#txtAntiDump").val() == "") ? ($("#txtAntiDump").attr('placeholder') == undefined) ? 0.0 : $("#txtAntiDump").attr('placeholder') : $("#txtAntiDump").val();
        var Fuel = ($("#txtFuel").val() == "") ? ($("#txtFuel").attr('placeholder') == undefined) ? 0.0 : $("#txtFuel").attr('placeholder') : $("#txtFuel").val();

        //var TotalUnits = ($("#txtTotalUnits").val() == "") ? $("#txtTotalUnits").attr('placeholder') : $("#txtTotalUnits").val();
        //var TotalCrReqAmt = ($("#txtTotalCrReqAmt").val() == "") ? $("#txtTotalCrReqAmt").attr('placeholder') : $("#txtTotalCrReqAmt").val();
        //var TotGrowerAmt = ($("#txtTotGrower").val() == "") ? $("#txtTotGrower").attr('placeholder') : $("#txtTotGrower").val();
        //var Price = ($("#txtPrice").val() == "") ? $("#txtPrice").attr('placeholder') : $("#txtPrice").val();
        //var UnitCost = ($("#txtUnitCost").val() == "") ? $("#txtUnitCost").attr('placeholder') : $("#txtUnitCost").val();
        //var Packing = ($("#txtPacking").val() == "") ? $("#txtPacking").attr('placeholder') : $("#txtPacking").val();
        //var ImportCost = ($("#txtImportCost").val() == "") ? $("#txtImportCost").attr('placeholder') : $("#txtImportCost").val();
        //var Freight = ($("#txtFreight").val() == "") ? $("#txtFreight").attr('placeholder') : $("#txtFreight").val();
        //var Fumigation = ($("#txtFumigation").val() == "") ? $("#txtFumigation").attr('placeholder') : $("#txtFumigation").val();
        //var AntiDump = ($("#txtAntiDump").val() == "") ? $("#txtAntiDump").attr('placeholder') : $("#txtAntiDump").val();
        //var Fuel = ($("#txtFuel").val() == "") ? $("#txtFuel").attr('placeholder') : $("#txtFuel").val();

        //var Reason = ($("#txtReason").val() == "") ? $("#txtCrDesc").val() : $("#txtCrDesc").val() + "~" + $("#txtReason").val();        
        var Reason = ($("#txtReason").val() == "") ? $("#txtCrDesc").val() : $("#txtReason").val();
        var DeniedReason = ($("#txtDeniedReason").val() == "") ? "" : $("#txtDeniedReason").val();
        var TabName = $(".tab").find(".active").val();
        debugger;
        $.ajax({
            type: 'POST',
            url: 'BloomService.asmx/UpdateCreditDetailsWithImages',
            data: "{'ID':" + $("#hfCREREQID").val() + ",'VETID':" + $("#hfVETID").val() + ",'TotalUnits':" + TotalUnits + ",'TotalCrReqAmt':" + TotalCrReqAmt
                + ",'TotGrowerAmt':" + TotGrowerAmt + ",'Price':" + Price + ",'UnitCost':" + UnitCost + ",'Packing':" + Packing + ",'ImportCost':" + ImportCost
                + ",'Freight':" + Freight + ",'Fumigation':" + Fumigation + ",'AntiDump':" + AntiDump + ",'Fuel':" + Fuel + ",'Reason':'" + Reason + "','TabName':'" + TabName
                + "','DeniedReason':'" + DeniedReason + "', 'CreditFilenames' : '" + CreditFilenames + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var res = output.d;
                if (output.d == "Success") {
                    //$("#msg-approval").html("Request Updated...");
                    //$("#msgbox-approval").dialog("open");
                    var CrSessionFromDateDT = new Date(CrSessionFromDate)
                    var CrSessionToDateDT = new Date(CrSessionToDate)
                    RequestList = GetRequestList(CreditReqOpt + "$" + formatDate(CrSessionFromDateDT) + "$" + formatDate(CrSessionToDateDT), "");

                    //RequestList = GetRequestList(CreditReqOpt, "");
                    //if (CurrentRow > RequestList.length - 1)
                    //    CurrentRow = RequestList.length - 1;

                    LoadRequest(RequestList, CurrentRow);
                    LoadProduct(RequestList, CurrentRow);
                    LoadRequestBy(RequestList, CurrentRow);
                    // $("#fgrdPendingInfo").flexReload({ url: '/url/for/refresh' });

                    $(".editableText").attr("disabled", true);
                    $("#txtDeniedReason").attr("disabled", true);
                    $("#txtReason").attr("readonly", true);
                    $("#btnSave").attr("disabled", true);
                    $(".fileuploader-thumbnails-input").attr("style", "border: 0px #a5a5a5 solid;height: 60px;width: 100px;background: transparent;float: right;margin: 25px;z-index: 999;top: -10px;position: absolute;right: 0px;display: none");
                    $("#btnVoid").attr("disabled", false);
                    $("#btnPrevious").attr("disabled", false);
                    $("#btnNext").attr("disabled", false);
                    $("#btnEdit").attr("disabled", false);
                    if (TabName == "Product Info") {
                        $("#btnGrowerEdit").show();
                        $("#btnGrowerEdit").attr("disabled", false);
                    }
                    else {
                        $("#btnGrowerEdit").hide();
                        $("#btnGrowerEdit").attr("disabled", true);
                    }
                    $("#btnEmail").attr("disabled", false);
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });

    });

    $(".NumbersOnly").live('keypress', function (e) {
        return isNumber(event, this)
    });
    // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
    function isNumber(evt, element) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (
            //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
            ((charCode != 8 && charCode < 48) || charCode > 57))
            return false;
        return true;
    }

    $(".DecimalsOnly").live('keypress', function (e) {
        return isDecimal(event, this)
    });
    // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
    function isDecimal(evt, element) {

        var charCode = (evt.which) ? evt.which : event.keyCode
        if (
            //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
            (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.
            ((charCode != 8 && charCode < 48) || charCode > 57))
            return false;
        return true;
    }

    $('input').live('keypress', function (e) {
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
                else if ($(this).attr('id') == "txtTotalUnits") {
                    $("#txtTotalCrReqAmt").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtTotalCrReqAmt") {
                    $("#txtTotGrower").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtTotGrower") {
                    $("#txtPrice").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtPrice") {
                    $("#txtUnitCost").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtUnitCost") {
                    $("#txtPacking").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtPacking") {
                    $("#txtImportCost").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtImportCost") {
                    $("#txtFreight").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtFreight") {
                    $("#txtFumigation").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtFumigation") {
                    $("#txtAntiDump").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtAntiDump") {
                    $("#txtFuel").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtFuel") {
                    $(".#btnSave").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDateFrom") {
                    $("#txtDateTo").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDateTo") {
                    $("#DialogCreditsDate").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
                    return false;
                }
            }
        }
    });

    function ReqByCondt(RequestList, CurrentRow) {

        $("#trReqBy").show();
        $("#trSalesMgr").hide();
        $("#trCreditMgr").hide();
        $("#trDenBy").hide();
        $("#trDeniedReas").hide();

        //if ($(".tab").find(".active").attr("id") == "btnRequestBy") {
        if (CreditReqOpt == "SalesMgr") {
            $("#trReqBy").show();
            $("#btnVoid").attr("disabled", false);
        }
        else if (CreditReqOpt == "CrMgr") {
            $("#trReqBy").show();
            $("#trSalesMgr").show();
            $("#btnVoid").attr("disabled", false);
        }
        else if (CreditReqOpt == "Approved") {
            $("#trReqBy").show();
            $("#trSalesMgr").show();
            $("#trCreditMgr").show();
            $("#btnVoid").attr("disabled", true);
        }
        else if (CreditReqOpt == "Denied") {
            $("#trReqBy").show();
            $("#trDenBy").show();
            $("#trDeniedReas").show();
            $("#txtDeniedReason").attr("disabled", true);
            //$("#btnEdit").attr("disabled", false);
            $("#btnVoid").attr("disabled", true);
        }
        else if (CreditReqOpt == "Every") {
            if (RequestList[CurrentRow].Status == "P" && RequestList[CurrentRow].Salesmang == "")
                $("#trReqBy").show();
            else if (RequestList[CurrentRow].Status == "P" && RequestList[CurrentRow].Salesmang != "") {
                $("#trReqBy").show();
                $("#trSalesMgr").show();
            }
            else if (RequestList[CurrentRow].Status == "A") {
                $("#trReqBy").show();
                $("#trSalesMgr").show();
                $("#trCreditMgr").show();
            }
            else if (RequestList[CurrentRow].Status == "D") {
                $("#trReqBy").show();
                $("#trDenBy").show();
                $("#trDeniedReas").show();
                $("#txtDeniedReason").attr("disabled", true);
                $("#btnEdit").attr("disabled", false);
            }
        }
        else {
            $("#btnVoid").attr("disabled", false);
        }
        //}
    }

    /* Dialog for Email report type options */
    $("#DivCrReqEmail").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 195,
        width: 310,
        title: 'Report Type',
        buttons: {
            PDF: function () {

                var RptName = ($("input[name='rbRptType']:checked").val() == "Pre-Advice") ? "Pre-Advice" : "Farm"
                var CREREQID = $("#hfCREREQID").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintCreditAdviceRpt',
                    data: "{'CREREQID':'" + CREREQID + "','RptName':'" + RptName + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        var w0 = '';
                        w0 = window.open('GeneratingPDF.html', '_blank');
                        var res = output.d;

                        if (res == "") {
                            w0.close();
                        }
                        else {
                            w0.location = res;
                        }
                    }
                });
            },
            EMAIL: function () {
                var RptName = ($("input[name='rbRptType']:checked").val() == "Pre-Advice") ? "Pre-Advice" : "Farm"
                var CREREQID = $("#hfCREREQID").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintCreditAdviceRpt',
                    data: "{'CREREQID':'" + CREREQID + "','RptName':'" + RptName + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        debugger
                        var res = output.d;
                        var w0 = '';
                        //w0 = window.open('GeneratingPDF.html', '_blank');

                        if (res == "") {
                        }
                        else {
                            var RptURL = res.substring(res.length, res.lastIndexOf("/") + 1);
                            //$("#DivCrReqEmailSend").append("<div class='msgui'  style='margin-left: 10px;height: 17px;background:none;'></div>").css('height', '35px');
                            //$("#DivCrReqEmailSend").next('div').find('.msgui').hide();

                            $("#DivCrReqEmailSend").data("RptContent", { RptName: RptName, CREREQID: CREREQID, RptURL: RptURL }).dialog("open");
                            //w0.close();
                        }
                    }
                });
            },
            EXIT: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('PDF')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('EMAIL')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('EXIT')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#btnEmail").die("click").live("click", function () {
        $("#DivCrReqEmail").dialog("open");
    });

    /* Dialog for Email send options */
    $("#DivCrReqEmailSend").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 350,
        width: 600,
        title: 'EMAIL',
        buttons: {
            Send: function () {
                debugger
                var RptURL = $("#DivCrReqEmailSend").data("RptContent")["RptURL"];
                var Tomail = $("#txtEmailTo").val();
                var Subject = $("#txtEmailSub").val();
                var EmailBody = $("#txtEmailBody").val();
                var RptName = $("#DivCrReqEmailSend").data("RptContent")["RptName"];

                //$("#DivCrReqEmailSend").next('div').find(".msgui").css("width", $("#DivCrReqEmailSend").width() - $('#DivCrReqEmailSend').next('div').find(".ui-dialog-buttonset").width());
                if (Tomail == "") {
                    //$("#DivCrReqEmailSend").next('div').find(".msgui").html("Please enter ToEmail!!!");
                    //$("#DivCrReqEmailSend").next('div').find('.msgui').show();
                    $("#txtEmailTo").focus();
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendCrReqEmail',
                    data: "{'Tomail': '" + Tomail + "','Subject':'" + Subject + "','EmailBody':'" + EmailBody + "','RptURL':'" + RptURL + "','RptName':'" + RptName + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        console.log(output.d);
                        if (output.d.includes("success")) {
                            $.growl.notice({ title: "", message: "Success" });
                            $("#DivCrReqEmailSend").dialog("close");
                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            //$("#DivCrReqEmailSend").next('div').find('.msgui').hide();

            var farm = RequestList[CurrentRow].Farm;
            var RptName = ($("#DivCrReqEmailSend").data("RptContent")["RptName"] == "Pre-Advice") ? "Pre-Advice" : "Credit Advice - Farm";
            var CREREQID = $("#DivCrReqEmailSend").data("RptContent")["CREREQID"];
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCreditRptEmailSub',
                data: "{'CREREQID':'" + CREREQID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output, status) {

                    var res = output.d;
                    var CompanyName = ('<%=ConfigurationManager.AppSettings("CompanyName")%>').toString();
                    var SiteURL = ('<%=ConfigurationManager.AppSettings("SiteURL")%>').toString();
                    var SiteURLhost = SiteURL.substring(0, SiteURL.lastIndexOf("/"));
                    var sub = CompanyName + " --- " + RptName + " For " + res[0].FarmName;
                    $("#txtEmailSub").val(sub);
                    var body = "";
                    for (var i = 0; i < res.length; i++) {
                        if (res[i].ImageName.trim() != "")
                            body = body + SiteURL + "/CreditRequestImages/CREREQ/" + CREREQID + "/" + res[i].ImageName + "\n";
                    }
                    if (body != "") {
                        $("#txtEmailBody").val("Image URLs###\n" + body);
                    }
                    else {
                        $("#txtEmailBody").val("");
                    }
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetFarmDetailsByCode',
                        data: "{'Farm':'" + farm + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (output, status) {

                            $("#txtEmailTo").val(output.d.Email);
                            //$("#txtEmailTo").prop("readonly", true);
                        }
                    });
                }
            });

        }
    });

</script>
