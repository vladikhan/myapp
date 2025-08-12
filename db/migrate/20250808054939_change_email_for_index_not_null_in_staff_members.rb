class ChangeEmailForIndexNotNullInStaffMembers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :staff_members, :email_for_index, false
  end
end
