class FollowsController < ApplicationController
	def index 
		@follows = current_user.follows.order(created_at: :desc)
	end
	def post 
		@post = Post.find(params[:post_id])
		current_user.follow(@post)
		redirect_to follows_path
	end
	def unfollow_post
		@post = Post.find(params[:post_id])
		current_user.stop_following(@post)
		redirect_to follows_path
	end
	def task 
		@task = Task.find(params[:task_id])
		current_user.follow(@task)
		redirect_to follows_path
	end
	def unfollow_task
		@task = Task.find(params[:task_id])
		current_user.stop_following(@task)
		redirect_to follows_path
	end
end
