class Customer::AccountForm
  include ActiveModel::Model

  attr_accessor :customer, :inputs_home_address, :inputs_work_address

  delegate :persisted?, :valid?, to: :customer

  # Инициализация формы
  def initialize(customer)
    @customer = customer || Customer.new(gender: "male")

    # Делаем минимум 2 телефона
    (2 - @customer.personal_phones.size).times { @customer.personal_phones.build }

    # Управление отображением блоков адресов
    self.inputs_home_address = @customer.home_address.present?
    self.inputs_work_address = @customer.work_address.present?

    # Строим адреса, если их нет
    @customer.build_home_address unless @customer.home_address
    @customer.build_work_address unless @customer.work_address
  end

  # Присвоение параметров из формы
  def assign_attributes(params = {})

  # Основные атрибуты customer
  customer.assign_attributes(params.except(:home_address_attributes, :work_address_attributes, :personal_phones_attributes))

  # Домашний адрес
  if params[:home_address_attributes]
    if customer.home_address
      customer.home_address.assign_attributes(params[:home_address_attributes])
    else
      customer.build_home_address(params[:home_address_attributes])
    end
  end

  # Рабочий адрес
  if params[:work_address_attributes]
    if customer.work_address
      customer.work_address.assign_attributes(params[:work_address_attributes])
    else
      customer.build_work_address(params[:work_address_attributes])
    end
  end

  # Телефоны
  if params[:personal_phones_attributes]
    params[:personal_phones_attributes].each do |i, phone_params|
      phone = customer.personal_phones.find { |p| p.id.to_s == phone_params[:id].to_s } || customer.personal_phones.build
      phone.assign_attributes(phone_params)
    end
  end
  end

  # Сохранение данных
  def save
    ActiveRecord::Base.transaction do
      customer.save!
      customer.home_address.save! if inputs_home_address
      customer.work_address.save! if inputs_work_address
      customer.personal_phones.each(&:save!)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    false
  end

  # Для использования в view
  def personal_phones
    customer.personal_phones.to_a
  end
end