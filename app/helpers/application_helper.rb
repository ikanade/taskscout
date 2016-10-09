module ApplicationHelper
	def new_notifications?   # new notifications displays
		if user_signed_in?
			notifications = Notification.where(
				recipient_id: current_user.id,
				created_at:current_user.updated_at..Time.now)
			return true unless notifications.empty?
		end
		false
	end            # due date of project and task convert to string
	def due_when(date)
		if date.to_date.today?
			"Today"
		elsif date.to_date == Date.tomorrow
			"Tomorrow"
		elsif date.to_date == (Date.tomorrow + 1.days)
			"Day after Tomorrow"
		else
			date.to_date
		end	
	end
	def available_members(project)
		User.all - project.members
	end
end
