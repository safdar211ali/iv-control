// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery.js
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery-ui
//= require_tree .

//FOR CP IMAGES
//for date picker
$(window).bind('page:change', function() {
$(function() {
     $('#pic-date').datepicker({ dateFormat: "yy-mm-dd" }).val();
    });
});

$(window).bind('page:change', function() {
    $(function() {
        $('#pic-date2').datepicker({ dateFormat: "yy-mm-dd" }).val();
    });
});
//for date picker end


$(window).bind('page:change', function() {

$(document).ready(function(){
    $('#welcom').hover(function() {
        $(this).width( 140);
       $(this).height( 140);
    }, function() {
        $(this).width( 128);
        $(this).height( 128);
});


    $('#signup').hover(function() {
        $(this).width( 140);
        $(this).height( 140);
    }, function() {
        $(this).width( 128);
        $(this).height( 128);
    });



    $('#stockg').hover(function() {
        $(this).width( 140);
        $(this).height( 140);
    }, function() {
        $(this).width( 128);
        $(this).height( 128);
    });



    $('#logout').hover(function() {
        $(this).width( 140);
        $(this).height( 140);
    }, function() {
        $(this).width( 128);
        $(this).height( 128);
    });



    $('#setting').hover(function() {
        $(this).width( 140);
        $(this).height( 140);
    }, function() {
        $(this).width( 128);
        $(this).height( 128);
    });



    $('#home').hover(function() {
        $(this).addClass("img-thumbnail");
         }, function() {
        $(this).removeClass("img-thumbnail");

    });
});



});


//
//$(document).ready(function(){
//   var imgWidth = null;
//   var imgHeight = null;
//var $image = $('#welcom'), //Or some other selector
//    imgWidth = $image.width(),
//    imgHeight = $image.height();
//$('#welcom').hover(function() {
//    //The mouseover
//    $(this).width( 100);
//    $(this).height( 100);
//}, function() {
//    $(this).width( imgWidth );
//    $(this).height( imgHeight );
//});
//
//
//
//    var $image = $('#signup'), //Or some other selector
//        imgWidth = $image.width(),
//        imgHeight = $image.height();
//    $('#signup').hover(function() {
//        //The mouseover
//        $(this).width( 100);
//        $(this).height( 100);
//    }, function() {
//        $(this).width( imgWidth );
//        $(this).height( imgHeight );
//    });
//
//
//
//    var $image = $('#stockg'), //Or some other selector
//        imgWidth = $image.width(),
//        imgHeight = $image.height();
//    $('#stockg').hover(function() {
//        //The mouseover
//        $(this).width( 100);
//        $(this).height( 100);
//    }, function() {
//        $(this).width( imgWidth );
//        $(this).height( imgHeight );
//    });
//
//
//
//    var $image = $('#logout'), //Or some other selector
//        imgWidth = $image.width(),
//        imgHeight = $image.height();
//    $('#logout').hover(function() {
//        //The mouseover
//        $(this).width( 100);
//        $(this).height( 100);
//    }, function() {
//        $(this).width( imgWidth );
//        $(this).height( imgHeight );
//    });
//
//
//
//    var $image = $('#setting'), //Or some other selector
//        imgWidth = $image.width(),
//        imgHeight = $image.height();
//    $('#setting').hover(function() {
//        //The mouseover
//        $(this).width( 100);
//        $(this).height( 100);
//    }, function() {
//        $(this).width( imgWidth );
//        $(this).height( imgHeight );
//    });
//
//
//});
//



//var window_focus;
//$(window).focus(function() {
//    window_focus = true;
//}).blur(function() {
//    window_focus = false;
//});
//function checkReload(){
//    if(!window_focus){
//        location.reload();
//    }
//}
//setInterval(checkReload, 1000);

//
//window.onload = function() {
//    if(!window.location.hash) {
//        window.location = window.location + '#loaded';
//        window.location.reload();
//    }
//}
//

//$(function () {
//    $("#items_search input").keyup(function () {
//        $.get($("#items_search").attr("action"), $("#items_search").serialize(), null, "script");
//        return false;
//    });
//
//});


//function jsFunction(){
//    var myselect = document.getElementById("selectOpt");
//  var itm_id = myselect.options[myselect.selectedIndex].value;
//    return itm_id;
//}
//
//$.ajax({
//    url : "/receivings",
//    type : "get",
//    data : { data_value: JSON.stringify(jsFunction()) }
//});



$(document).ready(function(){
    $("#myTab li:eq(1) a").tab('show');
});

$(window).bind('page:change', function() {
    //FOR RECEIVING
    $(document).ready(function(){
        $("#value2").keyup(function(){
            var val1 = +$("#value1").val();
            var val2 = +$("#value2").val();
            $("#result").val(val1+val2);
        });

        //FOR ISSUANCE
        $("#qtyissued").keyup(function(){
            var val1 = +$("#Qty").val();
            var val2 = +$("#qtyissued").val();
            $("#qtysingleb").val(val1-val2);
            var val3 = +$("#qtypresent").val();
            var val4 = +$("#qtyissued").val();
            $("#qtybalance").val(val3-val4);
        });

    });


});

