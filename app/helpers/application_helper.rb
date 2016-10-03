module ApplicationHelper
	def new_notifications?
		if user_signed_in?
			notifications = Notification.where(
				recipient_id: current_user.id,
				created_at:current_user.updated_at..Time.now)
			return true unless notifications.empty?
		end
		false
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
