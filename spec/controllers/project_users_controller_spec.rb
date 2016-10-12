require 'rails_helper'

RSpec.describe ProjectUsersController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project,user_id:@user.id)
		@member = create(:user)
	end
  describe "GET #new" do
    it "returns http success" do
      get :new, id: @project.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, {id: @project.id, user_id: @member.id}
      expect(response).to redirect_to([@user,@project])
    end
  end

  describe "POST #create add existing member" do
    it "should redirect to new project user route" do
      post :create, {id: @project.id, user_id: @user.id}
      expect(response).to redirect_to(new_project_user_path(@project))
    end
  end

end
