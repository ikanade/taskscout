$(document).on('turbolinks:load', function() {
	var options = {
		valueNames: [ 'name', 'email' ]
	};

	var userList = new List('members', options);
});
