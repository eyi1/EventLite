class AttendancesController < ApplicationController

    def new      
        @attendance = Attendance.create(user_id: params[:user_id], event_id: params[:event_id])
        redirect_to user_path(@attendance.user)
    end
end