class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	user_path(resource)
  end

  def authorize_user!
  	redirect_to current_user unless current_user.id.to_i == params[:id].to_i
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
