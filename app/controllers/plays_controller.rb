class PlaysController < ApplicationController

  respond_to :html, :js

  def create
    card_id = play_params[:card_id]
    appearance_id = play_params[:appearance_id]
    round_id = play_params[:round_id]
    @play = Play.create(card_id: card_id, appearance_id: appearance_id, round_id: round_id)
    @card = @play.card
    @success = @play.valid?

    puts "??????????????????????????????????????????????????????????????????????????????????????????"
    # add a new card to your hand
    if @success
      appearance = Appearance.find(appearance_id)
      appearance.draw_card!

      # mark the played card as played in holdings table
      holding = appearance.holdings.find_by(card_id: card_id)
      holding.played = true
      holding.save

      # update the round status if this is the last play of the round
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      p @play.round.update_status
      p @play.round.status
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    end
  end

  private

  def play_params
    params.permit(:appearance_id, :card_id, :round_id, :game_id)
  end
end