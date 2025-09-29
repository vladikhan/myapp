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

  
  describe "ログインしていない場合" do
    before do
      delete admin_logout_url  # разлогиниваемся
    end
  end
end