# spec/requests/admin/sessions_spec.rb
require "rails_helper"

RSpec.describe "Admin::Sessions", type: :request do
  # Подключаем Devise helper для request specs
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:admin_member) } # фабрика для AdminMember

  # Настроим host для теста, чтобы пройти constraints
  before do
    host! Rails.application.config.baukis2[:admin][:host]
  end

  describe "ログイン" do
    it "正しい情報でログインできる" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
      follow_redirect!  # Перейдем по редиректу после успешного логина
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("管理画面") # пример проверки текста на странице после логина
    end

    it "間違った情報ではログインできない" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "wrong" } }
      expect(response.body).to include("ログイン情報が正しくありません")
    end
  end

  describe "ログアウト" do
    it "ログアウトできる" do
      sign_in admin
      delete admin_logout_dev_path
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("ログイン") # проверяем, что вернулись на страницу логина
    end
  end
end