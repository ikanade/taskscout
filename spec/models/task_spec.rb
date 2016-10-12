require 'rails_helper'

RSpec.describe Task, type: :model do
	before(:each) do
		@user = FactoryGirl.create(:user)
		@task = FactoryGirl.create(:task, user_id: @user.id)
	end
  context "Validate title " do
      it "is valid with title" do
       	FactoryGirl.build(:task, title: "PIT",user_id: @user.id).should be_valid
      end
      it "is not valid without title" do
       	FactoryGirl.build(:task, title: nil ).should_not be_valid
      end
  end
  context "Validate priority" do
    it "is valid with priority" do
     	FactoryGirl.build(:task, priority: "ASAP",user_id: @user.id ).should be_valid
    end
     it "is not valid with priority" do
     	FactoryGirl.build(:task, priority: 6574).should_not be_valid
    end
  end
  context "validate status " do 
      it "is valid with status" do
       	  FactoryGirl.build(:task, status: "finished",user_id: @user.id).should_not be_valid
      end
       it "is not valid with status" do
       	FactoryGirl.build(:task, status: 6754).should_not be_valid
      end
  end
  context " validate progress" do
    it "is valid with progress" do
     	FactoryGirl.build(:task, progress: 25,user_id: @user.id).should be_valid
    end
    it "is not valid with progress" do
     	  FactoryGirl.build(:task, progress: 25677).should_not be_valid
    end
     it "is not valid with progress" do
     	  FactoryGirl.build(:task, progress: "cvgbh").should_not be_valid
    end
  end
  context "Date validation checks Task Model" do
     it "is not valid with date" do
        FactoryGirl.build(:task, started_at: "2016-10-15 10:01:38")
        FactoryGirl.build(:task, due_date: "2016-09-12 10:01:38").should_not be_valid
     end
     it "is valid with date" do
        FactoryGirl.build(:task)
        FactoryGirl.build(:task,user_id: @user.id).should be_valid
     end
     it "is not valid format of date" do
        FactoryGirl.build(:task, started_at: "asdasdasd")
        FactoryGirl.build(:task, due_date: "hubhnjn nnnjnj").should_not be_valid
     end
       it "is not valid format of date" do
          FactoryGirl.build(:task, started_at: "12345")
        FactoryGirl.build(:task, due_date: "564787").should_not be_valid   
      end
    end


  context "Associations" do
      it "has many tasks" do
        assc = described_class.reflect_on_association(:tasks)
        expect(assc.macro).to eq :has_many
      end
      it "has many comments" do
        assc = described_class.reflect_on_association(:comments)
        expect(assc.macro).to eq :has_many
      end
      it "has many labels " do
        assc = described_class.reflect_on_association(:labels)
        expect(assc.macro).to eq :has_many
      end
      it "belongs to  users " do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it "belongs to taskable " do
        assc = described_class.reflect_on_association(:taskable)
        expect(assc.macro).to eq :belongs_to
      end
  end

  context "Test instance methods Task model" do 
    it "returns a Parent project" do
      task = FactoryGirl.build(:task)
      parent_task = FactoryGirl.build(:task)
      task.taskable = parent_task
      task.parent_project.should == parent_task.taskable
    end  
    it "returns project creator as follower" do
      task = FactoryGirl.build(:task)
      project = FactoryGirl.create(:project) 
      follow = FactoryGirl.build(:follow)
      expect(follow.follower_id) == project.creator.id
    end 
    it "returns task progress" do
      task = FactoryGirl.build(:task, status: "active",user_id: @user.id)
      task.save!
      expect(task.progress) 
    end 
    it "returns task progress on status change" do
      task = FactoryGirl.build(:task, status: "complete",user_id: @user.id)
      task.save!
      expect(task.progress) == 100 
    end 
    it "returns user as follower" do
      task = FactoryGirl.create(:task,user_id: @user.id)
      user = FactoryGirl.create(:user, id: 12)
      user.tasks << task
      follow = FactoryGirl.build(:follow)
      task.save!
      expect(follow.follower_id) == task.user_id
    end 
  end
end
