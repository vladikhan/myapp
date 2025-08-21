class StaffMemberPresenter < ModelPresenter
  delegate :suspended?, to: :object

  # Показывает галочку, если сотрудник приостановлен
  def suspended_mark
    if object.nil?
      raw("&#x2610;") # пустой квадрат, если объекта нет
    else
      suspended? ? raw("&#x2611;") : raw("&#x2610;")
    end
  end
end