class Admin::Base < ApplicationController
  
  layout "admin"
  before_action :authorize
  

  def current_admin_member
  @current_admin_member ||= AdminMember.find_by(id: session[:admin_member_id])
  end

helper_method :current_admin_member

  private def authorize
    unless current_admin_member
      flash.notice = "管理者としてログインしてください"
      redirect_to admin_login_path
    end
  end
end
