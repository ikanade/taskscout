require 'rails_helper'

RSpec.describe Post, type: :model do
	before(:each) do
		@user = create(:user)
		@post = create(:post, user_id: @user.id)
	end

  context "validation checks " do
    it "is valid with title" do
      build(:post, title: "gh jk jn", user_id: @user.id).should be_valid
    end
    it "is not valid without title" do
      build(:post, title: nil).should_not be_valid
    end
    it "is valid with body" do
      build(:post, body: "gh jk jn cdscs",user_id: @user.id).should be_valid
    end
  end
  context "Associations" do
    it "has many user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it "has many project" do
      assc = described_class.reflect_on_association(:project)
      expect(assc.macro).to eq :belongs_to
    end
    it "has many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end

  context " Test instance methods " do  
    it "returns user as follower" do
      post = create(:post,user_id: @user.id)
      user = create(:user, id: 13)
      user.posts << post
      follow = build(:follow)
      expect(follow.follower_id) == post.user_id
    end 
  end  
end

    