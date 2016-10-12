module Extras
	def login_user
		Warden.test_mode!
		user = FactoryGirl.create(:user)
		login_as user, :scope => :user
		user.confirmed_at = Time.now
		user.confirm
		user.save
		user
	end
end