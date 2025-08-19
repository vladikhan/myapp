class RemoveHashedPasswordFromAdminMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :admin_members, :hashed_password, :string if column_exists?(:admin_members, :hashed_password)
  end
end
