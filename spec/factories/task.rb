require 'faker'
FactoryGirl.define do
	factory :task do |f|
		f.title { Faker::Name.name }
		f.description { Faker::Lorem.paragraph }
		f.progress {Faker::Number.between(0,100)}
		f.status  {["active","inactive","complete","none"][rand(4)]}
		f.priority  {["low","normal","high","ASAP"][rand(4)]}
		f.due_date { Faker::Date.between(Date.today, 1.year.from_now)}
		f.started_at { Date.today} 
		f.taskable_type {["Task","Project"][rand(2)]}
		association :user, factory: :user, strategy: :build	
  	
  		association :taskable, factory: :project, strategy: :build

	  	factory :task_taskable do
	  		association :taskable, factory: :task, strategy: :build
	  	end
	  	trait :subtask_task do
	  		association :taskable, factory: :task, strategy: :build
	  	end
	  	
		end
end