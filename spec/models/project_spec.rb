require 'rails_helper'
  describe Project do
    it "is invalid without a title" do
      FactoryGirl.build(:project, title: nil).should_not be_valid
    end
  end
