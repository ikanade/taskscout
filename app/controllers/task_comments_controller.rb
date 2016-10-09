class TaskCommentsController < ApplicationController
  def index
  	@tasks = Task.find(params[:task_id])  
    @comments=@tasks.comments
  end

  def create
  	@task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save!
      respond_to do |format|
      	format.html { redirect_to([@task.taskable,@task]) }
      	format.js {}
      end
    else
      render 'new'
    end 
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    if @comment.destroy  
      redirect_to project_task_path(session[:project_id],@task)
    end
  end

  private
   def comment_params
      params.require(:comment).permit(:body,:id)
   end
end
