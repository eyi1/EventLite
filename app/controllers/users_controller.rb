class UsersController < ApplicationController
    #before_action :find_user
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Welcome to Event Builder- click create event to get started!"
        else
            render :new
        end
    end

    private

    def user_params
        @user = User.find_by(params[:id])
    end

    def find_user
        params.require(:user).permit(
            :name,
            :username,
            :email,
            :password
        )
    end

end
