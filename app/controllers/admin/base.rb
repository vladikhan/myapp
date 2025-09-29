# app/controllers/admin/base.rb
class Admin::Base < ApplicationController
  layout "admin"
  before_action :authorize
  before_action :check_timeout

  TIMEOUT = 1.hour

  def current_admin_member
    @current_admin_member ||= AdminMember.find_by(id: session[:admin_member_id])
  end
  helper_method :current_admin_member

  private

  def authorize
    if current_admin_member.nil? || current_admin_member.suspended?
      reset_session
      flash[:notice] = "管理者としてログインしてください"
      redirect_to admin_login_path
    end
  end

  def check_timeout
    if session[:last_seen_at] && session[:last_seen_at] < TIMEOUT.ago
      reset_session
      redirect_to admin_login_path, alert: "セッションがタイムアウトしました"
    end
    # 更新 времени последнего доступа
    session[:last_seen_at] = Time.current
  end
end