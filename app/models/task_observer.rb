class TaskObserver < ActiveRecord::Observer
	def after_save(task)
		if task.user_id_changed? && !task.user_id_was.nil?
			User.find(task.user_id_was).stop_following(task)
			task.followers.each do |follower|
				notification_body = 	{
					resource_id: task.id,
					recipient_id: follower.id,
					subject: "Assignee changed for task due #{due_when(task.due_date)}",
					body: "#{task.user.name} got assigned to task: #{task.title}",
					category: 'Task'
				}
				Pusher.trigger("private-#{follower.id}",
					'new_notification',notification_body)

				Notification.create(notification_body)
			end

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
