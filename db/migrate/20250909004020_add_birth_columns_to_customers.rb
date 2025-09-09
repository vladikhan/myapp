class AddBirthColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :birth_year, :integer, if_not_exists: true
    add_column :customers, :birth_month, :integer, if_not_exists: true
    add_column :customers, :birth_mday, :integer, if_not_exists: true
  end
end
