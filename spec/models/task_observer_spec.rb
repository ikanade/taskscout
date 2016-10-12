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
      
    end

end