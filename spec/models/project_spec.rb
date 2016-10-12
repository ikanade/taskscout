require 'rails_helper'
  RSpec.describe Project, type: :model do
   context " Title validation check Project Model" do
	    it "is invalid without a title" do
	      build(:project, title: nil).should_not be_valid
	    end
	    it "is valid with a title" do
	      build(:project, title: "something").should be_valid
	    end
	end
	context "Date validation checks Project Model" do
	   it "is not valid with date" do
		   	build(:project, started_at: "2016-10-15 10:01:38")
        build(:project, deadline: "2016-09-12 10:01:38").should_not be_valid
	   end
	   it "is valid with date" do
		   	build(:project)
		   	build(:project).should be_valid
	   end
	   it "is not valid format of date" do
	   		build(:project, started_at: "asdasdasd")
	   		build(:project, deadline: "hubhnjn nnnjnj").should_not be_valid
 	   end
  	   it "is not valid format of date" do
  	   		build(:project, started_at: "12345")
	   		build(:project, deadline: "564787").should_not be_valid  	
  		end
    end
    context "Progress validation checks Project model" do
    	it "is valid with progress" do
   			build(:project, progress: 25 ).should be_valid  
 		end
  		it "is not valid with progress" do
   			build(:project, progress: 19867 ).should_not be_valid  
 		end
 		it "is valid with progress" do 
 			build(:project, progress: "bhbhbh" ).should_not be_valid
 		end
 	end
 	context "Associations " do
	    it "has many tasks" do
	      create(:project).tasks.length # 0
        create(:project_with_tasks).tasks.length # 5
        create(:project_with_tasks, tasks_count: 15).tasks.length 
	    end
	    it "has many members " do
	      assc = described_class.reflect_on_association(:project_users)
	      expect(assc.macro).to eq :has_many
	    end
	    it "belongs to user" do
  	    project = create(:project)
  			project.new_record?       
  			project.creator.new_record? 
	    end
	    it "has many posts " do
	      create(:project).posts.length # 0
        create(:project_with_posts).posts.length # 5
        create(:project_with_posts, posts_count: 15).posts.length 
	    end	    
  	end

  	context "Test instance methods project model" do
  		it "check creator to member of project " do
  			project = create(:project)
  			expect(project.members.include? (project.creator))
  		end
  		it "returns task progress" do
		      project = build(:project)
		      project.save!
		      expect(project.progress) 
    	end 
  	end
  end
