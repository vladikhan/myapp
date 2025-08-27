class CreateAddressPhones < ActiveRecord::Migration[6.1]
  def change
    create_table :address_phones do |t|
      t.references :address, null: false, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end