require 'rails_helper'
  describe Project do
   context " Title validation check Project Model" do
	    it "is invalid without a title" do
	      FactoryGirl.build(:project, title: nil).should_not be_valid
	    end
	    it "is valid with a title" do
	      FactoryGirl.build(:project, title: "something").should be_valid
	    end
	end
	context "Date validation checks Project Model" do
	   it "is not valid with date" do
		   	FactoryGirl.build(:project, started_at: "2016-09-15 10:01:38")
		   	FactoryGirl.build(:project, deadline: "2016-09-14 10:01:38").should_not be_valid
	   end
	   it "is valid with date" do
		   	FactoryGirl.build(:project, started_at: "2016-10-05 10:01:38")
		   	FactoryGirl.build(:project, deadline: "2016-10-6 10:01:38").should be_valid
	   end
	   it "is not valid format of date" do
	   		FactoryGirl.build(:project, started_at: "asdasdasd")
	   		FactoryGirl.build(:project, deadline: "hubhnjn nnnjnj").should_not be_valid
 	   end
  	   it "is not valid format of date" do
  	   		FactoryGirl.build(:project, started_at: "12345")
	   		FactoryGirl.build(:project, deadline: "564787").should_not be_valid  	
  		end
    end

  end
