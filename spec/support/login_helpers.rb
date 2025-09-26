# spec/support/login_helpers.rb
module LoginHelpers
  def login_admin(admin = nil)
    admin ||= create(:admin_member) # 修正: :admin → :admin_member
    post admin_session_path, params: { admin_member: { email: admin.email, password: "password" } } # 修正: admin → admin_member, password: "password"
    admin
  end

  def login_customer(customer = nil)
    customer ||= create(:customer)
    post customer_session_path, params: { customer: { email: customer.email, password: "password" } } # password: "password"
    customer
  end
end