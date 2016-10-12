require 'rails_helper'
RSpec.describe User, type: :model do
  context " Name validation check user Model" do
      it "is not valid without name" do
        build(:user, name: nil).should_not be_valid
      end
      it "is valid with a title" do
        build(:user, name: "something").should be_valid
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
      create(:user).posts.length # 0
      create(:user_with_posts).posts.length # 5
      create(:user_with_posts, posts_count: 15).posts.length # 15
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
      user = build(:user, name: "John poee Doe")
      user.set_initials.should == "JD"
    end
    it "returns a task by due dates" do    
       user = create(:user)
       task1 = create(:task, user: user, due_date: "2016-10-17 10:01:38",status: "none")
       task2 = create(:task, user: user, due_date: "2016-10-15 10:01:38",status: "active")
       user.tasks_due_soon.should == [task2, task1]
    end
  end
end
