class EventsController < ApplicationController
    before_action :find_event, only: [:show, :update, :edit]

    def show       
    end
    
    def index 
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
       @event = Event.new(event_params)
       if @event.save
            redirect_to events_path
       else
            render :new
        end
    end

    def edit    
    end

    def update 
    end
    
    private
    def event_params
        params.require(:event).permit(
            :title,
            :location,
            :description,
            :starts,
            :ends
        )
    end

    def find_event
        @event = Event.find(params[:id])
    end
end

