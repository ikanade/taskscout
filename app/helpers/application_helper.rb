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
end
