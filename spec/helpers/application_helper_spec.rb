require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
	before(:each) do 
		@user = create(:user)
		login_user @user
		@project = create(:project,user_id: @user)
		@task = create(:task,user_id:@user.id,taskable: @project)
		@subtask = create(:task,user_id:@user.id,taskable: @task)
	end 
 describe "#due_when" do
    it "returns today for a date object of today" do
      expect(helper.due_when(Time.now)).to eq("Today")
    end
    it "returns tomorrow for a date object of tomorrow" do 
    	expect(helper.due_when(1.day.from_now)).to eq("Tomorrow")
    end
    it "returns day after tomorrow for a date object of day after tomorrow" do 
    	expect(helper.due_when(Date.tomorrow + 1.days)).to eq("Day after Tomorrow")
    end
    it "returns a readable date for a future date" do 
    	expect(helper.due_when(10.days.from_now)).to eq(10.days.from_now.to_date)
    end
  end
  describe "#belongs_to_url" do 
  	it "returns path to project for the task" do 
  		expect(helper.belongs_to_url(@task)).to eq(url_for([@user,@project]))
  	end
  	it "returns path to task for the subtask" do 
  		expect(helper.belongs_to_url(@subtask)).to eq(url_for([@project,@task]))
  	end
  end
  describe "#available members" do 
    it "check available members for project" do 
      expect(helper.available_members(@project)).to eq([@user])
    end
    it "check available members for project" do 
      expect(helper.available_members(@task)).to eq([@task.taskable])
    end
    
  end
end
 