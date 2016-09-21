class ProjectsController < ApplicationController
  def index
  	@projects = Project.where(user_id:current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
