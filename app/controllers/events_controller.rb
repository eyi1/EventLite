class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def show 
        @attendance = Attendance.new    
    end

    def new
        @event = Event.new
    end
    
    def index 
        if params[:user_id]
            @events = User.find(params[:user_id]).events 
        else
            @events = Event.all
        end
    end

    def create
       @event = Event.new(event_params)
       if @event.save
            current_user.events << @event #if @event.users.id == current_user.id #current_user.events.build(event_params)
            current_user.save
            redirect_to events_path
       else
            render :new
        end
    end

    def edit    
    end

    def update 
        if @event.users.each do |user|
            user == current_user
            @event.update(event_params)
            end
            redirect_to events_path
        else
            redirect_to edit_event_path
            #write error message : you do not have access to edit
        end
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

    def set_event
        @event = Event.find(params[:id])
    end
end

