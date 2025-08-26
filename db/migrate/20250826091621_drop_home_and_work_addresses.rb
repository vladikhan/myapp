class DropHomeAndWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    drop_table :home_addresses do |t|
      t.bigint :customer_id, null: false
      t.string :postal_code
      t.string :address
      t.string :prefecture
      t.timestamps
    end

    drop_table :work_addresses do |t|
      t.bigint :customer_id, null: false
      t.string :postal_code
      t.string :address
      t.string :prefecture
      t.timestamps
    end
  end
end
