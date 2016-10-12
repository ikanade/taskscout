require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@post = create(:post,user_id:@user.id)
		@task = create(:task,user_id:@user.id)
		login_with @user
	end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #post" do
    it "returns http success" do
      post :post, post_id: @post.id
      expect(response).to redirect_to(follows_path)
    end
  end

  describe "POST #task" do
    it "returns http success" do
      post :task, task_id: @task.id
      expect(response).to redirect_to(follows_path)
    end
  end

  describe "DELETE #unfollow_post" do
    it "returns http success" do
      delete :unfollow_post, post_id: @post.id
      expect(response).to redirect_to(follows_path)
    end
  end

  describe "DELETE #unfollow_task" do
    it "returns http success" do
      delete :unfollow_task, task_id: @task.id
      expect(response).to redirect_to(follows_path)
    end
  end
end
