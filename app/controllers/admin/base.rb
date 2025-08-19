class Admin::Base < ApplicationController
  
  layout "admin"
  before_action :authorize

  private def current_admin_member
    if session[:admin_member_id]
      @current_admin_member ||= AdminMember.find_by(id: session[:admin_member_id])
    end
  end

  helper_method :current_admin_member

  private def authorize
    unless current_admin_member
      flash.notice = "管理者としてログインしてください"
      redirect_to admin_login_path
    end
  end
end
