class Admin::LoginForm
  include ActiveModel::Model

  attr_accessor :email, :password
  attr_reader :admin_member

  validates :email, presence: true
  validates :password, presence: true

  def authenticate
    @admin_member = AdminMember.find_by(email: email)
    return false unless @admin_member
    
    # Проверяем suspended
    if @admin_member.suspended?
      errors.add(:base, "アカウントが停止されています")
      return false
    end
    
    # Проверяем пароль
    if @admin_member.authenticate(password)
      true
    else
      errors.add(:base, "メールアドレスまたはパスワードが正しくありません")
      false
    end
  end
end