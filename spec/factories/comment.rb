require 'faker'
FactoryBot.define do
factory :comment do |f|
   f.body { Faker::Lorem.paragraph }
  
  association :user, factory: :user, strategy: :build
  association :commentable, factory: :post, strategy: :build
  factory :task_commentable do
    association :commentable, factory: :task, strategy: :build
  end
end
end