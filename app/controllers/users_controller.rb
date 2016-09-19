class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :authorize_user!
	def show
	end
end
