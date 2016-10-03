class CommentObserver < ActiveRecord::Observer
	def after_save(comment)
		puts "gets called comment observer"
		comment.commentable.followers.each do |follower|
				puts "goes inside for #{follower}"
				notification_body = 	{
					resource_id: comment.commentable.id,
					recipient_id: follower.id,
					subject: "#{comment.user.name} commented on #{comment.commentable.title}",
					body: "#{comment.body}",
					category: 'Post'
				}
				Pusher.trigger("private-#{follower.id}",
					'new_notification',notification_body)

				Notification.create(notification_body)	
		end
	end
end
