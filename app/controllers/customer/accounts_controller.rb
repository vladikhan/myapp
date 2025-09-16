class Customer::AccountsController < Customer::Base
  def show
    @customer = current_customer
  end

  def edit
    @customer_form = Customer::AccountForm.new(current_customer)
  end

  #PATCH
    def confirm
    @customer_form = Customer::AccountForm.new(current_customer)
    
    permitted_params = params.require(:customer).permit(
      :email, :password, :family_name, :given_name,
      :family_name_kana, :given_name_kana, :birthday, :gender,
      home_address_attributes: [:postal_code, :prefecture, :city, :address1, :address2],
      work_address_attributes: [:company_name, :division_name, :postal_code, :prefecture, :city, :address1, :address2],
      personal_phones_attributes: [:number]
    )

    @customer_form.assign_attributes(permitted_params)

    if @customer_form.valid?
      render :confirm
    else
      flash.now.alert = "入力誤りがあります。"
      render :edit
    end
    end

  def update
    @customer_form = Customer::AccountForm.new(current_customer)
    @customer_form.assign_attributes(params.require(:customer).permit!)

    if @customer_form.save
      flash.notice = "アカウント情報を更新しました。"
      redirect_to :customer_account
    else
      flash.now.alert = "入力に誤りがあります。"
      render :edit
    end
  end
end