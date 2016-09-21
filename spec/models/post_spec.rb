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
  
end

    