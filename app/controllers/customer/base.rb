class Customer::Base < ApplicationController
  before_action :authorize

  private def current_customer
    return unless customer_id = cookies.signed[:customer_id] || session[:customer_id]

    @current_customer ||= Customer.find_by(id: customer_id)
  end

  helper_method :current_customer

  private def authorize
    return if current_customer

    flash.alert = "ログインして下さい。"
    redirect_to customer_login
  end
end
