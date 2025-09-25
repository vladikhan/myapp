require 'rails_helper'

RSpec.describe "管理者による職員管理", type: :request do
  let!(:admin) { create(:admin_member, password: "pw") }
  let!(:staff_member) { create(:staff_member) }

  before do
    Rails.application.config.hosts << "www.example.com"
    # логинимся
    post admin_login_path, params: { email: admin.email, password: "pw" }
    follow_redirect!
  end

  describe "新人登録" do
    it "職員一覧ページにリダイレクト" do
      post staff_members_path, params: { staff_member: { email: "new@example.com", password: "pw" } }
      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("職員一覧")
    end

    it "パラメータ不足で例外 ActionController::ParameterMissing が発生" do
      expect { post staff_members_path, params: {} }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "更新" do
    it "suspendedフラグをセット" do
      patch staff_member_path(staff_member), params: { staff_member: { suspended: true } }
      follow_redirect!

      staff_member.reload
      expect(staff_member.suspended).to be true
    end

    it "password_digestの値は変更されない" do
      old_digest = staff_member.password_digest
      patch staff_member_path(staff_member), params: { staff_member: { email: "test@example.com" } }
      follow_redirect!

      staff_member.reload
      expect(staff_member.password_digest).to eq(old_digest)
    end
  end

  describe "ログアウト" do
    it "管理者は正しくログアウトできる" do
      delete admin_logout_path
      follow_redirect!

      expect(session[:admin_member_id]).to be_nil
      expect(response).to redirect_to(admin_login_path)
    end
  end
end
