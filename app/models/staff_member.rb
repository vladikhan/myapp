class StaffMember < ApplicationRecord
  has_secure_password
  include StringNormalizer

  has_many :events, class_name: "StaffEvent", foreign_key: "staff_member_id"

  # Нормализация имени и фуриганы
  before_validation do
    self.family_name = normalize_as_name(family_name) if family_name
    self.given_name = normalize_as_name(given_name) if given_name
    self.family_name_kana = normalize_as_furigana(family_name_kana) if family_name_kana
    self.given_name_kana = normalize_as_furigana(given_name_kana) if given_name_kana
  end

  before_validation :normalize_email

  def normalize_email
    return if email.blank?
    self.email = email.strip.gsub(/\A[\u3000]+|[\u3000]+\z/, '')
    self.email = email.tr('Ａ-Ｚａ-ｚ０-９＠．', 'A-Za-z0-9@.')
    self.email = email.downcase
    self.email = email.gsub(/\s+/, '')
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana,
            presence: true,
            format: { with: KATAKANA_REGEXP, allow_blank: true }

  # Кастомные проверки дат
  validate :start_date_after_2000
  validate :end_date_after_start_date

  before_validation :set_email_for_index

  private

  def set_email_for_index
    self.email_for_index = email.downcase if email.present?
  end

  def start_date_after_2000
  return if start_date.blank?

  date = start_date.is_a?(Date) ? start_date : Date.parse(start_date.to_s) rescue nil
  return unless date

  if date < Date.new(2000, 1, 1)
    errors.add(
      :start_date,
      I18n.t("activerecord.errors.models.staff_member.attributes.start_date.after_or_equal_to")
    )
  end
end

def end_date_after_start_date
  return if end_date.blank? || start_date.blank?

  start_d = start_date.is_a?(Date) ? start_date : Date.parse(start_date.to_s) rescue nil
  end_d   = end_date.is_a?(Date) ? end_date : Date.parse(end_date.to_s) rescue nil
  return unless start_d && end_d

  if end_d <= start_d
    errors.add(
      :end_date,
      I18n.t("activerecord.errors.models.staff_member.attributes.end_date.after")
    )
  end
end

  def active?
    return false unless start_date
    !suspended && start_date <= Date.today && (end_date.nil? || end_date >= Date.today)
  end
end