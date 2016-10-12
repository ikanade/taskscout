require 'faker'
FactoryGirl.define do
	factory :post do |f|
	  f.title { Faker::Name.name }
	  f.body { Faker::Lorem.paragraph } 
	  association :user, factory: :user, strategy: :build
	  association :project, factory: :project, strategy: :build
	end
end