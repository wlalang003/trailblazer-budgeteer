#:update
class Transaction::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Transaction, :find_by)
    step Contract::Build( constant: Transaction::Contract::Update )
  end

  step Nested(Present)
  step Contract::Validate( key: :transaction )
  step Contract::Persist()
end
#:update end
