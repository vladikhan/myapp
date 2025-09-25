class Customer::MessagesController < Customer::Base
  
  def index
    @messages = current_customer.messages.includes(:staff_member)
      .order(created_at: :desc)
    @messages = @messages.page(params[:page]) if defined?(Kaminari)
  end

  def show
    @message = current_customer.messages.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "メッセージが見つかりません。"
    redirect_to customer_messages_path
  end

  def new
    @message = current_customer.outbound_messages.build
  end

  def create
    @message = current_customer.outbound_messages.build(message_params)
    
    if @message.save
      flash[:notice] = "メッセージを送信しました。"
      redirect_to customer_messages_path
    else
      flash.now[:alert] = "入力に誤りがあります。"
      render :new
    end
  end

  def confirm
    @message = current_customer.outbound_messages.build(message_params)
    
    if @message.valid?
      render :confirm
    else
      flash.now[:alert] = "入力に誤りがあります。"
      render :new
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.update!(deleted: true)
    flash[:notice] = "メッセージを削除しました。"
    redirect_to customer_messages_path
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "メッセージが見つかりません。"
    redirect_to customer_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:subject, :body, :staff_member_id)
  rescue ActionController::ParameterMissing
    {}
  end
end