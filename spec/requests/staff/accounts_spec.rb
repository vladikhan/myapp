require 'rails_helper'

describe "Staff::Accounts", type: :request do
  before do
    host! 'staff.baukis2.example.com'
  end

  it "returns 200" do
    get staff_account_url
    expect(response).to have_http_status(:ok)
  end
end