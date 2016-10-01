require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:subject) { Comment.new(body:"demo bhbh njnjn njnjn", commentable_type: "Post")} 
  
  it "is valid with body" do
   	subject.body = "PIT bdhh nnjn jdncjn"
  	expect(subject).to be_valid
  end
  it "is not valid with body" do
   	subject.body = nil
  	expect(subject).to_not be_valid
  end
  context "Associations" do
    it " belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
