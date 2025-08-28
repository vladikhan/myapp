module PasswordHolder
  extend ActiveSupport::Concern
  
  def password=(raw_password)
    case raw_password
    when String
      self.hashed_password = raw_password.strip.empty? ? nil : BCrypt::Password.create(raw_password)
    when nil
      self.hashed_password = nil
    end
  end
end