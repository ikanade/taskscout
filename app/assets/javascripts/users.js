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
$(document).on('turbolinks:load', function() {
	var options = {
		valueNames: [ 'card-title', 'card-description','due-date' ]
	};
	var taskList = new List('tasks', options);
	var projectList = new List('projects',options);
});
