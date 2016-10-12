module ApplicationHelper
	def new_notifications?   # new notifications displays
		if user_signed_in?
			last_checked = session[:last_checked]
			last_checked ||= current_user.current_sign_in_at 
			notifications = Notification.where(
				recipient_id: current_user.id,
				created_at:last_checked..Time.now)
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
	def available_members(resource)
		result = nil
		case resource.class.name
		when "Project"
			result = User.all - resource.members
		when "Task"
			result = resource.parent_project.members - [resource.user]
		end
		if result.empty?
			flash[:notice] = "No available member to assign, add new member to project"
		end 
		result 
	end
	def belongs_to_url(resource)
		case resource.taskable.class.name
		when "Project"
			print current_user.inspect
			url_for([current_user,resource.taskable])
		when "Task"
			url_for([resource.taskable.taskable,resource.taskable])
		end
	end
end
