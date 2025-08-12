 class StaffMember < ApplicationRecord
   has_secure_password

   before_validation :set_email_for_index

   private
   def set_email_for_index
     self.email_for_index = email.downcase if email.present?
   end
 end
