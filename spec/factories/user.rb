FactoryBot.define do
	factory :user do |f|
	  f.name { Faker::Name.name }
	  f.email { Faker::Internet.email}
	  f.password { Faker::Internet.password }

	  factory :user_with_posts do	 #has_many relation 		  	
	  	transient do
        	posts_count 5
      	end	  
	  	after(:create) do |user, evaluator|
       		 create_list(:post, evaluator.posts_count, user: user)
    	end
      end 
      factory :user_with_tasks do	 #has_many relation 		  	
	  	transient do
        	tasks_count 5
      	end	  
	  	#after(:create) do |user, evaluator|
      # 		 create_list(:post, evaluator.tasks_count, user: user)
    	#end
      end 
	end
end