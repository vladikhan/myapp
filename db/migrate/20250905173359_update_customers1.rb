class UpdateCustomers1 < ActiveRecord::Migration[6.1]
  def up
    # Проверяем, есть ли колонки
    if column_exists?(:customers, :birth_year) &&
       column_exists?(:customers, :birth_month) &&
       column_exists?(:customers, :birth_mday)

      execute <<-SQL
        UPDATE customers
        SET birth_year  = EXTRACT(YEAR FROM birthday),
            birth_month = EXTRACT(MONTH FROM birthday),
            birth_mday  = EXTRACT(DAY FROM birthday)
        WHERE birthday IS NOT NULL
      SQL
    end
  end

  def down
    if column_exists?(:customers, :birth_year)
      execute <<-SQL
        UPDATE customers
        SET birth_year  = NULL,
            birth_month = NULL,
            birth_mday  = NULL
      SQL
    end
  end
end