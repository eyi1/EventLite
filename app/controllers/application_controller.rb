class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user
    before_action :authenticate_user, except: [:new, :create, :home]

    def logged_in?
        !!current_user
    end

    private
    def authenticate_user
        redirect_to root_path unless logged_in?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end
