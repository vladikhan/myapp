class Admin::Base < ApplicationController
  
  layout "admin"
  before_action :authorize

    TIMEOUT = 1.hour.freeze
  

  def current_admin_member
  @current_admin_member ||= AdminMember.find_by(id: session[:admin_member_id])
  end

  helper_method :current_admin_member

  private 
  def authorize
    if current_admin_member.nil? || current_admin_member.suspended?
      reset_session
      flash.notice = "管理者としてログインしてください"
      redirect_to admin_login_path
    end
  end
end
