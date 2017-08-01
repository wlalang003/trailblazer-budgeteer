#:contract
module Transaction::Contract
  class Update < Create
    include Dry

    #:property
    property :name, writeable: false
    #:property end
  end
end
#:contract end
