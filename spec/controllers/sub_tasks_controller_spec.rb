require 'rails_helper'

RSpec.describe SubTasksController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project,user_id: @user)
		@task = create(:task_alternate,:project_task,user_id:@user.id,taskable: @project)
		@subtask = create(:task,user_id:@user.id,taskable: @task)
	end
  describe "GET #index" do
    it "returns http success" do
      get :index,task_id: @task.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create,{
				task:{
					title:"bahbbasda",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id }
      expect(response).to redirect_to([@task,@subtask])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
