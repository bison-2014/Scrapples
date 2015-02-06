class GamesController < ApplicationController


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
  end

end
