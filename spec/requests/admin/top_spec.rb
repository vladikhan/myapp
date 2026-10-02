require 'rails_helper'

RSpec.describe "Admin::Tops", type: :request do
  describe "GET /index" do
    before { host! 'staff.baukis2.example.com' }

    it "returns http success" do
      get admin_root_path
      expect(response).to have_http_status(:success)
    end
  end
end