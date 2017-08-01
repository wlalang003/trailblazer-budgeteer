#:createop
class Transaction::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Transaction, :new)
    step Contract::Build( constant: Transaction::Contract::Create )
  end

  #~present
  step Nested( Present )
  step Contract::Validate( key: :transaction )
  failure :failed!

  step Contract::Persist( )
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New Transaction #{model.name}.")
  end

  def failed!(options, model:, **)
    Rails.logger.error "Validation Failed"
  end
  #~present end
end
#:createop end
