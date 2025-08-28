class CustomerPresenter < ModelPresenter
  delegate :email, to: :object

  def full_name
    object.family_name.to_s + " " + object.given_name.to_s
  end

  def full_name_kana
    object.family_name_kana.to_s + " " + object.given_name_kana.to_s
  end

  def birthday
    object.birthday.present? ? object.birthday.strftime("%Y/%m/%d") : ""
  end

  def gender
    case object.gender
    when "male"
      "男性"
    when "female"
      "女性"
    else
      "-"
    end
  end
end