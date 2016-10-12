require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
	before(:each) do
		@user = create(:user)
		login_with @user
		@project = create(:project, user_id: @user.id)
	end


	describe "GET #index" do
		it "returns http success" do
			get :index, user_id: @user.id
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #show" do
		it "returns http success" do
			get :show, {user_id: @user.id, id: @project.id}
			expect(response).to have_http_status(:success)
		end
	end
#8166A18C
	describe "GET #new" do
		it "returns http success" do
			get :new, user_id: @user.id
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST #create with valid data" do
		it "redirects to the new project" do
			post :create, {
				project: {
					title: @project.title,
			 		description: @project.description,
			 		deadline: @project.deadline,
			 		started_at: Time.now},
			 	user_id: @user.id}
			expect(response).to redirect_to([@user,@user.projects.last])
		end
	end

	describe "POST #create with invalid data" do
		it "render new template" do
			post :create, {
				project: {
					title: nil,
			 		description: nil,
			 		deadline: @project.deadline,
			 		started_at: Time.now},
			 	user_id: @user.id}
			expect(response).to render_template('new')
		end
	end

	describe "GET #edit" do
		it "returns http success" do
			get :edit, user_id: @user.id, id: @project.id
			expect(response).to have_http_status(:success)
		end
	end

	describe "PATCH #update with valid data" do
		it "returns http success" do
			patch :update, {
				project: {
					title: "New title",
			 		description: @project.description,
			 		deadline: @project.deadline,
			 		started_at: Time.now},
			 	user_id: @user.id,id: @project.id}
			expect(response).to redirect_to([@user,@user.projects.last])
		end
	end

	describe "PATCH #update with invalid data" do
		it "returns http success" do
			patch :update, {
				project: {
					title: nil,
			 		description: @project.description,
			 		deadline: @project.deadline,
			 		started_at: nil},
			 	user_id: @user.id,id: @project.id}
			expect(response).to render_template('edit')
		end
	end
	describe "DELETE #delete" do
		it "returns http success" do
			delete :destroy, {user_id: @user.id, id: @project.id}
			expect(response).to redirect_to([@user])
		end
	end
end
