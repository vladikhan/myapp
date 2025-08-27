class AddCityToWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :work_addresses, :city, :string
  end
end