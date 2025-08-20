class StaffMember < ApplicationRecord
  has_secure_password
  include StringNormalizer

  has_many :events, class_name: "StaffEvent", foreign_key: "staff_member_id"

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)  
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REGEXP, allow_blank: true }
  
  validates :start_date, presence: true
  validate :validate_dates

  before_validation :set_email_for_index

  private

  def set_email_for_index
    self.email_for_index = email.downcase if email.present?
  end

  def validate_dates
    return if start_date.blank?

    if start_date < Date.new(2000, 1, 1) || start_date > 1.year.from_now.to_date
      errors.add(:start_date, "は2000年1月1日以降、1年以内の日付でなければなりません")
    end

    if end_date.present?
      if end_date < start_date
        errors.add(:end_date, "は入社日より後でなければなりません")
      end

      if end_date > 1.year.from_now.to_date
        errors.add(:end_date, "は1年以内の日付でなければなりません")
      end
    end
  end

  public

  def active?
    return false unless start_date
    !suspended && start_date <= Date.today && (end_date.nil? || end_date >= Date.today)
  end
end