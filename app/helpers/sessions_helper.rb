module SessionsHelper
  # def sign_in(user)
  #   session[:user] = user
  # end

  # def current_user
  #   session[:user]
  # end
  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  # def sign_out
  #   session[:user] = nil
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def logged_in?
    current_user != nil
  end

  def log_in(user)
  	session[:user_id] = user.id
  end
end