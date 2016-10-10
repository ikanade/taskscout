require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  it "is valid with body" do
    FactoryGirl.build(:comment, body: "PIT bdhh nnjn jdncjn").should be_valid
  end
  it "is not valid with body" do
    FactoryGirl.build(:comment, body: nil).should_not be_valid
  end
  context "Associations" do
    it " belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it " belongs to commentable" do
      assc = described_class.reflect_on_association(:commentable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
