require "rails_helper"
RSpec.describe "routes for Widgets", :type => :routing do
  it "routes /projects to the widgets controller" do
    expect(get("/users/1/projects")).
      to route_to(:controller => "projects", :action  => "index", user_id: '1')
  end
end