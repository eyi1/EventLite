class StaticPagesController < ApplicationController
    def home
        if !logged_in?
            redirect_to root_path
        else
            redirect_to events_path
        end
    end
end
