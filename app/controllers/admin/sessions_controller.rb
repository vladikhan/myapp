class Admin::SessionsController < Admin::Base
  skip_before_action :authorize, only: [:new, :create]

  def new
    # форма логина
  end

  def create
    @form = Admin::LoginForm.new(login_params)
    if @form.authenticate
      session[:admin_member_id] = @form.admin_member.id
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def destroy
    session[:admin_member_id] = nil
    redirect_to admin_login_path
  end

  private

  def login_params
    params.require(:admin_login_form).permit(:email, :password)
  end
end