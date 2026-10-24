class Staff::PasswordsController < Staff::Base
  def show
    redirect_to :edit_staff_password
  end

  def edit
    @change_password_form = StaffMember::Contract::ChangePassword.new(current_staff_member)
  end

  def update
    result = StaffMember::Operation::ChangePassword.call(
      params: staff_change_password_params.to_h.stringify_keys,
      current_user: current_staff_member
    )
    if result.success?
      flash.notice = "パスワードを変更しました．"
      redirect_to :staff_account
    else
      @change_password_form = result[:'contract.default']
      flash.now.alert = "入力に誤りがあります．"
      render action: "edit"
    end
  end

  private def staff_change_password_params
    params.require(:staff_change_password_form).permit(:current_password, :new_password, :new_password_confirmation)
  end
end
