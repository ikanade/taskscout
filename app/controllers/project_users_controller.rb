class ProjectUsersController < ApplicationController
  def new
  	print flash.inspect
  	@users = User.all
  	@project = Project.find(params[:id])
  end

  def index
    @project = Project.find(params[:id])
    @task = @project.tasks
    @users = @project.users
  end

  def create
  	@project_user = ProjectUser.new()
  	@project_user.project_id = params[:id]
  	@project_user.user_id = params[:user_id]
  	begin 
  		@project_user.save!
  		redirect_to user_projects_path(current_user)
  	rescue Exception => e
  		#flash[:danger] = "User already exists in the project"
  		if e.message.match('Validation failed')
  			flash[:notice] = "User is already a part of the project"
  		end
  		redirect_to new_project_user_path(params[:id])
  	end
  end
end
