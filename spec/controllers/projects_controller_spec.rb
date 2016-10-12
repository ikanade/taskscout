  require 'rails_helper'

  RSpec.describe ProjectsController, type: :controller do
     before(:each) do
     	byebug
        @user = FactoryGirl.create(:user)
        sign_in @user
        @project = FactoryGirl.attributes_for(:project)
     end
    
    describe "#new" do
      it "redirects to the show page upon save" do
      	byebug
         get :new
         expect(response.status).to eq(200)
      end
    end
  end
