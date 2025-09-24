class Customer::AccountsController < Customer::Base
  def show
    @customer = current_customer
  end

  def edit
    @customer_form = Customer::AccountForm.new(current_customer)
  end

  # PATCH /customer/account/confirm
  def confirm
    @customer_form = Customer::AccountForm.new(current_customer)

    if request.patch? && params[:customer].present?
      permitted_params = params.require(:customer).permit(
        :email, :password, :family_name, :given_name,
        :family_name_kana, :given_name_kana, :birthday, :gender,
        home_address_attributes: [:id, :postal_code, :prefecture, :city, :address1, :address2],
        work_address_attributes: [:id, :company_name, :division_name, :postal_code, :prefecture, :city, :address1, :address2],
        personal_phones_attributes: [:id, :number]
      )

      @customer_form.assign_attributes(permitted_params)
    end

    render :confirm
  end

  # PATCH /customer/account
  def update
    @customer_form = Customer::AccountForm.new(current_customer)

    if params[:customer].present?
      permitted_params = params.require(:customer).permit(
        :email, :password, :family_name, :given_name,
        :family_name_kana, :given_name_kana, :birthday, :gender,
        home_address_attributes: [:id, :postal_code, :prefecture, :city, :address1, :address2],
        work_address_attributes: [:id, :company_name, :division_name, :postal_code, :prefecture, :city, :address1, :address2],
        personal_phones_attributes: [:id, :number]
      )

      @customer_form.assign_attributes(permitted_params)

      if @customer_form.save
        flash.notice = "アカウント情報を更新しました。"
        redirect_to :customer_account
      else
        flash.now.alert = "入力に誤りがあります。"
        render :confirm  # Важно рендерить confirm, чтобы данные не потерялись
      end
    else
      redirect_to edit_customer_account_path
    end
  end
end