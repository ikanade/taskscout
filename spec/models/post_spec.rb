require 'rails_helper'

describe Post do
  context "validation checks " do
    it "is valid with title" do
      FactoryGirl.build(:post, title: "gh jk jn").should be_valid
    end
    it "is not valid without title" do
      FactoryGirl.build(:post, title: nil).should_not be_valid
    end
    it "is valid with body" do
      FactoryGirl.build(:post, body: "gh jk jn cdscs").should be_valid
    end
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

    