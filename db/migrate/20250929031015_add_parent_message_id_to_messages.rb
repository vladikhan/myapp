class AddParentMessageIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :parent_message_id, :integer
  end
end
