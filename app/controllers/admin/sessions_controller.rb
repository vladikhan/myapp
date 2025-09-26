class Admin::SessionsController < Admin::Base
  skip_before_action :authenticate_admin_member!, only: [:new, :create]

  def create
    @form = Admin::LoginForm.new(login_params)
    if @form.authenticate
      session[:admin_member_id] = @form.admin_member.id
      flash.notice = "ログインしました。"
      redirect_to admin_root_path
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_member_id)
    flash.notice = "ログアウトしました。"
    redirect_to admin_root_path
  end

  private

  def login_params
    params.require(:admin_login_form).permit(:email, :password)
  end
end