require 'faker'
FactoryGirl.define do
factory :post do |f|
  f.title { Faker::Name.name }
  f.body { Faker::Lorem.paragraph }  
  association :user_id, factory: :user, strategy: :build
  association :project_id, factory: :project, strategy: :build
end
end