class AllowedSourcePresenter
  delegate :octet1, :octet2, :octet3, :octet4, :wildcard?, to: :object

  def initialize(object, view_context)
    @object = object
    @view = view_context
  end

  private

  attr_reader :object, :view

  public

  def ip_address
    [octet1, octet2, octet3, wildcard? ? "*" : octet4].join(".")
  end

  def created_at
    object.created_at.strftime("%Y/%m/%d %H:%M:%S")
  end
end