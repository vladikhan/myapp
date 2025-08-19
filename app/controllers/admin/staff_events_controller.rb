class Admin::StaffEventsController < Admin::Base
  def index
    @events = StaffEvent.includes(:member).order(created_at: :desc)
  end
end