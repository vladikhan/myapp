require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  let!(:admin) { create(:admin_member, password: "pw") }

  before do
    # разрешаем тестовый host
    Rails.application.config.hosts << "www.example.com"
  end

  describe "ログイン" do
    it "正しい情報でログインできる" do
      post admin_login_path, params: { email: admin.email, password: "pw" }
      follow_redirect!  # редирект после успешного логина

      expect(session[:admin_member_id]).to eq(admin.id)
      expect(response).to have_http_status(:ok)
    end

    it "間違った情報ではログインできない" do
      post admin_login_path, params: { email: admin.email, password: "wrong" }
      follow_redirect!  # редирект на login

      expect(session[:admin_member_id]).to be_nil
      expect(response.body).to include("メールアドレスまたはパスワードが正しくありません")
    end
  end

  describe "ログアウト" do
    it "ログアウトできる" do
      # сначала логинимся
      post admin_login_path, params: { email: admin.email, password: "pw" }
      follow_redirect!

      delete admin_logout_path
      follow_redirect!

      expect(session[:admin_member_id]).to be_nil
      expect(response).to redirect_to(admin_login_path)
    end
  end
end
