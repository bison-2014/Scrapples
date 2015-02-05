class SessionsController < ApplicationController

	def new
		# render :new
	end

	def create
		user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	log_in(user)
    	redirect_to user
    else
    	# flash[:danger] = "WRONG!!"
    	render :new
    end
	end

	def show

	end

	def destroy
		log_out
    redirect_to login_path
	end

	private
	# def user_params
 #    params.require(:user).permit(:name, :email, :password, :password_confirmation)
 #  end
end