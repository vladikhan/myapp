class AddIndexesToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_index :customers, [:birth_year, :birth_month, :birth_mday], if_not_exists: true
    add_index :customers, [:birth_month, :birth_mday], if_not_exists: true
    add_index :customers, :given_name_kana, if_not_exists: true
    add_index :customers, [:birth_year, :family_name_kana, :given_name_kana],
      name: "idx_birth_year_furigana", if_not_exists: true
    add_index :customers, [:birth_year, :given_name_kana], if_not_exists: true
    add_index :customers, [:birth_month, :family_name_kana, :given_name_kana],
      name: "idx_birth_month_furigana", if_not_exists: true
    add_index :customers, [:birth_month, :given_name_kana], if_not_exists: true
    add_index :customers, [:birth_mday, :family_name_kana, :given_name_kana],
      name: "idx_birth_mday_furigana", if_not_exists: true
    add_index :customers, [:birth_mday, :given_name_kana], if_not_exists: true
  end
end