#:showop
class Transaction::Show < Trailblazer::Operation
  step Model(Transaction, :find_by)
end
#:showop end
