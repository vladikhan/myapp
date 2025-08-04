class AddPasswordDigestToStaffMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :staff_members, :password_digest, :string
  end
end
