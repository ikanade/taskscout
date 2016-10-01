require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { Post.new(title: "gh kli hjy", body:"demo bhbh njnjn njnjn")} 
  
  it "is valid with title" do
   	subject.title = "Gh hnj"
  	expect(subject).to be_valid
  end
  it "is not valid without title" do
   	subject.title = nil
  	expect(subject).to_not be_valid
  end
  it "is valid with body" do
   	subject.body = "PIT bdhh nnjn jdncjn"
  	expect(subject).to be_valid
  end
  
  context "Associations" do
    it "has many user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it "has many project" do
      assc = described_class.reflect_on_association(:project)
      expect(assc.macro).to eq :belongs_to
    end
    it "has many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end

end

    