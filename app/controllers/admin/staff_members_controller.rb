module Admin
  class StaffMembersController < Admin::Base
    def index
      @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
    end

    def show
      @staff_member = StaffMember.find(params[:id])
      redirect_to[ :edit, :admin, staff_member ]
    end

    def new
      @staff_member = StaffMember.new
    end

    def create
      @staff_member = AdminMember.new(staff_member_params)
      if @staff_member.save
        redirect_to admin_staff_members_path, notice: "職員を作成しました"
      else
        render :new
      end
    end

    def edit
      @staff_member = AdminMember.find(params[:id])
    end

    def update
      @staff_member = AdminMember.find(params[:id])
      if @staff_member.update(staff_member_params)
        redirect_to admin_staff_members_path, notice: "職員情報を更新しました"
      else
        render :edit
      end
    end

    def destroy
      @staff_member = AdminMember.find(params[:id])
      @staff_member.destroy
      redirect_to admin_staff_members_path, notice: "職員を削除しました"
    end

    private

    def staff_member_params
      params.require(:admin_member).permit(:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :start_date, :end_date, :suspended, :password)
    end
  end
end