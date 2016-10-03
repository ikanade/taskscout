require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
   before(:each) do
     @user = FactoryGirl.create(:user)
     @project = FactoryGirl.create(:project)
     @project.user_id = @user
     @project.save
   end
  it "populates an array of projects" do

    get user_projects_path(@user)
    
  end
  

end
