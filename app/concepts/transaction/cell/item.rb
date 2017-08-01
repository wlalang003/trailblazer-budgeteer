#item
module Transaction::Cell
  class Item < Trailblazer::Cell
    def title
      link_to model.name, model unless model == nil
    end

    property :name
    property :description
    property :amount

    def created_at
      model.created_at.strftime("%d %B %Y")
    end

    def transaction_type
      Transaction::Contract::Create.ttypes[model.ttype.to_s]
    end
  end
end
#item end
