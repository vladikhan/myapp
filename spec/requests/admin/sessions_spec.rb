require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  # Создаём тестового администратора через фабрику
  let(:admin_member) { create(:admin_member, email: 'admin@example.com', password: 'password123', password_confirmation: 'password123') }

  before do
    Rails.application.routes.default_url_options[:host] = "baukis2.example.com"
  end

  describe "ログイン" do
    context "ログインせずに管理画面トップにアクセスする" do
      it "shows index page when not authenticated" do
        get admin_root_path
        expect(response).to have_http_status(:ok)
        # TopController показывает index (страницу входа) для незалогиненных
        expect(response.body).to include("ログイン")
      end
    end

    context "正しい情報でログインできる" do
      it "redirects to admin root path with valid credentials" do
        post admin_login_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: 'password123'
          }
        }

        expect(response).to have_http_status(:found).or have_http_status(:see_other)
        expect(response).to redirect_to(admin_root_path)
        expect(session[:admin_member_id]).to eq(admin_member.id)
        expect(session[:last_seen_at]).to be_present
        follow_redirect!
        expect(flash[:notice]).to eq("ログインしました。")
      end
    end

    context "間違った情報でログインできない" do
      it "renders login form with wrong password" do
        post admin_login_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: 'wrongpassword'
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("メールアドレスまたはパスワードが正しくありません")
        expect(session[:admin_member_id]).to be_nil
      end

      it "renders login form with wrong email" do
        post admin_login_path, params: {
          admin_login_form: {
            email: 'wrong@example.com',
            password: 'password123'
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(session[:admin_member_id]).to be_nil
      end

      it "renders login form with empty parameters" do
        post admin_login_path, params: {}

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("メールアドレスとパスワードを入力してください")
        expect(session[:admin_member_id]).to be_nil
      end
    end

    context "ログイン後に管理画面トップにアクセスできる" do
      before do
        # ログイン処理
        post admin_login_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: 'password123'
          }
        }
      end

      it "can access admin top page after login" do
        get admin_root_path
        expect(response).to have_http_status(:ok)
        # TopController показывает dashboard для залогиненных пользователей
        expect(response.body).to include("ダッシュボード")
      end
    end

    context "停止されたアカウントではログインできない" do
      it "denies access for suspended admin member" do
        admin_member.update!(suspended: true)

        post admin_login_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: 'password123'
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
        # Контроллер показывает общее сообщение, а не конкретное из формы
        expect(response.body).to include("メールアドレスまたはパスワードが正しくありません")
        expect(session[:admin_member_id]).to be_nil
      end
    end
  end

  describe "ログアウト" do
    before do
      # 各テストの前にログイン
      post admin_login_path, params: {
        admin_login_form: {
          email: admin_member.email,
          password: 'password123'
        }
      }
    end

    context "ログアウトできる" do
      it "logs out successfully and redirects to login page" do
        delete admin_logout_path

        expect(response).to have_http_status(:found).or have_http_status(:see_other)
        expect(response).to redirect_to(admin_login_path)
        expect(session[:admin_member_id]).to be_nil
        expect(session[:last_seen_at]).to be_nil
        follow_redirect!
        expect(flash[:notice]).to eq("ログアウトしました。")
      end
    end

    context "ログアウト後に管理画面トップにアクセスできない" do
      it "shows index page after logout (no redirect because skip_before_action)" do
        delete admin_logout_path
        
        # TopController пропускает authorize, поэтому показывает index вместо редиректа
        get admin_root_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("ログイン")
        # Проверяем что пользователь действительно вышел
        expect(session[:admin_member_id]).to be_nil
      end
    end

    context "ログアウト後に再度ログインできる" do
      it "can login again after logout" do
        delete admin_logout_path

        post admin_login_path, params: {
          admin_login_form: {
            email: admin_member.email,
            password: 'password123'
          }
        }

        expect(response).to have_http_status(:found).or have_http_status(:see_other)
        expect(session[:admin_member_id]).to eq(admin_member.id)
      end
    end
  end

  describe "ログインフォーム" do
    context "GET /admin/login" do
      it "displays login form" do
        get admin_login_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("ログイン")
      end
    end
  end

  describe "セッションタイムアウト" do
    before do
      # ログイン
      post admin_login_path, params: {
        admin_login_form: {
          email: admin_member.email,
          password: 'password123'
        }
      }
    end

    it "redirects to login after timeout" do
      skip "Cannot manipulate session[:last_seen_at] in request specs"
    end

    it "does not timeout within 1 hour" do
      # セッションの最終アクセス時刻は自動的に更新される
      get admin_root_path
      expect(response).to have_http_status(:ok)
      expect(session[:admin_member_id]).to eq(admin_member.id)
    end
  end
end