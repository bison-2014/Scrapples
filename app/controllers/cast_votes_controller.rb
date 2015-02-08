class CastVotesController < ApplicationController
  
  def index
    render text: "hello"
  end
  
  def create
    @current_user ||= User.find_by(id: session[:user_id])
    this_game = Game.find(params[:game_id])
    
    # NOTE: We will require a play_id from the card that's picked in a vote
    
    this_game.this_round.cast_votes.create(appearance_id: @current_user.id, play_id: params[:play_id])
  
  end
    
   
end