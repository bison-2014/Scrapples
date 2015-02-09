class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	log_in(user)
    	redirect_to user
    else
      @errors = "Please try login in again"
    	render :new
    end
	end

	def destroy
		log_out
    redirect_to login_path
	end

	private

end
