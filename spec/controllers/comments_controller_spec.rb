require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@project = create(:project, user_id: @user.id)
		@user.confirm
		@post = create(:post,user_id:@user.id,project_id:@project.id)
		@comment = create(:comment,user_id: @user.id, commentable_type:'Post',commentable_id:@post.id)
   	login_with @user
	end
  describe "GET #index" do
    it "returns http success" do
      get :index, post_id: @post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {post_id: @post.id, id: @comment.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new,post_id: @post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create,{comment: {body: "some comment"}, post_id:@post.id}
      expect(response).to redirect_to([@user,@post.project])
    end
  end

  describe "POST #create with invalid data" do 
  	it "should render new" do 
  		post :create,{comment: {body: ""}, post_id:@post.id}
      expect(response).to render_template("new")
  	end
  end
  describe "GET #edit" do
    it "returns http success" do
      get :edit,{post_id: @post.id, id: @comment.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      patch :update,{post_id: @post.id, id: @comment.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #delete" do
    it "returns http success" do
      delete :destroy,{post_id: @post.id, id: @comment.id}
      expect(response).to redirect_to project_post_path(@post.project,@post)
    end
  end

end
