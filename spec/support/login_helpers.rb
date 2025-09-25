# spec/support/login_helpers.rb
module LoginHelpers
  def login_admin(admin = nil)
    admin ||= create(:admin)
    post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
    admin
  end

  def login_customer(customer = nil)
    customer ||= create(:customer)
    post customer_session_path, params: { customer: { email: customer.email, password: customer.password } }
    customer
  end
end
