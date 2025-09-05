class ChangeAddressNullableInPhones < ActiveRecord::Migration[6.1]
  def change
    change_column_null :phones, :address_id, true
  end
end
