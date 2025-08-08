class Admin::SessionsController < Admin::Base
  layout "admin"
  def new 
    if current_admin_member
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end
  def create 
    @form = Admin::LoginForm.new(login_form_params)
    if @form.email.present?
      admin_member = 
      AdminMember.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if admin_member && Admin::Authenticator.new(admin_member).authenticate(@form.password)
      if admin_member.suspended?
        flash.now.alert = "アカウントが止されています．"
        render action :"new"
      else
        session[:admin_member_id] = admin_member.id
        flash.notice = "ログインしました."
        redirect_to :admin_root
      end
    else
      flash.now.alert =  "メールアドレスまたパスワードが正しくありません．"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:email, :password)
  end

  
  def destroy
    session.delete(:admin_member_id)
    flash.notice = "ログアウトしました．"
    redirect_to admin_login_path
  end
end

