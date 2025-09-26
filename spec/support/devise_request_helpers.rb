module DeviseRequestSpecHelpers
  extend ActiveSupport::Concern

  included do
    include Devise::Test::IntegrationHelpers
  end

  def login_admin(admin = nil)
    admin ||= create(:admin_member)
    sign_in admin
    admin
  end
end