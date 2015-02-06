class GamesController < ApplicationController

  def new
    render :new
  end

  def create
    game = Game.create!
    appearance = game.appearances.create!(player: current_user)
    round = game.rounds.create!

    redirect game_round_path
  end

end
