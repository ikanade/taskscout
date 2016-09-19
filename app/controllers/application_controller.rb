class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	user_path(resource)
  end

  def authorize_user!
  	redirect_to current_user unless current_user.id.to_i == params[:id].to_i
  end
end
