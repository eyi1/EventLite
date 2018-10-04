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
            search
        else
            @events = Event.all
            search
        end
    end
    
    def create
       @event = Event.new(event_params)
      if @event.save
            current_user.events << @event #current_user.events.build(event_params)
            flash[:success] = "Successfully created event!"
            redirect_to events_path
       else
            render :new
        end
    end

    def edit    
    end

    def update 
        if @event.update(event_params)
            flash[:success] = "Successfully updated event!"
            redirect_to events_path
        else
            redirect_to edit_event_path
        end
    end
    
    def destroy
        @event.destroy
        flash[:success] = "Successfully deleted event!"
        redirect_to events_path
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

    def search
        if !params[:date].blank?
            if params[:date] == "Upcoming"
              @events.from_today
            else
              @events.old_events
            end
        end
    end
end