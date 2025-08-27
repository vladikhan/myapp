class AddDivisionNameToWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :work_addresses, :division_name, :string
  end
end
