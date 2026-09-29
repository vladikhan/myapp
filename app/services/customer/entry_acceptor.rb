class Customer::EntryAcceptor
  def initialize(customer)
    @customer = customer
  end

  def accept(_program_id)
    raise if Time.current < program.application_start_time
    return :closed if Time.current >= program.application_end_time

    ActiveRecord::Base.transaction do
      program.lock!
      if program.entries.where(cutomer_id: @customer.id).exists?
        return :accepted
      elsif max = program.max_number_of_participants
        return :full unless program.entries.where(canceled: false).count < max

        program.entries.create!(customer: @customer)
        return :accepted

      else
        program.entries.create!(customer: @customer)
        return :accepted
      end
    end
  end
end
