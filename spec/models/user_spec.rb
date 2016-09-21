require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) {User.new(name:"ASDAS",email:"as@as.as",password:"password")} 
  
  it "is invalid without name" do
   subject.name = "Sonali"
  expect(subject).to be_valid
  end
  it "is invalid without email" do
   subject.email = "name@gmail.com"
  expect(subject).to be_valid
  end
  
end
