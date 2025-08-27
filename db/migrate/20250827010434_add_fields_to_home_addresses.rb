class AddFieldsToHomeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :home_addresses, :city, :string
    add_column :home_addresses, :address1, :string
    add_column :home_addresses, :address2, :string
  end
end
