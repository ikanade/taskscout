require 'rails_helper'

RSpec.describe TaskCommentsController, type: :controller do
	before(:each) do 
		@user = create(:user)
		login_with @user
		@project = create(:project, user_id: @user.id)
		@task = create(:task,user_id: @user.id, taskable: @project)
		@comment = create(:comment,user_id:@user.id, commentable: @task)
	end
  describe "POST #create with valid data" do
    it "redirects to the task which got commented on" do
      post :create, { task_id: @task.id, comment: {
      		body: "yolololo"
      	}
      }
      expect(response).to redirect_to([@task.taskable,@task])
    end
  end
  describe "POST #create with invalid data" do
    it "redirects to the task which got commented on" do
      post :create, { task_id: @task.id, comment: {
      		body: nil
      	}
      }
      expect(response).to redirect_to([@task.taskable,@task])
    end
  end
  describe "DELETE #destroy" do
    it "redirects to the task which got commented on" do
      delete :destroy, { task_id: @task.id, id: @comment.id }
      expect(response).to redirect_to([@task.taskable,@task])
    end
  end
end
