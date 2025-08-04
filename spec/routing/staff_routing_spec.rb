require "rails_helper"

RSpec.describe "Staff routing", type: :routing do
  it "routes /staff/login to staff/session#new" do
    expect(get: "/staff/login").to route_to(
      controller: "staff/session",
      action: "new"
    )
  end

  it "routes /staff to staff/top#index" do
    expect(get: "/staff").to route_to(
      controller: "staff/top",
      action: "index"
    )
  end
end
