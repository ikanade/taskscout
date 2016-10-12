require 'rails_helper'

RSpec.describe TaskObserver, type: :model do
	before(:each) do
		@user = create(:user)
		login_as @user
    @project = create(:project)
		@task = create(:task, user_id: @user.id)
		@taskobserver = TaskObserver.instance
		@notification = create(:notification, recipient_id: @user.id,resource_id:@task.id)
	end
	 describe "instance methods" do
      it "after save notification created if user id changed " do      
         @taskobserver.after_save(@task)
         expect(@notification)
      end
      it "after save notification created if user id changed " do      
         @taskobserver.after_save(@task)
         expect(@notification)
      end
      it "after save due when return date in string format " do      
         @task.due_date = "2016-10-13 09:02:00"
         @task.due_when
         expect("Tomorrow")
      end
      it "after save due when return date in string format " do      
         @task.due_date = "2016-10-12 09:02:00"
         @task.due_when
         expect("Today")
      end
      it "after save due when return date in string format " do      
         @task.due_date = "2016-10-14 09:02:00"
         @task.due_when
         expect("Day after tomorrow")
      end
      it "after save due when return date in date format " do      
         @task.due_date = "2016-10-15 09:02:00"
         @task.due_when
         expect("2016-10-15 09:02:00")
      end
      it "should notify about assignee change" do 
      	@task.user = create(:user)
      	@task.followers.last.id = -1
      	@times_called = 0
      	allow(Notification).to receive(:create) do 
      		@times_called +=  1
      		raise MultiJson::ParseError.new("error") if @times_called == 1
      	end
      	@task.save

      end
    end

end