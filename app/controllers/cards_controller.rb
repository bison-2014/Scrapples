class CardsController < ActionController::Base
  
  def index
    @all_cards = Card.all
  end
  
  def create
    @card = Card.new(params[:card])
    
    if @card.save
      redirect_to root_path
    else
      @errors = @card.errors.full_messages
      flash[:message] = "This card failed to create! Make sure it has a name and a description please."
      render :new
    end
  end
  
  def show 
    @card = Card.find(params[:card_id])
    
  end
end