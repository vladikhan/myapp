class Customer::TopController < Customer::Base
  skip_before_action :authorize
  layout "customer"

  def index
    if current_customer
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
