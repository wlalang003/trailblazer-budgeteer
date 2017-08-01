#:showop
class Transaction::Show < Trailblazer::Operation
  extend Representer::DSL
  step Model(Transaction, :find_by)
  representer :render do
    property :id
    property :name
    property :description
    property :amount
    property :ttype
  end
end
#:showop end
