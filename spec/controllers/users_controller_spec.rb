require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@user.confirm
		login_with @user
	end
	describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
