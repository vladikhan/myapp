require 'rails_helper'

RSpec.describe "Staff routing", type: :routing do
  it "routes /staff/login to staff/sessions#new" do
    expect(get: "/staff/login").to route_to(
      controller: "staff/sessions",
      action: "new"
    )
  end

  it "routes /staff/logout to staff/sessions#destroy" do
    expect(delete: "/staff/logout").to route_to(
      controller: "staff/sessions",
      action: "destroy"
    )
  end

  it "routes POST /staff/login to staff/sessions#create" do
    expect(post: "/staff/login").to route_to(
      controller: "staff/sessions",
      action: "create"
    )
  end
end
