require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
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
end
 