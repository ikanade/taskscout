class PostsController < ApplicationController
  def index
    @user = User.find(current_user)
    @posts = @user.posts    
    @project = Project.where(user_id:current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to project_posts_path
    else
      render 'new'
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy  
    redirect_to posts_path
  end
private
    def post_params
        params.require(:post).permit(:title, :body)
     end
  
end
