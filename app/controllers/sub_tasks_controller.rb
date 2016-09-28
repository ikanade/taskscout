class SubTasksController < ApplicationController
  before_action :set_task ,only: [:show,:new,:destroy]
  def index
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @subtasks = @task.tasks
  end

  def show
    @subtasks = @task.tasks
  end

  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.tasks.new(task_params)
    if @subtask.save!
      redirect_to user_project_path(current_user,@project)
    else
      render 'new'
    end
  end

  def new
    @subtask = @task.tasks.new()
    @subtask[:started_at] = Time.now()
  end

  def destroy
    @task = Task.find_by(user_id:params[:user_id],id:params[:id])
    if @task.destroy
      redirect_to user_projects_path(params[:user_id])
    end
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end
    def task_params
      data = params.require(:task).permit(:title,:description,:due_date,:started_at,:priority)
      due_date = data[:due_date] +" "+Time.now.strftime("%H:%M:%S %z")
      data.store(:due_date,due_date)
      data
    end

end
