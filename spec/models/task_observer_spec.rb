require 'rails_helper'

RSpec.describe TaskObserver, type: :observer do
  
  context " test methods " do
	   it " return date in words" do
		   	task = FactoryGirl.build(:task, due_date: "2016-10-07 10:01:38")
		   	TaskObserver.due_when(task.due_date) == "Tomorrow"
	   end
  end
end
