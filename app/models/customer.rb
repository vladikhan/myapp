# app/models/customer.rb
class Customer < ApplicationRecord

  has_secure_password
  
  has_many :personal_phones, -> { where(address_id: nil).order(:id) }, class_name: "Phone", dependent: :destroy, autosave: true
  has_one :home_address, dependent: :destroy, autosave: true
  has_one :work_address, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :personal_phones

  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, timeliness: { after: Date.new(1900, 1, 1), before: ->(obj) { Date.today }, allow_blank: true }
end
