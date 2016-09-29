class TaskObserver < ActiveRecord::Observer
	def after_save(task)
		print "observer gets called for #{task.inspect}"
		task.followers.each do |follower|
			notification_body = 	{
				resource_id: task.id,
				recipient_id: follower.id,
				subject: "New Task Created",
				body: "#{task.title} is due #{due_when(task.due_date)}",
				category: 'Task'
				}
			Pusher.trigger("private-#{follower.id}" ,'new_notification',notification_body)
			Notification.create(notification_body)
			puts "Task pusher new_notification called as well"
		end
	end
	def due_when(date)
		if date.to_date.today?
			"Today"
		elsif date.to_date == Date.tomorrow
			"Tomorrow"
		elsif date.to_date == (Date.tomorrow + 1.days)
			"Day after tomorrow"
		else
			date.to_date
		end	
	end
end
