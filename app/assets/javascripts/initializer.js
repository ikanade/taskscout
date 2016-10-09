$(document).on('turbolinks:load', function() {
	console.log("Initializing page");
	$('.datepicker').pickadate({
		selectMonths: true,
		selectYears: 15, 
		min: Date.now(),
		format: 'yyyy-mm-dd'
	});
	$('.modal-trigger').leanModal({
		starting_top: '1%',
		ending_top: '10%'
	});
	$('select').material_select();
	$(".dropdown-button").dropdown();
	$('ul.tabs').tabs();
	$('.tooltipped').tooltip({delay: 50});
});