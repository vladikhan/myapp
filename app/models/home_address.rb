# app/models/home_address.rb
class HomeAddress < ApplicationRecord
  belongs_to :customer
  has_many :phones, class_name: "AddressPhone", foreign_key: :address_id, dependent: :destroy
end