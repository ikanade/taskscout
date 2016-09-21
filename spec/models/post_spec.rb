require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { Comment.new(body:"demo bhbh njnjn njnjn")} 
  
  it "is valid with body" do
   	subject.body = "PIT bdhh nnjn jdncjn"
  	expect(subject).to be_valid
  end
end
t.string   "body"
    t.integer  "user_id"
    t.integer  "commentable_id"