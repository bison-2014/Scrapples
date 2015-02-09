class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    render :new
  end

  def create
    game = Game.create!
    appearance = game.appearances.create!(player: current_user)

    redirect_to game_path(game)
  end

  def show
    @game = Game.find_by(id: params[:id])
    @appearance = @game.appearances.find_by(player: current_user)
    @round = @game.this_round

    @my_play = Play.find_by(appearance: @appearance, round: @round)
  end

  # I'm hijacking the updating route to check if the game has been updated
  def update
    game = Game.find_by(id: params[:id])
    round = game.this_round

    respond_to do |format|
      format.json { render json: { gameTimestamp: game.updated_at.to_i, roundTimestamp: round.updated_at.to_i } }
    end
  end


  private

  # def first_round
  #   self.rounds.first
  # end

  # def last_round
  #   self.rounds.last
  #   round = game.rounds.create!

  #   redirect_to game_path(game)
  # end

  def game_params
    params.permit(:gameId)
  end

end

