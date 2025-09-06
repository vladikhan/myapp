# app/models/customer.rb
class Customer < ApplicationRecord
  has_secure_password

  # Личные телефоны, не связанные с адресами
  has_many :personal_phones, dependent: :destroy, autosave: true

  # Адреса
  has_one :home_address, dependent: :destroy, autosave: true
  has_one :work_address, dependent: :destroy, autosave: true

  # Телефоны для адресов
  has_many :address_phones, through: :home_address, source: :phones
  has_many :address_phones, through: :work_address, source: :phones

  # Nested attributes для формы
  accepts_nested_attributes_for :personal_phones
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :work_address

  # Валидации
  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, timeliness: { after: Date.new(1900,1,1), before: ->(obj){ Date.today }, allow_blank: true }

  # Автоматическая установка года, месяца, дня рождения
  before_save do
    if birthday
      self.birth_year  = birthday.year
      self.birth_month = birthday.month
      self.birth_mday  = birthday.mday
    end
  end
end
