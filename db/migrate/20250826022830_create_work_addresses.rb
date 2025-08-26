class CreateWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :work_addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
