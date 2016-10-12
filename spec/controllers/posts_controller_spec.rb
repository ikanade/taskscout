require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project, user_id: @user.id)
		@post = create(:post, user:@user,project: @project)
	end
  describe "GET #index" do
    it "returns http success" do
      get :index, project_id: @project.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, project_id: @project.id, id: @post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new,project_id: @project.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create with valid data" do
    it "redirects to project page on success" do
      post :create, { post:{
      	title:@post.title,
       	body: @post.body },
       project_id:@project.id }
      expect(response).to redirect_to([@user,@project])
    end
  end

  describe "POST #create with invalid data" do
    it "renders new post page" do
      post :create, { post:{
      	title:nil,
       	body: nil },
       project_id:@project.id }
      expect(response).to render_template('new')
    end
  end
  describe "DELETE #destroy" do
    it "redirects to project page on deletion" do
      delete :destroy, project_id: @project.id, id: @post.id
      expect(response).to redirect_to([@user,@project])
    end
  end

end
