require 'rails_helper'

RSpec.describe "Admin::StaffEvents", type: :request do
  let(:admin_member) { create(:admin_member, password: 'password') }

  before do
    Rails.application.routes.default_url_options[:host] = 'baukis2.example.com'

    # логин через форму, соответствующую контроллеру
    post admin_login_path, params: {
      admin_login_form: {
        email: admin_member.email,
        password: 'password'
      }
    }
    follow_redirect! if response.redirect?
  end
end