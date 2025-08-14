class Staff::SessionsController < Staff::Base
  layout "staff"
  skip_before_action :authorize

  def new 
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: "new"
    end
  end

  def create 
  @form = Staff::LoginForm.new(login_form_params)
  if @form.email.present?
    staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
  end
  if staff_member && Staff::Authenticator.new(staff_member).authenticate(@form.password)
    if staff_member.suspended?
      flash.now.alert = "アカウントが止されています．"
      render action: "new"
    else 
      session[:staff_member_id] = staff_member.id
      session[:last_access_time] = Time.current
      flash.notice = "ログインしました."
      redirect_to :staff_root
    end
  else 
    flash.now.alert = "メールアドレスまたパスワードが正しくありません．"
    render action: "new"
  end
  end
  private def login_form_params
    params.require(:staff_login_form).permit(:email, :password)
  end

  def destroy 
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました．"
    redirect_to :staff_root
  end
end

