require 'faker'
FactoryGirl.define do
	factory :label do |f|
	  f.name { Faker::Name.name }
	  f.color { ["red","green","blue","yellow","purple","black","orange","cyan",]}  
	end
end