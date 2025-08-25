class StaffMemberFormPresenter < FormPresenter
  # Пароль только для новых сотрудников
  def password_field_block(name, options = {})
    return "".html_safe unless object&.new_record?

    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      label_text = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name}")
      m << decorated_label(name, label_text, merged_options)
      m << password_field(name, merged_options)
      m << error_messages_for(name)
    end
  end

  # Полное имя
  def full_name_block(name1, name2, options = {})
    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      label_text1 = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name1}")
      label_text2 = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name2}")
      m << decorated_label(name1, label_text1, merged_options)
      m << text_field(name1, merged_options)
      m << text_field(name2, merged_options)
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

  # Фуригана
  def full_name_kana_block(name1, name2, options = {})
    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      label_text1 = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name1}")
      label_text2 = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name2}")
      m << decorated_label(name1, label_text1, merged_options)
      m << text_field(name1, merged_options)
      m << text_field(name2, merged_options)
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

  # Даты
  def date_field_block(name, options = {})
    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      label_text = I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name}")
      m << decorated_label(name, label_text, merged_options)
      m << date_field(name, merged_options)
      m << error_messages_for(name)
    end
  end

  # Флаг приостановки аккаунта
  def suspended_check_box
    markup(:div, class: "check-boxes") do |m|
      m << form_builder.check_box(:suspended)
      m << form_builder.label(:suspended, "アカウント停止")
    end
  end
end