class ProjectsController < ApplicationController
  def index
  	@projects = current_user.projects
  end

  def show
  	@project = Project.find(params[:id]) 
  	@posts = @project.posts.order(created_at: :desc)
  end

  def new
  	@project = Project.new()
  	@project.creator = current_user
  	@project.started_at = Time.now
  end

  def create
  	@project = Project.new(project_params)
  	@project.creator = current_user
  	if @project.save!
  		flash[:success] = "Project Created"
  		redirect_to user_project_path(current_user,@project)
  	else
  		render 'new'
  	end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update   
    @project = Project.find(params[:id])
    if @project.update(project_params)
        redirect_to user_project_path(current_user,@project)
    else
        render 'edit'
    end
  end

  def destroy
  	@project = Project.find_by(user_id:params[:user_id],id:params[:id])
  	if @project.destroy
  		redirect_to user_path(params[:user_id])
  	end
  end

  private 
  def project_params
  	data = params.require(:project).permit(:title,:description,:deadline,:started_at)
  	deadline = data[:deadline] +" "+Time.now.strftime("%H:%M:%S %z")
  	data.store(:deadline,deadline)
  	data.store(:user_id,params[:user_id])
  	print data
  	data
  end
end
