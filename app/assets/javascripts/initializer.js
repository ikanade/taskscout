$(document).on('turbolinks:load', function() {
	$('.datepicker').pickadate({
		selectMonths: true,
		selectYears: 15, 
		min: Date.now()
	});
	console.log("gets in");
});