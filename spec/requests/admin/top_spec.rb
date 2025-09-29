require "rails_helper"

RSpec.describe "Admin::Tops", type: :request do
  let(:admin_member) { create(:admin_member, password: "pw") }

  before do
    # Авторизация администратора
    post admin_login_path, params: {
      admin_login_form: {
        email: admin_member.email,
        password: "pw"
      }
    }
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_root_path
      expect(response).to have_http_status(:success)
    end
  end
end