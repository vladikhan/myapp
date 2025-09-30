# spec/support/features_spec_helper.rb
module FeaturesSpecHelper
  def switch_namespace(namespace)
    # Логика переключения пространства имен
    case namespace
    when :customer
      @current_namespace = :customer
    when :staff
      @current_namespace = :staff
    end
  end

  def login_as_customer(customer)
    visit customer_session_path
    fill_in "customer_login_form[email]", with: customer.email
    fill_in "customer_login_form_password", with: customer.password || "password"
    click_button "ログイン"
  end

  def login_as_staff_member(staff_member)
    visit staff_session_path
    fill_in "staff_member[email]", with: staff_member.email
    fill_in "staff_member[password]", with: staff_member.password || "password"
    click_button "ログイン"
  end
end