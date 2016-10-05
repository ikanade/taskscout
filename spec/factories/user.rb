FactoryGirl.define do
	factory :user do |f|
	  f.name { Faker::Name.name }
	  f.email { Faker::Internet.email}
	  f.password { Faker::Internet.password }  
	end

	factory :post do
  # ...
  association :author, factory: :user, strategy: :build
end

end