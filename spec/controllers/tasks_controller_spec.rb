require 'rails_helper'

RSpec.describe TasksController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@project = create(:project, user_id: @user.id)
		@task = create(:task,user_id: @user.id,taskable: @project)
		@user.confirm
		login_with @user
	end
	describe "GET #index" do
		it "returns http success" do
			get :index, project_id:@project.id
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #show" do
		it "returns http success" do
			get :show, {project_id:@project.id, id: @task.id}
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #new" do
		it "returns http success" do
			get :new, project_id: @project.id
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST #create" do
		it "returns http success" do
			post :create, {
				task:{
					title:"bahbbasda",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				project_id:@project.id }
			expect(response).to redirect_to(user_project_path(@user,@project))
		end
	end

	describe "POST #create with invalid data" do
		it "renders new template" do
			post :create, {
				task:{
					title:"",
					description:"",
					due_date:10.days.from_now },
				project_id:@project.id }
			expect(response).to render_template('new')
		end
	end

	describe "GET #edit" do
		it "returns http success" do
			get :edit,{project_id:@project.id, id: @task.id}
			expect(response).to have_http_status(:success)
		end
	end

	describe "PATCH #update" do
		it "returns http success" do
			patch :update,{project_id:@project.id, id: @task.id,task:{
					title:"balla",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now }}
			expect(response).to redirect_to([@project,@task])
		end
	end

	describe "DELETE #delete" do
		it "returns http success" do
			delete :destroy, {project_id:@project.id, id: @task.id}
			expect(response).to redirect_to([@user,@project])
		end
	end

end
