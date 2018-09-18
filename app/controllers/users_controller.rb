class UsersController < ApplicationController
    #before_action 
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(name: params[:name])
    end
end
