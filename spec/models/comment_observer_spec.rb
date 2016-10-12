require 'rails_helper'

RSpec.describe CommentObserver, type: :observer do
	before(:each) do
		@user = create(:user)
    @project = create(:project,user_id: @user.id)
    @post = create(:post,project_id: @project.id, user_id: @user.id)
		@comment = create(:comment, user_id: @user.id, commentable:@post)
	end
	 describe "instance methods" do
      it "should invoke aftersave for comment and raise exception once" do 
      	@times_called = 0
      	allow(Notification).to receive(:create) do 
      		raise Pusher::HTTPError.new("error") if @times_called == 1
      	end   
      	@comment.body = "sometext"
      	@comment.save
      end
  	end
end
