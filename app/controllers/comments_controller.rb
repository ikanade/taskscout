class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
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

  def delete
  end

  private
   def comment_params
      params.require(:comment).permit(:body)
   end
end
