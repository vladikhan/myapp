class Staff::AjaxController < ApplicationController
  before_action :check_source_ip_address
  before_action :authorize
  before_action :check_timeout
end

# GET
def message_count
  render plain: CustomerMessage.unprocessed.count
end

# POST
def add_tag
  message = Message.find(params[:id])
  message.add_tag(params[:label])
  render plain: "ok"
end

# DELETE
def remove_tag
  message = Message.find(params[:id])
  message.remove_tag(params[:label])
  render plain: "ok"
end

private def check_source_ip_address
  return if AllowedSource.include?("staff", request.ip)

  render plain: "Forbidden", status: :forbidden
end

private def current_staff_member
  return unless session[:staff_member_id]

  StaffMember.find_by(id: session[:staff_member_id])
end

private def authorize
  return if current_staff_member && current_staff_member.active?

  render plain: "Forbidden", status: :forbidden
end

private def check_timeout
  unless session[:last_access_time] &&
         session[:last_access_time] >= Staff::Base::TIMEOUT.ago
    session.delete(:staff_member_id)
    render plain: "Forbidden", status: :forbidden
  end
end
