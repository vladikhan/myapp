class Staff::RepliesController < Staff::Base
  before_action :prepare_message

  def new
    @reply = StaffMessage.new
  end

  def confirm
    @reply = StaffMessage.new(staff_message_params)
    @reply.staff_member = current_staff_member
    @reply.parent = @message
    if @reply.valid?
      render :confirm
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def create
    @reply = StaffMessage.new(staff_message_params)
    @reply.staff_member = current_staff_member
    @reply.parent = @message
    if @reply.save
      flash.notice = "問い合わせに送信しました。"
      redirect_to outbound_staff_messages_path
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  private

  def prepare_message
    @message = CustomerMessage.find(params[:message_id])
  end

  def staff_message_params
    params.require(:staff_message).permit(:subject, :body)
  end
end