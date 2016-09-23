$(document).on('turbolinks:load', function() {
	$('.datepicker').pickadate({
		selectMonths: true,
		selectYears: 15, 
		min: Date.now(),
		format: 'yyyy-mm-dd'
	});
	console.log("gets in");
});