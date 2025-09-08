class HomeAddress < ApplicationRecord
  belongs_to :customer
  has_many :phones, class_name: "AddressPhone", foreign_key: :address_id, dependent: :destroy

  validates :postal_code, :prefecture, :city, :address1, presence: true
  validates :company_name, :division_name, absence: true
end
