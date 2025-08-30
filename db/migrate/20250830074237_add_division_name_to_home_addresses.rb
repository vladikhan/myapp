class AddDivisionNameToHomeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :home_addresses, :division_name, :string
  end
end
