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
<<<<<<< HEAD
  f.taskable_type {["Task","Project"][rand(2)]}
  association :user, factory: :user, strategy: :build

  association :taskable, factory: :project, strategy: :build

  factory :task_taskable do
    association :taskable, factory: :task, strategy: :build
=======
  #f.taskable_type {["Task","Project"][rand(2)]}
  association :user_id, factory: :user, strategy: :build
  trait :project_task do  
  	association :taskable, factory: :project, strategy: :build
>>>>>>> 911e4168342f40e798dfd8eed3b2b07d8e62c5ef
  end
  trait :subtask_task do
		association :taskable, factory: :task, strategy: :build
  end
  #factory :task_taskable do
  #  association :taskable, factory: :task, strategy: :build
  #end
end
end