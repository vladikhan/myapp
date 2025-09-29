# spec/requests/staff/accounts_spec.rb
require "rails_helper"

RSpec.describe "Staff::Accounts", type: :request do
  let(:staff_member) { create(:staff_member, password: "pw") }

  before do
    # Логинимся через request spec
    post staff_session_path, params: {
      email: staff_member.email,
      password: "pw"
    }
  end

  describe "GET /staff/account" do
    it "returns 200 when logged in" do
      get staff_account_path
      expect(response).to have_http_status(:ok)
    end
  end
end