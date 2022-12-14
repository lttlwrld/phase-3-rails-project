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
        @ride = Ride.new(ride_params)
        if @ride.save
            @ride.users = []
            @ride.users << current_user
            redirect_to ride_path(@ride)
        else
            render :new
        end
    end

    def delete
        ride = Ride.find(params[:id])
        ride.delete
        redirect_to rides_path
    end

    def edit
        @ride = Ride.find(params[:id])
        if @ride.user != current_user
            redirect_to ride_path(@ride)
        end
    end
    
    def update
        @ride = Ride.find(params[:id])
        if @ride.update(ride_params)
            redirect_to ride_path(@ride)
        else
            render :new
        end
    end

    def complete
        @ride = Ride.find(params[:id])
        @ride.update(completed: true)
        redirect_to ride_path(@ride)
    end

    def join
        if logged_in?
            @ride = Ride.find(params[:id])
            @ride.users << current_user
            redirect_to ride_path(@ride)
        else
            redirect_to signup_path
        end
    end

    def leave
        @ride = Ride.find(params[:id])
        @ride.users.delete(current_user)
        redirect_to ride_path(@ride)
    end

    def show
        @ride = Ride.find(params[:id])
    end

    private

    def ride_params
        params.require(:ride).permit(:name, :date, :category, :distance, :about, :location, :user_id)
    end
    
end