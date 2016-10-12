require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project, user_id: @user.id)
end
  describe "POST #create with valid data" do
    it "redirects to the task which got commented on" do
      post :create,{notification: {
      	recipient_id:@user.id,
      	resource_id:1,
      	subject:"Some subject",
      	body:"Some body",
      	category:"Task"
      	}}
      expect(response).to redirect_to(@user)
    end
  end
  describe "POST #create with invalid data" do
    it "redirects to the task which got commented on" do
      post :create,{notification: {
      	recipient_id:nil,
      	resource_id:nil,
      	subject:"Some subject",
      	body:"Some body",
      	category:"Task"
      	}}
      expect(response).to redirect_to(@user)
    end
  end
  describe "GET #index" do
    it "redirects to the task which got commented on" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
