class Admin::Base < ApplicationController
  layout "admin"
  before_action :authorize, except: [:new, :create]  # ← Или используйте skip_before_action
  before_action :check_timeout, except: [:new, :create]

  TIMEOUT = 1.hour

  def current_admin_member
    @current_admin_member ||= AdminMember.find_by(id: session[:admin_member_id]) if session[:admin_member_id]
  end
  helper_method :current_admin_member

  private

  def authorize
    unless current_admin_member && !current_admin_member.suspended?
      reset_session
      flash.alert = "管理者としてログインしてください"  # ← Изменить на :alert
      redirect_to admin_login_path
    end
  end

  def check_timeout
    if session[:last_seen_at] && session[:last_seen_at] < TIMEOUT.ago
      reset_session
      flash.alert = "セッションがタイムアウトしました"
      redirect_to admin_login_path
    end
    session[:last_seen_at] = Time.current
  end
end