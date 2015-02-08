module ApplicationHelper
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  def has_joined?(game_id)
    current_user.appearances.find_by(game_id: game_id)
  end
end
