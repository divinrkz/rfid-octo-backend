class Api::V1::TransactionsController < ApplicationController

  def index
    transactions = Transaction.all
    render json: transactions, status: :ok
  end


  def show
    transaction = Transaction.find_by(id: params[:id])
    if transaction
      render json: transaction, status: :ok
    else
      render json: {success: false, message: 'Transaction Not found', status: 404}, status: :not_found
    end
  end

  def create
    card = Card.find_by(uuid: params[:card])
    transport_fare = validate[:fare]

    unless card
      return  render json: { success: false, message: 'Card Not found', status: 404 }, status: :not_found
    end

    if card[:balance] < transport_fare
      return render json: { success: false, message: 'Insufficient amount on Card! Please recharge', status: 400 }, status: :bad_request
    end

    transaction =  Transaction.new(card: card, fare: transport_fare)

    card[:balance] = (card[:balance] - transport_fare)
    card.save

    if transaction.save && card.save
      render json: transaction, status: 201
    else
      render json: {success: false, message: 'Transaction Not saved', status: 500}, status: :internal_server_error
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
    params.require(:transaction).permit([:card, :fare, :initial_balance, :current_balance])
  end
end
