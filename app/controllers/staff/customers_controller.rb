class Staff::CustomersController < Staff::Base
  before_action :set_customer_form, only: [:show, :edit, :update]

  def index
    @customers = Customer.order(:id).page(params[:page])
  end

  def show
    # @customer_form уже установлен через before_action
    @customer = @customer_form.customer
  end

  def new
    @customer_form = Staff::CustomerForm.new
  end

  def create
    @customer_form = Staff::CustomerForm.new
    @customer_form.customer.assign_attributes(customer_params)

    if @customer_form.customer.save
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
      redirect_to staff_customers_path, notice: "顧客情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to staff_customers_path, notice: "顧客を削除しました。"
  end

  private

  def set_customer_form
    customer = Customer.find(params[:id])
    @customer_form = Staff::CustomerForm.new(customer)
  end

  def customer_params
    params.require(:form).permit(
      customer: [:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday, :gender],
      home_address: [:postal_code, :prefecture, :city, :address1, :address2],
      work_address: [:company_name, :division_name, :postal_code, :address1, :address2],
      personal_phones: [],
      work_phones: []
    )
  end
end