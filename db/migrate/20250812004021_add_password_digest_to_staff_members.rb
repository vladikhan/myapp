class AddPasswordDigestToStaffMembers < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:staff_members, :password_digest)
      if column_exists?(:staff_members, :hashed_password)
        rename_column :staff_members, :hashed_password, :password_digest
      else
        add_column :staff_members, :password_digest, :string
      end
    end
  end
end