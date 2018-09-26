class AttendancesController < ApplicationController

    def new
        @attendance = Attendance.create(
            :user_id => params[:user_id] 
            :event_id => params[:event_id]
        )
    end

end
