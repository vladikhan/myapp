class RenameHashedPasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        remove_column :staff_members, :hashed_password, :string
        add_column :staff_members, :password_digest, :string
      end

      dir.down do
        # Добавляем только если колонки ещё нет
        remove_column :staff_members, :password_digest, :string
        # Предотвратим ошибку, если колонка уже есть
        unless column_exists?(:staff_members, :hashed_password)
          add_column :staff_members, :hashed_password, :string
        end
      end
    end
  end
end