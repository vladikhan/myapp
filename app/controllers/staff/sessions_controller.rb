class Staff::SessionsController < Staff::Base
  layout "staff"

  def new 
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: "new"
    end
  end

  def create 
    @form = Staff::LoginForm.new(params[:staff_login_form])
    if @form.email.present?
      staff_member =
      StaffMember.find_by("LOWER(email) = ?", @form.email.downcase)
    end

    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      if staff_member.suspended?
        flash.now.alert= "アカウントが止されています．"
        render action :"new"
      else 
        session[:staff_member_id] = staff_member.id
        flash.notice = "ログインしました."
        redirect_to :staff_root
      end
    else 
      flash.now.alert = "メールアドレスまたパスワードが正しくありません．"
      render action: "new"
    end
  end

  def destroy 
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました．"
    redirect_to :staff_root
  end
end
