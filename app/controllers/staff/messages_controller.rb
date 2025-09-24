class Staff::MessagesController < Staff::Base
  def index
    @messages = Message.not_deleted.sorted.page(params[:page])
    .tagged_as(params[:tag_id])
  end

  #GET
  def inbound
    @messages = CustomerMessage.not_deleted.sorted.page(params[:page])
    .tagged_as(params[:tag_id])
    render action: "index"
  end

  #GET 
  def outbound
    @messages = StaffMessage.not_deleted.sorted.page(params[:page])
    .tagged_as(params[:tag_id])
    render action: "index"
  end

  #GET
  def deleted
    @messages = Message.deleted.sorted.page(params[:page])
    .tagged_as(params[:tag_id])
    render action: "index"
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    message = CustomerMessage.find(params[:id])
    message.update_column(:deleted, true)
    flash.notice = "問い合わせを削除しました。"
    redirect_back(fallback_location: :staff_root)
  end

  def bulk_delete
    ids = params[:form][:messages].values
              .select { |h| h[:destroy] == "1" }
              .map { |h| h[:id] }
    Messages.where(id: ids).update_all(deleted: true)
    flash.notice = "選択したメッセージを削除しました。"
    redirect_to action: :index
  end

  def destroy_selected
    ids = params[:messages]&.select { |_, v| v['_destroy'] == "1" }&.keys || []
    Message.where(id: ids).update_all(deleted: true)
    flash[:notice] = "選択したメッセージを削除しました。"
    redirect_to deleted_staff_messages_path
  end
end