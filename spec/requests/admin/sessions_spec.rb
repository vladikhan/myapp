require "rails_helper"

RSpec.describe "Admin::Sessions", type: :request do
  let!(:admin_member) { create(:admin_member, password: "password") }

  describe "ログイン" do
    example "正しい情報でログインできる" do
      post admin_session_path, params: { admin_login_form: { email: admin_member.email, password: "password" } }
      expect(session[:admin_member_id]).to eq(admin_member.id)
      expect(response).to redirect_to(admin_root_path)
    end

    example "間違った情報ではログインできない" do
      post admin_session_path, params: { admin_login_form: { email: admin_member.email, password: "wrong" } }
      expect(session[:admin_member_id]).to be_nil
      expect(response.body).to include("メールアドレスまたパスワードが正しくありません")
    end
  end

  describe "ログアウト" do
    before { post admin_session_path, params: { admin_login_form: { email: admin_member.email, password: "password" } } }

    example "ログアウトできる" do
      delete admin_logout_path
      expect(session[:admin_member_id]).to be_nil
      expect(response).to redirect_to(admin_login_path)
    end
  end
end