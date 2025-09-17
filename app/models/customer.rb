class Customer < ApplicationRecord
  has_secure_password

  # Личные телефоны, не связанные с адресами
  has_many :personal_phones, dependent: :destroy, autosave: true

  has_many :entries,dependent: :destroy
  has_many :programs, through: :entries
  has_many :messages
  has_many :outbound_messages, class_name: "CustomerMessage",
    foreign_key: "customer_id"
  has_many :inbound_messages, class_name: "StaffMessage",
    foreign_key: "customer_id"
  
  # Адреса
  has_many :addresses, dependent: :destroy
  has_one :home_address, dependent: :destroy, autosave: true
  has_one :work_address, dependent: :destroy, autosave: true

  # Телефоны для адресов
  has_many :home_address_phones, through: :home_address, source: :phones
  has_many :work_address_phones, through: :work_address, source: :phones

  # Nested attributes для формы
  accepts_nested_attributes_for :personal_phones
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :work_address

  # Валидации
  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, timeliness: { after: Date.new(1900,1,1), before: ->(obj){ Date.today }, allow_blank: true }

  # Проверка, заблокирован ли пользователь
  def suspended?
    respond_to?(:suspended) ? suspended : false
  end

  # Проверка активности по датам
  def active_today?
    today = Date.today
    start_ok = respond_to?(:start_date) ? (start_date.nil? || start_date <= today) : true
    end_ok   = respond_to?(:end_date)   ? (end_date.nil? || end_date > today) : true
    start_ok && end_ok
  end

  # Автоматическая установка года, месяца, дня рождения
  before_save do
    if birthday
      self.birth_year  = birthday.year
      self.birth_month = birthday.month
      self.birth_mday  = birthday.mday
    end
  end
end
