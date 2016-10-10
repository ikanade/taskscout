  require 'rails_helper'

  RSpec.describe ProjectsController, type: :controller do
     before(:each) do
       @user = nil
     end
    
    describe "#new" do
      it "redirects to the home page upon save" do
      	  @user = FactoryGirl.attributes_for(:user)
          sign_in @user
          @project = FactoryGirl.attributes_for(:project)
          get :new, user_id: @user
          response.should redirect_to user_projects_path(@user, @project)
      end
    end

    it "redirects to the home page upon save" do

    	  @user = FactoryGirl.attributes_for(:user)
    	  sign_in @user
    	  @project = FactoryGirl.create(:project)
  	  get :show, user_id: @user, id:@project
  	  response.should redirect_to user_projects_path(@user, @project)
    end

  end
