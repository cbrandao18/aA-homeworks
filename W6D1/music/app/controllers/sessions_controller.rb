class SessionsController < ApplicationController

    # Render the sign in/sign up html page
    def new
        render :new
    end

    # Takes the username email and password and tries to generate a new session
    def create
        #gets the user
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        
        # if we found it, generate a new session token, change it on the user
        # instance as well as the cookie
        if !user.nil?
            log_in_user!(user)
            flash.now[:success] = "Login successful"
            redirect_to user_url(user)
        else
            flash.now[:error] = "Invalid email/password combo"
            redirect_to :new
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil

        redirect_to new_session_url
    end
end