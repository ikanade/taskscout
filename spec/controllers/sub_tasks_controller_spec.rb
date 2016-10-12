require 'rails_helper'

RSpec.describe SubTasksController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project,user_id: @user)
		@task = create(:task,user_id:@user.id,taskable:@project)
		@subtask = create(:task,user_id:@user.id,taskable:@task)
	end
  describe "GET #index" do
    it "returns http success" do
      get :index,task_id: @task.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create with valid data" do
    it "redirects to the new subtask" do
      post :create,{
				task:{
					title:"bahbbasda",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id }
      expect(response).to redirect_to(task_task_path(@task,@task.tasks.second))
    end
  end

  describe "POST #create with invalid data" do
    it "renders the new template" do
      post :create,{
				task:{
					title:"",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id }
      expect(response).to render_template('new')
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new,task_id: @task.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, {task_id: @task.id, id: @subtask.id}
      expect(response).to redirect_to([@task.taskable,@task])
    end
  end

  describe "PATCH #update with task" do
    it "returns http success" do
      patch :update ,{task:{
					title:"update the title",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id,
				id: @subtask.id }
      expect(response).to redirect_to([@task,@subtask])
    end
  end

  describe "PATCH #update with subtask" do
    it "returns http success" do
      patch :update ,{sub_task:{
					title:"update the title",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id,
				id: @subtask.id }
      expect(response).to redirect_to([@task,@subtask])
    end
  end

   describe "PATCH #update with invalid data" do
    it "returns http success" do
      patch :update ,{sub_task:{
					title:"",
					description:"samdoamsod",
					due_date:10.days.from_now,
					started_at: Time.now },
				task_id:@task.id,
				id: @subtask.id }
      expect(response).to render_template('edit')
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {task_id: @task.id, id: @subtask.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show,{task_id: @task.id, id: @subtask.id}
      expect(response).to have_http_status(:success)
    end
  end

end
