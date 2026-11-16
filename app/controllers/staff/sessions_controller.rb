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
    staff_member = StaffMember.find_by(email_for_index: @form.email.downcase) if @form.email.present?
    if staff_member && Staff::Authenticator.new(staff_member).authenticate(@form.password)
      if staff_member.suspended?
        staff_member.events.create!(type: "rejected")
        flash.now.alert = "アカウントが止されています．"
        render action: "new"
      else
        session[:staff_member_id] = staff_member.id
        session[:last_access_time] = Time.current
        staff_member.events.create!(type: "logged_in")
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
    current_staff_member.events.create!(type: "logged_out") if current_staff_member
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました．"
    redirect_to :staff_root
  end
end
