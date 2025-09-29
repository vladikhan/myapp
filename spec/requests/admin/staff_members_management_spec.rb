require "rails_helper"

RSpec.describe "管理者による職員管理", type: :request do
  let(:admin_member) { create(:admin_member, password: "pw") }

  before do
    # Авторизация администратора перед каждым тестом
    post admin_login_path, params: {
      admin_login_form: {
        email: admin_member.email,
        password: "pw"
      }
    }
  end

  describe "一覧" do
    it "成功" do
      get admin_staff_members_path
      expect(response).to have_http_status(:ok)
    end

    it "停止フラグがセットされたら強制的にログアウト" do
      admin_member.update!(suspended: true)
      get admin_staff_members_path
      expect(response).to redirect_to(admin_login_path)
    end

    it "セッションタイムアウト" do
      travel_to Admin::Base::TIMEOUT.from_now + 1.second
      get admin_staff_members_path
      expect(response).to redirect_to(admin_login_path)
    end
  end

  describe "新規登録" do
    let(:params_hash) { attributes_for(:staff_member) }

    it "職員一覧ページにリダイレクト" do
      post admin_staff_members_path, params: { staff_member: params_hash }
      expect(response).to redirect_to(admin_staff_members_path)
    end

    it "例外ActionController::ParameterMissingが発生" do
      expect { post admin_staff_members_path }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "更新" do
    let(:staff_member) { create(:staff_member) }
    let(:params_hash) { attributes_for(:staff_member) }

    it "suspendedフラグをセットする" do
      patch admin_staff_member_path(staff_member), params: { staff_member: { suspended: true } }
      staff_member.reload
      expect(staff_member).to be_suspended
    end

    it "password_digestの値は書き換え不可" do
      old_digest = staff_member.password_digest
      patch admin_staff_member_path(staff_member), params: { staff_member: { password_digest: "x" } }
      staff_member.reload
      expect(staff_member.password_digest).to eq(old_digest)
    end
  end
end