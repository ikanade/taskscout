class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :authorize_user!
	before_action :setup_user, only: [:show]
	
	def index
  end

	def show
		@projects = @user.projects
	end

	private 
		def setup_user
			@user = User.find(params[:id])
		end
end
