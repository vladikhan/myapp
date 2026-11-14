class CustomerMessage < Message
  scope :unprocessed, -> { where(status: STATUS_UNREAD, deleted: false) }
end
