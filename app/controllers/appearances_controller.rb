class AppearancesController < ActionController::Base

  def create
    if current_user
      game = Game.find(params[:game_id])
      game.appearances.create(player_id: current_user.id)
      redirect_to game_path
    else
      redirect_to login_path
    end
end
