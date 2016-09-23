require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:subject) {Project.new(title:"demo", deadline: Time.now + 5.days, started_at: Time.now, status: "start", progress: 10)} 
  
  it "is valid with title" do
   	subject.title = "PIT"
  	expect(subject).to be_valid
  end
  it "is not valid without title" do
   	subject.title = nil
  	expect(subject).to_not be_valid
  end
  it "is valid with date" do
   	subject.started_at = "2016-09-21 09:42:06"
   	subject.deadline = "2016-09-26 10:01:38"
  	expect(subject).to be_valid
  end
  it "is not valid deadline" do
   	subject.started_at = "2016-09-21 09:42:06"
   	subject.deadline = "2016-09-15 10:01:38"
  	expect(subject).to_not be_valid
  end
  it "is not valid format of date" do
   	subject.started_at = "asdasdasd"
   	subject.deadline = "hubhnjn nnnjnj"   
  	expect(subject).to_not be_valid
  end
  it "is not valid format of date" do
    subject.started_at = 123456
    subject.deadline = 98786
    expect(subject).to_not be_valid
  end
  
  it "is valid status" do
   	subject.status = "created" 	
  	expect(subject).to be_valid
  end
  it "is not valid status" do
   	subject.status = "created at gh" 	
  	expect(subject).to_not be_valid
  end
  it "is valid progres" do
   	subject.progress = 20 	
  	expect(subject).to be_valid
  end
  it "is not valid progress" do
   	subject.progress = 12345	
  	expect(subject).to_not be_valid
  end
  it "is not valid progress" do
   	subject.progress = "asdf" 	
  	expect(subject).to_not be_valid
  end  
end
