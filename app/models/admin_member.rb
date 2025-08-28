class AdminMember < ApplicationRecord
  include PasswordHolder
  include EmailHolder
  has_secure_password
end



               