FactoryGirl.define do
	factory :user do |f|
	  f.name { Faker::Name.name }
	  f.email { Faker::Internet.email}
	  f.password { Faker::Internet.password }

	  factory :user_with_posts do	  		  	
	  	transient do
        	posts_count 5
      	end	  
	  	after(:create) do |user, evaluator|
       		 create_list(:post, evaluator.posts_count, user: user)
    	end
      end 
	end
end