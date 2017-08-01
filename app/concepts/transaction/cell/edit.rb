#:edit
module Transaction::Cell
  class Edit < New

    def show
      render :edit
    end

    def back
      link_to "Back", transaction_path(model.id)
    end

    def delete
      link_to "Delete Post", transaction_path(model.id), method: :delete
    end
  end
end
#:edit end
