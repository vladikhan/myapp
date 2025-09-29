# spec/requests/staff/accounts_spec.rb
require "rails_helper"

RSpec.describe "Staff::Accounts", type: :request do
  let(:staff_member) { create(:staff_member) }

before do
  host! 'staff.baukis2.example.com'  # если используется host-based routing

  post staff_session_url, params: {
    staff_login_form: { email: staff_member.email, password: "pw" }
  }
end

  describe "GET /staff/account" do
    it "returns 200 when logged in" do
      get staff_account_path
      expect(response).to have_http_status(:ok)
    end
  end
end