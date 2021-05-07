class Api::V1::CardsController < ApplicationController

  def index
    cards = Card.all
    render json: cards, status: :ok
  end

  def show
    card = Card.find_by(id: params[:id])
    if card
      render json: card, status: :ok
    else
      render json: {success: false, message: 'Card Not found', status: 404}, status: :not_found
    end
  end


  def create
    card =  Card.new(uuid: validate_post[:uuid], balance: validate_post[:balance])
    if card.save
      render json: card, status: 201
    else
      render json: {success: false, message: 'Card Not saved', status: 500}, status: :internal_server_error
    end
  end

  def update
    card = Card.find_by(id: params[:id])
    if card
      card.update_attribute(:balance, validate_put[:balance])
      render json: card, status: :ok
    else
      render json: {success: false, message: 'Card Not found', status: 404}, status: :not_found
    end
  end


  def destroy
    card = Card.find_by(id: params[:id])
    if card
      Card.delete(card)
      render json: {success: true, message: 'Card Deleted Successfully', status: 200}, status: :ok
    else
      render json: {success: false, message: 'Card Not found', status: 404}, status: :not_found
    end
  end


  private def validate_post
    params.require(:card).permit([:uuid, :balance])
  end

  private def validate_put
    params.require(:card).permit([:balance])
  end
end
