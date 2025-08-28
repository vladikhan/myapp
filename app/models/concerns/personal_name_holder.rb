module PersonalNameHolder
  extend ActiveSupport::Concern

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  NAME_REGEX     = /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{Latin}ー－]+\z/

  included do
  include StringNormalizer
  before_validation do
    self.family_name = normalize_as_name(family_name) if family_name
    self.given_name = normalize_as_name(given_name) if given_name
    self.family_name_kana = normalize_as_furigana(family_name_kana) if family_name_kana
    self.given_name_kana = normalize_as_furigana(given_name_kana) if given_name_kana
    end

  validates :family_name, :given_name,
            presence: { message: "は必須です" },
            format: { with: NAME_REGEX, message: "には漢字・ひらがな・カタカナ・英字で入力してください" }

  validates :family_name_kana, :given_name_kana,
            presence: { message: "は必須です" },
            format: { with: KATAKANA_REGEXP, message: "はカタカナで入力してください" }
end
end