module Api::V1
  class TransactionsController < ApplicationController

    def show
      result = run Transaction::Show
      render json: result['representer.render.class'].new(result['model']).to_json
    end
  end
end