class SessionsController < ApplicationController

    def new
        @user = User.new
        @users = User.all
    end

    def create
        if auth_hash = request.env["omniauth.auth"] 
            @user = User.find_or_create_by_omniauth(auth_hash)
                 #@user.save! #Attempts to save the record just like Base#save but will raise a RecordInvalid exception instead of returning false if the record is not valid.
                 session[:user_id] = @user.id
                 flash[:success] = "Welcome Back!"
                 redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:user][:email])
            
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                flash[:success] = "Welcome Back!" 
                redirect_to user_path(@user)                 
            else
                flash[:error] = "Couldn't find username and password"
                redirect_to login_path
            end

        end
    end

    def destroy
        session.destroy
        flash[:success] = "Successfully logged out"
        redirect_to root_url
    end
end