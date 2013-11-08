class SessionsController < ApplicationController
	skip_before_filter :set_current_user

	def new
	end
	
	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			#sign in and redirect to show page
			cookies.permanent[:session_token]=user.session_token
			@current_user = user
			redirect_to user
		else
			flash.now[:warning] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def destroy
		cookies.delete(:session_token)
		@current_user = nil
		flash[:notice] 'You have logged out'
		redirect_to user_path
	end

end
