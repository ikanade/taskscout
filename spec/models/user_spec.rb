require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without name" do
   name = User.new(name: "mech")
  expect(name).to be_valid
  end
  it "is invalid without email" do
   email = User.new(name: "mech@gmail.com")
  expect(email).to be_valid
  end
end
