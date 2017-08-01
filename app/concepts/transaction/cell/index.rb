#:index
module Transaction::Cell
  class Index < Trailblazer::Cell
    def total
      return "No transactions" if model.size == 0
      model.size
    end
  end
end
#:index end
