class Admin::SessionsController < Admin::Base
  skip_before_action :authorize, only: [:new, :create]
  skip_before_action :check_timeout, only: [:new, :create]

  def new
    @form = Admin::LoginForm.new
    render :new
  end

  def create
    @form = Admin::LoginForm.new(login_params)
    if @form.authenticate
      session[:admin_member_id] = @form.admin_member.id
      session[:last_seen_at] = Time.current
      flash.notice = "ログインしました。"
      redirect_to admin_root_path
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  rescue ActionController::ParameterMissing
    @form = Admin::LoginForm.new
    flash.now.alert = "メールアドレスとパスワードを入力してください。"
    render :new, status: :unprocessable_entity
  end

  def destroy
    session.delete(:admin_member_id)
    session.delete(:last_seen_at)
    flash.notice = "ログアウトしました。"
    redirect_to admin_login_path
  end

  private

  def login_params
    params.require(:admin_login_form).permit(:email, :password)
  end
end