class CommentObserver < ActiveRecord::Observer
	def after_save(comment)
		comment.commentable.followers.each do |follower|
				notification_body = 	{
					resource_id: comment.commentable.id,
					recipient_id: follower.id,
					subject: "#{comment.user.name} commented on #{comment.commentable.title}",
					body: "#{comment.body}",
					category: 'Post'
				}
				if Rails.env != "testing"
					Pusher.trigger("private-#{follower.id}",
						'new_notification',notification_body)
				end
				Notification.create(notification_body)	
		end
	end
end
