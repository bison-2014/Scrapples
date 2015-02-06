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

  private

  # def first_round
  #   self.rounds.first
  # end

  def last_round
    self.rounds.last
    round = game.rounds.create!

    redirect game_round_path
  end

end