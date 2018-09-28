class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def show 
        #@attendance = Attendance.new
        # @event.users.each do |user|
        #     if user == current_user
        #      @event.users << current_user
        #      end
        #  end
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
            # current_user.events << @event #if @event.users.id == current_user.id #current_user.events.build(event_params)
            # current_user.save
            #@tweet = current_user.tweets.build(content: params[:content])
            # @event = current_user.events.build(event_params)
            # @event.users << current_user
            # if @event.save
            redirect_to events_path
       else
            render :new
        end
    end

    #.build - if @event.user = current_user?
    def edit    
    end

    def update 
        if @event.update(event_params)
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