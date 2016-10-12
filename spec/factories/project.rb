require 'faker'
FactoryGirl.define do
	factory :project do |f|
	  f.title { Faker::Name.name }
	  f.deadline { Faker::Date.between(Date.today + 1.day, 1.year.from_now)}
	  f.description { Faker::Lorem.paragraph }
	  f.progress {Faker::Number.between(0,100)}
	  f.started_at { Date.today} 
 	  association :creator, factory: :user, strategy: :build

 	  factory :project_with_posts do	  		#has_many relation  	
	  	transient do
        	posts_count 5        
      	end	  
	  	after do |project, evaluator|
       		 create_list(:post, evaluator.posts_count, project: project)      		 
    	end
      end 
      factory :project_with_tasks do	  		#has_many relation  	
	  	transient do
        	tasks_count 5
      	end	  
	  	after do |project, evaluator|
       		 create_list(:task, evaluator.tasks_count, project: project)
    	end
      end 
 	  
	end
end