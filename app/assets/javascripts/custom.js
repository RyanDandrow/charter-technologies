jQuery(document).ready(function() {

	if (current_controller) {
		active_tab = $("#tab-" + current_controller);
		if (active_tab) {
			active_tab.addClass("active");
		}
	}

	if($("#notice")) {
		setTimeout(function() {
			$("#notice").fadeOut(1000);
		}, 10000);
	};
});

toggleDiv = function(div) {
	switch ($("#"+div).css('display')) {
		case "none":
			$("#"+div).fadeIn(300);
		break;

		case "block":
			$("#"+div).fadeOut(300);
		break;
	}	
}


// INPUT MASKS FOR CONTACTS

$(document).ready(function(){
    $('#tax_id').mask('00-0000000', {placeholder: "00-0000000"});
});

$(document).ready(function(){
    $('#date').mask('00/00/0000', {placeholder: "mm/dd/yyyy"});
});

$(document).ready(function(){
    $('#date2').mask('00/00/0000', {placeholder: "mm/dd/yyyy"});
});

$(document).ready(function(){
    $('#phone1').mask('(000)-000-0000 Ext.000', {placeholder: "(000)-000-0000 Ext.000"});
});

$(document).ready(function(){
    $('#sf_id').mask('000', {placeholder: "000"});
});

$(document).ready(function(){
    $('#phone2').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#phone3').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#phone4').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#altphone').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#altphone2').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#altphone3').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});

$(document).ready(function(){
    $('#altphone4').mask('(000)-000-0000', {placeholder: "(000)-000-0000"});
});



$(document).ready(function() {
	
	
	 toastr.options = {
	                  "closeButton": false,
	                  "debug": false,
	                  "positionClass": "toast-bottom-right",
	                  "onclick": null,
	                  "showDuration": "500",
	                  "hideDuration": "1000",
	                  "timeOut": "5000",
	                  "extendedTimeOut": "1000",
	                  "showEasing": "swing",
	                  "hideEasing": "linear",
	                  "showMethod": "fadeIn",
	                  "hideMethod": "fadeOut"
	              }
	
	});


$(function() {
  // limits the number of categories
  $('#categories').bind('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#categories').bind('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#categories .nested-fields').length == 3) {
      $('#add-category a').hide();
    } else {
      $('#add-category a').show();
    }
  }
})