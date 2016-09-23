require 'rails_helper'

RSpec.describe Task, type: :model do
	let(:subject) { Task.new(title:"demo", priority: "ASAP", status: "started",
					 progress: 12, description: "asd fgh truh uunun", started_at: Time.now, 
					 due_date: Time.now + 5.days,taskable_type: "Task")} 
  
  it "is valid with title" do
   	subject.title = "PIT"
  	expect(subject).to be_valid
  end
  it "is not valid without title" do
   	subject.title = nil
  	expect(subject).to_not be_valid
  end
  it "is valid with priority" do
   	subject.priority = "ASAP"
  	expect(subject).to be_valid
  end
   it "is valid with priority" do
   	subject.priority = 123
  	expect(subject).to_not be_valid
  end
  it "is valid with status" do
   	subject.status = "Assigned"
  	expect(subject).to be_valid
  end
   it "is valid with status" do
   	subject.status = 123
  	expect(subject).to_not be_valid
  end
  it "is valid with progress" do
   	subject.progress = 25
  	expect(subject).to be_valid
  end
  it "is valid with progress" do
   	subject.progress = 67532467
  	expect(subject).to_not be_valid
  end
   it "is valid with progress" do
   	subject.progress = "bhb"
  	expect(subject).to_not be_valid
  end
  it "is valid with date" do
   	subject.started_at = "2016-09-21 09:42:06"
   	subject.due_date = "2016-09-26 10:01:38"
  	expect(subject).to be_valid
  end
  it "is not valid due date" do
   	subject.started_at = "2016-09-21 09:42:06"
   	subject.due_date = "2016-09-15 10:01:38"
  	expect(subject).to_not be_valid
  end
  it "is not valid format of date" do
   	subject.started_at = "asdasdasd"
   	subject.due_date = "hubhnjn nnnjnj"
  	expect(subject).to_not be_valid
  end
  it "is not valid format of date" do
   	subject.started_at = 12345	
   	subject.due_date = 23456
  	expect(subject).to_not be_valid
  end
end
