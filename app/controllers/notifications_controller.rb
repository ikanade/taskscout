class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
  	session[:last_checked] = Time.now
    @notifications = current_user.notifications.order("created_at desc")
  end
  
  def create
    notification = Notification.new(notification_params)
    if notification.save
      flash[:notice] = "You triggered a notification"
      
      # Send a Pusher notification
			Pusher['private-'+params[:notification][:recipient_id]].trigger('new_notification',
			 { 
			 	subject: notification.subject,
			 	body: notification.body })
				redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  private 
  	def notification_params
  		params.require(:notification).permit(:recipient_id,:resource_id,:subject,:body,:category)
  	end
end
