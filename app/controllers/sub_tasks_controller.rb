class SubTasksController < ApplicationController
  before_action :set_task
  def index
    @subtasks = @task.tasks
  end

  def show
   # @project = Project.find(session[:project_id])
    @subtask = @task.tasks.find(params[:id])
    @project = @subtask.parent_project()
    if @subtask.user
    	@available_members = @project.members - [@subtask.user]
    else
    	@available_members ||= @project.members
  	end
  end

  def create
    @subtask = @task.tasks.new(task_params)
    @subtask.user = current_user
    if @subtask.save!
      redirect_to task_task_path(@task,@subtask)
    else
      render 'new'
    end
  end

  def edit
    @subtask = @task.tasks.find(params[:id])
  end

  def update   
    @subtask = @task.tasks.find(params[:id])
    if @subtask.update(update_params)
        redirect_to task_task_path(@task,@subtask)
    else
        render 'edit'
    end
  end

  def new
    @subtask = @task.tasks.new()
    @subtask[:started_at] = Time.now()
  end

  def destroy
    @subtask = @task.tasks.find(params[:id])
    if @subtask.destroy
      redirect_to ([@task.taskable,@task])
    end
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end
    def task_params
      data = params.require(:task).permit(:title,:description,:due_date,:started_at,:priority,:status,:progress)
      due_date = data[:due_date] +" "+Time.now.strftime("%H:%M:%S %z")
      data.store(:due_date,due_date)
      data
    end
    def update_params
    	if params[:sub_task]
      	params.require(:sub_task).permit(:title,:user_id,:description,:due_date,:started_at,:priority,:status,:progress)
    	elsif params[:task]
    		params.require(:task).permit(:title,:user_id,:description,:due_date,:started_at,:priority,:status,:progress)
    	end	
    end

end
