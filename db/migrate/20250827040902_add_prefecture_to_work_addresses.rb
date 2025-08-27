class AddPrefectureToWorkAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :work_addresses, :prefecture, :string
  end
end
