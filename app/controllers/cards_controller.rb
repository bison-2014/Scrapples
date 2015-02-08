class CardsController < ActionController::Base

  def index
    @all_cards = Card.all
  end
  
  def show 
    @card = Card.find(params[:card_id])
  end
  
end