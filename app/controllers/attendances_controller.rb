class AttendancesController < ApplicationController

    def new      
        @attendance = Attendance.create(user_id: params[:user_id], event_id: params[:event_id], comment: params[:comment])
        redirect_to event_path(@attendance.event)
    end
end