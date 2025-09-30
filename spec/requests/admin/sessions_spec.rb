require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  # Создаём тестового администратора через фабрику
  let(:admin_member) { create(:admin_member, email: 'admin@example.com', password: 'password123', password_confirmation: 'password123') }

  before do
    Rails.application.routes.default_url_options[:host] = "baukis2.example.com"
  end

  describe "ログイン" do
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
        expect(response.body).to include("管理者トップページ").or include("管理画面")
      end
    end

    context "ログインせずに管理画面トップにアクセスするとリダイレクトされる" do
      it "redirects to login page when not authenticated" do
        get admin_root_path
        expect(response).to have_http_status(:found).or have_http_status(:see_other)
        expect(response).to redirect_to(admin_login_path)
        follow_redirect!
        expect(flash[:alert]).to eq("管理者としてログインしてください")
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
        expect(response.body).to include("アカウントが停止されています")
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
      it "cannot access admin area after logout" do
        delete admin_logout_path
        follow_redirect!

        # ログアウト後に管理画面トップにアクセスを試みる
        get admin_root_path
        expect(response).to have_http_status(:found).or have_http_status(:see_other)
        expect(response).to redirect_to(admin_login_path)
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
      # セッションの最終アクセス時刻を2時間前に設定
      session[:last_seen_at] = 2.hours.ago

      get admin_root_path
      expect(response).to have_http_status(:found).or have_http_status(:see_other)
      expect(response).to redirect_to(admin_login_path)
      follow_redirect!
      expect(flash[:alert]).to eq("セッションがタイムアウトしました")
    end

    it "does not timeout within 1 hour" do
      # セッションの最終アクセス時刻を30分前に設定
      session[:last_seen_at] = 30.minutes.ago

      get admin_root_path
      expect(response).to have_http_status(:ok)
      expect(session[:admin_member_id]).to eq(admin_member.id)
    end
  end
end