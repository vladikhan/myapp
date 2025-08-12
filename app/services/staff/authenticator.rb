class Staff::Authenticator
  def initialize(staff_member)
    @staff_member = staff_member
  end

  def authenticate(raw_password)
    return false unless @staff_member
    return false if @staff_member.suspended?
    return false if @staff_member.start_date > Date.today
    return false if @staff_member.end_date && @staff_member.end_date <= Date.today
    return false unless @staff_member.password_digest.present?

    @staff_member.authenticate(raw_password)
  end
end