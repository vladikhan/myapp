class CreateMyHashes < ActiveRecord::Migration[6.1]
  def change
    create_table :my_hashes do |t|
      t.string :table, null: false
      t.string :column, null: false
      t.string :key, null: false

      t.boolean :lock

      t.timestamps
    end
    add_index :my_hashes, [ :table, :column, :key ], unique: true
  end
end
