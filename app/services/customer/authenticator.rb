class Customer::Authenticator
  def initialize(customer)
    @customer = customer
  end

  def authenticate(raw_password)
  return false unless @customer
  return false if @customer.suspended?
  return false unless @customer.respond_to?(:start_date) ? (@customer.start_date.nil? || @customer.start_date <= Date.today) : true
  return false unless @customer.respond_to?(:end_date)   ? (@customer.end_date.nil? || @customer.end_date > Date.today) : true

  @customer.authenticate(raw_password)
  end
end
