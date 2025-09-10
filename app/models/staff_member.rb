class StaffMember < ApplicationRecord
  has_secure_password
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder

  has_many :events, class_name: "StaffEvent", foreign_key: "staff_member_id"
  has_many :programs, foreign_key: "registrant_id", dependent: :restrict_with_exception

  # 正規化 (Normalization)
  
  before_validation :normalize_email
  before_validation :set_email_for_index

# 有効な状態かどうか
  def active?
    !suspended? && (end_date.nil? || end_date >= Date.today)
  end

  def deletable?
    programs.empty?
  end

  # メールアドレスの正規化
  def normalize_email
    return if email.blank?

    self.email = email.strip.gsub(/\A[\u3000]+|[\u3000]+\z/, '')
    self.email = email.tr('Ａ-Ｚａ-ｚ０-９＠．', 'A-Za-z0-9@.')
    self.email = email.downcase
    self.email = email.gsub(/\s+/, '')
  end

  

  # カスタム日付チェック
  validate :start_date_after_2000
  validate :end_date_after_start_date

  private

  # email_for_indexの設定
  def set_email_for_index
    self.email_for_index = email.downcase if email.present?
  end

  # 入社日が2000年以降であること
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

  # 退職日が入社日より後であること
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
end