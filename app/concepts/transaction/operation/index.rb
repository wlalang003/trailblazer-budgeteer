#:indexop
class Transaction::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::Transaction.all.reverse_order
  end
end
#:indexop end
