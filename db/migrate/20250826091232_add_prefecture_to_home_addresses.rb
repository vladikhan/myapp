class AddPrefectureToHomeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :home_addresses, :prefecture, :string
  end
end