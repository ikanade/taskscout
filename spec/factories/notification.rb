require 'faker'
FactoryGirl.define do
factory :notification do |f|
	f.subject { Faker::Name.name }
	f.body { Faker::Lorem.paragraph }
	f.resource_id {rand(1..100)}
	f.category {"Task"}
  association :recipient, factory: :user, strategy: :build
end
end