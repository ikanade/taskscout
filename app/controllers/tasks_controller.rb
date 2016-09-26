class TasksController < ApplicationController
	before_action :set_project_and_task ,only: [:edit,:update,:show,:new,:delete]
  def index
  end

  def show
  end

  def new
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
  end

  def delete
  end

  private
  	def set_project_and_task
  		@project= Project.find(params[:project_id])
  		@task = @project.tasks.new()
  	end
  	def task_params
    	data = params.require(:task).permit(:title,:description,:due_date,:started_at,:priority)
  		due_date = data[:due_date] +" "+Time.now.strftime("%H:%M:%S %z")
  		data.store(:due_date,due_date)
  		data
  	end
end
