require 'faker'
FactoryGirl.define do
factory :notification do |f| 
  association :recipient, factory: :user, strategy: :build
end
end