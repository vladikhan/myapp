class AddCompanyNameToHomeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :home_addresses, :company_name, :string
  end
end
