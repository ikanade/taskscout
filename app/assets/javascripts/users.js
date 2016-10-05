function toggle(what){
	if (what === "projects") {
		$('#projects').removeClass('hide');
		$('#tasks').addClass('hide');
	}
	else if (what === "tasks")
	{
		$('#projects').addClass('hide');
		$('#tasks').removeClass('hide');
	}
}
