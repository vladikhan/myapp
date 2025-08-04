class Customer::TopController < ApplicationController
  layout "customer"

  def index
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end
end
