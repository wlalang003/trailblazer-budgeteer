module Transaction::Cell

  class Show < Trailblazer::Cell
    property :name
    property :description
    property :amount

    def current_user
      return options[:context][:current_user]
    end

    def time
      model.created_at
    end

    def edit
      link_to "Edit", edit_transaction_path(model.id)
    end

    def delete
      link_to "Delete", transaction_path(model.id), method: :delete, data: {confirm: 'Are you sure?'}
    end

    def back
      link_to "Back to posts list", transactions_path
    end

    def transaction_type
      Transaction::Contract::Create.ttypes[model.ttype.to_s]
    end
  end
end
