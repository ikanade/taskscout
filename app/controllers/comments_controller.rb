class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
   
    @comments=@posts.comments
  end

  def show

  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save!
      redirect_to project_posts_path(session[:project_id])
    else
      render 'new'
    end 
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy  
      redirect_to project_posts_path(session[:project_id])
    end
  end

  private
   def comment_params
      params.require(:comment).permit(:body)
   end
end
