require "rails_helper"

describe "管理者による職員管理", "ログイン前" do
  before { host! 'baukis2.example.com' } # <- добавляем сюда

  include_examples "a protected admin controller", "admin/staff_members"
end

describe "管理者による職員管理" do
  let(:administrator) { create(:administrator) }

  before do
    host! 'baukis2.example.com'   # <- host для admin

    post admin_session_url, params: {
      admin_login_form: { email: administrator.email, password: "password" }
    }
    follow_redirect!
  end

  describe "新人登録" do
    let(:params_hash) { attributes_for(:staff_member) }

    example "職員一覧ページにリダイレクト" do
      post admin_staff_members_url, params: { staff_member: params_hash }
      expect(response).to redirect_to(admin_staff_members_url)
    end

    example "例外 ActionController::ParameterMissing が発生" do
      expect { post admin_staff_members_url, params: {} }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "更新" do
    let(:staff_member) { create(:staff_member) }
    let(:params_hash) { attributes_for(:staff_member) }

    example "suspended フラグをセットする" do
      params_hash.merge!(suspended: true)
      patch admin_staff_member_url(staff_member), params: { staff_member: params_hash }
      staff_member.reload
      expect(staff_member).to be_suspended
    end

    example "password_digest の値は変更されない" do
      params_hash.delete(:password)
      expect {
        patch admin_staff_member_url(staff_member), params: { staff_member: params_hash }
      }.not_to change { staff_member.reload.password_digest }
    end
  end

  describe "ログアウト" do
    example "管理者は正しくログアウトできる" do
      delete admin_logout_url
      expect(response).to redirect_to(admin_login_url)
    end
  end
end