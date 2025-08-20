class StaffMember < ApplicationRecord
  has_secure_password
  include StringNormalizer

  has_many :events, class_name: "StaffEvent", foreign_key: "staff_member_id"

  before_validation do
    self.family_name = normalize_as_name(family_name) if family_name
    self.given_name = normalize_as_name(given_name) if given_name
    self.family_name_kana = normalize_as_furigana(family_name_kana) if family_name_kana
    self.given_name_kana = normalize_as_furigana(given_name_kana) if given_name_kana
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REGEXP, allow_blank: true }

  before_validation :set_email_for_index

  private

  def set_email_for_index
    self.email_for_index = email.downcase if email.present?
  end

  def active?
    return false unless start_date
    !suspended && start_date <= Date.today && (end_date.nil? || end_date >= Date.today)
  end
end