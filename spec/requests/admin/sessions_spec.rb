require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  let(:admin_member) { create(:admin_member, email: 'admin@example.com', password: 'password') }

  before do
    Rails.application.routes.default_url_options[:host] = "baukis2.example.com"
  end

  # describe "ログイン" do
  #   it "正しい情報でログインできる" do
  #     post admin_session_path, params: {
  #       admin_login_form: {
  #         email: admin_member.email,
  #         password: 'password'
  #       }
  #     }
  #     expect(response).to redirect_to(admin_root_path)
  #     expect(session[:admin_member_id]).to eq(admin_member.id)
  #   end
  # end
end