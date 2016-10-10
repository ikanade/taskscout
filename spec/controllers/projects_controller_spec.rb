  require 'rails_helper'

  RSpec.describe ProjectsController, type: :controller do
     before(:each) do
        @user = FactoryGirl.attributes_for(:user)
        @project = FactoryGirl.attributes_for(:project)
     end
    
    describe "#new" do
      it "redirects to the show page upon save" do      	  
          get :create, user_id: @user
          response.should redirect_to user_projects_path(@user, @project)
      end
    end

    

  end
