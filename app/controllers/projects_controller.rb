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
  	@project = Project.new(project_params)
  	if @project.save!
  		flash[:success] = "Project Created"
  		redirect_to user_projects_path(current_user)
  	else
  		render 'new'
  	end
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

  private 
  def project_params
  	data = params.require(:project).permit(:title,:description,:deadline,:started_at)
  	deadline = data[:deadline] +" "+Time.now.strftime("%H:%M:%S %z")
  	data.store(:deadline,deadline)
  	data.store(:user_id,params[:user_id])
  	data
  end
end
