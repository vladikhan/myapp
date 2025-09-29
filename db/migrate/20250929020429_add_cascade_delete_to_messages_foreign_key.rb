class AddCascadeDeleteToMessages < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :messages, :customers
    add_foreign_key :messages, :customers, on_delete: :cascade
  end
end