class RidesController < ApplicationController

    def index
        @rides = Ride.all
    end

    def user_index
        @user = User.find_by(username: params[:username])
    end

    def new
        @ride = Ride.new
    end

    def create
        ride = Ride.create(ride_params)
        ride.update(user_id: current_user.id)
        ride.users << current_user
        redirect_to ride_path(ride)
    end

    def delete
        ride = Ride.find(params[:id])
        ride.delete
        redirect_to rides_path
    end

    def edit
        @ride = Ride.find(params[:id])
    end
    
    def update
        @ride = Ride.find(params[:id])
        @ride.update(ride_params)
        redirect_to ride_path(@ride)
    end

    def complete
        @ride = Ride.find(params[:id])
        @ride.update(completed: true)
        redirect_to ride_path(@ride)
    end

    def join
        @ride = Ride.find(params[:id])
        @ride.users << current_user
        redirect_to ride_path(@ride)
    end

    def leave
        @ride = Ride.find(params[:id])
        @ride.users.delete(current_user)
        redirect_to ride_path(@ride)
    end
    
    def show
        @ride = Ride.find(params[:id])
    end

    def ride_params
        params.require(:ride).permit(:name, :date, :category, :distance, :about, :location)
    end
    
end