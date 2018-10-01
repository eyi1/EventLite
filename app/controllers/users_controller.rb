class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.admin = true
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Welcome to Event Builder- click create event to get started!"         
        else
            render :new
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
        #@user = current_user
    end

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :admin
        )
    end

end
