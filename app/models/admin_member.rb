class AdminMember < ApplicationRecord
  include EmailHolder
  has_secure_password
end



               