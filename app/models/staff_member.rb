 class StaffMember < ApplicationRecord
   has_secure_password

   has_many :events, class_name: "StaffEvent", dependent: :destroy

   before_validation :set_email_for_index

   private
   def set_email_for_index
     self.email_for_index = email.downcase if email.present?
   end

    def active?
    return false unless start_date
    !suspended && start_date <= Date.today && (end_date.nil? || end_date >= Date.today)
    end

 end
