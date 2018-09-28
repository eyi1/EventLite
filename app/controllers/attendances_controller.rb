class AttendancesController < ApplicationController

    def new #post
    #     @attendance = Attendance.create(user_id: params[:user_id], event_id: params[:event_id])
    #     redirect_to user_path(@attendance.user)
        event = Event.find_by_id(params[:event_id])
        @attendance = event.attendances.create(user_id: params[:user_id], event_id: params[:event_id])

        # user = User.find_by_id(params[:user_id])
        # @attendance = event.attendances.create(:user_id => user.id)
        redirect_to user_path(@attendance.user)
    end
end