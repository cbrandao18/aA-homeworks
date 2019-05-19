class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    # Checks if there is a current session token, if there is then we know
    # that the user is logged in.
    # Otherwise, return @current_user or find them by their session token
    def current_user
        return nil if !session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        @current_user.nil? ? false : true
    end

    def log_in_user!(user)
        token = user.reset_session_token!
        session[:session_token] = token
    end
end
