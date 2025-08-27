class AddCompanyNameToWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :work_addresses, :company_name, :string
  end
end