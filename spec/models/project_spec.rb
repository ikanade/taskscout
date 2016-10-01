require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:subject) {Project.new(title:"demo", deadline: Time.now + 5.days, started_at: Time.now,
                 progress: 10,description: "vdvgcv vsdgcbh gdcgvgvb")} 
  
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

  context "Associations" do
    it "has many tasks" do
      assc = described_class.reflect_on_association(:tasks)
      expect(assc.macro).to eq :has_many
    end
    it "has many project users" do
      assc = described_class.reflect_on_association(:project_users)
      expect(assc.macro).to eq :has_many
    end
    it "has many Posts " do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end
  end
end
