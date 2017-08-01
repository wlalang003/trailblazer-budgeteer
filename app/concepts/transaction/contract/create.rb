#:contract
require "reform"
require "reform/form/dry"

module Transaction::Contract
  class Create < Reform::Form
    include Dry

    def self.ttypes
      {"0" => "Income", "1" => "Expense"}
    end

    def ttypes
      [self.class.ttypes.to_a, :first, :last]
    end

    #:property
    property :name
    property :description
    property :amount
    property :ttype
    #:property end

    #:validation
    validation do
      required(:name).filled
      required(:amount).filled
      required(:ttype).filled.included_in?(Transaction::Contract::Create.ttypes.keys)
    end
    #:validation end
  end
end
#:contract end
