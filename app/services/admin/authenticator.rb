class Admin::Authenticator
  def initialize(admin_member)
    @admin_member = admin_member
  end

  def authenticate(raw_password)
    @admin_member &&
      !@admin_member.suspended? &&
      @admin_member.start_date <= Date.today &&
      (@admin_member.end_date.nil? || @admin_member.end_date > Date.today) &&
      @admin_member.authenticate(raw_password)  # <- метод has_secure_password
  end
end