class BikesController < ApplicationController
    
    def index
        @user = User.find_by(username: params[:username])
    end

    def new
        if logged_in?
            if params[:username] == current_user.username
                @bike = Bike.new
                @bike.components.build(category: 'Groupset')
                @bike.components.build(category: 'Wheelset')
            else
                redirect_to user_bikes_path(current_user.username)
            end
        else
            redirect_to login_path
        end
    end

    def create
        @bike = Bike.new(bike_params)
        @bike[:user_id] = current_user.id
        if @bike.save
            redirect_to bike_path(@bike.user.username, @bike)
        else
            render :new
        end
    end

    def edit
        if logged_in?
            if params[:username] == current_user.username
                @bike = Bike.find(params[:id])
            else
                redirect_to user_bikes_path(current_user.username)
            end
        else
            redirect_to login_path
        end
    end

    def update
        @bike = Bike.find(params[:id])
        if @bike.update(bike_params)
            redirect_to bike_path(@bike.user.username, @bike)
        else
            render :edit
        end
    end

    def show
        @bike = Bike.find(params[:id])
    end

    def confirm_delete
        @bike = Bike.find(params[:id])
    end

    def delete
        @bike = Bike.find(params[:id])
        @bike.delete
        redirect_to user_bikes_path
    end

    private

    def bike_params
        params.require(:bike).permit(:model, components_attributes: [:id, :category, :model])
    end

end