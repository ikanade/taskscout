require 'rails_helper'

RSpec.describe PusherController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@user.confirm
	end
  describe "POST #auth" do
    it "returns http success" do
      login_with @user
      post :auth, {channel_name: "private-#{@user.id}", socket_id:1}
      expect(response).to have_http_status(:success)
    end
  end

end
