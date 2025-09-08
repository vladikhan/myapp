class Staff::CustomerSearchForm
  include ActiveModel::Model
  include ActiveModel::Naming
  include StringNormalizer

  attr_accessor :family_name_kana, :given_name_kana, 
                :birth_year, :birth_month, :birth_mday, 
                :address_type, :prefecture, :city, :phone_number

  def search
    normalize_values

    rel = Customer.all

    # --- Имя ---
    rel = rel.where(family_name_kana: family_name_kana) if family_name_kana.present?
    rel = rel.where(given_name_kana: given_name_kana)   if given_name_kana.present?

    # --- Дата рождения ---
    rel = rel.where(birth_year: birth_year)   if birth_year.present?
    rel = rel.where(birth_month: birth_month) if birth_month.present?
    rel = rel.where(birth_mday: birth_mday)   if birth_mday.present?

    # --- Адрес ---
    if prefecture.present? || city.present?
      case address_type
      when "home"
        rel = rel.joins(:home_address)
        rel = rel.where(home_addresses: { prefecture: prefecture }) if prefecture.present?
        rel = rel.where(home_addresses: { city: city }) if city.present?
      when "work"
        rel = rel.joins(:work_address)
        rel = rel.where(work_addresses: { prefecture: prefecture }) if prefecture.present?
        rel = rel.where(work_addresses: { city: city }) if city.present?
      when ""
  # пустой - объединяем оба адреса через left_outer_joins
  rel = rel.left_outer_joins(:home_address, :work_address)
  if prefecture.present?
    rel = rel.where("home_addresses.prefecture = :pref OR work_addresses.prefecture = :pref", pref: prefecture)
  end
  if city.present?
    rel = rel.where("home_addresses.city = :city OR work_addresses.city = :city", city: city)
  end
else
  raise ArgumentError, "Unknown address_type: #{address_type}"
      end

      rel = rel.where("addresses.prefecture = ?", prefecture) if prefecture.present?
      rel = rel.where("addresses.city = ?", city)             if city.present?
    end

    # --- Телефон ---
    if phone_number.present?
      rel = rel.joins(:personal_phones)
               .where("personal_phones.number = ?", phone_number)
    end

    rel.distinct.order(:family_name_kana, :given_name_kana)
  end

  private

  def normalize_values
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana  = normalize_as_furigana(given_name_kana)
    self.city             = normalize_as_name(city)
    self.phone_number     = normalize_as_phone_number(phone_number)&.gsub(/\D/, "")
  end
end
