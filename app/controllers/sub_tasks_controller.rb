class SubTasksController < ApplicationController
  before_action :set_task ,only: [:show,:new,:destroy]
  def index
   
    @task = Task.find(params[:task_id])
    @subtasks = @task.tasks
  end

  def show
    @subtasks = @task.tasks
  end

  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.tasks.new(task_params)
    if @subtask.save!
      redirect_to task_tasks_path(@task)
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @subtask = @task.tasks.find(params[:id])
  end

  def update   
    @task = Task.find(params[:task_id])
    @subtask = @task.tasks.find(params[:id])
    if @subtask.update(task_params)
        redirect_to task_tasks_path(@task)
    else
        render 'edit'
    end
  end

  def new
    @subtask = @task.tasks.new()
    @subtask[:started_at] = Time.now()
  end

  def destroy
    @task = Task.find(params[:task_id])
    @subtask = @task.tasks.find(params[:id])
    if @subtask.destroy
      redirect_to task_tasks_path(@task)
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
