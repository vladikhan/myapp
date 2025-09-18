class Staff::MessagesController < Staff::Base
  def index
    @messages = Message.not_deleted.sorted.page(params[:page])
  end

  #GET
  def inbound
    @messages = CustomerMessage.not_deleted.sorted.page(params[:page])
    render action: "index"
  end

  #GET 
  def outbound
    @messages = StaffMessage.not_deleted.sorted.page(params[:page])
    render action: "index"
  end

  #GET
  def deleted
    @messages = Message.deleted.sorted.page(params[:page])
    render action: "index"
  end
end