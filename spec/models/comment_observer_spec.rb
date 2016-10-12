require 'rails_helper'

RSpec.describe CommentObserver, type: :observer do
	before(:each) do
		@user = FactoryGirl.create(:user)
    	#@project = FactoryGirl.create(:project)
		@comment = FactoryGirl.create(:comment, user_id: @user.id)
		@commentobserver = CommentObserver.instance
		@follow = FactoryGirl.build(:follow)
		@notification = FactoryGirl.create(:notification, recipient_id: @user.id,resource_id:@comment.id)
	end
	 describe "Insatnce methods" do
      it "after save notification created if user id changed " do      
         @commentobserver.after_save(@comment)
         expect(@notification)
      end
      it "after save notification created if user id changed " do      
         @commentobserver.after_save(@comment)	         
         expect(Rails.env.development?) == Pusher.trigger("private-#{@follow.follower.id}",
					'new_notification',@notification)
      end
  	end
end
