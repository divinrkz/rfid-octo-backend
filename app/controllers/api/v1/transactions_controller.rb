class Api::V1::TransactionsController < ApplicationController

  def index
    transactions = Transaction.all
    render json: transactions, status: :ok
  end

  def show
    transaction = Transaction.find_by(id: params[:id])
    if card
      render json: transaction, status: :ok
    else
      render json: {success: false, message: 'Transaction Not found', status: 404}, status: :not_found
    end
  end



  def create
    transaction =  Transaction.new(uuid: validate[:uuid], balance: validate[:balance])
    if transaction.save
      render json: transaction, status: 201
    else
      render json: {success: false, message: 'Card Not saved', status: 500}, status: :internal_server_error
    end
  end




  def update
    transaction = Transaction.find_by(id: params[:id])
    if transaction
      transaction.update_attribute(:uuid, validate[:uuid])
      transaction.update_attribute(:balance, validate[:balance])
      render json: transaction, status: :ok
    else
      render json: {success: false, message: 'Transaction Not found', status: 404}, status: :not_found
    end
  end


  def destroy
    transaction = Transaction.find_by(id: params[:id])
    if transaction
      Transaction.delete(transaction)
      render json: {success: true, message: 'Transaction Deleted Successfully', status: 200}, status: :ok
    else
      render json: {success: false, message: 'Transaction Not found', status: 404}, status: :not_found
    end
  end

  private def validate
    params.require(:transaction).permit([:card, :fare])
  end
end
