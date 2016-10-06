require 'faker'
FactoryGirl.define do
	factory :project do |f|
	  f.title { Faker::Name.name }
	  f.deadline { Faker::Date.between(Date.today, 1.year.from_now)}
	  f.description { Faker::Lorem.paragraph }
	  f.progress {Faker::Number.between(0,100)}
	  f.started_at { Date.today} 
	  f.user_id {Faker::Number.number(2)}
 	  association :creator, factory: :user, strategy: :build

 	  
	end
end