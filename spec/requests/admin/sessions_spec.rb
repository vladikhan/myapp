require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  let!(:admin) do
    AdminMember.create!(
      email: "admin1@example.com",
      password: "password123",
      password_confirmation: "password123",
      family_name: "山田",
      given_name: "太郎",
      family_name_kana: "ヤマダ",
      given_name_kana: "タロウ",
      start_date: Date.today
    )
  end

  describe "ログイン" do
    it "正しい情報でログインできる" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password123" } }
      expect(response).to redirect_to(admin_root_dev_path)
      follow_redirect!
      expect(response.body).to include("ログアウト")
    end

    it "間違った情報ではログインできない" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "wrong" } }
      expect(response.body).to include("ログイン情報が正しくありません")
    end
  end

  describe "ログアウト" do
    it "ログアウトできる" do
      # Логинимся
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password123" } }
      follow_redirect!

      # Логаут
      delete admin_logout_path
      expect(response).to redirect_to(admin_login_path)
    end
  end
end
