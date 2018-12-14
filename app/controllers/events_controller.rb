class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy, :event_data]

    def show         
        @attendance = Attendance.new
        respond_to do |format|
            format.html
            format.json {render json: @event}
        end
    end

    def new
        @event = Event.new
    end

    def index 
        if params[:user_id]
            @events = User.find(params[:user_id]).events
            search
            @my_url = new_user_event_path(current_user)
            
            respond_to do |format|
                format.html
                format.json {render json: @events}
            end
           
        else
            @events = Event.all
            search
            @my_url = new_event_path
            
            respond_to do |format|
                format.html
                format.json {render json: @events}
            end

        end
    end
    
    def create
        #@event = current_user.events.build(event_params)
        #if @event.save <--@event.users []
        @event = Event.new(event_params)
        if @event.save
            current_user.events << @event #current_user.events.build(event_params)
            flash[:success] = "Successfully created event!"
            #redirect_to events_path
            render json: @event, status: 201
        else
            render :new
        end
    end

    def edit   
    end

    def update 
        if @event.update(event_params)
            flash[:success] = "Successfully updated event!"
            redirect_to event_path(@event)
        else
            redirect_to edit_event_path
        end
    end
    
    def destroy
        @event.destroy
        flash[:success] = "Successfully deleted event!"
        redirect_to events_path
    end

    # def event_data
    #     render json: @event
    # end

    def events_data
        @events = Event.all
        render json: @events
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
              @events = @events.from_today
            else
              @events = @events.old_events
            end
        end
    end
end