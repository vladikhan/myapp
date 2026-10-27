require 'rails_helper'

RSpec.describe "Admin::StaffMembers", type: :request do
  let(:admin_member) { create(:admin_member, email: "admin@example.com", password: "password") }

  before do
    # Устанавливаем host для тестового окружения
    Rails.application.routes.default_url_options[:host] = "baukis2.example.com"
  end

  describe "GET /index" do
    context "ログインしている場合" do
      before do
        # Логиним администратора перед тестами
        post admin_session_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: "password"
          }
        }
      end

      it "リクエストが成功すること" do
        get admin_staff_members_path
        expect(response).to have_http_status(:ok)
      end

      it "職員一覧ページが表示されること" do
        get admin_staff_members_path
        expect(response.body).to include("職員一覧") # замените на текст из вашего шаблона
      end
    end

    context "ログインしていない場合" do
      it "ログインページにリダイレクトされること" do
        get admin_staff_members_path
        expect(response).to redirect_to(admin_session_path)
      end
    end
  end
end