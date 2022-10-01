

$(".ClsNumbersOnly").keypress(function (event) {
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

$(".ClsAwbAllowDash").keypress(function (event) {

    if (event.keyCode == 45) {
        return true;
    }
    else {
        return isNumber(event, this)
    }
});

$(".ClsDecimalsOnly").keypress(function (event) {
    
    return isDecimal(event, this)
});


$(".ClsTwoDecimalsOnly").focusout(function (event) {
    //debugger;
    if ($(this).val() != "") {
        $(this).val(parseFloat($(this).val()).toFixed(2))
    }
});

$(".ClsTwoDecimalsOnly").keypress(function (event) {
    //debugger;
    return isTwoDecimal(event, this)
});

$(".ClsThreeDecimalsOnly").focusout(function (event) {
    //debugger;
    if ($(this).val() != "") {
        $(this).val(parseFloat($(this).val()).toFixed(3))
    }
});

$(".ClsThreeDecimalsOnly").keypress(function (event) {
    //debugger;
    return isDecimal(event, this)
});







$(".ClsFourDecimalsOnly").focusout(function (event) {
    //debugger;
    if ($(this).val() != "") {
        $(this).val(parseFloat($(this).val()).toFixed(4))
    }
});

$(".ClsFourDecimalsOnly").keypress(function (event) {
    //debugger;
    return isDecimal(event, this)
});




$(".ClsDecimalsOnly").focusout(function (event) {
    
    if ($(this).val() != "") {
        $(this).val(parseFloat($(this).val()).toFixed(4))
    }
});


// THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
function isDecimal(evt, element) {
    
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (
        (charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
    (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.       
    ((charCode != 8 && charCode < 48) || charCode > 57))
        return false;
    try {
        var number = element.value.split('.');
        //just one dot (thanks ddlab)
        if (number[1].length >= 4) {
            return false;
        }
    }
    catch (e) {

    }
    return true;
}

function isTwoDecimal(evt, element) {

    var charCode = (evt.which) ? evt.which : event.keyCode
    if (
        (charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
    (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.       
    ((charCode != 8 && charCode < 48) || charCode > 57))
        return false;
    try {
        var number = element.value.split('.');
        //just one dot (thanks ddlab)
        if (number[1].length >= 2) {
            return false;
        }
    }
    catch (e) {

    }
    return true;
}


$(".datecontrol,.hasDatepicker").focusout(function () {
    var isValid = isValidDate($(this).val());
    if (isValid) {
        //alert('Valid date');
        $(this).css('background', 'white')
    } else {
        // $.MessageBox("Invalid date");
        $(this).css('background', 'red')
        $(this).focus();
        
    }

})

function isValidDate(input) {
    var regexes = [
      /^(\d{1,2})\/(\d{1,2})\/(\d{4})$/,
      /^(\d{1,2})\-(\d{1,2})\-(\d{4})$/
    ];

    for (var i = 0; i < regexes.length; i++) {
        var r = regexes[i];
        if (!r.test(input)) {
            continue;
        }
        var a = input.match(r), d = new Date(a[3], a[1] - 1, a[2]);
        if (d.getFullYear() != a[3] || d.getMonth() + 1 != a[1] || d.getDate() != a[2]) {
            continue;
        }
        // All checks passed:
        return true;
    }

    return false;
}

function onlyAlphabets(e, t) {
    return (e.charCode > 64 && e.charCode < 91) || (e.charCode > 96 && e.charCode < 123) || e.charCode == 32;
}

$(".ClsAlphabetsOnly").keypress(function (event) {

    return onlyAlphabets(event, this)
});

$(".ClsAllowOnlyTwoDecimal").keypress(function (event) {

    return isNumberKey(event)
});

function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
        return false;
    else {
        var len = $('.CsstxtName').val().length;
        var index = $('.CsstxtName').val().indexOf('.');

        if (index > 0 && charCode == 46) {
            return false;
        }
        if (index > 0) {
            var CharAfterdot = (len + 1) - index;
            if (CharAfterdot > 3) {
                return false;
            }
        }

    }
    return true;
}

$('.ClsForValidatingTwoDecimal').on('input', function () {
    match = (/(\d{0,3})[^.]*((?:\.\d{0,2})?)/g).exec(this.value.replace(/[^\d.]/g, ''));
    this.value = match[1] + match[2];
})

$('.ClsForValidatingThreeDecimal').on('input', function () {
    match = (/(\d{0,4})[^.]*((?:\.\d{0,3})?)/g).exec(this.value.replace(/[^\d.]/g, ''));
    this.value = match[1] + match[2];
})

function formatDate(date) {
    debugger;
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}


$('.ClsForValidatingFourDecimal').on('input', function () {
    match = (/(\d{0,5})[^.]*((?:\.\d{0,4})?)/g).exec(this.value.replace(/[^\d.]/g, ''));
    this.value = match[1] + match[2];
})