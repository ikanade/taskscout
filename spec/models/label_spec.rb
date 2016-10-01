require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:subject) {Label.new(name:"jku", color: "red", labelable_type: "Task")} 
  
  it "is valid with name" do
   	subject.name = "bhj"
  	expect(subject).to be_valid
  end
  it "is not valid with name" do
   	subject.name = nil
  	expect(subject).to_not be_valid
  end
  it "is valid with color" do
   	subject.color = "blue"
  	expect(subject).to be_valid
  end
  it "is not valid with color" do
   	subject.color = nil
  	expect(subject).to_not be_valid
  end

  context "Associations" do
    it " belongs to labelable" do
      assc = described_class.reflect_on_association(:labelable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
