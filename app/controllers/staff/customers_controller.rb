class Staff::CustomersController < Staff::Base
  before_action :set_customer_form, only: [:show, :edit, :update]

  def index
    @search_form = Staff::CustomerSearchForm.new(search_params)
    @customers = @search_form.search
    @customers = @customers.page(params[:page]) if defined?(Kaminari)
  rescue => e
    logger.error "Index error: #{e.message}"
    @customers = Customer.normalize_as_name
    flash.now[:alert] = "エラーが発生しました。"
  end

  def show
    @customer = @customer_form.customer
  end

def new
  @customer_form = Staff::CustomerForm.new
end

  def create
  @customer_form = Staff::CustomerForm.new
  @customer_form.assign_attributes(customer_form_params)
  if @customer_form.save
    redirect_to staff_customers_path, notice: "顧客を登録しました。"
  else
    render :new
  end
  end

  def edit
    @customer = @customer_form.customer
  end

  def update
    @customer_form.customer.assign_attributes(customer_params)
    if @customer_form.customer.save
      flash.notice = "顧客情報を更新しました。"
      redirect_to staff_customers_path
    else
      render :edit
    end
  end


def destroy
  customer = Customer.find_by(id: params[:id])
  if customer
    begin
      customer.messages.destroy_all
      customer.destroy
      flash[:notice] = "顧客アカウントを削除しました。"
    rescue ActiveRecord::InvalidForeignKey => e
      flash[:alert] = "削除できませんでした。関連付けられたデータが存在します。"
    end
  else
    flash[:alert] = "顧客が見つかりませんでした。"
  end
  redirect_to staff_customers_path
end
 



  private

  def search_params
  params[:search]&.permit(
    :family_name_kana, :given_name_kana, :birth_year, 
    :birth_month, :birth_mday, :address_type, 
    :prefecture, :city, :phone_number
  )
  end

  def customer_form_params
  params.require(:customer_form).permit(
    :email, :password, :family_name, :given_name,
    :family_name_kana, :given_name_kana, :birthday, :gender,
    home_address_attributes: [:postal_code, :prefecture, :city, :address1, :address2],
    work_address_attributes: [:company_name, :division_name, :postal_code, :prefecture, :city, :address1, :address2],
    personal_phones_attributes: [:number]
  )
  end

  def set_customer_form
    customer = Customer.find_by(id: params[:id])
    if customer
      @customer_form = Staff::CustomerForm.new(customer)
    else
      redirect_to staff_customers_path, alert: "顧客が見つかりませんでした。"
    end
  end

  def account_params
    params.require(:customer).permit(
      :name, :email,
      work_address_attributes: [:id, :company_name, :department, :postal_code]
    )
  end

  def customer_params
    params.require(:customer).permit(
      :email, :password, :family_name, :given_name,
      :family_name_kana, :given_name_kana, :birthday, :gender,
      home_address_attributes: [:postal_code, :prefecture, :city, :address1, :address2],
      work_address_attributes: [:company_name, :division_name, :postal_code, :prefecture, :city, :address1, :address2],
      personal_phones_attributes: [:number]
    )
  end
end
