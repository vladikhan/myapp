module PasswordHolder
  extend ActiveSupport::Concern

  included do
    # Подключаем стандартное хеширование пароля через Rails
    has_secure_password
  end
end
