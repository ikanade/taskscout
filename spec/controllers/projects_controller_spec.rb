require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
   
  
  it "redirects to the home page upon save" do
  	  @user = FactoryGirl.attributes_for(:user)
  	  @project = FactoryGirl.attributes_for(:project)
	  get :new, user_id: @user
	  response.should redirect_to user_projects_path(@user, @project)
  end
  

end
