FactoryGirl.define do
factory :task do |f|
  f.title { Faker::Name.name }
  f.description { Faker::Lorem.paragraph }
  f.progress {Faker::Number.between(0,100)}
  f.due_date { Faker::Date.between(Date.today, 1.year.from_now)}
  f.started_at { Date.today} 
  f.taskable_type 'Task'
  f.taskable_id {Faker::Number.number(2)}
  association :user_id, factory: :user, strategy: :build
end
end