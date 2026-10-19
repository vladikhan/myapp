class StaffMember::Contract::ChangePassword < Reform::Form
  property :current_password, virtual: true
  property :new_password, virtual: true
  property :new_password_confirmation, virtual: true

  validates :current_password, presence: { message: "パスワードは必須です" }
  validates :new_password, presence: { message: "は必須です" }
  validates :new_password_confirmation, presence: { message: "は必須です" }
  validate :passwords_match
  validate :correct_current_password

  private

  def passwords_match
    return if new_password == new_password_confirmation

    errors.add(:new_password, "と確認が一致しません")
  end

  def correct_current_password
    return if current_password.blank?
    return if Staff::Authenticator.new(model).authenticate(current_password)

    errors.add(:current_password, "を正しく入力してください")
  end
end