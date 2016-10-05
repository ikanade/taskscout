require 'rails_helper'
  describe Project do
   context " Title validation check " do
	    it "is invalid without a title" do
	      FactoryGirl.build(:project, title: nil).should_not be_valid
	    end
	    it "is valid with a title" do
	      FactoryGirl.build(:project, title: "something").should be_valid
	    end
	end
	context "Date validation checks " do
	   it "is not valid with date" do
	   	FactoryGirl.build(:project, started_at: "2016-09-15 10:01:38")
	   	FactoryGirl.build(:project, deadline: "2016-09-14 10:01:38").should_not be_valid
	   end
	   it "is valid with date" do
	   	FactoryGirl.build(:project, started_at: "2016-10-05 10:01:38")
	   	FactoryGirl.build(:project, deadline: "2016-10-6 10:01:38").should be_valid
	   end
    end

  end
