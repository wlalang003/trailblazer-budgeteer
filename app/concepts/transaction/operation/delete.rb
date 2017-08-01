#:delete
class Transaction::Delete < Trailblazer::Operation
  step Model(Transaction, :find_by)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end
#:delete end
