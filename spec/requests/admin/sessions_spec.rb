RSpec.describe "Admin::Sessions", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:admin_member) }

  before do
    host! Rails.application.config.baukis2[:admin][:host]
  end

  describe "ログイン" do
    it "正しい情報でログインできる" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
      expect(response).to have_http_status(:found).or have_http_status(:see_other)
      follow_redirect! if response.redirect?
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("管理画面")
    end

    it "間違った情報ではログインできない" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "wrong" } }
      expect(response.body).to include("ログイン情報が正しくありません")
    end

    it "ログイン後に管理画面トップにアクセスできる" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
      follow_redirect! if response.redirect?
      get admin_root_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("管理画面")
    end

    it "ログインせずに管理画面トップにアクセスするとリダイレクトされる" do
      get admin_root_path
      expect(response).to have_http_status(:found).or have_http_status(:see_other)
      follow_redirect! if response.redirect?
      expect(response.body).to include("ログイン")
    end
  end

  describe "ログアウト" do
    it "ログアウトできる" do
      # sign_inはmappingエラーになるため、リクエストでログイン
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
      follow_redirect! if response.redirect?
      delete admin_logout_dev_path
      expect(response).to have_http_status(:found).or have_http_status(:see_other)
      follow_redirect! if response.redirect?
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("ログイン")
    end

    it "ログアウト後に管理画面トップにアクセスできない" do
      post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
      follow_redirect! if response.redirect?
      delete admin_logout_dev_path
      follow_redirect! if response.redirect?
      get admin_root_path
      expect(response).to have_http_status(:found).or have_http_status(:see_other)
      follow_redirect! if response.redirect?
      expect(response.body).to include("ログイン")
    end
  end

  describe "セッション管理" do
    it "複数回ログイン・ログアウトしても正常に動作する" do
      2.times do
        post admin_session_dev_path, params: { admin_member: { email: admin.email, password: "password" } }
        follow_redirect! if response.redirect?
        expect(response.body).to include("管理画面")
        delete admin_logout_dev_path
        follow_redirect! if response.redirect?
        expect(response.body).to include("ログイン")
      end
    end
  end
end