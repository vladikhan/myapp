class AddEmailForIndexToStaffMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :staff_members, :email_for_index, :string, null: false
    add_index :staff_members, :email_for_index, unique: true
  end
end
