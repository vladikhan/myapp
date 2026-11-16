class EnsurePasswordDigestOnAdminMembers < ActiveRecord::Migration[6.1]
  def up
    return if column_exists?(:admin_members, :password_digest)

    add_column :admin_members, :password_digest, :string
  end

  def down
    remove_column :admin_members, :password_digest if column_exists?(:admin_members, :password_digest)
  end
end
