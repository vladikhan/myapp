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
    @message = current_customer.messages.new(message_params)
    if @message.valid?
      render :confirm
    else
      render :new
    end
  end

  
  

  def destroy
  @message = Message.find(params[:id])
  if @message.deletable?
    @message.destroy
    redirect_to customer_messages_path, notice: 'メッセージを削除しました。'
  else
    redirect_to customer_messages_path, alert: 'このメッセージは削除できません。返信が存在します'
  end
  rescue => e
    logger.error "メッセージ削除時のエラー: #{e.message}"
    redirect_to customer_messages_path, alert: 'メッセージが見つかりません。'
  end




  private

  def message_params
    params.require(:message).permit(:subject, :body, :staff_member_id)
  rescue ActionController::ParameterMissing
    {}
  end
end