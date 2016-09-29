class TasksController < ApplicationController
	before_action :set_project ,only: [:edit,:update,:show,:new,:delete]
  def index
  end

  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def new
  	@task = @project.tasks.new()
  	@task[:started_at] = Time.now()
  end

  def create
  	@project = Project.find(params[:project_id])
  	@task = @project.tasks.new(task_params)
  	if @task.save!
  		redirect_to user_project_path(current_user,@project)
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	puts
  	print params 
  	puts
  	@task = Task.find(params[:id])
  	print update_params
  	if @task.update_attributes(update_params)
  		puts "does the update"
  		redirect_to project_task_path(params[:project_id],@task)
  	end
  end

  def destroy
    @task = Task.find_by(user_id:params[:user_id],id:params[:id])
    if @task.destroy
      redirect_to user_projects_path(params[:user_id])
    end
  end

  private
  	def set_project
  		@project= Project.find(params[:project_id])
  	end
  	def task_params
    	data = params.require(:task).permit(:title,:description,:due_date,:started_at,:priority)
  		due_date = data[:due_date] +" "+Time.now.strftime("%H:%M:%S %z")
  		data.store(:due_date,due_date)
  		data
		end
		def update_params
			params.require(:task).permit(:title,:description,:user_id,:due_date,:priority)
		end
end
