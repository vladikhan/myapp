class Admin::StaffMembersController < Admin::Base
  layout "admin"
    before_action :authorize

    def index
      unless current_admin_member
        redirect_to admin_login_path
      end
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
    flash[:notice] = "職員アカウントを作成しました"
    redirect_to admin_staff_members_path
  else
    # Показываем ошибки на форме
    flash.now[:alert] = @staff_member.errors.full_messages.join(", ")
    Rails.logger.debug(@staff_member.errors.full_messages)  # Логи для дебага
    render :new
  end
end

    def update
      @staff_member = StaffMember.find(params[:id])
      if @staff_member.update(staff_member_params)
        flash.notice = "職員アカウントを更新しました"
        redirect_to admin_staff_members_path
      else
        render :edit
      end
    end

    def destroy
      @staff_member = StaffMember.find(params[:id])
      @staff_member.destroy!
      flash.notice = "職員を削除しました"
      redirect_to admin_staff_members_path
    end

    private def authorize
      unless current_admin_member
        flash.notice = "管理者(かんりしゃ)としてログインしてください"
        redirect_to admin_login_path
      end
    end

    def staff_member_params
      params.require(:staff_member).permit(
        :email, :password, :family_name,
        :family_name_kana, :given_name_kana,
        :start_date, :end_date, :suspended
      )
    end
end
