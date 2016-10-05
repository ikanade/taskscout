require 'rails_helper'
describe User do
  context " Name validation check user Model" do
      it "is not valid without name" do
        FactoryGirl.build(:user, name: nil).should_not be_valid
      end
      it "is not valid with name" do
        FactoryGirl.build(:user, name: "123hhb").should_not be_valid
      end
      it "is valid with a title" do
        FactoryGirl.build(:user, name: "something").should be_valid
      end
  end

  context "Associations" do
    it "has many project_users" do
      assc = described_class.reflect_on_association(:project_users)
      expect(assc.macro).to eq :has_many
    end
    it "has many project" do
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

  context "Test Instance methods" do
    it "returns a user's name initials" do
      user = FactoryGirl.build(:user, name: "John Doe")
      user.set_initials.should == "JD"
    end
    it "returns a " do
      user1 = FactoryGirl.build(:user, user_id: 23, due_date: >= 2016-09-17 10:01:38, status: != 'complete' )
      user2 = FactoryGirl.build(:user, user_id: 23, due_date: >= 2016-09-15 10:01:38, status: != 'complete' )
      user.tasks.should == ""
    end
  end
end
