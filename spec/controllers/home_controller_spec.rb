require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	before(:each) do 
		@user = create(:user)
		@user.confirm
	end
	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end
		it "redirects to users page if user is logged in" do
			login_with @user
			get :index
			expect(response).to redirect_to(user_path(@user))
		end
	end
end
