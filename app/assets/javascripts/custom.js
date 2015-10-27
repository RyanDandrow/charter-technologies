//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

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