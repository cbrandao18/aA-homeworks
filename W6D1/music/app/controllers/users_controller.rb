class UsersController < ApplicationController

    # Creates a new user instance and renders the 'new' view for the user to sign up
    def new
        @user = User.new
        render :new
    end

    # Saves that user
    # TODO: Users should be logged in immediately after they sign up
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Successfully created your account."
            redirect_to new_session_url
        else
            flash.now[:error] = @user.errors.full_messages
            render :new
        end 
    end

    def show
        render :show
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end