FactoryGirl.define do
factory :project do |f|
  f.title { Faker::Name.name }
  f.description { Faker::Lorem.paragraph }
  f.progress {Faker::Number.between(0,100)}
  f.due_date { Faker::Date.forward(days = 1)}
  f.started_at {Faker::Date.forward(0)} 
  f.user_id {Faker::Number.number(2)}
end
end