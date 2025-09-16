class Customer::AccountForm
  include ActiveModel::Model

  attr_accessor :customer, :inputs_home_address, :inputs_work_address
  delegate :persisted?, :valid?, :save, to: :customer

  def initialize(customer)
    @customer = customer || Customer.new(gender: "male")
    (2 - @customer.personal_phones.size).times { @customer.personal_phones.build }
    self.inputs_home_address = @customer.home_address.present?
    self.inputs_work_address = @customer.work_address.present?
    @customer.build_home_address unless @customer.home_address
    @customer.build_work_address unless @customer.work_address
  end

  def assign_attributes(params = {})
    @params = params || {}

    customer.assign_attributes(customer_params)
    customer.home_address.assign_attributes(home_address_params) if inputs_home_address
    customer.work_address.assign_attributes(work_address_params) if inputs_work_address

    if @params[:personal_phones_attributes]
      customer.personal_phones.each_with_index do |phone, i|
        phone.assign_attributes(number: @params[:personal_phones_attributes][i][:number])
      end
    end
  end

  def save
    ActiveRecord::Base.transaction do
      customer.save!
      customer.home_address.save! if inputs_home_address
      customer.work_address.save! if inputs_work_address
      customer.personal_phones.each(&:save!)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def customer_params
    # Используем slice, чтобы выбрать нужные ключи из хэша
    @params.slice(
      :email, :password, :family_name, :given_name,
      :family_name_kana, :given_name_kana, :birthday, :gender
    )
  end

  def home_address_params
    @params[:home_address_attributes] || {}
  end

  def work_address_params
    @params[:work_address_attributes] || {}
  end
end