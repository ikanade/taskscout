require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { Comment.new(body:"demo bhbh njnjn njnjn", commentable_type: "Post")} 
  
  it "is valid with body" do
   	subject.body = "PIT bdhh nnjn jdncjn"
  	expect(subject).to be_valid
  end
  it "is not valid with body" do
   	subject.body = nil
  	expect(subject).to_not be_valid
  end
end

    