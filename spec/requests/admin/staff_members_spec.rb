require 'rails_helper'

RSpec.describe "Admin::StaffMembers", type: :request do
  let(:administrator) { create(:administrator) }

  before do
    # Устанавливаем хост для namespace admin
    host! 'baukis2.example.com'

    # Логинимся как админ
    post admin_session_url, params: { admin_login_form: { email: administrator.email, password: 'password' } }
    follow_redirect!  # чтобы сессия корректно установилась
  end

  describe "GET /index" do
    it "リクエストが成功すること" do
      get admin_staff_members_url
      expect(response).to have_http_status(:ok)
    end

    it "職員一覧ページが表示されること" do
      get admin_staff_members_url
      expect(response.body).to include("職員一覧")  # Убедись, что на странице есть заголовок
    end
  end

  describe "ログインしていない場合" do
    before do
      delete admin_logout_url  # разлогиниваемся
    end

    it "ログインページにリダイレクトされること" do
      get admin_staff_members_url
      expect(response).to redirect_to(admin_login_url)
    end
  end
end