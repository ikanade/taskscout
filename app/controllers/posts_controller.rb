class PostsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @posts = @project.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  	 @project = Project.find(params[:project_id])
     @post = current_user.posts.new(project_id: @project.id)
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    if @post.save!
      redirect_to project_posts_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    if @post.destroy  
      redirect_to project_posts_path(@project)
    end
  end
private
    def post_params
        data = params.require(:post).permit(:title, :body)
        data.store(:user_id,current_user.id)
        data.store(:project_id,params[:project_id])
        data
     end
  
end
