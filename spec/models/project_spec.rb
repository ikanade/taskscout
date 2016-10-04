require 'rails_helper'

RSpec.describe Project, type: :model do
  describe Project do
  it "has a valid factory" do
    Factory.create(:project).should be_valid
  end
  it "is not valid without title" do
   	Factory.build(:project, title: nil).should_not be_valid
  end
  end
end
