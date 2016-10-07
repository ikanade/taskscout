require 'faker'
FactoryGirl.define do
	factory :follow do |f|  
	  
	 
	  association :follower, factory: :user, strategy: :build
	 
	  	association :followable, factory: :post, strategy: :build
	end
end