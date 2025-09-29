  # spec/support/login_helpers.rb
module LoginHelpers
  def login_admin(admin_member = nil)
    admin_member ||= create(:admin_member, password: "pw")
    post admin_login_path, params: {
      admin_login_form: {
        email: admin_member.email,
        password: "pw"
      }
    }
    admin_member
  end

  def login_customer(customer = nil)
    customer ||= create(:customer)
    post customer_session_path, params: { customer: { email: customer.email, password: "password" } } # password: "password"
    customer
  end
end