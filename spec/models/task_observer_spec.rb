require 'rails_helper'

RSpec.describe TaskObserver, type: :model do
	before(:each) do
		@user = FactoryGirl.create(:user)
    	@project = FactoryGirl.create(:project)
		@task = FactoryGirl.create(:task, user_id: @user.id)
		@taskobserver = TaskObserver.instance
		@notification = FactoryGirl.create(:notification, recipient_id: @user.id,resource_id:@task.id)
	end
	 describe "Insatnce methods" do
      it "after save notification created if user id changed " do      
         @taskobserver.after_save(@task)
         expect(@notification)
      end
      it "after save notification created if user id changed " do      
         @taskobserver.after_save(@task)
         expect(@notification)
      end
      it "after save due when return date in string format " do      
         @taskobserver.due_when("2016-10-13 09:02:00")
         expect("Tomorrow")
      end
      it "after save due when return date in string format " do      
         @taskobserver.due_when("2016-10-12 09:02:00")
         expect("Today")
      end
      it "after save due when return date in string format " do      
         @taskobserver.due_when("2016-10-14 09:02:00")
         expect("Day after tomorrow")
      end
      it "after save due when return date in date format " do      
         @taskobserver.due_when("2016-10-15 09:02:00")
         expect("2016-10-15 09:02:00")
      end
    end

end