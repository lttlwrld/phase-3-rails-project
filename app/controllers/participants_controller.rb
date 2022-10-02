class ParticipantsController < ApplicationController


    def edit
        @ride = Ride.find(params[:id])
        if @ride.users.include?(current_user)
            @participant = Participant.find_by(user_id: current_user.id, ride_id: @ride.id)
        else
            redirect_to ride_path(@ride)
        end
    end

    def update
        @ride = Ride.find(params[:id])
        @participant = Participant.find_by(user_id: current_user.id, ride_id: @ride.id)
        if @participant && participant_params[:time] != nil && participant_params[:time] != ""
            @participant.update(participant_params)
            @participant.update(speed: (@ride.distance/time_from_form(current_user.current_ride_stats(@ride).time)).round(2))
            if @participant.save
                redirect_to ride_path(@ride)
            else
                render 'edit'
            end
        else
            redirect_to ride_path(@ride)
        end
    end

    private

    def participant_params
        params.require(:participant).permit(:time)
    end


end