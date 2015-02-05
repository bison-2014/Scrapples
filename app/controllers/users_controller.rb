class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    # @user.password = params[:password]

    if @user.save
      flash[:notice] = "You have signed up successfully"
      # flash[:color] = "Valid"
      session[:user_id] = @user.id
    else
      flash[:notice] = "Form is invalid"
      # flash[:color] = "Invalid"
    end
    render "new"
  end
end
