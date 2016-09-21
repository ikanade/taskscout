require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) {User.new(name:"ASDAS",email:"as@as.as",password:"password")} 
  
  it "is valid with name" do
   	subject.name = "Sonali"
  	expect(subject).to be_valid
  end
  it "is not valid without name" do
   	subject.name = ""
  	expect(subject).to_not be_valid
  end
end
