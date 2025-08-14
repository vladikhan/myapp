class Staff::Base < ApplicationController
  layout "staff"
  before_action :authorize
  # before_action :check_account
  # before_action :check_timeout
  # before_action :set_staff_member


  private


  def staff_member
    current_staff_member
  end

  def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  helper_method :current_staff_member, :staff_member

  def authorize
    unless current_staff_member
      flash[:notice] = "職員(しょくいん)としてログインしてください"
      redirect_to staff_login_path
    end
  end

  def check_account
    if current_staff_member && !current_staff_member.active?
      session.delete(:staff_member_id)
      flash[:notice] = "アカウントが無効になりました"
      redirect_to staff_root_path
    end
  end

  TIMEOUT = 60.minutes

  def check_timeout
    return unless current_staff_member

    last_time = session[:last_access_time]
    if last_time && last_time >= TIMEOUT.ago
      session[:last_access_time] = Time.current
    else
      session.delete(:staff_member_id)
      flash[:notice] = "セッションがタイムアウトしました"
      redirect_to staff_login_path
    end
  end
end