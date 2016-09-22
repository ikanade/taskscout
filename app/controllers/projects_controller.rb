class ProjectsController < ApplicationController
  def index
  	@projects = Project.where(user_id:current_user.id)
  end

  def show
  end

  def new
  	@project = Project.new()
  	@project.creator = current_user
  	@project.started_at = Time.now
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  	@project = Project.find_by(user_id:params[:user_id],id:params[:id])
  	if @project.destroy
  		redirect_to user_projects_path(params[:user_id])
  	end
  end

end
