# app/presenters/customer_presenter.rb
class CustomerPresenter
  def initialize(customer)
    @customer = customer
  end

  def full_name
    [@customer.family_name, @customer.given_name].compact.join(' ').presence || "不明"
  end

  def full_name_kana
    [@customer.family_name_kana, @customer.given_name_kana].compact.join(' ').presence || "不明"
  end

  def email
    @customer.email.presence || "不明"
  end

  def birthday
    @customer.birthday.present? ? @customer.birthday.strftime("%Y-%m-%d") : "不明"
  end

  def gender
    case @customer.gender
    when "male" then "男性"
    when "female" then "女性"
    else "不明"
    end
  end
end
