class TransactionsController < ApplicationController

  # GET /transactions
  def index
    #@transactions = Transaction.all
    run Transaction::Index
    render cell(Transaction::Cell::Index, result["model"])
  end

  # GET /transactions/1
  def show
    run Transaction::Show
    render cell(Transaction::Cell::Show, result["model"])
  end

  # GET /transactions/new
  def new
    # @transaction = Transaction.new
    run Transaction::Create::Present
    render cell(Transaction::Cell::New, @form)
  end

  # GET /transactions/1/edit
  def edit
    run Transaction::Update::Present
    render cell(Transaction::Cell::Edit, @form)
  end

  # POST /transactions
  def create
    # @transaction = Transaction.new(transaction_params)

    # respond_to do |format|
    #   if @transaction.save
    #     format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
    #     format.json { render :show, status: :created, location: @transaction }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @transaction.errors, status: :unprocessable_entity }
    #   end
    # end
    run Transaction::Create do |result|
      flash[:notice] = "#{result["model"].name} has been created"
      return redirect_to transactions_path
    end

    # This can also be called this way
    # Transaction::Create.call(params, options)

    render cell(Transaction::Cell::New, @form), layout: false
  end

  # PATCH/PUT /transactions/1
  def update
    # respond_to do |format|
    #   if @transaction.update(transaction_params)
    #     format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @transaction }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @transaction.errors, status: :unprocessable_entity }
    #   end
    # end

    op =
    run Transaction::Update do |result|
      flash[:notice] = "#{result["model"].name} has been saved"
      return redirect_to transaction_path(result["model"].id)
    end
    render cell(Transaction::Cell::Edit, @form), layout: false
  end

  # DELETE /transactions/1
  def destroy
    run Transaction::Delete

    flash[:alert] = "Transaction deleted"
    redirect_to transactions_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_transaction
  #     @transaction = Transaction.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def transaction_params
  #     params.require(:transaction).permit(:name, :description, :ttype)
  #   end
end

# 40-45 lines
