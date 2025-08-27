class AddAddressToWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :work_addresses, :address1, :string
    add_column :work_addresses, :address2, :string
  end
end