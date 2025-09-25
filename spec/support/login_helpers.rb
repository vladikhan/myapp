# spec/support/login_helpers.rb
module LoginHelpers
  # -----------------------
  # Admin login
  # -----------------------
  def login_admin(admin = nil)
    admin ||= create(:admin)
    post admin_session_path, params: {
      admin_session: {
        email: admin.email,
        password: admin.password || 'password'
      }
    }
    follow_redirect! if response.redirect?
    admin
  end

  def logout_admin
    delete destroy_admin_session_path
    follow_redirect! if response.redirect?
  end

  # -----------------------
  # Staff login
  # -----------------------
  def login_staff(staff = nil)
    staff ||= create(:staff_member)
    post staff_session_path, params: {
      staff_member_session: {
        email: staff.email,
        password: staff.password || 'password'
      }
    }
    follow_redirect! if response.redirect?
    staff
  end

  def logout_staff
    delete destroy_staff_session_path
    follow_redirect! if response.redirect?
  end

  # -----------------------
  # Customer login
  # -----------------------
  def login_customer(customer = nil)
    customer ||= create(:customer)
    post customer_session_path, params: {
      customer_session: {
        email: customer.email,
        password: customer.password || 'password'
      }
    }
    follow_redirect! if response.redirect?
    customer
  end

  def logout_customer
    delete destroy_customer_session_path
    follow_redirect! if response.redirect?
  end
end

# Подключаем в RSpec
RSpec.configure do |config|
  config.include LoginHelpers, type: :request
end
