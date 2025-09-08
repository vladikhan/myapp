class Customer::TopController < Customer::Base
  skip_before_action :authorize
  layout "customer"

  def index
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end
end
