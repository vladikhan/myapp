class Admin::TopController < Admin::Base
  layout "admin" 
  
  skip_before_action :authorize
  
  def index
    if current_admin_member
      render action: "dashboard"
    else 
      render action: "index"
    end
  end
end
