#:createop
class Transaction::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Transaction, :new)
    step Contract::Build( constant: Transaction::Contract::Create )
  end

  #~present
  step Nested( Present )
  success :this_will_always_proceed!
  step Policy::Guard( :authorize! )
  failure :unauthorized!
  step Contract::Validate( key: :transaction )
  failure :failed!

  step Contract::Persist( )
  step :notify!

  # Below are the methods being called above. failed!, this_will_proceed!, etc...

  def this_will_always_proceed!(*)
    Rails.logger.info "This will always proceed before failure"
  end

  # current_user can be passed.
  def authorize!(options, current_user: nil, **)
    # current_user.logged_in?
    true
  end

  def unauthorized!(options, **)
    Rails.logger.error "Unauthorized" unless options["result.policy.default"].success?
  end

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New Transaction #{model.name}.")
  end

  def failed!(options, model:, **)
    Rails.logger.error "Validation Failed" if options["result.contract.default"].try(:errors)
  end

  #~present end
end
#:createop end
