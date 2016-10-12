module Extras
	def login_user(user = double('user'), scope = :user)
		Warden.test_mode!
		user.confirmed_at = Time.now
		user.confirm
		user.save
		login_as user, :scope => :user
		current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(helper).to receive(current_user).and_return(nil)
    else
      allow(helper).to receive(current_user).and_return(user)
    end
	end
	def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(current_user).and_return(user)
    end
  end
end