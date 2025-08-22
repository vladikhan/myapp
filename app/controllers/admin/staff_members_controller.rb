class Admin::StaffMembersController < Admin::Base
  layout "admin"

  # index, show, new, edit, create, update, destroy
  # авторизация уже выполняется в Admin::Base, дублировать не нужно

  def index
    @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
  end

  def show
    staff_member = StaffMember.find(params[:id])
    redirect_to [:edit, :admin, staff_member]
  end

  def new
    @staff_member = StaffMember.new
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)
    if @staff_member.save
      flash[:notice] = "職員を登録しました"
      redirect_to admin_staff_members_path
    else
      flash.now[:alert] = @staff_member.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @staff_member = StaffMember.find(params[:id])
    if @staff_member.update(staff_member_params)
      flash[:notice] = "職員アカウントを更新しました"
      redirect_to admin_staff_members_path
    else
      flash.now[:alert] = @staff_member.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy!
    flash[:notice] = "職員を削除しました"
    redirect_to admin_staff_members_path
  end

  private

  def staff_member_params
  params.require(:staff_member).permit(
    :email, :password, :family_name, :given_name,
    :family_name_kana, :given_name_kana,
    :start_date, :end_date, :suspended
  )
  end
end