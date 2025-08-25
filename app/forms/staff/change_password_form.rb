class Staff::ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :object, :current_password, :new_password, :new_password_confirmation

  validates :new_password, presence: { message: "は必須です" }, confirmation: { message: "と確認が一致しません" }
  validates :new_password_confirmation, presence: { message: "は必須です" }

  validate :correct_current_password

  def save
    return false unless valid?

    object.password = new_password
    object.save!
  end

  private

  def correct_current_password
    return if object && Staff::Authenticator.new(object).authenticate(current_password)
    errors.add(:current_password, :wrong)
  end
end