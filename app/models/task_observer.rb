
class TaskObserver < ActiveRecord::Observer
	def after_save(task)
		if task.user_id_changed? && task.user_id_was
			puts" after save gets called for user"
			user = User.find(task.user_id_was)
			if task.parent_project.creator != user
				user.stop_following(task)
				puts "#{user.name} is gettin unfollowed"
			end
			task.followers.each do |follower|
				puts"notification gets called for #{follower.name}"
				notification_body = 	{
					resource_id: task.id,
					recipient_id: follower.id,
					subject: "Assignee changed for task due #{due_when(task.due_date)}",
					body: "#{task.user.name} got assigned to task: #{task.title}",
					category: 'Task'
				}
				
			 			if Rails.env != "testing"
							Pusher.trigger("private-#{follower.id}",
								'new_notification',notification_body)									
						end
						Notification.create(notification_body)
			
			end
			notification_body = {
					resource_id: task.id,
					recipient_id: task.user_id,
					subject: "You have been assigned a task due #{due_when(task.due_date)}",
					body: "Details - #{task.title}",
					category: 'Task'
				}
				if Rails.env != "testing"
					Pusher.trigger("private-#{task.user_id}",
					'new_notification',notification_body)
			  end
				Notification.create(notification_body)
		end
		if task.status_changed? && task.status_was
				task.followers.each do |follower|
				notification_body = 	{
					resource_id: task.id,
					recipient_id: follower.id,
					subject: "Status changed for task due #{due_when(task.due_date)}",
					body: "task: #{task.title} now has status #{task.status}",
					category: 'Task'
				}
				if Rails.env != "testing"
					Pusher.trigger("private-#{follower.id}",
						'new_notification',notification_body)
				end
				Notification.create(notification_body)	
				end
			end

			 require "pusher-fake/support/base"
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
