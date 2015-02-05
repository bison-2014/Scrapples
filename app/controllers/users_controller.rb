class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # @user.password = params[:password]

    if @user.save
      log_in(@user)
      # flash[:success] = "You have signed up successfully"
      # flash[:color] = "Valid"
      session[:user_id] = @user.id
      redirect_to @user
    else
      # flash[:notice] = "Form is invalid"
      # flash[:color] = "Invalid"
    render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
