# app/forms/staff/customer_search_form.rb
class Staff::CustomerSearchForm
  include ActiveModel::Model
  include ActiveModel::Naming   # важно для FormPresenter

  attr_accessor :family_name_kana, :given_name_kana, 
                :birth_year, :birth_month, :birth_mday, 
                :address_type, :prefecture, :city, :phone_number

  # Основной метод поиска
  def search
    customers = Customer.all

    # Фильтр по имени
    customers = customers.where(family_name_kana: family_name_kana) if family_name_kana.present?
    customers = customers.where(given_name_kana: given_name_kana) if given_name_kana.present?

    # Фильтр по дате рождения
    if birth_year.present?
      customers = customers.where('extract(year from birthday) = ?', birth_year)
    end
    if birth_month.present?
      customers = customers.where('extract(month from birthday) = ?', birth_month)
    end
    if birth_mday.present?
      customers = customers.where('extract(day from birthday) = ?', birth_mday)
    end

    # Фильтр по адресу
    if address_type.present?
      address_assoc = address_type == "work" ? :work_address : :home_address
      customers = customers.joins(address_assoc)
      customers = customers.where("#{address_assoc.to_s.pluralize}.prefecture = ?", prefecture) if prefecture.present?
      customers = customers.where("#{address_assoc.to_s.pluralize}.city = ?", city) if city.present?
    end

    # Фильтр по телефону
    if phone_number.present?
      customers = customers.left_joins(:personal_phones)
                           .where('personal_phones.number = ?', phone_number)
    end

    customers.distinct
  end
end
