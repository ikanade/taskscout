require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
   before(:each) do
     @user = FactoryGirl.create(:user)
     @project = FactoryGirl.create(:project)
     @project.user_id = @user
     @project.save
   end
  
  it "redirects to the home page upon save" do
	  get :new, project: FactoryGirl.attributes_for(:project)
	  response.should redirect_to user_projects_path(@user)
  end

end
