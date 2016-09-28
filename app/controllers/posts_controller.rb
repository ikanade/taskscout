class PostsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @posts = @project.posts
    session[:project_id] = params[:project_id]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
     @project = Project.find(params[:project_id])
    @post=@project.posts.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.new(post_params)
    @post.user = current_user
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
      redirect_to project_posts_path
    end
  end
private
    def post_params
        params.require(:post).permit(:title, :body)
     end
  
end
