class Customer < ApplicationRecord
include PersonalNameHolder
include EmailHolder
include PasswordHolder

  has_many :personal_phones, dependent: :destroy
  has_one :home_address, dependent: :destroy, autosave: true
  has_one :work_address, dependent: :destroy,autosave: true
  
  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, timeliness: {
    after: Date.new(1900, 1, 1),
    before: ->(obj) { Date.today },
    allow_blank: true
  }
end
