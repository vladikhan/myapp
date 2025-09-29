class Customer::SessionsController < Customer::Base
  skip_before_action :authorize

  def new
    if current_customer
      redirect_to customer_root_path
    else
      @form = Customer::LoginForm.new
    end
  end

  def create
    Rails.logger.debug params.inspect

    @form = Customer::LoginForm.new(login_form_params)
    customer = Customer.find_by("LOWER(email) = ?", @form.email.downcase) if @form.email.present?

    if customer && Customer::Authenticator.new(customer).authenticate(@form.password)
      if @form.remember_me?
        cookies.permanent.signed[:customer_id] = customer.id
      else
        cookies.delete(:customer_id)
        session[:customer_id] = customer.id 
      end
      flash[:notice] = "ログインしました。"
      redirect_to customer_root_path
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません。"
      render :new
    end
  rescue => e
    Rails.logger.error "Customer login error: #{e.message}\n#{e.backtrace.join("\n")}"
    flash.now[:alert] = "システムエラーが発生しました。"
    render :new
  end

  def destroy
    cookies.delete(:customer_id)
    session.delete(:customer_id)
    @current_customer = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to customer_login_path
  end

  private

  def login_form_params
    params.require(:customer_login_form).permit(:email, :password, :remember_me)
  end
end
