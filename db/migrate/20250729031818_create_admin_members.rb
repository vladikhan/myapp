class CreateAdminMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_members do |t|
      t.string :email, null: false # mail
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false 
      t.string :given_name_kana, null: false
      t.string :password_digest
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end

    add_index :admin_members, "LOWER(email)", unique: true
    add_index :admin_members, [:family_name_kana, :given_name_kana]
  end
end