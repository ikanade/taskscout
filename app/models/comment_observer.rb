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
			unless Rails.env.test?
				begin
					Pusher.trigger("private-#{follower.id}",
						'new_notification',notification_body)
					Notification.create(notification_body)
				rescue Pusher::HTTPError => e
					retry
				end	
			end
		end
	end
end
