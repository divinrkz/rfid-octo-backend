class Api::V1::CardsController < ApplicationController

  def index
    cards = Card.all
    render json: cards, status: :ok
  end

  def show
    puts params[:id]
    card = Card.find_by(id: params[:id])
    if card
      render json: card, status: :ok
    else
      render json: {success: false, message: 'Card Not found', status: 404}, status: :not_found
    end
  end


  def create
    card =  Card.new(UUID: validate[:UUID])
    if card.save
      render json: card, status: 201
    else
      render json: {success: false, message: 'Card Not saved', status: 500}, status: :internal_server_error
    end
  end


  private def validate
    params.require(:rfid_card).permit([:UUID])
  end
end
