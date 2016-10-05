require 'rails_helper'

describe Task do 
  context "Validate title " do
      it "is valid with title" do
       	FactoryGirl.build(:task, title: "PIT").should be_valid
      end
      it "is not valid without title" do
       	FactoryGirl.build(:task, title: nil ).should_not be_valid
      end
  end
  context "Validate priority" do
    it "is valid with priority" do
     	FactoryGirl.build(:task, priority: "ASAP" ).should be_valid
    end
     it "is valid with priority" do
     	FactoryGirl.build(:task, priority: 6574).should_not be_valid
    end
  end
  context "validate status " do 
      it "is valid with status" do
       	  FactoryGirl.build(:task, status: "finished").should_not be_valid
      end
       it "is valid with status" do
       	FactoryGirl.build(:task, status: 6754).should_not be_valid
      end
  end
  context " validate progress" do
    it "is valid with progress" do
     	FactoryGirl.build(:task, progress: 25).should be_valid
    end
    it "is valid with progress" do
     	  FactoryGirl.build(:task, progress: 25677).should_not be_valid
    end
     it "is valid with progress" do
     	  FactoryGirl.build(:task, progress: "cvgbh").should_not be_valid
    end
  end
  context "Date validation checks Task Model" do
     it "is not valid with date" do
        FactoryGirl.build(:task, started_at: "2016-09-15 10:01:38")
        FactoryGirl.build(:task, due_date: "2016-09-14 10:01:38").should_not be_valid
     end
     it "is valid with date" do
        FactoryGirl.build(:task, started_at: "2016-10-05 10:01:38")
        FactoryGirl.build(:task, due_date: "2016-10-6 10:01:38").should be_valid
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
      it "belongs to  usere " do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it "belongs to taskable " do
        assc = described_class.reflect_on_association(:taskable)
        expect(assc.macro).to eq :belongs_to
      end
  end

 
end
