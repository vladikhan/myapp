class WorkAddress < ApplicationRecord
  belongs_to :customer

  has_many :phones, class_name: "AddressPhone", foreign_key: :address_id

  before_validation do
    self.company_name = normalize_as_name(company_name)
    self.division_name = normalize_as_name(division_name)
  end

  validates :company_name, presence: true


def normalize_as_name(value)
  value.to_s.strip.presence
end
end
