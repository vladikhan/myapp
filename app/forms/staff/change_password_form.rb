class Staff::ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :object, :current_password, :new_password, :new_password_confirmation

 validate do
  if object.nil?
    errors.add(:base, "Staff member not found")
  elsif !Staff::Authenticator.new(object).authenticate(current_password)
    errors.add(:current_password, :wrong)
  end
end

 def save
  return false if object.nil?
  return false unless valid?

  object.password = new_password
  object.save!
  end
end