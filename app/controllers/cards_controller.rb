class CardsController < ActionController::Base
  
  def new
    @card = Card.new
  end
  
  def create
    @card
  end
  
  def show 
    @card = Card.find(params[:id])
    
  end
end