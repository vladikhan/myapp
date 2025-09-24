class Customer::EntryAcceptor
  def initialize(customer)
    @customer = customer
  end

  def accept(program)
    # проверка сроков
    return :closed if Time.current < program.application_start_time ||
                      Time.current >= program.application_end_time

    ActiveRecord::Base.transaction do
      # блокировка записи в БД
      program.reload if program.changed?
      program.lock!

      # уже есть заявка
      return :accepted if program.entries.where(customer_id: @customer.id).exists?

      # проверка лимита участников
      if max = program.max_number_of_participants
        if program.entries.where(canceled: false).count < max
          program.entries.create!(customer: @customer)
          return :accepted
        else
          return :full
        end
      else
        program.entries.create!(customer: @customer)
        return :accepted
      end
    end
  end
end