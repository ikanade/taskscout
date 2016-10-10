require 'faker'
FactoryGirl.define do
factory :comment do |f|
   f.body { Faker::Lorem.paragraph }
  association :user_id, factory: :user, strategy: :build

  association :commentable, factory: :post, strategy: :build

  factory :task_commentable do
    association :commentable, factory: :task, strategy: :build
  end
end
end