class SessionsController < ApplicationController
	skip_before_filter :set_current_user

	def new
	end
	
	def create
	  puts("USER EMAIL?")
	  puts(params[:session][:email])
	  puts("USER PASS?")
	  puts(params[:session][:password])
		#user = User.find_by_email(params[:session][:email])
		puts("THIS IS THE USER")
		puts(user)
		#if user == nil
		  auth = request.env["omniauth.auth"]
		  puts ("THIS IS AUTH")
		  puts(auth)
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||User.create_with_omniauth(auth)
      session[:session_token] = user.session_token
      redirect_to players_path
    #else
		  #if user && user.authenticate(params[:session][:password])
		  	#sign in and redirect to show page
		  	#cookies.permanent[:session_token]=user.session_token
		  	#@current_user = user
		  	#redirect_to players_path
		  #else
		  	#flash.now[:warning] = 'Invalid email/password combination'
		  	#render 'new'
		  #end
		#end
	end
	
	def destroy
		session[:session_token] = nil
		#cookies.delete(:session_token)
		#@current_user = nil
		#flash[:notice] = 'You have logged out'
		redirect_to players_path
	end

end
