class NotificationsController < ApplicationController
	before_filter :authenticate_user!
  
  def index
    @notifications = current_user.notifications.order("created_at desc")
  end
  
  def create
    notification = Notification.new(notification_params)
    notification.sender_id = current_user.id
    if notification.save
      flash[:notice] = "You triggered a notification"
      
      # Send a Pusher notification
			Pusher['private-'+params[:notification][:recipient_id]].trigger('new_notification',
			 { 
			 	from: current_user.name, 
			 	subject: notification.subject,
			 	body: notification.body })
				redirect_to user_path(current_user)
    else
      @user = User.find(params[:notification][:recipient_id])
      render :action => 'users/show'
    end
  end

  private 
  	def notification_params
  		params.require(:notification).permit(:recipient_id,:sender_id,:subject,:body,:category)
  	end
end
