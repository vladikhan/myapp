class WorkAddress < ApplicationRecord
  belongs_to :customer

  before_validation do
    self.company_name = normalize_as_name(company_name)
    self.division_name = normalize_as_name(division_name)
  end

  validates :company_name, presence: true

private_methods

def normalize_as_name(value)
  value.to_s.strip.presence
end
end
