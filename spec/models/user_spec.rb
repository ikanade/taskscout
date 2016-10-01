require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) {User.new(name:"ASDAS",email:"as@as.as",password:"password")} 
  
  it "is valid with name" do
   	subject.name = "Sonali"
  	expect(subject).to be_valid
  end
  it "is not valid with name" do
   	subject.name = "123sdf"
  	expect(subject).to_not be_valid
  end
  it "is not valid without name" do
   	subject.name = nil
  	expect(subject).to_not be_valid
  end

  context "Associations" do
    it "has many project_users" do
      assc = described_class.reflect_on_association(:project_users)
      expect(assc.macro).to eq :has_many
    end
    it "has many tasks" do
      assc = described_class.reflect_on_association(:tasks)
      expect(assc.macro).to eq :has_many
    end
    it "has many Posts " do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end
    it "has many Comments " do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
    it "has many notifications " do
      assc = described_class.reflect_on_association(:notifications)
      expect(assc.macro).to eq :has_many
    end
  end
end
