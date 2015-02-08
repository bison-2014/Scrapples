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

  # def create
  #   #validate that current user is logged in
  #   if current_user
  #     #If user is logged in
  #     #assign them to the game w/ appearance create (game.id, current_user.id)
  #     game = Game.find(params[:game_id])
  #     game.appearances.create(player_id: current_user.id)
  #       #Q: Do we reroute them to the game, and the game controller/model handles the *state* of the game, oui ou non?  (ANSWER: Oui)
  #       redirect_to game_path
  #   else
  #     #otherwise send them to login page
  #     redirect_to login_path
  #   end
  # end

end
