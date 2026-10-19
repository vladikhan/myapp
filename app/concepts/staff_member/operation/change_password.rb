class StaffMember::Operation::ChangePassword < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: StaffMember::Contract::ChangePassword)
  step Contract::Validate()
  step :change_password!

  def model!(ctx, current_user:, **)
    ctx[:model] = current_user
  end

  def change_password!(ctx, **)
    new_password = ctx[:"contract.default"].new_password
    ctx[:model].password = new_password
    ctx[:model].password_confirmation = new_password
    ctx[:model].save
  end
end