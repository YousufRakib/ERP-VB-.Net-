/*
* Flexigrid for jQuery - New Wave Grid
*
* Copyright (c) 2008 Paulo P. Marinas (webplicity.net/flexigrid)
* Dual licensed under the MIT (MIT-LICENSE.txt)
* and GPL (GPL-LICENSE.txt) licenses.
*
* $Date: 2008-07-14 00:09:43 +0800 (Tue, 14 Jul 2008) $
*/

(function ($) {
    $.addFlex = function (t, p) {
        if (t.grid) return false; //return if already exist

        // apply default properties
        p = $.extend({
            height: 200, //default height
            width: 'auto', //auto width
            striped: true, //apply odd even stripes
            novstripe: false,
            minwidth: 30, //min width of columns
            minheight: 80, //min height of columns
            resizable: true, //resizable table
            url: false, //ajax url
            method: 'POST', // data sending method
            dataType: 'xml', // type of data loaded
            errormsg: 'Connection Error',
            usepager: false, //
            nowrap: true, //
            page: 1, //current page
            total: 1, //total pages
            useRp: true, //use the results per page select box
            rp: $("#ctl00_divUserRP").html(), // results per page //Get RP value from DB
            rpOptions: [10, 15, 20, 25, 40, 50, 75, 100,500],
            title: false,
            pagestat: 'Displaying {from} to {to} of {total} items',
            procmsg: 'Loading, please wait ...',
            query: '',
            qtype: '',
            nomsg: 'No items',
            minColToggle: 1, //minimum allowed column to be hidden
            showToggleBtn: true, //show or hide column toggle popup
            hideOnSubmit: true,
            autoload: true,
            blockOpacity: 0.5,
            onToggleCol: false,
            onChangeSort: false,
            onSuccess: false,
            optional: {},
            onSubmit: false // using a custom populate function

        }, p);
        //Check Export CSV Button visibility

        $(t)
		.show() //show if hidden
		.attr({ cellPadding: 0, cellSpacing: 0, border: 0 })  //remove padding and spacing
		.removeAttr('width') //remove width properties	
        ;

        //To Eliminate Checkbox fields Headers for ExportCSV
        var RHeaders = ["Delete", "Active?", "Web Login", "Errors", "Label Notification", "XML", "Edit", "<img"];

        function GetPages() {
            
            var page = window.location.href;
            if (page.indexOf('Page=Order') >= 0 || page.indexOf('Page=ConfirmedPOs') >= 0 || page.indexOf('Page=PendingPOs') >= 0 || page.indexOf('Page=ManualPO') >= 0 || page.indexOf('Page=Incoming') >= 0 || page.indexOf('Page=PO') >= 0 || page.indexOf('Page=Grower') >= 0 || page.indexOf('Page=Accounts') >= 0 || page.indexOf('Page=Credits') >= 0 || page.indexOf('Page=Sales') >= 0 || page.indexOf('Page=SPORD') >= 0) {
                return true;
            }
            else {
                return false;
            }
        }

        function stringFormatFBE(strValue) { return strValue.toFixed(3).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") }
        function stringFormatInv(strValue) { return strValue.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") }
        function stringFormatGPM(strValue) { return strValue.toFixed(1).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") }

        function addCommas(nStr) {
            nStr += '';
            var x = nStr.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        function GetTotals() {
            //debugger;
            var page = window.location.href;
            var totcubes = 0, totpcs = 0, totfbe = 0, totinvamt = 0, totgpm = 0, totweight = 0;
            var TotalFOBAmount = 0, TotalInvCost = 0, Totalcubes = 0;
            if (page.indexOf('Page=Order') >= 0 || page.indexOf('Page=Sales') >= 0) {
                var sel = jQuery("#DivOrderHeader .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(sel[x]).children('td');
                            totweight += parseInt($(tds[20]).find('div').text(), 10);
                            totcubes += parseFloat($(tds[21]).find('div').text());
                            totpcs += parseInt($(tds[22]).find('div').text(), 10);
                            totfbe += parseFloat($(tds[23]).find('div').text());
                            totinvamt += parseFloat($(tds[24]).find('div').text().substring(2).replace(',', ""));
                            //totgpm += parseFloat($(tds[22]).find('div').text().split("%")[0]);
                            TotalFOBAmount += parseFloat($(tds[30]).find('div').text());
                            TotalInvCost += parseFloat($(tds[31]).find('div').text());
                        }
                    }
                }
                if (TotalFOBAmount != 0)
                    totgpm = ((TotalFOBAmount - TotalInvCost) / TotalFOBAmount) * 100
                totfbe = stringFormatFBE(totfbe)
                totinvamt = "$ " + stringFormatInv(totinvamt)
                totgpm = stringFormatGPM(totgpm) + "%"

                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(21) div.totalRowFontStyle").text(totweight);
                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(22) div.totalRowFontStyle").text(totcubes.toFixed(3));
                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(23) div.totalRowFontStyle").text(totpcs);
                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(24) div.totalRowFontStyle").text(totfbe);
                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(25) div.totalRowFontStyle").text(totinvamt);
                $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(26) div.totalRowFontStyle").text(totgpm);

                //$("#DivOrderHeader div.hDivBox").find("th:eq(18) div").html("Pcs<br><div class='totalRowFontStyle'>" + totpcs )
                //$("#DivOrderHeader div.hDivBox").find("th:eq(19) div").html("FBE<br><div class='totalRowFontStyle'>" + totfbe)
                //$("#DivOrderHeader div.hDivBox").find("th:eq(20) div").html("$Inv.Amount<br><div class='totalRowFontStyle'>" + totinvamt )
                //$("#DivOrderHeader div.hDivBox").find("th:eq(21) div").html("%GPM<br><div class='totalRowFontStyle'>" + totgpm)
                //alert(totpcs + "," + val19 + "," + totinvamt + "," + totgpm);
            }
        }

            function GetGrowerTotals() {
            var page = window.location.href;
            var BoxesHeader = 0, FBEHeader = 0, GrossHeader = 0;
            var FBEAWBHeader = 0, FBESoldAWBHeader = 0;
            var Boxes = 0, FBE = 0, Origross = 0; Credits = 0; TotalUnits = 0;
            var Amount = 0;
            var Boxes_rec = 0;
            if (page.indexOf('Page=Grower') >= 0) {
                var divheader = jQuery("#DivGrowerFarmHeader .bDiv table tbody tr");//not(":last");
                if (divheader.length > 0) {
                    for (var x = 0; x < divheader.length - 1; x++) {

                        var style = jQuery(divheader[x]).css("display");
                        if (style == "table-row") {

                            var tds = jQuery(divheader[x]).children('td');
                            BoxesHeader += parseInt($(tds[4]).find('div').text(), 10);

                            FBEHeader += parseFloat($(tds[5]).find('div').text());

                            GrossHeader += parseFloat($(tds[6]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }

                BoxesHeader = BoxesHeader.toFixed()
                FBEHeader = FBEHeader.toFixed(3)
                GrossHeader = GrossHeader.toFixed(2)

                $('#fgrdGrowerFarmHeader #row0 td:nth-child(5) div').text(BoxesHeader);
                $('#fgrdGrowerFarmHeader #row0 td:nth-child(6) div').text(FBEHeader);
                $('#fgrdGrowerFarmHeader #row0 td:nth-child(7) div').text(addCommas(GrossHeader));

                var divAWBheader = jQuery("#DivGrowerAWBHeader .bDiv table tbody tr");//not(":last");
                if (divAWBheader.length > 0) {
                    for (var x = 0; x < divAWBheader.length - 1; x++) {
                        var style = jQuery(divAWBheader[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(divAWBheader[x]).children('td');
                            FBEAWBHeader += parseFloat($(tds[3]).find('div').text());
                            FBESoldAWBHeader += parseFloat($(tds[4]).find('div').text());
                        }
                    }
                }

                FBEAWBHeader = FBEAWBHeader.toFixed(3)
                FBESoldAWBHeader = FBESoldAWBHeader.toFixed(3)

                $('#fgrdGrowerAWBHeader #row0 td:nth-child(4) div').text(FBEAWBHeader);
                $('#fgrdGrowerAWBHeader #row0 td:nth-child(5) div').text(FBESoldAWBHeader);

                var sel = jQuery("#DivGrowerFarmDetail .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(sel[x]).children('td');
                            Boxes_rec += parseInt($(tds[6]).find('div').text(), 10);

                            Boxes += parseInt($(tds[7]).find('div').text(), 10);

                            TotalUnits += parseFloat($(tds[10]).find('div').text(), 10);

                            FBE += parseFloat($(tds[13]).find('div').text());

                            Origross += parseFloat($(tds[12]).find('div').text().replace(/,/g, ''));

                            Credits += parseFloat($(tds[22]).find('div').text());
                        }
                    }
                }
                Boxes = Boxes.toFixed();
                Boxes_rec = Boxes_rec.toFixed();
                TotalUnits = TotalUnits.toFixed();
                FBE = FBE.toFixed(3)
                Origross = Origross.toFixed(2)
                Credits = Credits.toFixed(2)

                $('#fgrdGrowerFarmDetail #row0 td:nth-child(7) div').text(Boxes_rec);
                $('#fgrdGrowerFarmDetail #row0 td:nth-child(8) div').text(Boxes);
                $('#fgrdGrowerFarmDetail #row0 td:nth-child(11) div').text(TotalUnits);
                $('#fgrdGrowerFarmDetail #row0 td:nth-child(14) div').text(FBE);
                $('#fgrdGrowerFarmDetail #row0 td:nth-child(13) div').text(addCommas(Origross));
                $('#fgrdGrowerFarmDetail #row0 td:nth-child(23) div').text(Credits);

                var divGrowerInv = jQuery("#DivFgrdGrowerInv .bDiv table tbody tr");//not(":last");
                if (divGrowerInv.length > 0) {
                    for (var x = 0; x < divGrowerInv.length - 1; x++) {
                        var style = jQuery(divGrowerInv[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(divGrowerInv[x]).children('td');
                            Amount += parseFloat($(tds[4]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }
                Amount = Amount.toFixed(2)
                $('#fgrdGrowerInv #row0 td:nth-child(5) div').text(addCommas(Amount));

                //$("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".bDiv").find("table tr td:nth-child(5) div").text(Boxes);
                //$("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".bDiv").find("table tr td:nth-child(9) div").text(FBE);
                //$("#fgrdGrowerFarmDetail").parent(".bDiv").siblings(".bDiv").find("table tr td:nth-child(10) div").text(Origross);
                // $("#fgrdOrderHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(23) div.totalRowFontStyle").text(val21);
            }
        }

        function GetConfirmedPOTotals() {
            var page = window.location.href;
            var Boxes = 0;var Conf = 0; var Units = 0; var Cost = 0.000; var TotalCost = 0.000;
            if (page.indexOf('Page=ConfirmedPOs') >= 0) {
                var sel = jQuery("#DivConfirmedPOs .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                          
                            var tds = jQuery(sel[x]).children('td');
                            Boxes += parseInt($(tds[8]).find('div').text(), 10);
                            Units = parseInt($(tds[10]).find('div').text(), 10);
                            
                            if ($(tds[11]).find('div').text().trim() == "") {
                                Cost = 0.00;
                            }
                            else {
                                Cost = parseFloat($(tds[11]).find('div').text());
                            }
                            
                            Conf += parseInt($(tds[12]).find('div').text(), 10);
                         
                            
                            TotalCost += parseInt($(tds[8]).find('div').text(), 10) * Units * Cost
                            
                        }
                    }
                }
               

                Boxes = Boxes.toFixed();
                Conf = Conf.toFixed();
                TotalCost = TotalCost.toFixed(2)
                $('#DivConfirmedPOs #row0 td:nth-child(9) div').text(Boxes);
                $('#DivConfirmedPOs #row0 td:nth-child(12) div').text(TotalCost);
                $('#DivConfirmedPOs #row0 td:nth-child(13) div').text(Conf);
            }
        }


        //Written By Udal Bharti 06.07.2021
        function GetCreditRequetsTotals() {
            debugger;
            var page = window.location.href;
                var TotalCost = 0.000;
            if (page.indexOf('Page=Credits') >= 0) {
                var sel = jQuery("#DivPendingTab .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {

                            var tds = jQuery(sel[x]).children('td');                          


                            TotalCost += parseFloat($(tds[13]).find('div').text(), 10);

                        }
                    }
                }

                debugger;
                TotalCost = TotalCost.toFixed(2)
                $('#DivPendingTab #row0 td:nth-child(14) div').text(TotalCost);
                if (TotalCost > 0) { $('#DivPendingTab #row0').removeAttr("style");}
            
                
            }
        }


        function GetInventoryCoolerTotals() {
            var page = window.location.href;
            var Boxes = 0;  var TotalUnits = 0; var FBE = 0.000;
            if (page.indexOf('Page=Inventory') >= 0) {
                var sel = jQuery("#divInventoryDetailByFarm .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {

                            var tds = jQuery(sel[x]).children('td');
                            Boxes += parseInt($(tds[7]).find('div').text());
                            TotalUnits += parseInt($(tds[11]).find('div').text());
                            FBE += parseFloat($(tds[12]).find('div').text());
                        }
                    }
                }


                Boxes = Boxes.toFixed();
                TotalUnits = TotalUnits.toFixed();
                FBE = FBE.toFixed(3);

                $('#divInventoryDetailByFarm #row0 td:nth-child(8) div').text(Boxes);
                $('#divInventoryDetailByFarm #row0 td:nth-child(12) div').text(TotalUnits);
                $('#divInventoryDetailByFarm #row0 td:nth-child(13) div').text(FBE);
                $('#divInventoryDetailByFarm #row0 td:nth-child(24) div').text("");
                $('#divInventoryDetailByFarm #row0 td:nth-child(25) div').text("");
            }
        }
              


        function GetIncomingTotals() {
            var page = window.location.href;
            var Boxes = 0, FBE = 0, Amount = 0, Scanned = 0, Missing = 0;
            var Weight = 0, DWeight = 0, MPF = 0, Duties = 0;
            if (page.indexOf('Page=Incoming') >= 0) {
                var sel = jQuery("#DivUserHeaders .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(sel[x]).children('td');
                            Boxes += parseInt($(tds[5]).find('div').text().replace(/,/g, ''), 10);
                            FBE += parseFloat($(tds[6]).find('div').text().replace(/,/g, ''));
                            Amount += parseFloat($(tds[7]).find('div').text().replace(/,/g, ''));
                            Scanned += parseFloat($(tds[15]).find('div').text().replace(/,/g, ''), 10);
                            Missing += parseFloat($(tds[16]).find('div').text().replace(/,/g, ''), 10);
                            Weight += parseFloat($(tds[17]).find('div').text().replace(/,/g, ''));
                            DWeight += parseFloat($(tds[18]).find('div').text().replace(/,/g, ''));
                            MPF += parseFloat($(tds[19]).find('div').text().replace(/,/g, ''));
                            Duties += parseFloat($(tds[20]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }

                Boxes = Boxes.toFixed()
                FBE = FBE.toFixed(3)
                Amount = Amount.toFixed(2)

                Scanned = Scanned.toFixed()
                Missing = Missing.toFixed()
                Weight = Weight.toFixed(2)
                DWeight = DWeight.toFixed(2)
                MPF = MPF.toFixed(2)
                Duties = Duties.toFixed(2)

                $('#DivUserHeaders #row0 td:nth-child(6) div').text(Boxes);
                $('#DivUserHeaders #row0 td:nth-child(7) div').text(FBE);
                $('#DivUserHeaders #row0 td:nth-child(8) div').text(Amount);
                $('#DivUserHeaders #row0 td:nth-child(16) div').text(Scanned);
                $('#DivUserHeaders #row0 td:nth-child(17) div').text(Missing);
                $('#DivUserHeaders #row0 td:nth-child(18) div').text(Weight);
                $('#DivUserHeaders #row0 td:nth-child(19) div').text(DWeight);
                $('#DivUserHeaders #row0 td:nth-child(20) div').text(MPF);
                $('#DivUserHeaders #row0 td:nth-child(21) div').text(Duties);
            }
        }

        function GetAccountsRecTotals() {
            var page = window.location.href;
            var Balance = 0, Month1 = 0, Month2 = 0, Month3 = 0, Month4 = 0;
            if (page.indexOf('Page=Accounts') >= 0) {
                var sel = jQuery("#DivCustomerDetails .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(sel[x]).children('td');
                            Balance += parseFloat($(tds[12]).find('div').text().replace(",", ""));
                            Month1 += parseFloat($(tds[13]).find('div').text().replace(",", ""));
                            Month2 += parseFloat($(tds[14]).find('div').text().replace(",", ""));
                            Month3 += parseFloat($(tds[15]).find('div').text().replace(",", ""));
                            Month4 += parseFloat($(tds[16]).find('div').text().replace(",", ""));
                        }
                    }
                }

                Balance = Balance.toFixed(2)
                Month1 = Month1.toFixed(2)
                Month2 = Month2.toFixed(2)
                Month3 = Month3.toFixed(2)
                Month4 = Month4.toFixed(2)

                $('#DivCustomerDetails #row0 td:nth-child(13) div').text(addCommas(Balance));
                $('#DivCustomerDetails #row0 td:nth-child(14) div').text(addCommas(Month1));
                $('#DivCustomerDetails #row0 td:nth-child(15) div').text(addCommas(Month2));
                $('#DivCustomerDetails #row0 td:nth-child(16) div').text(addCommas(Month3));
                $('#DivCustomerDetails #row0 td:nth-child(17) div').text(addCommas(Month4));
            }
        }

        function GetDepositTotals() {
            
            var page = window.location.href;
            var DepositHeaderTotal = 0, DepositDetailsTotal = 0, CheckDetailsTotal = 0;
            if (page.indexOf('Page=Accounts') >= 0) {
                var divDepositHeader = jQuery("#DivDepositsHeader .bDiv table tbody tr");//not(":last");
                if (divDepositHeader.length > 0) {
                    for (var x = 0; x < divDepositHeader.length - 1; x++) {

                        var style = jQuery(divDepositHeader[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(divDepositHeader[x]).children('td');
                            DepositHeaderTotal += parseFloat($(tds[3]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }
                DepositHeaderTotal = DepositHeaderTotal.toFixed(2)
                $('#fgrdDepositsHeader #row0 td:nth-child(4) div').text(addCommas(DepositHeaderTotal));

                var divDepositDetails = jQuery("#DivDepositDetails .bDiv table tbody tr");//not(":last");
                if (divDepositDetails.length > 0) {
                    for (var x = 0; x < divDepositDetails.length - 1; x++) {
                        var style = jQuery(divDepositDetails[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(divDepositDetails[x]).children('td');
                            DepositDetailsTotal += parseFloat($(tds[1]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }

                DepositDetailsTotal = DepositDetailsTotal.toFixed(2)
                $('#fgrdDepositDetails #row0 td:nth-child(2) div').text(addCommas(DepositDetailsTotal));

                var sel = jQuery("#DivCheckDetails .bDiv table tbody tr");//not(":last");
                if (sel.length > 0) {
                    for (var x = 0; x < sel.length - 1; x++) {
                        var style = jQuery(sel[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(sel[x]).children('td');
                            CheckDetailsTotal += parseFloat($(tds[4]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }
                CheckDetailsTotal = CheckDetailsTotal.toFixed(2)
                $('#fgrdCheckDetails #row0 td:nth-child(5) div').text(addCommas(CheckDetailsTotal));
            }
        }

        function GetPaymentsTotals() {
            var page = window.location.href;
            var ChargesTotal = 0; PaymentsTotal = 0; CreditsTotal = 0; AdjustmentTotal = 0; BalanceTotal = 0;
            if (page.indexOf('Page=Accounts') >= 0) {
                var divPaymentsHeader = jQuery("#DivCustPayARINVDetails .bDiv table tbody tr");//not(":last");
                if (divPaymentsHeader.length > 0) {
                    for (var x = 0; x < divPaymentsHeader.length - 1; x++) {

                        var style = jQuery(divPaymentsHeader[x]).css("display");
                        if (style == "table-row") {
                            var tds = jQuery(divPaymentsHeader[x]).children('td');
                            ChargesTotal += parseFloat($(tds[10]).find('div').text().replace(/,/g, ''));
                            PaymentsTotal += parseFloat($(tds[11]).find('div').text().replace(/,/g, ''));
                            CreditsTotal += parseFloat($(tds[12]).find('div').text().replace(/,/g, ''));
                            AdjustmentTotal += parseFloat($(tds[13]).find('div').text().replace(/,/g, ''));
                            BalanceTotal += parseFloat($(tds[14]).find('div').text().replace(/,/g, ''));
                        }
                    }
                }
                ChargesTotal = ChargesTotal.toFixed(2)
                PaymentsTotal = PaymentsTotal.toFixed(2)
                CreditsTotal = CreditsTotal.toFixed(2)
                AdjustmentTotal = AdjustmentTotal.toFixed(2)
                BalanceTotal = BalanceTotal.toFixed(2)
                $('#fgrdCustPayARINVDetails #row0 td:nth-child(11) div').text(addCommas(ChargesTotal));
                $('#fgrdCustPayARINVDetails #row0 td:nth-child(12) div').text(addCommas(PaymentsTotal));
                $('#fgrdCustPayARINVDetails #row0 td:nth-child(13) div').text(addCommas(CreditsTotal));
                $('#fgrdCustPayARINVDetails #row0 td:nth-child(14) div').text(addCommas(AdjustmentTotal));
                $('#fgrdCustPayARINVDetails #row0 td:nth-child(15) div').text(addCommas(BalanceTotal));
            }
        }

        // Muthu Nivetha M :: 25Feb2020 :: Added :: To calulate the totals of Consol Order grid
        function GetConsolTotalsForOrder() {
            //debugger;
            var BoxesTotal = 0; TotUnitsTotal = 0; Total = 0; CubesTotal = 0; WeightTotal = 0;
            var divodrdetconsolvw = jQuery("#DivOrderDetailsConsolView .bDiv table tbody tr");//not(":last");
            if (divodrdetconsolvw.length > 0) {
                for (var x = 0; x < divodrdetconsolvw.length - 1; x++) {

                    var style = jQuery(divodrdetconsolvw[x]).css("display");
                    if (style == "table-row") {
                        var tds = jQuery(divodrdetconsolvw[x]).children('td');
                        BoxesTotal += parseInt($(tds[5]).find('div').text(), 10);
                        TotUnitsTotal += parseInt($(tds[8]).find('div').text(), 10);
                        Total += parseFloat($(tds[10]).find('div').text().replace(/,/g, ''));
                        CubesTotal += parseFloat($(tds[12]).find('div').text().replace(/,/g, ''));
                        var tmpweight = 0;
                        tmpweight = parseFloat($(tds[13]).find('div').text().replace(/,/g, ''));
                        WeightTotal += (((tmpweight.toString().toLowerCase() == 'nan'.toLowerCase()) || (tmpweight == undefined)) ? (parseFloat("0").toFixed(2)) : tmpweight);
                    }
                }
            }
            Total = Total.toFixed(2)
            CubesTotal = CubesTotal.toFixed(3)
            WeightTotal = (parseFloat(WeightTotal).toFixed(2) == parseFloat("0").toFixed(2)) ? "" : WeightTotal.toFixed(2);

            $('#fgrdOrderDetailsConsolView  #row0 td:nth-child(6) div').text(addCommas(BoxesTotal));
            $('#fgrdOrderDetailsConsolView  #row0 td:nth-child(9) div').text(addCommas(TotUnitsTotal));
            $('#fgrdOrderDetailsConsolView  #row0 td:nth-child(11) div').text(addCommas(Total));
            $('#fgrdOrderDetailsConsolView  #row0 td:nth-child(13) div').text(addCommas(CubesTotal));
            $('#fgrdOrderDetailsConsolView  #row0 td:nth-child(14) div').text(addCommas(WeightTotal));
        }

        // Muthu Nivetha M :: 26Feb2020 :: Added :: To calulate the totals of Consol VET grid
        function GetConsolTotalsForVET() {
            //debugger;
            var BoxesTotal = 0; TotUnitsTotal = 0; Total = 0; CubesTotal = 0; WeightTotal = 0;
            var divodrvetconsolvw = jQuery("#DivOrderVETConsolView .bDiv table tbody tr");//not(":last");
            if (divodrvetconsolvw.length > 0) {
                for (var x = 0; x < divodrvetconsolvw.length - 1; x++) {

                    var style = jQuery(divodrvetconsolvw[x]).css("display");
                    if (style == "table-row") {
                        var tds = jQuery(divodrvetconsolvw[x]).children('td');
                        BoxesTotal += parseInt($(tds[4]).find('div').text(), 10);
                        TotUnitsTotal += parseInt($(tds[7]).find('div').text(), 10);
                        Total += parseFloat($(tds[9]).find('div').text().replace(/,/g, ''));
                        CubesTotal += parseFloat($(tds[11]).find('div').text().replace(/,/g, ''));
                        var tmpweight = 0;
                        tmpweight = parseFloat($(tds[12]).find('div').text().replace(/,/g, ''));
                        WeightTotal += (((tmpweight.toString().toLowerCase() == 'nan'.toLowerCase()) || (tmpweight == undefined)) ? (parseFloat("0").toFixed(2)) : tmpweight);
                    }
                }
            }
            Total = Total.toFixed(2)
            CubesTotal = CubesTotal.toFixed(3)
            WeightTotal = (parseFloat(WeightTotal).toFixed(2) == parseFloat("0").toFixed(2)) ? "" : WeightTotal.toFixed(2);
            $('#DivOrderVETConsolView #row0 td:nth-child(5) div').text(BoxesTotal);
            $('#DivOrderVETConsolView #row0 td:nth-child(8) div').text(TotUnitsTotal);
            $('#DivOrderVETConsolView #row0 td:nth-child(10) div').text(Total);
            $('#DivOrderVETConsolView #row0 td:nth-child(12) div').text(CubesTotal);
            $('#DivOrderVETConsolView #row0 td:nth-child(13) div').text(WeightTotal);
        }

        var Exclude = false;
        //create grid class
        var g = {
            hset: {},
            rePosDrag: function () {
                
                var cdleft = 0 - this.hDiv.scrollLeft;
                if (this.hDiv.scrollLeft > 0) cdleft -= Math.floor(p.cgwidth / 2);
                $(g.cDrag).css({ top: g.hDiv.offsetTop + 1 });
                var cdpad = this.cdpad;

                $('div', g.cDrag).hide();

                $('thead tr:first th:visible', this.hDiv).each
				(
			 	function () {
			 	    var n = $('thead tr:first th:visible', g.hDiv).index(this);
			 	    var cdpos = parseInt($('div', this).width());
			 	    var ppos = cdpos;
			 	    if (cdleft == 0)
			 	        cdleft -= Math.floor(p.cgwidth / 2);

			 	    cdpos = cdpos + cdleft + cdpad;

			 	    //$('div:eq(' + n + ')', g.cDrag).css({ 'left': cdpos + 'px' }).show();

			 	    cdleft = cdpos;
			 	}
				);

            },
            fixHeight: function (newH) {
                newH = false;
                if (!newH) newH = $(g.bDiv).height();
                var hdHeight = $(this.hDiv).height();
                $('div', this.cDrag).each(
						function () {
						    $(this).height(newH + hdHeight);
						}
					);

                var nd = parseInt($(g.nDiv).height());

                if (nd > newH)
                    $(g.nDiv).height(newH).width(200);
                else
                    $(g.nDiv).height('auto').width('auto');

                $(g.block).css({ height: newH, marginBottom: (newH * -1) });

                var hrH = g.bDiv.offsetTop + newH;
                if (p.height != 'auto' && p.resizable) hrH = g.vDiv.offsetTop;
                $(g.rDiv).css({ height: hrH });

            },
            dragStart: function (dragtype, e, obj) { //default drag function start    

                if (dragtype == 'colresize' && p.colresize == true) //column resize
                {
                    $(g.nDiv).hide(); $(g.nBtn).hide();
                    var n = $('div', this.cDrag).index(obj);
                    var ow = $('th:visible div:eq(' + n + ')', this.hDiv).width();
                    $(obj).addClass('dragging').siblings().hide();
                    $(obj).prev().addClass('dragging').show();

                    this.colresize = { startX: e.pageX, ol: parseInt(obj.style.left), ow: ow, n: n };
                    $('body').css('cursor', 'col-resize');
                }
                else if (dragtype == 'vresize') //table resize
                {
                    var hgo = false;
                    $('body').css('cursor', 'row-resize');
                    if (obj) {
                        hgo = true;
                        $('body').css('cursor', 'col-resize');
                    }
                    this.vresize = { h: p.height, sy: e.pageY, w: p.width, sx: e.pageX, hgo: hgo };
                }

                else if (dragtype == 'colMove') //column header drag
                {
                    $(g.nDiv).hide(); $(g.nBtn).hide();
                    this.hset = $(this.hDiv).offset();
                    this.hset.right = this.hset.left + $('table', this.hDiv).width();
                    this.hset.bottom = this.hset.top + $('table', this.hDiv).height();
                    this.dcol = obj;
                    this.dcoln = $('th', this.hDiv).index(obj);

                    this.colCopy = document.createElement("div");
                    this.colCopy.className = "colCopy";
                    this.colCopy.innerHTML = obj.innerHTML;
                    if ($.browser.msie) {
                        this.colCopy.className = "colCopy ie";
                    }

                    $(this.colCopy).css({ position: 'absolute', 'float': 'left', display: 'none', textAlign: obj.align });
                    $('body').append(this.colCopy);
                    $(this.cDrag).hide();
                }

                $('body').noSelect();

            },
            dragMove: function (e) {
                if (this.colresize) //column resize
                {
                    var n = this.colresize.n;
                    var diff = e.pageX - this.colresize.startX;
                    var nleft = this.colresize.ol + diff;
                    var nw = this.colresize.ow + diff;
                    if (nw > p.minwidth) {
                        $('div:eq(' + n + ')', this.cDrag).css('left', nleft);
                        this.colresize.nw = nw;
                    }
                }
                else if (this.vresize) //table resize
                {
                    var v = this.vresize;
                    var y = e.pageY;
                    var diff = y - v.sy;

                    if (!p.defwidth) p.defwidth = p.width;

                    if (p.width != 'auto' && !p.nohresize && v.hgo) {
                        var x = e.pageX;
                        var xdiff = x - v.sx;
                        var newW = v.w + xdiff;
                        if (newW > p.defwidth) {
                            this.gDiv.style.width = newW + 'px';
                            p.width = newW;
                        }
                    }

                    var newH = v.h + diff;
                    if ((newH > p.minheight || p.height < p.minheight) && !v.hgo) {
                        this.bDiv.style.height = newH + 'px';
                        p.height = newH;
                        this.fixHeight(newH);
                    }
                    v = null;
                }
                else if (this.colCopy) {
                    $(this.dcol).addClass('thMove').removeClass('thOver');
                    if (e.pageX > this.hset.right || e.pageX < this.hset.left || e.pageY > this.hset.bottom || e.pageY < this.hset.top) {
                        //this.dragEnd();
                        $('body').css('cursor', 'move');
                    }
                    else
                        $('body').css('cursor', 'pointer');
                    $(this.colCopy).css({ top: e.pageY + 10, left: e.pageX + 20, display: 'block' });
                }
            },
            dragEnd: function () {
                if (this.colresize) {
                    var n = this.colresize.n;
                    var nw = this.colresize.nw;

                    $('th:visible div:eq(' + n + ')', this.hDiv).css('width', nw);
                    $('tr', this.bDiv).each(
									function () {
									    $('td:visible div:eq(' + n + ')', this).css('width', nw);
									}
								);
                    this.hDiv.scrollLeft = this.bDiv.scrollLeft;

                    $('div:eq(' + n + ')', this.cDrag).siblings().show();
                    $('.dragging', this.cDrag).removeClass('dragging');
                    this.rePosDrag();
                    this.fixHeight();
                    this.colresize = false;
                }
                else if (this.vresize) {
                    this.vresize = false;
                }
                else if (this.colCopy) {
                    $(this.colCopy).remove();
                    if (this.dcolt != null) {
                        if (this.dcoln > this.dcolt)

                            $('th:eq(' + this.dcolt + ')', this.hDiv).before(this.dcol);
                        else
                            $('th:eq(' + this.dcolt + ')', this.hDiv).after(this.dcol);

                        this.switchCol(this.dcoln, this.dcolt);
                        $(this.cdropleft).remove();
                        $(this.cdropright).remove();
                        this.rePosDrag();
                    }

                    this.dcol = null;
                    this.hset = null;
                    this.dcoln = null;
                    this.dcolt = null;
                    this.colCopy = null;

                    $('.thMove', this.hDiv).removeClass('thMove');
                    $(this.cDrag).show();
                }
                $('body').css('cursor', 'default');
                $('body').noSelect(false);
            },
            toggleCol: function (cid, visible) {
                var ncol = $("th[axis='col" + cid + "']", this.hDiv)[0];
                var n = $('thead th', g.hDiv).index(ncol);
                var cb = $('input[value=' + cid + ']', g.nDiv)[0];

                if (visible == null) {
                    visible = ncol.hide;
                }

                if ($('input:checked', g.nDiv).length < p.minColToggle && !visible) return false;

                if (visible) {
                    ncol.hide = false;
                    $(ncol).show();
                    cb.checked = true;
                }
                else {
                    ncol.hide = true;
                    $(ncol).hide();
                    cb.checked = false;
                }

                $('tbody tr', t).each
							(
								function () {
								    if (visible)
								        $('td:eq(' + n + ')', this).show();
								    else
								        $('td:eq(' + n + ')', this).hide();
								}
							);

                this.rePosDrag();

                if (p.onToggleCol) p.onToggleCol(cid, visible);

                return visible;
            },
            switchCol: function (cdrag, cdrop) { //switch columns
                $('tbody tr', t).each
					(
						function () {
						    if (cdrag > cdrop)
						        $('td:eq(' + cdrop + ')', this).before($('td:eq(' + cdrag + ')', this));
						    else
						        $('td:eq(' + cdrop + ')', this).after($('td:eq(' + cdrag + ')', this));
						}
					);

                //switch order in nDiv
                if (cdrag > cdrop)
                    $('tr:eq(' + cdrop + ')', this.nDiv).before($('tr:eq(' + cdrag + ')', this.nDiv));
                else
                    $('tr:eq(' + cdrop + ')', this.nDiv).after($('tr:eq(' + cdrag + ')', this.nDiv));

                if ($.browser.msie && $.browser.version < 7.0) $('tr:eq(' + cdrop + ') input', this.nDiv)[0].checked = true;

                this.hDiv.scrollLeft = this.bDiv.scrollLeft;
            },
            scroll: function () {
                this.hDiv.scrollLeft = this.bDiv.scrollLeft;
                this.rePosDrag();
            },
            addData: function (data) { //parse data
                if (p.preProcess)
                    data = p.preProcess(data);
                if (this.pDiv) {
                    this.domElements.pReload.removeClass('loading');
                }
                this.loading = false;
                if (!data) {
                    if (this.pDiv) {
                        this.domElements.pPageStat.html(p.errormsg);
                    }
                    return false;
                }

                if (p.dataType == 'xml')
                    p.total = +$('rows total', data).text();
                else
                    p.total = data.total;

                if (p.total == 0) {
                    $('tr, a, td, div', t).unbind();
                    $(t).empty();
                    p.pages = 1;
                    p.page = 1;
                    this.buildpager();
                    if (this.pDiv) {
                        this.domElements.pPageStat.html(p.nomsg);
                    }
                    if (p.hideOnSubmit) $(g.block).remove();
                    //21Mar19 :: Abinaya :: Speed optimization for Save process
                    if (this.bDiv.firstChild.id == "fgrdInventoryUsersHeaders" || this.bDiv.firstChild.id == "fgrdOrderHeader" || this.bDiv.firstChild.id == "fgrdOrderNewDetails") {
                        if (p.onSuccess) p.onSuccess();
                    }
                    return false;
                }

                p.pages = Math.ceil(p.total / p.rp);

                if (p.dataType == 'xml')
                    p.page = +$('rows page', data).text();
                else
                    p.page = data.page;

                this.buildpager();

                //build new body
                var tbody = document.createElement('tbody');

                if (p.dataType == 'json') {
                    $.each
					(
					 data.rows,
					 function (i, row) {
					     var tr = document.createElement('tr');
					     if (i % 2 && p.striped) tr.className = 'erow';
					     if (row.id) tr.id = 'row' + row.id;
					     if (row.style) tr.style = row.style;
					     if (row.title) tr.title = row.title;// added by abinaya

					     //add cell
					     $('thead tr:first th', g.hDiv).each
							(
							 	function () {

							 	    var td = document.createElement('td');
							 	    var idx = $(this).attr('axis').substr(3);
							 	    td.align = this.align;
							 	    td.innerHTML = row.cell[idx];
							 	    $(tr).append(td);
							 	    td = null;
							 	}
							);


					     //if ($('thead', this.gDiv).length < 1) //handle if grid has no headers
					     //{

					     //    for (idx = 0; idx < cell.length; idx++) {
					     //        var td = document.createElement('td');
					     //        td.innerHTML = row.cell[idx];
					     //        $(tr).append(td);
					     //        td = null;
					     //    }
					     //}

					     $(tbody).append(tr);
					     tr = null;
					 }
					);

                } else if (p.dataType == 'xml') {
                    i = 1;
                    $("rows row", data).each
				(
				 	function () {
				 	    i++;
				 	    var tr = document.createElement('tr');
				 	    if (i % 2 && p.striped) tr.className = 'erow';

				 	    if ($(this).attr('Class') == "trChecked")
				 	        tr.className = "trChecked";

				 	    var nid = $(this).attr('id');
				 	    if (nid) tr.id = 'row' + nid;
				 	    //added by mani
				 	    var styles = $(this).attr("style")
				 	    if (styles) tr.style.cssText = styles

				 	    //added by abinaya for confirmedPO tooltip ::10-08-2016
				 	    var titles = $(this).attr("title")
				 	    if (titles) tr.title = titles;

				 	    nid = null;

				 	    //VEN::12-11-2015::For change row backgroud color and font color 
				 	    var bgvalue = $(this).attr('background-color');
				 	    if (bgvalue != "")
				 	        tr.style.backgroundColor = bgvalue;

				 	    var ftvalue = $(this).attr('color');
				 	    if (ftvalue != "")
				 	        tr.style.color = ftvalue;

				 	    var robj = this;

				 	    /* For flexigrid speed up process:: COMMENTED by ABI::07Dec2017 

				 	    $('thead tr:first th', g.hDiv).each(function () {
				 	    	 	    var td = document.createElement('td');
				 	    	 	    var idx = $(this).attr('axis').substr(3);
				 	    	 	    td.align = this.align;
				 	    	 	    td.innerHTML = $("cell:eq(" + idx + ")", robj).text();
				 	    	 	    $(tr).append(td);
				 	    	 	    td = null;
				 	    	 	}
				 	    );
                        
				 	    if ($('thead', this.gDiv).length < 1) //handle if grid has no headers
				 	    {
				 	        $('cell', this).each(function () {
								 	    var td = document.createElement('td');
								 	    td.innerHTML = $(this).text();
								 	    $(tr).append(td);
								 	    td = null;
								 	});
				 	    }
                        */
				 	    
				 	    $('thead tr:first th', g.hDiv).each
							(
							 	function () {
							 	    var td = document.createElement('td');
							 	    var idx = $(this).attr('axis').substr(3);
							 	    td.align = this.align;
							 	    if ($("cell:eq(" + idx + ")", robj).text() == '')
							 	        td.innerHTML = "<div style='width:" + $(this)[0].children[0].style.width + ";text-align:" + $(this)[0].children[0].style.textAlign + "'>&nbsp;</div>";
							 	    else
							 	        td.innerHTML = "<div style='width:" + $(this)[0].children[0].style.width + ";text-align:" + $(this)[0].children[0].style.textAlign + "'>" + $("cell:eq(" + idx + ")", robj).text() + "</div>";

							 	    var prnt = $(tr);
							 	    var pid = false;
							 	    var pth = $(this)[0]
							 	    if (prnt[0].id) {
							 	        pid = prnt[0].id.substr(3);
							 	    }
							 	    if (pth != null) {
							 	        if (p.sortname == $(pth).attr('abbr') && p.sortname) {
							 	            pth.className = 'sorted';
							 	        }
							 	        if (pth.process) pth.process(td, pid);
							 	        if (pth.hide) $(td).css('display', 'none');
							 	    }
							 	    if (p.nowrap == false) $(td).css('white-space', 'normal');

							 	    $(tr).append(td);
							 	    $(tr)
                                        .click(
                                            function (e) {
                                                var obj = (e.target || e.srcElement); if (obj.href || obj.type) return true;
                                                $(this).toggleClass('trSelected');
                                                if (p.singleSelect) $(this).siblings().removeClass('trSelected');
                                            }
                                        )
							 	    td = null;
							 	}
							);
				 	    $(tbody).append(tr);
				 	    tr = null;
				 	    robj = null;
				 	}
				);
                }

                $('tr', t).unbind();
                $(t).empty();

                $(t).append(tbody);

                /* For flexigrid speed & these two functionalities sorted when rows append from 'th' loop:: COMMENTED by ABI::07Dec2017::[line no:761-781] 
                this.addCellProp();
                this.addRowProp();
                */

                //this.fixHeight($(this.bDiv).height());
                //this.rePosDrag();

                tbody = null; data = null; i = null;

                if (p.onSuccess) p.onSuccess();

                if (p.hideOnSubmit) $(g.block).remove(); //$(t).show();

                this.hDiv.scrollLeft = this.bDiv.scrollLeft;
                if ($.browser.opera) $(t).css('visibility', 'visible');
                var page = window.location.href;

                if (GetPages() || page.indexOf('Page=Inventory') >= 0) {
                    this.buildpager();
                }

            },

            changeSort: function (th) { //change sortorder
                if (this.loading) return true;
                if (this.pDiv) {
                    this.domElements.pPageStat.html(p.procmsg).css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0');
                    this.domElements.pReload.addClass('loading');
                }

                $(g.nDiv).hide(); $(g.nBtn).hide();

                if (p.sortname == $(th).attr('abbr')) {
                    if (p.sortorder == 'asc') p.sortorder = 'desc';
                    else p.sortorder = 'asc';
                }

                $(th).addClass('sorted').siblings().removeClass('sorted');
                $('.sdesc', this.hDiv).removeClass('sdesc');
                $('.sasc', this.hDiv).removeClass('sasc');
                $('div', th).addClass('s' + p.sortorder);
                p.sortname = $(th).attr('abbr');

                var page = window.location.href;

                if (GetPages() || page.indexOf('Page=Inventory') >= 0) {
                    this.inPlaceSort();
                    this.domElements.pReload.removeClass('loading');
                    this.buildpager()
                }
                else {
                    if (p.onChangeSort)
                        p.onChangeSort(p.sortname, p.sortorder);
                    else
                        this.populate();
                }
            },
            inPlaceSort: function () {
               
                if (!p.sortorder) sortorder = "asc";

                col = $(this.hDiv).find("th").index($(this.hDiv).find("th[abbr='" + p.sortname + "']"));
                if (isNaN(col) || col < 0) {
                    alert("Sorting is somehow not configured properly - couldn't find the header for name '" + sortname + "'");
                }

                //var rows = $(this.bDiv).find("tr");
                var rows = $(this.bDiv).find("tr").not('.TotalRows');//.not('.TotalRows');
                if (!rows || rows.length < 2) {
                    return;
                }

                var parent = $(rows[0]).parent();
                var align =$(this.hDiv).find("th[abbr='" + p.sortname + "']")[0].align

                // Hat tip http://www.onemoretake.com/2009/02/25/sorting-elements-with-jquery/
                // This comparator could be a lot more sophisticated.  How about adding 
                // a property of the column model that says if the data is numeric or textual,
                // then sorting based on that?  TODO: yeah.
                rows.sort(function (a, b) {

                    var compA = $(a).find("td:eq(" + col + ")").text().replace(",", "");
                    var compB = $(b).find("td:eq(" + col + ")").text().replace(",", "");

                    if (align == "right") {
                        compA = compA.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-')
                        compB = compB.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
                    }

                    var float = /^\s*(\+|-)?((\d+(\.\d+)?)|(\.\d+))\s*$/;
                    var date = /^(?:(0[1-9]|1[012])[\/.-](0[1-9]|[12][0-9]|3[01])[\/.-](19|20)[0-9]{2})$/;
                    var a = $(".check_int_float").val();


                    if (float.test(compA)) {
                        compA = parseFloat(compA);
                        compB = parseFloat(compB);
                    }
                    else if (date.test(compA)) {
                        compA = Date.parse(compA);
                        compB = Date.parse(compB);
                    }
                    if (p.sortorder == "asc") return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;
                    else return (compA < compB) ? 1 : (compA > compB) ? -1 : 0;
                });

                $.each(rows, function () {

                    $(parent).prepend(this);
                });
            },
            buildpager: function () { //rebuild pager based on new properties
                //if (this.pDiv) {
                //    this.domElements.pcontrol_input.val(p.page);
                //    this.domElements.pcontrol_span.html(p.pages);
                //}

                $('.pcontrol input', this.pDiv).val(p.page);
                $('.pcontrol span', this.pDiv).html(p.pages);
                var r1 = (p.page - 1) * p.rp + 1;
                var r2 = r1 + (p.rp - 1);
                if (p.total < r2) r2 = p.total;

                var stat = p.pagestat;
                var page = window.location.href;
                
                if (GetPages() || page.indexOf('Page=Inventory') >= 0 ) {
                    //PageGrower:: Multiple flexigrid loads data at same time and One grid is displayed & another is hidden means it araised 'No Records Found' in pDiv
                    //var searchname = $('input[name=q]', this.sDiv).val();
                    //if (searchname=="" && (this.bDiv.firstChild.id == "fgrdGrowerAWBHeader" || this.bDiv.firstChild.id == "fgrdGrowerFarmHeader")) {
                    //    r1 = 1
                    //    r2 = $(this.bDiv).find("tr").not('.TotalRows').length
                    //    p.total = $(this.bDiv).find("tr").not('.TotalRows').length
                    //    stat = stat.replace(/{from}/, r1);
                    //    stat = stat.replace(/{to}/, r2);
                    //    stat = stat.replace(/{total}/, p.total);
                    //}
                    if (this.bDiv.firstChild.id == "fgrdARINVSpord" || this.bDiv.firstChild.id == "fgrdInventoryPricing" || this.bDiv.firstChild.id == "fgrdInventoryRacks" || this.bDiv.firstChild.id == "fgrdInventoryUsersConsolidatePurchased" || this.bDiv.firstChild.id == "fgrdInventoryUsersConsolidate") {
                        stat = stat.replace(/{from}/, r1);
                        stat = stat.replace(/{to}/, r2);
                        stat = stat.replace(/{total}/, p.total);
                    }
                    else {
                        r1 = 1
                        r2 = $(this.bDiv).find("tr:visible").not('.TotalRows').length
                        p.total = $(this.bDiv).find("tr:visible").not('.TotalRows').length
                        stat = stat.replace(/{from}/, r1);
                        stat = stat.replace(/{to}/, r2);
                        stat = stat.replace(/{total}/, p.total);
                    }
                }
                else {
                    stat = stat.replace(/{from}/, r1);
                    stat = stat.replace(/{to}/, r2);
                    stat = stat.replace(/{total}/, p.total);
                }

                if (this.pDiv) {
                    if (this.bDiv.firstChild.id != "fgrdARINVSpord" && this.bDiv.firstChild.id != "fgrdInventoryPricing" && this.bDiv.firstChild.id != "fgrdInventoryRacks" && this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidatePurchased" && this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidate" && this.bDiv.firstChild.id != "fgrdManualPOHeader" && this.bDiv.firstChild.id != "fgrdInventoryDetailbyAWB" && this.bDiv.firstChild.id != "fgrdInventoryUserFarmDetails" && this.bDiv.firstChild.id != "fgrdBoxDetails" && this.bDiv.firstChild.id != "fgrdArmelliniXMLLogs" && this.bDiv.firstChild.id != "fgrdARINVSViewChecksHeader" && this.bDiv.firstChild.id != "fgrdARINVSViewChecksDetails" && page.indexOf("Default.aspx") < 0) {
                        this.domElements.pPageStat.html(stat).css('font-weight', 'normal').css('font-size', '11px').css('color', 'black').css('top', '5px').css('margin-left', '0px');
                    }
                    else {
                        this.domElements.pPageStat.html(stat).css('font-weight', 'normal').css('font-size', '11px').css('color', 'black').css('top', '5px').css('margin-left', '0px');
                    }
                }

                if (p.total == 0 && (GetPages() || page.indexOf('Page=Inventory') >= 0)) {
                    if (this.domElements != null) {
                        this.domElements.pPageStat.html("No records found")
                    }
                }

            },
            populate: function () { //get latest data
                if (this.loading) return true;

                if (p.onSubmit) {
                    var gh = p.onSubmit();
                    if (!gh) return false;
                }

                this.loading = true;
                if (!p.url) return false;


                var page = document.location.href;
                if (this.pDiv) {
                    if (this.bDiv.firstChild.id != "fgrdARINVSpord" && this.bDiv.firstChild.id != "fgrdInventoryPricing" && this.bDiv.firstChild.id != "fgrdInventoryRacks" && this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidatePurchased" && this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidate" && this.bDiv.firstChild.id != "fgrdManualPOHeader" && this.bDiv.firstChild.id != "fgrdInventoryDetailbyAWB" && this.bDiv.firstChild.id != "fgrdInventoryUserFarmDetails" && this.bDiv.firstChild.id != "fgrdBoxDetails" && page.indexOf("Default.aspx") < 0) {
                        this.domElements.pPageStat.html(p.procmsg).css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0').css('margin-left', '0px');
                    }
                    else {
                        this.domElements.pPageStat.html(p.procmsg).css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0').css('margin-left', ' 0px');
                    }
                    this.domElements.pReload.addClass('loading');
                }

                $(g.block).css({ top: g.bDiv.offsetTop });

                if (p.hideOnSubmit) $(this.gDiv).prepend(g.block); //$(t).hide();

                if ($.browser.opera) $(t).css('visibility', 'hidden');

                if (!p.newp) p.newp = 1;

                if (p.page > p.pages) p.page = p.pages;

                //var param = { page: p.newp, rp: p.rp, sortname: p.sortname, sortorder: p.sortorder, query: p.query, qtype: p.qtype };
                var page = window.location.href;

                if (GetPages() || page.indexOf('Page=Inventory') >= 0) {
                    
                    if (g.bDiv.firstChild.id != "fgrdARINVSpord" && g.bDiv.firstChild.id != "fgrdInventoryPricing"
                        && g.bDiv.firstChild.id != "fgrdInventoryRacks" && g.bDiv.firstChild.id != "fgrdInventoryUsersConsolidatePurchased"
                        && g.bDiv.firstChild.id != "fgrdInventoryUsersConsolidate"
                        ) {
                        
                        $('input[name=q]', g.sDiv).val('');
                        var param = [
                          { name: 'page', value: p.newp }
                          , { name: 'rp', value: p.rp }
                          , { name: 'sortname', value: p.sortname }
                          , { name: 'sortorder', value: p.sortorder }
                          , { name: 'query', value: $('input[name=q]', g.sDiv).val() }
                          , { name: 'qtype', value: $('select[name=qtype]', g.sDiv).val() }
                        ];
                    }
                    else {
                        var param = [
                           { name: 'page', value: p.newp }
                       , { name: 'rp', value: p.rp }
                       , { name: 'sortname', value: p.sortname }
                       , { name: 'sortorder', value: p.sortorder }
                       , { name: 'query', value: p.query }
                       , { name: 'qtype', value: p.qtype }
                        ];
                    }
                }
                else {
                    var param = [
                           { name: 'page', value: p.newp }
                       , { name: 'rp', value: p.rp }
                       , { name: 'sortname', value: p.sortname }
                       , { name: 'sortorder', value: p.sortorder }
                       , { name: 'query', value: p.query }
                       , { name: 'qtype', value: p.qtype }
                    ];
                }

                if (p.params) {
                    for (var pi = 0; pi < p.params.length; pi++) param[param.length] = p.params[pi];
                }
                var nparam = '{ ';
                for (var pi = 0; pi < param.length; pi++) {
                    nparam += '"' + param[pi].name + '":"' + param[pi].value + '"';
                    if (pi != param.length - 1)
                        nparam += ', ';
                }
                nparam += ' }';

                //var param = '{ "page":"' + p.newp + '", "rp":"' + p.rp + '", "sortname":"' + p.sortname + '", "sortorder":"' + p.sortorder + '", "query": "' + p.query + '", "qtype": "' + p.qtype + '" }';
                $.ajax({
                    type: "POST",
                    url: p.url,
                    data: nparam,
                    contentType: "application/json; charset=utf-8",
                    dataType: "xml",
                    success: function (data, status) {
                        g.addData(data);
                    },
                    error: function (data) {
                        try { if (p.onError) p.onError(data); } catch (e) { }
                    }
                });
            },
            doSearch: function (event) {
                debugger;
                p.query = $('input[name=q]', g.sDiv).val();
                p.qtype = $('select[name=qtype]', g.sDiv).val();
                p.qtypetxt = $('select[name=qtype] option:selected', g.sDiv).text().trim();
                p.newp = 1;
                var page = window.location.href;
                
                if (GetPages() || page.indexOf('Page=Inventory') >= 0) {
                    if (this.bDiv.firstChild.id != "fgrdARINVSpord" && this.bDiv.firstChild.id != "fgrdInventoryPricing" && this.bDiv.firstChild.id != "fgrdInventoryRacks" && this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidatePurchased" &&
                        this.bDiv.firstChild.id != "fgrdInventoryUsersConsolidate") {
                            p.query = $('input[name=q]', g.sDiv).val();
                            p.qtype = $('select[name=qtype]', g.sDiv).val();
                            p.qtypetxt = $('select[name=qtype] option:selected', g.sDiv).text().trim();
                            //p.newp = 1;
                            //this.populate();
                            var Nocells = $(this.hDiv).find('div.hDivBox tr')[0].cells;
                            // var tbl = this.bDiv.firstChild.id;

                            // var Nocells = $("#" + tbl + ".hDivBox tr")[0].cells;
                            var Index = "";
                            for (var i = 0, l = Nocells.length; i < l; i++) {
                                //if (Nocells[i].innerText.trim("<br>") == p.qtypetxt) {

                                if (Nocells[i].innerText.trim().split("\n")[0] == p.qtypetxt) {
                                    Index = i;
                                }
                            }

                            var value = p.query.toLowerCase();// == ' ' ? '' : p.query.toLowerCase();

                             value = value.replace(/\*/g, '\\*');

                            //    if (value == "*") {
                            //        value = "\\*"
                            //}
                             var Currentfgrdid = this.bDiv.firstChild.id
                            $("#" + this.bDiv.firstChild.id + " tr").each(function (index) {
                                //if last row exists hide that
                                //$('#DivOrderHeader bDiv tr #row0').css({"display":'none'});
                                $row = $(this);
                                var id = $row.find("td").eq(Index).text().toLowerCase();
                                if (id === " ")
                                    id = '\xA0';
                                //id = escape(id)
                                if (Currentfgrdid == "fgrdAvaliableInventoryGridList" && p.qtype.toLowerCase() == "flower") {
                                    if (p.query != ' ') {
                                        if (id.lastIndexOf(value, 0) === 0) {
                                            $row.show();
                                        }
                                        else {
                                            $row.hide();
                                        }
                                    }
                                    else if (p.query === ' ') {
                                        var res = id.indexOf(value);
                                        if (id === '\xA0') {
                                            $row.show();

                                            if ($(this).attr('id') == "row0") {
                                                $row.hide();
                                            }
                                        }
                                        else {
                                            $row.hide();
                                        }
                                    }
                                }
                                else if (p.qtype == 'WH') {
                                    if (p.query != ' ') {
                                        if (id.match(value) != null) {
                                            $row.show();
                                        }
                                        else {
                                            $row.hide();
                                        }
                                    }
                                    else if (p.query === ' ') {
                                        var res = id.indexOf(value);
                                        if (id === '\xA0') {
                                            $row.show();

                                            if ($(this).attr('id') == "row0") {
                                                $row.hide();
                                            }
                                        }
                                        else {
                                            $row.hide();
                                        }
                                    }
                                }
                                else if (p.qtype == 'CustNumber' && p.query != "" && page.indexOf('Page=PO') >= 0) {
                                    var idArray = value.split(',');
                                    var matchFound = false;
                                    for (var iCust = 0; iCust < idArray.length; iCust++) {
                                        if (idArray[iCust].match(id) != null) {
                                            matchFound = true;

                                            if ($(this).attr('id') == "row0" && p.query != "") {
                                                $row.hide();
                                            }
                                            else {
                                                $row.show();
                                            }
                                        }
                                    }

                                    if (!matchFound) {
                                        if ($(this).attr('id') === "row0" && p.query != "" && (page.indexOf('Page=Grower') >= 0 || page.indexOf('Page=Incoming') >= 0 || page.indexOf('Page=ConfirmedPOs') >= 0 || page.indexOf('Page=Accounts') >= 0 || page.indexOf('Page=Inventory') >= 0)) {
                                            $row.show();
                                        }
                                        else {
                                            $row.hide();
                                        }
                                        if ($(this).attr('id') === "row0" && p.query != "" && Currentfgrdid == "fgrdOrderDetailsConsolView") {
                                            $row.show();
                                        }
                                        if ($(this).attr('id') === "row0" && p.query != "" && Currentfgrdid == "fgrdOrderVETConsolView") {
                                            $row.show();
                                        }
                                    }

                                }
                                else {
                                    if (id.match(value) != null) {
                                        var pgind = page.indexOf('page=Grower');
                                        var pgind1 = page.indexOf('Page=Grower');

                                        if (page.indexOf('Page=Grower') >= 0) {
                                            $row.show();
                                        }
                                        else {
                                            if ($(this).attr('id') == "row0" && p.query != "") {
                                                $row.hide();
                                            }
                                            else
                                                $row.show();
                                        }
                                    }
                                    else {
                                        if ($(this).attr('id') === "row0" && p.query != "" && (page.indexOf('Page=Grower') >= 0 || page.indexOf('Page=Incoming') >= 0 || page.indexOf('Page=ConfirmedPOs') >= 0 || page.indexOf('Page=Accounts') >= 0 || page.indexOf('Page=Inventory') >= 0)) {
                                            $row.show();
                                        }
                                        else
                                        {
                                            $row.hide();
                                        }
                                        if ($(this).attr('id') === "row0" && p.query != "" && Currentfgrdid == "fgrdOrderDetailsConsolView")
                                        {
                                            $row.show();
                                        }
                                        if ($(this).attr('id') === "row0" && p.query != "" && Currentfgrdid == "fgrdOrderVETConsolView") {
                                            $row.show();
                                        }
                                    }                                    
                                }
                            });
                            if (this.bDiv.firstChild.id == "fgrdAvaliableInventoryGridList") {
                                $("#fgrdAvaliableInventoryGridList [id^=row]").removeClass("trSelectedCheck");
                                $("#fgrdAvaliableInventoryGridList tr:visible:first").addClass("trSelectedCheck");
                                $('#DivAvaliableInventoryGridList [class="qtype"]').focus();
                            }
                            if ((this.bDiv.firstChild.id == "fgrdOrderVETConsolView") || (page.indexOf('Page=Accounts') >= 0)) {
                                GetConsolTotalsForVET();
                            }
                            if (page.indexOf('Page=Grower') >= 0) {
                                GetGrowerTotals();
                            }
                            else if (page.indexOf('Page=Incoming') >= 0) {
                                GetIncomingTotals()
                            }
                            else if (page.indexOf('Page=Inventory') >= 0)
                            {
                                GetInventoryCoolerTotals()
                            }
                            else if (page.indexOf('Page=ConfirmedPOs') >= 0) {
                                GetConfirmedPOTotals()
                            }  
                            else if (page.indexOf('Page=Credits') >= 0) {
                                //Written By Udal Bharti 06.07.2021
                                GetCreditRequetsTotals()
                            }

                            else if (page.indexOf('Page=Accounts') >= 0) {
                                /* <summary>
                                ''' AUTHOR : Abinaya
                                ''' Date created : 08/29/2017
                                ''' Brief description of : Calculate TotalRows on Accounts Receivable - A/R Inquiry at the time of using Quick Search
                                ''' </summary> */
                                GetAccountsRecTotals();
                                GetDepositTotals();
                                GetPaymentsTotals();/*Calculate totals for customer payments grid*/
                            }
                            else if (this.bDiv.firstChild.id == "fgrdOrderDetailsConsolView") {
                                GetConsolTotalsForOrder();
                            }
                            else if (this.bDiv.firstChild.id == "fgrdOrderVETConsolView") {
                                GetConsolTotalsForVET();
                            }
                           
                            else {
                                GetTotals();
                            }
                            this.buildpager();
                    }
                    else {
                        this.populate();
                    }
                }
                else {
                    this.populate();
                }
            },
            doExclude: function () {
                p.query = $('input[name=q]', g.sDiv).val();
                p.qtype = $('select[name=qtype]', g.sDiv).val();
                p.qtypetxt = $('select[name=qtype] option:selected', g.sDiv).text().trim();
                p.newp = 1;
                var page = window.location.href;

                if (GetPages() || page.indexOf('Page=Inventory') >= 0) {
                    p.query = $('input[name=q]', g.sDiv).val();
                    p.qtype = $('select[name=qtype]', g.sDiv).val();
                    p.qtypetxt = $('select[name=qtype] option:selected', g.sDiv).text().trim();
                    //p.newp = 1;
                    //this.populate();

                    var Nocells = $(this.hDiv).find('div.hDivBox tr')[0].cells;
                    // var tbl = this.bDiv.firstChild.id;

                    // var Nocells = $("#" + tbl + ".hDivBox tr")[0].cells;
                    var Index = "";
                    for (var i = 0, l = Nocells.length; i < l; i++) {
                        if (Nocells[i].innerText.trim().split("\n")[0] == p.qtypetxt) {
                            Index = i;
                        }
                    }

                    var value = p.query.toLowerCase();
                    $("#" + this.bDiv.firstChild.id + " tr").each(function (index) {

                        $row = $(this);
                        var id = $row.find("td").eq(Index).text().toLowerCase();
                        if (id.indexOf(value) < 0) {
                            //$row.show();
                            if ($row[0].id == "row0" && p.query != "") {
                                $row.hide();
                            }
                            else {
                                $row.show();
                            }
                        }
                        else {
                            $row.hide();
                        }
                    });

                    this.buildpager();
                }
                else {
                    this.populate();
                }
            },
            changePage: function (ctype) { //change page
                if (this.loading) return true;
                switch (ctype) {
                    case 'first': p.newp = 1; break;
                    case 'prev': if (p.page > 1) p.newp = parseInt(p.page) - 1; break;
                    case 'next': if (p.page < p.pages) p.newp = parseInt(p.page) + 1; break;
                    case 'last': p.newp = p.pages; break;
                    case 'input':
                        if (this.pDiv) {
                            var nv = parseInt(this.domElements.pcontrol_input.val());
                            if (isNaN(nv)) nv = 1;
                            if (nv < 1) nv = 1;
                            else if (nv > p.pages) nv = p.pages;
                            this.domElements.pcontrol_input.val(nv);
                            p.newp = nv;
                            break;
                        }
                }

                if (p.newp == p.page) return false;

                if (p.onChangePage)
                    p.onChangePage(p.newp);
                else
                    this.populate();
            },
            addCellProp: function () {
                
                $('tbody tr td', g.bDiv).each(function () {
                    var tdDiv = document.createElement('div');
                    var n = $('td', $(this).parent()).index(this);
                    var pth = $('th:eq(' + n + ')', g.hDiv).get(0);
                    if (pth != null) {
                        if (p.sortname == $(pth).attr('abbr') && p.sortname) {
                            this.className = 'sorted';
                        }
                        $(tdDiv).css({
                            textAlign: pth.align,
                            width: $('div:first', pth)[0].style.width
                        });
                        if (pth.hidden) {
                            $(this).css('display', 'none');
                        }
                    }
                    if (p.nowrap == false) {
                        $(tdDiv).css('white-space', 'normal');
                    }
                    if (this.innerHTML == '') {
                        this.innerHTML = '&nbsp;';
                    }
                    tdDiv.innerHTML = this.innerHTML;
                    var prnt = $(this).parent()[0];
                    var pid = false;
                    if (prnt.id) {
                        pid = prnt.id.substr(3);
                    }
                    if (pth != null) {
                        if (pth.process) pth.process(tdDiv, pid);
                    }
                    $(this).empty().append(tdDiv).removeAttr('width'); //wrap content
                    //g.addTitleToCell(tdDiv);
                });

            },
            getCellDim: function (obj) // get cell prop for editable event
            {
                var ht = parseInt($(obj).height());
                var pht = parseInt($(obj).parent().height());
                var wt = parseInt(obj.style.width);
                var pwt = parseInt($(obj).parent().width());
                var top = obj.offsetParent.offsetTop;
                var left = obj.offsetParent.offsetLeft;
                var pdl = parseInt($(obj).css('paddingLeft'));
                var pdt = parseInt($(obj).css('paddingTop'));
                return { ht: ht, wt: wt, top: top, left: left, pdl: pdl, pdt: pdt, pht: pht, pwt: pwt };
            },
            addRowProp: function () {
                $('tbody tr', g.bDiv).each
                    (
                        function () {
                            $(this)
                            .click(
                                function (e) {
                                    var obj = (e.target || e.srcElement); if (obj.href || obj.type) return true;
                                    $(this).toggleClass('trSelected');
                                    if (p.singleSelect) $(this).siblings().removeClass('trSelected');
                                }
                            )
                            .mousedown(
                                function (e) {
                                    if (e.shiftKey) {
                                        $(this).toggleClass('trSelected');
                                        g.multisel = true;
                                        this.focus();
                                        $(g.gDiv).noSelect();
                                    }
                                }
                            )
                            .mouseup(
                                function () {
                                    if (g.multisel) {
                                        g.multisel = false;
                                        $(g.gDiv).noSelect(false);
                                    }
                                }
                            )
                            .hover(
                                function (e) {
                                    if (g.multisel) {
                                        $(this).toggleClass('trSelected');
                                    }
                                },
                                function () { }
                            )
                            ;

                            if ($.browser.msie && $.browser.version < 7.0) {
                                $(this)
                                    .hover(
                                        function () { $(this).addClass('trOver'); },
                                        function () { $(this).removeClass('trOver'); }
                                    )
                                ;
                            }
                        }
                    );
            },
            pager: 0
        };

        //create model if any
        if (p.colModel) {
            thead = document.createElement('thead');
            tr = document.createElement('tr');

            for (i = 0; i < p.colModel.length; i++) {
                var cm = p.colModel[i];
                var th = document.createElement('th');
                //th.undrag = cm.undragable ? true : false;
                th.undrag = true;

                th.innerHTML = cm.display;

                if (cm.name && cm.sortable)
                    $(th).attr('abbr', cm.name);

                //th.idx = i;
                $(th).attr('axis', 'col' + i);

                if (cm.align)
                    th.align = cm.align;

                if (cm.title)
                    th.title = cm.title

                if (cm.width)
                    $(th).attr('width', cm.width);

                if (cm.hide) {
                    th.hide = true;
                }

                if (cm.process) {
                    th.process = cm.process;
                }

                $(tr).append(th);
            }
            $(thead).append(tr);
            $(t).prepend(thead);
        } // end if p.colmodel	

        //init divs
        g.gDiv = document.createElement('div'); //create global container
        g.mDiv = document.createElement('div'); //create title container
        g.hDiv = document.createElement('div'); //create header container
        g.bDiv = document.createElement('div'); //create body container
        g.vDiv = document.createElement('div'); //create grip
        g.rDiv = document.createElement('div'); //create horizontal resizer
        g.cDrag = document.createElement('div'); //create column drag
        g.block = document.createElement('div'); //creat blocker
        g.nDiv = document.createElement('div'); //create column show/hide popup
        g.nBtn = document.createElement('div'); //create column show/hide button
        g.iDiv = document.createElement('div'); //create editable layer
        g.tDiv = document.createElement('div'); //create toolbar
        g.sDiv = document.createElement('div');

        if (p.usepager) g.pDiv = document.createElement('div'); //create pager container
        g.hTable = document.createElement('table');

        //set gDiv
        g.gDiv.className = 'flexigrid';
        if (p.width != 'auto') g.gDiv.style.width = p.width + 'px';

        //add conditional classes
        if ($.browser.msie)
            $(g.gDiv).addClass('ie');

        if (p.novstripe)
            $(g.gDiv).addClass('novstripe');

        $(t).before(g.gDiv);
        $(g.gDiv)
		.append(t)
        ;

        //set toolbar
        if (p.buttons) {
            g.tDiv.className = 'tDiv';
            var tDiv2 = document.createElement('div');
            tDiv2.className = 'tDiv2';

            for (i = 0; i < p.buttons.length; i++) {
                var btn = p.buttons[i];
                if (!btn.separator) {
                    var btnDiv = document.createElement('div');
                    btnDiv.className = 'link';
                    btnDiv.innerHTML = "<a class='links'><span>" + btn.name + "</span></a>";
                    if (btn.bclass)
                        $('span', btnDiv)
							.addClass(btn.bclass);

                    if (btn.title)
                        $('span', btnDiv).prop("title", btn.title)

                    btnDiv.onpress = btn.onpress;
                    btnDiv.name = btn.name;
                    if (btn.onpress) {
                        $(btnDiv).click
							(
								function () {
								    this.onpress(this.name, g.gDiv);
								}
							);
                    }
                    $(tDiv2).append(btnDiv);
                    if ($.browser.msie && $.browser.version < 7.0) {
                        $(btnDiv).hover(function () { $(this).addClass('fbOver'); }, function () { $(this).removeClass('fbOver'); });
                    }

                } else {
                    $(tDiv2).append("<div class='btnseparator'></div>");
                }
            }
            $(g.tDiv).append(tDiv2);
            $(g.tDiv).append("<div style='clear:both'></div>");
            $(g.gDiv).prepend(g.tDiv);
        }

        //set hDiv
        g.hDiv.className = 'hDiv';

        $(t).before(g.hDiv);

        //set hTable
        g.hTable.cellPadding = 0;
        g.hTable.cellSpacing = 0;
        $(g.hDiv).append('<div class="hDivBox"></div>');
        $('div', g.hDiv).append(g.hTable);
        var thead = $("thead:first", t).get(0);
        if (thead) $(g.hTable).append(thead);
        thead = null;

        if (!p.colmodel) var ci = 0;

        //setup thead			
        $('thead tr:first th', g.hDiv).each
			(
			 	function () {
			 	    var thdiv = document.createElement('div');

			 	    if ($(this).attr('abbr')) {
			 	        $(this).click(
								function (e) {
								    if (!$(this).hasClass('thOver')) return false;
								    var obj = (e.target || e.srcElement);
								    if (obj.href || obj.type) return true;
								    g.changeSort(this);
								}
							);
			 	        if ($(this).attr('abbr') == p.sortname) {
			 	            this.className = 'sorted';
			 	            thdiv.className = 's' + p.sortorder;
			 	        }
			 	    }

			 	    if (this.hide) $(this).hide();

			 	    if (!p.colmodel) {
			 	        $(this).attr('axis', 'col' + ci++);
			 	    }

			 	    $(thdiv).css({ textAlign: this.align, width: this.width + 'px' });
			 	    thdiv.innerHTML = this.innerHTML;
			 	    var me = this; // <-- patched here
			 	    if (me.undrag) me.style.cursor = 'default'; // <-- patched here

			 	    $(this).empty().append(thdiv).removeAttr('width')
						.mousedown(function (e) {
						    if (!me.undrag)
						        g.dragStart('colMove', e, this);
						})
						.hover(
							function () {
							    //if (me.undrag) { // <-- patched here
							    $(g.nDiv).hide(); // <-- patched here
							    $(g.nBtn).hide(); // <-- patched here
							    if (!g.colresize && !$(this).hasClass('thMove') && !g.colCopy) $(this).addClass('thOver');

							    if ($(this).attr('abbr') != p.sortname && !g.colCopy && !g.colresize && $(this).attr('abbr')) $('div', this).addClass('s' + p.sortorder);
							    else if ($(this).attr('abbr') == p.sortname && !g.colCopy && !g.colresize && $(this).attr('abbr')) {
							        var no = '';
							        if (p.sortorder == 'asc') no = 'desc';
							        else no = 'asc';
							        $('div', this).removeClass('s' + p.sortorder).addClass('s' + no);
							    }
							    return // <-- patched here
							    //}; // <-- patched here

							    if (!g.colresize && !$(this).hasClass('thMove') && !g.colCopy) $(this).addClass('thOver');

							    if ($(this).attr('abbr') != p.sortname && !g.colCopy && !g.colresize && $(this).attr('abbr')) $('div', this).addClass('s' + p.sortorder);
							    else if ($(this).attr('abbr') == p.sortname && !g.colCopy && !g.colresize && $(this).attr('abbr')) {
							        var no = '';
							        if (p.sortorder == 'asc') no = 'desc';
							        else no = 'asc';
							        $('div', this).removeClass('s' + p.sortorder).addClass('s' + no);
							    }

							    if (g.colCopy) {
							        var n = $('th', g.hDiv).index(this);

							        if (n == g.dcoln) return false;

							        if (n < g.dcoln) $(this).append(g.cdropleft);
							        else $(this).append(g.cdropright);

							        g.dcolt = n;

							    } else if (!g.colresize) {

							        var nv = $('th:visible', g.hDiv).index(this);
							        var onl = parseInt($('div:eq(' + nv + ')', g.cDrag).css('left'));
							        var nw = parseInt($(g.nBtn).width()) + parseInt($(g.nBtn).css('borderLeftWidth'));
							        nl = onl - nw + Math.floor(p.cgwidth / 2);

							        $(g.nDiv).hide(); $(g.nBtn).hide();

							        $(g.nBtn).css({ 'left': nl, top: g.hDiv.offsetTop }).show();

							        var ndw = parseInt($(g.nDiv).width());

							        $(g.nDiv).css({ top: g.bDiv.offsetTop });

							        if ((nl + ndw) > $(g.gDiv).width())
							            $(g.nDiv).css('left', onl - ndw + 1);
							        else
							            $(g.nDiv).css('left', nl);

							        if ($(this).hasClass('sorted'))
							            $(g.nBtn).addClass('srtd');
							        else
							            $(g.nBtn).removeClass('srtd');
							    }
							},
							function () {
							    $(this).removeClass('thOver');
							    if ($(this).attr('abbr') != p.sortname) $('div', this).removeClass('s' + p.sortorder);
							    else if ($(this).attr('abbr') == p.sortname) {
							        var no = '';
							        if (p.sortorder == 'asc') no = 'desc';
							        else no = 'asc';

							        $('div', this).addClass('s' + p.sortorder).removeClass('s' + no);
							    }
							    if (g.colCopy) {
							        $(g.cdropleft).remove();
							        $(g.cdropright).remove();
							        g.dcolt = null;
							    }
							})
			 	    ; //wrap content
			 	}
			);

        //set bDiv
        g.bDiv.className = 'bDiv';
        $(t).before(g.bDiv);
        $(g.bDiv)
		.css({ height: (p.height == 'auto') ? 'auto' : p.height + "px" })
		.scroll(function (e) { g.scroll() })
		.append(t)
        ;

        if (p.height == 'auto') {
            $('table', g.bDiv).addClass('autoht');
        }
        //add td properties
        g.addCellProp();

        //add row properties
        g.addRowProp();

        //set cDrag

        var cdcol = $('thead tr:first th:first', g.hDiv).get(0);

        if (cdcol != null) {
            g.cDrag.className = 'cDrag';
            g.cdpad = 0;

            g.cdpad += (isNaN(parseInt($('div', cdcol).css('borderLeftWidth'))) ? 0 : parseInt($('div', cdcol).css('borderLeftWidth')));
            g.cdpad += (isNaN(parseInt($('div', cdcol).css('borderRightWidth'))) ? 0 : parseInt($('div', cdcol).css('borderRightWidth')));
            g.cdpad += (isNaN(parseInt($('div', cdcol).css('paddingLeft'))) ? 0 : parseInt($('div', cdcol).css('paddingLeft')));
            g.cdpad += (isNaN(parseInt($('div', cdcol).css('paddingRight'))) ? 0 : parseInt($('div', cdcol).css('paddingRight')));
            g.cdpad += (isNaN(parseInt($(cdcol).css('borderLeftWidth'))) ? 0 : parseInt($(cdcol).css('borderLeftWidth')));
            g.cdpad += (isNaN(parseInt($(cdcol).css('borderRightWidth'))) ? 0 : parseInt($(cdcol).css('borderRightWidth')));
            g.cdpad += (isNaN(parseInt($(cdcol).css('paddingLeft'))) ? 0 : parseInt($(cdcol).css('paddingLeft')));
            g.cdpad += (isNaN(parseInt($(cdcol).css('paddingRight'))) ? 0 : parseInt($(cdcol).css('paddingRight')));

            $(g.bDiv).before(g.cDrag);

            var cdheight = $(g.bDiv).height();
            var hdheight = $(g.hDiv).height();

            $(g.cDrag).css({ top: -hdheight + 'px' });

            $('thead tr:first th', g.hDiv).each
			(
			 	function () {
			 	    var cgDiv = document.createElement('div');
			 	    $(g.cDrag).append(cgDiv);
			 	    if (!p.cgwidth) p.cgwidth = $(cgDiv).width();
			 	    $(cgDiv).css({ height: cdheight + hdheight })
						.mousedown(function (e) { g.dragStart('colresize', e, this); })
			 	    ;
			 	    if ($.browser.msie && $.browser.version < 7.0) {
			 	        g.fixHeight($(g.gDiv).height());
			 	        $(cgDiv).hover(
								function () {
								    g.fixHeight();
								    $(this).addClass('dragging')
								},
								function () { if (!g.colresize) $(this).removeClass('dragging') }
							);
			 	    }
			 	}
			);
            //g.rePosDrag();
        }

        //add strip		
        if (p.striped)
            $('tbody tr:odd', g.bDiv).addClass('erow');

        if (p.resizable && p.height != 'auto') {
            g.vDiv.className = 'vGrip';
            $(g.vDiv)
		.mousedown(function (e) { g.dragStart('vresize', e) })
		.html('<span></span>');
            $(g.bDiv).after(g.vDiv);
        }

        if (p.resizable && p.width != 'auto' && !p.nohresize) {
            g.rDiv.className = 'hGrip';
            $(g.rDiv)
		.mousedown(function (e) { g.dragStart('vresize', e, true); })
		.html('<span></span>')
		.css('height', $(g.gDiv).height())
            ;
            if ($.browser.msie && $.browser.version < 7.0) {
                $(g.rDiv).hover(function () { $(this).addClass('hgOver'); }, function () { $(this).removeClass('hgOver'); });
            }
            $(g.gDiv).append(g.rDiv);
        }

        // add pager
        if (p.usepager) {
            g.pDiv.className = 'pDiv';
            g.pDiv.innerHTML = '<div class="pDiv2"></div>';
            $(g.bDiv).after(g.pDiv);
            var html = ' <div class="pGroup"> <div class="pFirst pButton"><span></span></div><div class="pPrev pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"><span class="pcontrol">Page <input type="text" size="4" value="1" /> of <span> 1 </span></span></div> <div class="btnseparator"></div> <div class="pGroup"> <div class="pNext pButton"><span></span></div><div class="pLast pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"> <div class="pReload pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"><span class="pPageStat"></span></div>';
            $('div', g.pDiv).html(html);

            g.domElements = {
                pReload: $('.pReload', g.pDiv),
                pPageStat: $('.pPageStat', g.pDiv),
                pcontrol_input: $('.pcontrol input', g.pDiv),
                pcontrol_span: $('.pcontrol span', g.pDiv)
            };

            g.domElements.pReload.click(function () { g.populate() });
            $('.pFirst', g.pDiv).click(function () { g.changePage('first') });
            $('.pPrev', g.pDiv).click(function () { g.changePage('prev') });
            $('.pNext', g.pDiv).click(function () { g.changePage('next') });
            $('.pLast', g.pDiv).click(function () { g.changePage('last') });
            g.domElements.pcontrol_input.keydown(function (e) { if (e.keyCode == 13) g.changePage('input') });
            if ($.browser.msie && $.browser.version < 7) $('.pButton', g.pDiv).hover(function () { $(this).addClass('pBtnOver'); }, function () { $(this).removeClass('pBtnOver'); });

            if (p.useRp) {
                var opt = "";
                for (var nx = 0; nx < p.rpOptions.length; nx++) {
                    if (p.rp == p.rpOptions[nx]) sel = 'selected="selected"'; else sel = '';
                    opt += "<option value='" + p.rpOptions[nx] + "' " + sel + " >" + p.rpOptions[nx] + "&nbsp;&nbsp;</option>";
                };
                $('.pDiv2', g.pDiv).prepend("<div class='pGroup'><select name='rp'>" + opt + "</select></div> <div class='btnseparator'></div>");
                $('select', g.pDiv).change(
					function () {
					    if (p.onRpChange) {
					        p.onRpChange(+this.value);
					    }
					    else {
					        p.newp = 1;
					        p.rp = +this.value;
					        g.populate();

					        $.ajax({
					            type: "POST",
					            url: 'BloomService.asmx/UpdateRPforUser',
					            data: "{'RP':'" + this.value + "'}",
					            contentType: "application/json; charset=utf-8",
					            dataType: "json",
					            success: function (output, status) {
					                if (output.d != "valid") {
					                    $.MessageBox("OOPS!!! Something Wrong please try again, we will research the issue!!");
					                }
					            }
					        });
					    }
					}
				);
            }

            //add search button
            if (p.searchitems) {
                $('.pDiv2', g.pDiv).prepend("<div class='pGroup'> <div class='pSearch pButton'><span></span></div> </div>  <div class='btnseparator'></div>");
                $('.pSearch', g.pDiv).click(function () { $(g.sDiv).slideToggle('fast', function () { $('.sDiv:visible input:first', g.gDiv).trigger('focus'); }); });
                //add search box
                g.sDiv.className = 'sDiv';

                sitems = p.searchitems;

                var sopt = "";
                for (var s = 0; s < sitems.length; s++) {
                    if (p.qtype == '' && sitems[s].isdefault == true) {
                        p.qtype = sitems[s].name;
                        sel = 'selected="selected"';
                    } else sel = '';
                    if (sitems[s].hide == undefined) {
                        sopt += "<option value='" + sitems[s].name + "' " + sel + " >" + sitems[s].display + "&nbsp;&nbsp;</option>";
                    }

                    if (sitems[s].hide == false) {
                        sopt += "<option value='" + sitems[s].name + "' " + sel + " >" + sitems[s].display + "&nbsp;&nbsp;</option>";
                    }
                }

                if (p.qtype == '') p.qtype = sitems[0].name;
                var page = window.location.href;
                //the below code is comment for we need export button in admin side.so removed conditions
                //if (window.location.href.indexOf("Default.aspx") >= 0) {
                //    if (window.location.href.indexOf("Default.aspx?Page=Users") >= 0) {
                
                    $(g.sDiv).append("<div class='sDiv2'>Quick Search <input type='text' size='30' name='q' class='qsbox' /><select name='lstsearch' style='display:none;'>  <option value='1'> Equals </option>  <option value='2'> Not equals </option></select><select name='qtype'>" + sopt + "</select> <input style='height:24px' type='button' value='Search' /><input style='height:24px' type='button' value='Clear' /><input style='height:24px;display:none;' type='button' id='ExportCSV'  value='Export' class='ExportCSV' /></div>");
                
                //$(g.sDiv).append("<div class='sDiv2'>Quick Search <input type='text' size='30' name='q' class='qsbox' /><select name='lstsearch' style='display:none;'>  <option value='1'> Equals </option>  <option value='2'> Not equals </option></select><select name='qtype'>" + sopt + "</select> <input style='height:24px' type='button' value='Search' /><input style='height:24px' type='button' value='Clear' /><input style='height:24px;display:none;' type='button' id='ExportCSV'  value='Export' class='ExportCSV' /></div>"); 
                //    }
                //    else {
                //        $(g.sDiv).append("<div class='sDiv2'>Quick Search <input type='text' size='30' name='q' class='qsbox' /><select name='lstsearch' style='display:none;'>  <option value='1'> Equals </option>  <option value='2'> Not equals </option></select><select name='qtype'>" + sopt + "</select> <input style='height:24px' type='button' value='Search' /><input style='height:24px' type='button' value='Clear' /></div>");
                //    }
                //}
                //else {
                //    $(g.sDiv).append("<div class='sDiv2'>Quick Search <input type='text' size='30' name='q' class='qsbox' /><select name='lstsearch' style='display:none;'>  <option value='1'> Equals </option>  <option value='2'> Not equals </option></select><select name='qtype'>" + sopt + "</select> <input style='height:24px' type='button' value='Search' /><input style='height:24px' type='button' value='Clear' /><input style='height:24px;' type='button' id='ExportCSV'  value='Export' class='ExportCSV' /></div>");
                //}


                $('input[value=Search]', g.sDiv).click(function (e) {
                    debugger;
                    if (g.sDiv.parentNode.parentNode.id == "DivOrderHeader") {
                        //hide the chart when filter applies show after grid bind
                        //$("#canvas-holder").hide();
                        //$("#js-legend").hide();
                        $("#tdChart").hide();
                    }

                    var searchvalue = $('select[name=lstsearch] option:selected', g.sDiv).val();
                    if (searchvalue == "1") {
                        Exclude = false;
                        g.doSearch(e);
                    }
                    else {
                        Exclude = true;
                        g.doExclude();
                    }
                });

                //$('select[value=Exclude]', g.sDiv).click(function () {
                //    if (g.sDiv.parentNode.parentNode.id == "DivOrderHeader") {
                //        //hide the chart when filter applies show after grid bind
                //        //$("#canvas-holder").hide();
                //        //$("#js-legend").hide();
                //        $("#tdChart").hide();
                //    }
                //    Exclude = true;
                //    g.doExclude();
                //});

                $('input[name=q],select[name=qtype]', g.sDiv).keydown(function (e) {
                    if (e.keyCode == 13) {
                        e.preventDefault();
                        if (g.sDiv.parentNode.parentNode.id == "DivOrderHeader") {
                            //hide the chart when filter applies show after grid bind
                            //$("#canvas-holder").hide();
                            //$("#js-legend").hide();
                            $("#tdChart").hide();
                        }
                        //g.doSearch();
                        var searchvalue = $('select[name=lstsearch] option:selected', g.sDiv).val();
                        if (searchvalue == "1") {
                            Exclude = false;
                            g.doSearch(e);
                        }
                        else {
                            Exclude = true;
                            g.doExclude();
                        }
                    }
                });

                $('input[value=Clear]', g.sDiv).click(function (e) {

                    $('input[name=q]', g.sDiv).val(''); p.query = '';
                    g.doSearch(e);
                });

                $('#ExportCSV', g.sDiv).click(function (e) {

                    if (g.pDiv) {
                        g.domElements.pPageStat.html(p.procmsg).css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0');
                        g.domElements.pReload.addClass('loading');
                    }

                    e.preventDefault();
                    var param = [
                      { name: 'page', value: p.newp }
                  , { name: 'rp', value: p.rp }
                  , { name: 'sortname', value: p.sortname }
                  , { name: 'sortorder', value: p.sortorder }
                  , { name: 'query', value: p.query }
                  , { name: 'qtype', value: p.qtype }

                    ];

                    var Colheader = "";

                    if (p.params) {
                        for (var pi = 0; pi < p.params.length; pi++) param[param.length] = p.params[pi];
                    }

                    for (var pt = 0; pt < p.colModel.length; pt++) {
                        if ($.inArray(p.colModel[pt].display, RHeaders) == -1) {
                            if (p.colModel[pt].display.indexOf("<img") < 0) {
                                Colheader += p.colModel[pt].display + ",";
                            }

                        }
                    }

                    Colheader = Colheader.substring(0, Colheader.length - 1)

                    var URI = ""
                    var arrcol = [];
                    URI = document.baseURI;
                    var nparam = '{ ';
                    for (var pi = 0; pi < param.length; pi++) {

                        if (param[pi].name == "ExportCSV") {
                            //nparam += '"ExportCSV":"1|' + URI.substr(URI.indexOf("=") + 1) + '|' + p.total + '|' + Colheader + '"';
                            //changed by Abinaya on 13-10-2016 to remove # from URL
                            nparam += '"ExportCSV":"1|' + URI.substr(URI.indexOf("=") + 1).replace("#", "") + '|' + p.total + '|' + Colheader + '"';
                        }
                        else if (param[pi].name.toLowerCase() == "exclude") {

                            nparam += '"Exclude":"' + Exclude + '"';
                        }
                        else {
                            nparam += '"' + param[pi].name + '":"' + param[pi].value + '"';
                        }
                        if (pi != param.length - 1) {
                            nparam += ', ';
                        }

                    }

                    //for (var picol = 0; picol < p.colModel.length; picol++) {
                    //    //arrcol += p.colModel[picol].display;
                    //    arrcol.push(p.colModel[picol].display);

                    //}
                    //nparam += ', ' + arrcol;

                    nparam += ' }';

                    p.query = $('input[name=q]', g.sDiv).val();
                    p.qtype = $('select[name=qtype]', g.sDiv).val();
                    p.newp = 1;
                    $.ajax({
                        type: "POST",
                        url: p.url,
                        data: nparam,
                        contentType: "application/json; charset=utf-8",
                        dataType: "xml",
                        success: function (data, status) {
                            var Xmlfile = data;
                            var filefxpath = Xmlfile.getElementsByTagName("cell")[0].childNodes[0].nodeValue;
                            window.location.href = filefxpath;
                            e.preventDefault();
                            g.domElements.pReload.removeClass('loading');
                            g.buildpager();
                        },
                        error: function (data) {
                            try { if (p.onError) p.onError(data); } catch (e) { }
                        }
                    });

                });

                $(g.bDiv).after(g.sDiv);
                //alert(p.query);
                $('input[name=q]', g.sDiv).val(p.query);
            }

        }
        $(g.pDiv, g.sDiv).append("<div style='clear:both'></div>");

        // add title
        if (p.title) {
            g.mDiv.className = 'mDiv';
            g.mDiv.innerHTML = '<div class="ftitle">' + p.title + '</div>';
            $(g.gDiv).prepend(g.mDiv);
            if (p.showTableToggleBtn) {
                $(g.mDiv).append('<div class="ptogtitle" title="Minimize/Maximize Table"><span></span></div>');
                $('div.ptogtitle', g.mDiv).click
					(
					 	function () {
					 	    $(g.gDiv).toggleClass('hideBody');
					 	    $(this).toggleClass('vsble');
					 	}
					);
            }
            //g.rePosDrag();
        }

        //setup cdrops
        g.cdropleft = document.createElement('span');
        g.cdropleft.className = 'cdropleft';
        g.cdropright = document.createElement('span');
        g.cdropright.className = 'cdropright';

        //add block
        g.block.className = 'gBlock';
        var gh = $(g.bDiv).height();
        var gtop = g.bDiv.offsetTop;
        $(g.block).css(
		{
		    width: g.bDiv.style.width,
		    height: gh,
		    background: 'white',
		    position: 'relative',
		    marginBottom: (gh * -1),
		    zIndex: 1,
		    top: gtop,
		    left: '0px'
		}
		);
        $(g.block).fadeTo(0, p.blockOpacity);

        // add column control
        if ($('th', g.hDiv).length) {

            g.nDiv.className = 'nDiv';
            g.nDiv.innerHTML = "<table cellpadding='0' cellspacing='0'><tbody></tbody></table>";
            $(g.nDiv).css(
			{
			    marginBottom: (gh * -1),
			    display: 'none',
			    top: gtop
			}
			).noSelect()
            ;

            var cn = 0;

            $('th div', g.hDiv).each
			(
			 	function () {
			 	    var kcol = $("th[axis='col" + cn + "']", g.hDiv)[0];
			 	    var chk = 'checked="checked"';
			 	    if (kcol.style.display == 'none') chk = '';

			 	    $('tbody', g.nDiv).append('<tr><td class="ndcol1"><input type="checkbox" ' + chk + ' class="togCol" value="' + cn + '" /></td><td class="ndcol2">' + this.innerHTML + '</td></tr>');
			 	    cn++;
			 	}
			);

            if ($.browser.msie && $.browser.version < 7.0)
                $('tr', g.nDiv).hover
				(
				 	function () { $(this).addClass('ndcolover'); },
					function () { $(this).removeClass('ndcolover'); }
				);

            $('td.ndcol2', g.nDiv).click
			(
			 	function () {
			 	    if ($('input:checked', g.nDiv).length <= p.minColToggle && $(this).prev().find('input')[0].checked) return false;
			 	    return g.toggleCol($(this).prev().find('input').val());
			 	}
			);

            $('input.togCol', g.nDiv).click
			(
			 	function () {

			 	    if ($('input:checked', g.nDiv).length < p.minColToggle && this.checked == false) return false;
			 	    $(this).parent().next().trigger('click');
			 	    //return false;
			 	}
			);


            $(g.gDiv).prepend(g.nDiv);

            $(g.nBtn).addClass('nBtn')
			.html('<div></div>')
			.attr('title', 'Hide/Show Columns')
			.click
			(
			 	function () {
			 	    $(g.nDiv).toggle(); return true;
			 	}
			);

            if (p.showToggleBtn) $(g.gDiv).prepend(g.nBtn);
        }

        // add date edit layer
        $(g.iDiv)
		.addClass('iDiv')
		.css({ display: 'none' })
        ;
        $(g.bDiv).append(g.iDiv);

        // add flexigrid events
        $(g.bDiv)
		.hover(function () { $(g.nDiv).hide(); $(g.nBtn).hide(); }, function () { if (g.multisel) g.multisel = false; })
        ;
        $(g.gDiv)
		.hover(function () { }, function () { $(g.nDiv).hide(); $(g.nBtn).hide(); })
        ;

        //add document events
        $(document)
		.mousemove(function (e) { g.dragMove(e) })
		.mouseup(function (e) { g.dragEnd() })
		.hover(function () { }, function () { g.dragEnd() })
        ;

        //browser adjustments
        if ($.browser.msie && $.browser.version < 7.0) {
            $('.hDiv,.bDiv,.mDiv,.pDiv,.vGrip,.tDiv, .sDiv', g.gDiv)
			.css({ width: '100%' });
            $(g.gDiv).addClass('ie6');
            if (p.width != 'auto') $(g.gDiv).addClass('ie6fullwidthbug');
        }

        g.rePosDrag();
        g.fixHeight();

        //make grid functions accessible
        t.p = p;
        t.grid = g;

        // load data
        if (p.url && p.autoload) {
            g.populate();
        }

        return t;

    };

    var docloaded = false;

    $(document).ready(function () {
        docloaded = true
    });

    $.fn.flexigrid = function (p) {
        
        return this.each(function () {
            if (!docloaded) {
                $(this).hide();
                var t = this;
                $(document).ready
					(
						function () {
						    $.addFlex(t, p);
						}
					);
            } else {
                $.addFlex(this, p);
            }
        });

    }; //end flexigrid

    $.fn.flexReload = function (p) { // function to reload grid

        return this.each(function () {
            if (this.grid && this.p.url) this.grid.populate();
        });

    }; //end flexReload

    $.fn.flexOptions = function (p) { //function to update general options

        return this.each(function () {
            if (this.grid) $.extend(this.p, p);
        });

    }; //end flexOptions

    $.fn.flexToggleCol = function (cid, visible) { // function to reload grid

        return this.each(function () {
            if (this.grid) this.grid.toggleCol(cid, visible);
        });

    }; //end flexToggleCol

    $.fn.flexAddData = function (data) { // function to add data to grid
        
        return this.each(function () {
            if (this.grid) this.grid.addData(data);
        });

    };

    $("#QuickSearchBtn").click(function (e) {

        this.grid.doSearch(e);
    });

    $.fn.noSelect = function (p) { //no select plugin by me :-)
        if (p == null)
            prevent = true;
        else
            prevent = p;

        if (prevent) {
            return this.each(function () {
                if ($.browser.msie || $.browser.safari) $(this).bind('selectstart', function () { return false; });
                else if ($.browser.mozilla) {
                    $(this).css('MozUserSelect', 'none');
                    $('body').trigger('focus');
                }
                else if ($.browser.opera) $(this).bind('mousedown', function () { return false; });
                else $(this).attr('unselectable', 'on');
            });

        } else {
            return this.each(function () {
                if ($.browser.msie || $.browser.safari) $(this).unbind('selectstart');
                else if ($.browser.mozilla) $(this).css('MozUserSelect', 'inherit');
                else if ($.browser.opera) $(this).unbind('mousedown');
                else $(this).removeAttr('unselectable', 'on');
            });

        }

    }; //end noSelect

    function xmlToString(xmlData) {
        var xmlString;
        //IE
        if (window.ActiveXObject) {
            xmlString = xmlData.xml;
        }
            // code for Mozilla, Firefox, Opera, etc.
        else {
            xmlString = (new XMLSerializer()).serializeToString(xmlData);
        }
        return xmlString;
    }
})(jQuery);